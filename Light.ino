// Grove - Light Sensor //

const int LIGHTPIN = A1;
int lightVal = 0;
int currentLight = 0;

void lightSetup() {
  pinMode(LIGHTPIN, INPUT);
}

void lightLoop() {
  lightVal = analogRead(LIGHTPIN);
  //Serial.println(lightVal);
  if (lightVal < 500) {
    currentLight = 0;
  }
  else if ((lightVal >= 500) && (lightVal <= 800)) {
    currentLight = 1;
  }
  else if (lightVal > 800) {
    currentLight = 2;
  }
}

