require 'capybara'
require 'capybara/cucumber'
#require 'capybara/rspec'
#require 'selenium/webdriver'
require 'site_prism'
#require 'faker'
#require 'rubygems'
require 'rspec'
#require 'rspec/retry'



AMBIENTE = ENV['AMBIENTE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")
CUSTOM = YAML.load_file(File.dirname(__FILE__) + "/config.yml")



Capybara.register_driver(:xxxxxx) do |app|

  Capybara::Selenium::Driver.load_selenium

  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--disable-web-security')
  options.add_argument('--start-maximized')
  options.add_argument('--disable-infobars')
  options.add_argument('--disable-extensions')
  options.binary = '/usr/bin/chromium'
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--window-size=1920x1080')
  #Capybara::Selenium::Driver.new(app, browser: :chrome, driver_path: '/usr/bin/chromedriver', options: options)
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.default_driver = :xxxxxx # Sem navegador
  config.app_host = CONFIG['url_padrao']
  Capybara.default_max_wait_time = 15
end
