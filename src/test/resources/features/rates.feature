Feature: Exchange Rates
  As a User
  I want to be able to have an automated testing framework available which covers different scenarios for the Rates API
  So that I can make sure that the API’s are fit for purpose in the use of the exchange rate for financial reasons

  Scenario: Validate the default base rate is euro
    Given I have access to valid api for Foreign Exchange rates
    When I GET the latest foreign exchange rates
    Then I should see the default rate as EUR

  Scenario: Validate the default date
    Given I have access to valid api for Foreign Exchange rates
    When I GET the latest foreign exchange rates
    Then I should see the default rate as yesterday

  Scenario: Validate the future date
    Given I have access to <api> for Foreign Exchange rates with year as 2050
    When I GET the latest foreign exchange rates
    Then I should see the default rate as yesterday

  Scenario: Validate the past date
    Given I have access to <api> for Foreign Exchange rates with year as 1989
    When I GET the latest foreign exchange rates
    Then I should see the HTTP response code as 400

  Scenario: Validate the default base rate can be changed to any other currency
    Given I have access to <api> for Foreign Exchange rates with base rate as GBP
    When I GET the latest foreign exchange rates
    Then I should see the default rate as GBP

  Scenario Outline : Validate specific currency rate
    Given I have access to <api> for Foreign Exchange rates with <symbols>
    When I GET the latest foreign exchange rates
    Then I should see the exchange rates displayed with <symbols>
    And I should see the default rate as EUR

    Examples:
      |symbols  |
      |GBP,USD  |
      |AUD      |
      |THB      |

  Scenario Outline : Validate specific currency rate with a different base rate
    Given I have access to <api> for Foreign Exchange rates with <symbols> and base rate as USD
    When I GET the latest foreign exchange rates
    Then I should see the exchange rates displayed with <symbols>
    And I should see the default rate as USD

    Examples:
      |symbols  |
      |GBP,USD  |
      |AUD      |
      |THB      |

  Scenario Outline : Validate specific currency rate
    Given I have access to <api> for Foreign Exchange rates with <symbols>
    When I GET the latest foreign exchange rates
    Then I should see the HTTP response code as <response code>

    Examples:
      |symbols  |response code|
      |         |             |
      |gbp,AUD  |400          |
      |Usd      |400          |



  Scenario Outline: Validate API response code for Latest Foreign Exchange rates
    Given I have access to <api> for Foreign Exchange rates
    When I GET the latest foreign exchange rates
    Then I should see the HTTP response code as <response code>

    Examples:
    |api            |response code|
    |valid          |200          |
    |invalid        |400          |
    |valid dates    |200          |
    |invalid dates  |400          |

  Scenario Outline: Validate API response body for Latest Foreign Exchange rates
    Given I have access to <api> for Foreign Exchange rates
    When I GET the latest foreign exchange rates
    Then I should see the HTTP response tags as <response body>

    Examples:
      |api            |response body  |
      |valid          |base           |
      |valid          |rates          |
      |valid          |date           |
      |valid dates    |base           |
      |valid dates    |rates          |
      |valid dates    |date           |
