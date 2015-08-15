// WiFi - Cloud Connectivity //

char ssid[] = "uw-event"; //  your network SSID (name) 
char pass[] = "uwhackathon"; // your network password

char edison_token[] = "iLOVEtechRETREAT";

int status = WL_IDLE_STATUS;
IPAddress server(10,21,176,88); // local server

// Initialize the client library
WiFiClient client;

long interval2 = 5000;
long previousMillis2 = 0;

void wifiSetup() {
  Serial.println("Attempting to connect to WPA network...");
  Serial.print("SSID: ");
  Serial.println(ssid);

  status = WiFi.begin(ssid, pass);
  if (status != WL_CONNECTED) { 
    Serial.println("Couldn't get a wifi connection");
    // don't do anything else:
    while(true);
  } 
  else {
    Serial.println("Connected to wifi");
    Serial.println("\nStarting connection...");
  }
}

void wifiLoop() {

  unsigned long currentMillis2 = millis();
  if (currentMillis2 - previousMillis2 > interval) {
    previousMillis2 = currentMillis2;
    char params[200];
    float temp = t;
    float latitude = 43.4722854; ////////////////////////// FIX
    float longitude = -80.5448576; ////////////////////////// FIX
    int air_quality = 2; ////////////////////////// FIX
    int light = currentLight;
    int sound = currentSound;
    int humidity = currentHumid;
    //boolean panic = panicBool;
    
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
  }
}
