class NavigationPage < AbstractPage
  include PageObject

  link(:dashboard, :id => 'nav-dashboard')
  link(:leads, :id => 'nav-leads')
  link(:contacts, :id => 'nav-contacts')
  link(:sales, :id => 'nav-sales')
  link(:tasks, :id => 'nav-tasks')
  link(:comm_center, :id => 'nav-communication-center')
  link(:reports, :id => 'nav-reports')
  text_field(:global_search, :class => 'search-query icn-search-10-light-green')
  ul(:search_results, :class => "search-results")
  link(:trial, :css => '.trial-countdown ')
  link(:notifications_bell, :css => ".base-popover .visibility-toggle")
  link(:settings, :href => '#user-dd')

  def go_to_settings_page(subpage=nil)
    settings_element.click
    link_element(:href => "/settings/profile").when_visible.click
    link_element(:href => "/settings/#{subpage}").when_visible.click if subpage
  end
end
