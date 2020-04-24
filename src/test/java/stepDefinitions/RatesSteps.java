package stepDefinitions;
import helper.Helper;
import org.junit.Assert;
import com.google.gson.JsonObject;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

import static org.assertj.core.api.Assertions.*;

public class RatesSteps {
	
	RestAssured baseObj;
	RequestSpecification requestSpec;
	Response response;
	JsonObject rates;

	@Given("I have access to (.*) for Foreign Exchange rates")
	public void I_have_access_to_Foreign_Exchange_rates_api(String api) throws Throwable {
	  baseObj.baseURI = new Helper().ValidBaseUrl;
	  requestSpec = baseObj.given();
	}

	@When("^I GET the latest foreign exchange rates$")
	public void I_GET_the_latest_foreign_exchange_rates() throws Throwable {
	  response = requestSpec.request(Method.GET);
	}
	
	@Then("I should see the HTTP response code as (.*)")
	public void I_should_see_the_HTTP_response_code_as(int responseCode) throws Throwable {
	  Assert.assertEquals(responseCode, response.getStatusCode());
	  String responseBody = response.getBody().asString();
	  rates = new Helper().get_rates_from_response(responseBody);
	}

	@Then("I should see the {string} current rate as {double}")
	public void iShouldSeeTheCurrentRateAs(String currency, Double value) throws Throwable {
		assertThat(rates.get(currency).toString()).isEqualTo(String.valueOf(value));
	}

	@Then("I should see the HTTP response tags as (.*)")
	public void I_should_see_the_HTTP(String responseBody)throws Throwable {
		//Assert.assertEquals(responseBody, rates.get(responseBody).toString());
		assertThat(rates.get(responseBody).toString()).isEqualTo(responseBody);
	}
}
