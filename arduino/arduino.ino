#include <WiFi.h>
#include <SPI.h>
#include "RestClient.h"

String SSID = "uw-event";
String PW = "uwhackathon";
RestClient client = RestClient("10.21.176.88", "uw-event", "uwhackathon");

void setup(){
  Serial.begin(9600);
  client.connect();
}

void loop(){
  String response = "";
  int statusCode = client.post("/telemetries", "{\"temp\"=4}", &response);

  Serial.println(statusCode);
  delay(2000);
  
}

