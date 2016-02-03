module Automatix::PageObjectConfig
  DEFAULT_WAIT = 30

  PageObject.javascript_framework = :jquery
  PageObject.default_element_wait = DEFAULT_WAIT
  PageObject.default_page_wait = DEFAULT_WAIT
  Watir.default_timeout = DEFAULT_WAIT
end
