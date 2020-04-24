package helper;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class Helper {

    public static String ValidBaseUrl = "https://api.ratesapi.io/api/latest";
    public static String InvalidBaseUrl = "https://api.ratesapi.io/api/latest";
    public static String DateUrl = "https://api.ratesapi.io/api/";

    public JsonObject get_rates_from_response(String responseBody)
    {
        JsonParser parser = new JsonParser();
        JsonObject jsonObject = parser.parse(responseBody).getAsJsonObject();
        JsonObject rates =  jsonObject.get("rates").getAsJsonObject();
        return rates;
    }
}
