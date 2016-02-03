module Automatix
  module Helper
    module Web

      def login_to_autotest(email = Automatix.config.email, password = Automatix.config.password)
        visit_page(LoginPage)
        on(LoginPage).login_with(email, password)
        on(DashboardPage).wait_until(10) { @current_page.activity_element.visible? }
      end

    end
  end
end
