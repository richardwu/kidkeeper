#include <SPI.h>
#include <WiFi.h>

char ssid[] = "uw-event";          //  your network SSID (name) 
char pass[] = "uwhackathon";   // your network password

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
    // if you get a connection, report back via serial:
    if (client.connect(server, 80)) {
      Serial.println("connected");
      // Make a HTTP request:
      client.println("POST /telemetries?temp=20&air_quality=1 HTTP/1.1");
      client.println("Host: 10.21.176.88");
      client.println("Content-Type: application/json");
      client.println("Content-Type: application/json");
      client.println("Content-Length: ");
      client.println();
    }
  }
}

void loop() {

}
