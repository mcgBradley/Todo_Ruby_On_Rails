RSpec::Matchers.define :appear_before do |later_content|
    match do |earlier_content|
      earlier_content_index = page.body.index(earlier_content)
      later_content_index = page.body.index(later_content)
  
      @failure_message = "Expected \"#{earlier_content}\" to appear before \"#{later_content}\""
  
      def raise_missing_content_error(content)
        @failure_message += " but \"#{content}\" was not found on the page."
        raise RSpec::Expectations::ExpectationNotMetError
      end
  
      raise_missing_content_error(earlier_content) if earlier_content_index.nil?
      raise_missing_content_error(later_content) if later_content_index.nil?
  
      earlier_content_index < later_content_index
    end
  
    failure_message { @failure_message }
  end