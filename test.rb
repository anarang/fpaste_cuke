require "rubygems"
require "watir-webdriver"
require "rspec"
require "rspec/expectations"
@browser = Watir::Browser.new :firefox
@browser.goto("http://fpaste.org/")
@browser.textarea(:id => "paste_data").send_keys("sample text here")
@browser.button(:id => "paste_button").click
puts @browser.url
@browser.div(:class => "text").wait_until_present
@browser.div(:class => "text").text.should == "sample text here"
@browser.close

