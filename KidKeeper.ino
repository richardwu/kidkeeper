// KidKeeper - IoT Intel Edison //
// Tech Retreat 2015 //
// Author: Udeshaya Wadhwa //
// Team: Vibhas Vatve, Edward Guo, & Richard Wu //

// Libraries
#include <DHT.h>
#include <SPI.h>
//#include <AirQuality.h>
#include <Arduino.h>
#include <DHT.h>
#include <math.h>
#include <WiFi.h>
#include <stdio.h>
//#include <Adafruit_GPS.h>
//#include <SoftwareSerial.h>

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  //airQualitySetup();  
  tempHumidSetup();
  lightSetup();
  soundSetup();
  //panicSetup();
  //GPSSetup();
  wifiSetup();
}

void loop() {
  // put your main code here, to run repeatedly:
  //airQualityLoop();
  tempHumidLoop();
  lightLoop();
  soundLoop();
  //panicLoop();
  //GPSLoop();
  wifiLoop();
}
