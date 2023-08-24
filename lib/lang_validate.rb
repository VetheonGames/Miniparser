# frozen_string_literal: true

require 'English'
module Miniparser
  class Validator
    def initialize(language)
      @language = language
    end

    def validate(code)
      case @language
      when :html
        validate_html(code)
      when :css
        validate_css(code)
      when :js
        validate_js(code)
      else
        raise "Unknown language: #{@language}"
      end
    end

    private

    def validate_html(code)
      # List of self-closing singleton tags in HTML5
      singleton_tags = %w[area base br col embed hr img input link meta param source track wbr]

      # Stack to keep track of opening tags
      stack = []

      # Iterate through all the tags in the code
      code.scan(%r{</?\w+[^>]*>}) do |tag|
        tag_name = tag.match(%r{</?(\w+)})[1]

        # Ignore singleton tags and declarations like <!DOCTYPE html>
        next if singleton_tags.include?(tag_name) || tag.start_with?('<!')

        if tag.start_with?('</') # Closing tag
          # Check if the closing tag matches the last opening tag
          if stack.last == tag_name
            stack.pop
          else
            return [false, "Mismatched HTML tags: expected </#{stack.last}> but found #{tag}"]
          end
        else # Opening tag
          stack.push(tag_name)
        end
      end

      # Check if there are any unmatched opening tags
      if stack.empty?
        [true, nil]
      else
        [false, "Mismatched HTML tags: unmatched <#{stack.last}>"]
      end
    end

    def validate_css(code)
      # Basic validation: check for balanced curly braces
      valid = code.count('{') == code.count('}')
      [valid, valid ? nil : 'Mismatched CSS curly braces']
    end

    require 'tempfile'
    require 'shellwords'

    def validate_js(code)
      Tempfile.create(['temp', '.js']) do |temp_file|
        temp_file.write(code)
        temp_file.close
        output = `node -c #{Shellwords.escape(temp_file.path)} 2>&1`
        success = $CHILD_STATUS.success?
        [success, success ? nil : output]
      end
    end
  end
end
