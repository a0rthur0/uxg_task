class WrappedElement
  def initialize(element)
    @element = element.element.__getobj__
    @browser = element.element.browser
  end

  def selector
    @element.instance_variable_get(:@selector)
  end

  def selector=(selector)
    @element.instance_variable_set(:@selector, selector)
  end

  def location
    @browser.driver[selector].location
  end
end
