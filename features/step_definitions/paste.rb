Given(/^that I am on the home page$/) do
  @browser.goto(@url)
end

When(/^I input text in the textbox$/) do
  @browser.textarea(:id => "paste_data").send_keys("sample text here")
end

When(/^I click on PASTE button$/) do
  @browser.button(:id => "paste_button").click
end

Then(/^a new paste should be created with the same text$/) do
  puts @browser.url
  @browser.div(:class => "text").text.should == "sample text here"
end
