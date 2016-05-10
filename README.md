# To run tests you need:
1. Ruby in version 2.2.x (+ DevKit if you are using Windows)
2. For testing in Firefox - an installed Firefox browser
3. For testing in Chrome - an installed Chrome browser and 'chromedriver'
4. Installed Git client

In case of details need see details.shot (below)

### Usage
1. Provide your credentials in 'config/settings.yml' file
2. Open console and run tests with rspec, e.g: from project main dir `rspec spec/general/tasks_spec.rb`

# Development
We use [RSpec](http://rspec.info/) as our test runner, [cheezy/page-object](https://github.com/cheezy/page-object) as our Page-Object Pattern implementation

###Details.shot
This is detailed installation for Windows:

1. Install Ruby 2.2.x with [RubyInstaller](http://rubyinstaller.org/downloads/) and DevKit for proper version of Ruby (it's on the same page)
2. In cmd, `cd` to the extracted DevKit dir and run `ruby dk.rb init` and `ruby dk.rb install`
3. Install [Git Client](http://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (you probably want to use it in windows cmd select proper options during installation)
4. In cmd run `gem install bundler` (if you get ssh errors -> see below)
5. Clone this project repository.
6. In cmd, `cd` the project main dir and run `bundle install`
7. If you want to use Chrome browser, you need to setup [chromedriver.exe](https://sites.google.com/a/chromium.org/chromedriver/getting-started)

This is detailed installation for Mac:

1. Install [RVM](https://rvm.io/rvm/install)
2. Install Ruby 2.2.x with `rvm install ruby-2.2`
3. In terminal run `gem install bundler`
4. Install [Git Client](http://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
5. Clone this project repository.
6. In terminal, `cd` the project main dir and run `bundle install`
7. If you want to use Chrome browser, you need to setup chromedriver `brew install chromedriver` (you need Homebrew app for this)

Now you are ready to run some tests.

#####What about ssh errors
If you see on of those it means you will need to [update rubygems](https://gist.github.com/luislavena/f064211759ee0f806c88#installing-using-update-packages-new)

### Updates 10.05.2016
1. Fixed test "Add task without date"
2. Added new test "Add task with date" with proper checks.
