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


Capybara.configure do |config|
  #config.default_driver = :selenium_chrome # Com Navegador
  config.default_driver = :selenium_chrome_headless # Sem navegador
  config.app_host = CONFIG['url_padrao']
  Capybara.default_max_wait_time = 15
end
