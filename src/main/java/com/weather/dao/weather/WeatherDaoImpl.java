package com.weather.dao.weather;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Scanner;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Repository
public class WeatherDaoImpl implements WeatherDao {

    private String name;
    private Double temp;
    private Double humidity;
    private String icon;
    private String main;

    //259ed2e03585b4c9c3b924564ecbeddd
    public WeatherDaoImpl getWeather(String message) throws IOException {
        WeatherDaoImpl weather = new WeatherDaoImpl();
        URL url = new URL("http://api.openweathermap.org/data/2.5/weather?q=" + message + "&units=metric&appid=259ed2e03585b4c9c3b924564ecbeddd");

        Scanner in = new Scanner((InputStream) url.getContent());
        String result = "";
        while (in.hasNext()) {
            result += in.nextLine();
        }

        JSONObject object = new JSONObject(result);
        weather.setName(object.getString("name"));

        JSONObject main = object.getJSONObject("main");
        weather.setTemp(main.getDouble("temp"));
        weather.setHumidity(main.getDouble("humidity"));
        JSONArray getArray = object.getJSONArray("weather");
        for (int i = 0; i < getArray.length(); i++) {
            JSONObject obj = getArray.getJSONObject(i);
            weather.setIcon((String) obj.get("icon"));
            weather.setMain((String) obj.get("main"));
        }
//        return "City: " + getName() + "\n" +
//                "Temperature: " + getTemp() + "C" + "\n" +
//                "Humidity: " + getHumidity() + "%" + "\n" +
//                "Main: "+getMain()+"\n"+
//                "http://openweathermap.org/img/w/" + getIcon() + ".png";
        return weather;
    }
}
