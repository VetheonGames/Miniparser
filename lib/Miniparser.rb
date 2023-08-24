# frozen_string_literal: true

require_relative 'Miniparser/version'
require_relative 'lang_detect'
require_relative 'lang_minify'
require_relative 'lang_validate'

module Miniparser
  class Error < StandardError; end

  class Processor
    def self.type_file(file_path)
      code = File.read(file_path)
      result = process_code(code)
      if result[:valid]
        output_file_path = file_path.gsub(/(\.\w+)$/, '_minified\1')
        File.write(output_file_path, result[:minified_code])
        result[:minified_code] = output_file_path
      end
      result
    end

    def self.type_string(code_string)
      process_code(code_string)
    end

    def self.process_code(code)
      language_detector = LanguageDetector.new
      language = language_detector.detect(code)
      validator = Validator.new(language)
      valid, errors = validator.validate(code)
      minifier = Minifier.new(language)
      minified_code = minifier.minify(code) if valid

      { valid:, errors:, minified_code: }
    end
  end
end
