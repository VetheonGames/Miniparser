# frozen_string_literal: true

module Miniparser
  class LanguageDetector
    def detect(code)
      return :html if code.match?(/<\s*html.*>|<\s*head.*>|<\s*body.*>/i)
      return :css if code.match?(/^\s*(\.\w+|#\w+|body)\s*\{/)
      return :js if code.match?(/function\s+\w+\s*\(|var\s+\w+\s*=|let\s+\w+\s*=|const\s+\w+\s*=/)

      :unknown
    end
  end
end
