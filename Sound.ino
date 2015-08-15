// Sound Sensor //

#define SOUNDSENSOR A2

int currentSound;
int soundVal;

void soundSetup() {
  pinMode(SOUNDSENSOR, INPUT);
}

void soundLoop() {
  soundVal = analogRead(SOUNDSENSOR);
  //Serial.println(soundVal);
  if (soundVal < 40) {
    currentSound = 0;
  }
  else if ((soundVal >= 40) && (soundVal < 150)) {
    currentSound = 1;
  }
  else if ((soundVal >= 150) && (soundVal < 400)) {
    currentSound = 2;
  }
  else if (soundVal >= 400) {
    currentSound = 3;
  }
}

