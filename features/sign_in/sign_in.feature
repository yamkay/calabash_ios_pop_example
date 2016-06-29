@sign_in_feature
Feature: Sign-In

@critical @iphrc
Scenario: User is able to sign-in from the more tab
     Given I am on Home screen
     And I navigate to Account tab
     When I sign-out if I am already signed-in via App Settings options
     Then I sign-in with valid credentials via App Settings options
