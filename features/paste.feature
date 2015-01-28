Feature: To be able to paste a snippet of text on fpaste successfully

	Scenario: To verify that I can paste a snippet of text on fpaste
	Given that I am on the home page 
	When I input text in the textbox
	And I click on PASTE button
	Then a new paste should be created with the same text