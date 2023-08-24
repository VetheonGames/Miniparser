# frozen_string_literal: true

module Miniparse
  class Minifier
    def initialize(language)
      @language = language
    end

    def minify(code)
      case @language
      when :html
        minify_html(code)
      when :js
        minify_js(code)
      when :css
        minify_css(code)
      else
        raise "Unknown language: #{@language}"
      end
    end

    private

    def minify_html(code)
      code.gsub(%r{>\s*</}, '> </').gsub(/>\s+</, '><').strip
    end

    def minify_js(code)
      # Remove single-line and multi-line comments, and all unnecessary whitespace
      code.gsub(%r{//.*$}, '').gsub(%r{/\*.*?\*/}m, '').gsub(/\s+/, ' ').strip
    end

    def minify_css(code)
      # Remove comments and all unnecessary whitespace, including newlines
      code.gsub(%r{/\*.*?\*/}m, '').gsub(/\s+/, '').strip
    end
  end
end
