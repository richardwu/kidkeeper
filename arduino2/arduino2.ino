#include <SPI.h>
#include <WiFi.h>
#include <stdio.h>

char ssid[] = "uw-event";          //  your network SSID (name) 
char pass[] = "uwhackathon";   // your network password

char edison_token[] = "iLOVEtechRETREAT";

int status = WL_IDLE_STATUS;
IPAddress server(10,21,176,88);  // Local server

// Initialize the client library
WiFiClient client;

void setup() {
  Serial.begin(9600);
  Serial.println("Attempting to connect to WPA network...");
  Serial.print("SSID: ");
  Serial.println(ssid);

  status = WiFi.begin(ssid, pass);
  if ( status != WL_CONNECTED) { 
    Serial.println("Couldn't get a wifi connection");
    // don't do anything else:
    while(true);
  } 
  else {
    Serial.println("Connected to wifi");
    Serial.println("\nStarting connection...");
  }
}

void loop() {
  
  char params[200];
  float temp = 20;
  float latitude = 10;
  float longitude = 10;
  int air_quality = 0;
  int light = 0;
  int sound = 0;
  int humidity = 0;
  
  sprintf(params, "POST /telemetries?edison_token=%s&temp=%f&latitude=%f&longitude=%f&air_quality=%d&light=%d&sound=%d&humidity=%d HTTP/1.1", edison_token, temp, latitude, longitude, air_quality, light, sound, humidity);
 
  
  if (client.connect(server, 80)) {
      Serial.println("connected");
      // Make a HTTP request:
      client.println(params);
      client.println("Host: 10.21.176.88");
      client.println("Content-Type: application/json");
      client.println("Content-Length: ");
      client.println();
      client.stop();
    }
   
   delay(5000);
}
