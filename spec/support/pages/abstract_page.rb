class AbstractPage
  include PageObject
  include Automatix::PageObjectConfig
  include Automatix::Helper::Web

  def initialize_page
    begin
      wait_until(10) do
        self.div_element(css: "#feedback-progress").attribute("class") == "hide"
      end
    rescue Watir::Wait::TimeoutError, Timeout::Error
      # it is better to have page fully loaded
      # but in most cases we can ignore if spinner is still visible after time
      puts "Page isn't fully loaded - Progress bar still visible!"
    end
  end
end
