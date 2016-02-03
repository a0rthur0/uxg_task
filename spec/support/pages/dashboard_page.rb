class DashboardPage
  include PageObject

  page_url "https://app.futuresimple.com/sales"

  div(:activity, :css => '.feed-navigation')
end
