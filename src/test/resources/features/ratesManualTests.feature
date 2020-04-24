Feature: Exchange Rates
  As a User
  I want to be able to have an automated testing framework available which covers different scenarios for the Rates API
  So that I can make sure that the API’s are fit for purpose in the use of the exchange rate for financial reasons

  Scenario : Validate API availability for Latest Foreign Exchange rates
    Given I access "valid" api for Foreign Exchange rates
    When I GET the latest foreign exchange rates
    Then I should see the HTTP response code as 200

  Scenario: Validate invalid API response for Latest Foreign Exchange rates
    Given I access "invalid" api for Foreign Exchange rates
    When I GET the latest foreign exchange rates
    Then I should see the HTTP response code as 400

  Scenario: Validate API availability for Latest Foreign Exchange rates on default date
    Given I access "valid dates" api for Foreign Exchange rates
    When I GET the latest foreign exchange rates
    Then I should see the HTTP response code as 200

  Scenario: Validate invalid API response for Latest Foreign Exchange rates on default date
    Given I access "invalid dates" api for Foreign Exchange rates
    When I GET the latest foreign exchange rates
    Then I should see the HTTP response code as 400

  Scenario Outline: Validate API response for Latest Foreign Exchange rates
    Given I access "valid" api for Foreign Exchange rates
    When I GET the latest foreign exchange rates
    Then I should see the HTTP response code as <response body>

    Examples:
      |response body|
      |GBP          |
      |HKD          |
      |IDR          |
      |ILS          |
      |DKK          |
      |INR          |
      |CHF          |
      |MXN          |
      |CZK          |
      |SGD          |
      |THB          |
      |HRK          |
      |MYR          |
      |NOK          |
      |CNY          |
      |BGN          |
      |PHP          |
      |SEK          |
      |PLN          |
      |ZAR          |
      |CAD          |
      |ISK          |
      |BRL          |
      |RON          |
      |NZD          |
      |TRY          |
      |JPY          |
      |RUB          |
      |KRW          |
      |USD          |
      |HUF          |
      |AUD          |
      |KRW          |
      |USD          |
      |HUF          |
      |AUD          |

