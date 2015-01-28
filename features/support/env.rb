require 'watir-webdriver'
require 'cucumber'
require 'json'
require 'rspec'
require 'logger'
require 'rspec/expectations'

# browser = Watir::Browser.new :firefox
# browser = Watir::Browser.new

browser = Watir::Browser.new :phantomjs, :args => ['--ignore-ssl-errors=yes','--ssl-protocol=tlsv1']

INDEX_OFFSET = -1
WEBDRIVER = true
 
CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), '..','..','config', 'config.yml'))

baseURL = CONFIG['base_url']

time_stamp = Time.new.strftime('%m%d_%H%M_%S')
logger = Logger.new(STDOUT)

Before do
  @browser = browser
  @url = baseURL
  @browser.driver.manage.window.maximize
end

Before do |scenario|
   logger.info("Running Scenario: #{scenario.name}")
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.screenshot.save screenshot
    embed screenshot, 'image/png'
  end
end

at_exit do
  browser.close
  browser.exit
end
