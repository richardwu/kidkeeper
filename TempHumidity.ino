// Temperature & Humidity Sensor //

// Define Input
#define DHTPIN 5
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);

// 2-Second Timer
long previousMillis = 0;
long interval = 2000;

int currentTemp = 0;
int currentHumid = 0;
float t;
float h;

void tempHumidSetup() {
  dht.begin();
}

void tempHumidLoop() {
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis > interval) {
    previousMillis = currentMillis;
    h = dht.readHumidity();
    // Read temperature as Celsius
    t = dht.readTemperature();
    if (isnan(h) || isnan(t)) {
      //Serial.println("Failed to read from DHT sensor!");
      return;
    }
    if (t >= 40) {
      currentTemp = 0;
    } 
    else if ((t >= 30) && (t < 40)) {
      currentTemp = 1;
    }
    else if ((t >= 20) && (t < 30)) {
      currentTemp = 2;
    } 
    else if ((t >= 10) && (t < 20)) {
      currentTemp = 3;
    }
    else if ((t >= 0) && (t < 10)) {
      currentTemp = 4;
    }
    else if (t < 0) {
      currentTemp = 5;
    }
    
    /*Serial.print("Humidity: "); 
    Serial.print(h);
    Serial.print(" %\t");
    Serial.print("Temperature: "); 
    Serial.print(t);
    Serial.println(" *C ");*/
  }
}
