// Panic Button //

#define PANICPIN 4
int panicBool = 0;
boolean currentPanic = false;

void panicSetup() {
  pinMode(PANICPIN, INPUT);
} 

void panicLoop() {
  panicBool = digitalRead(PANICPIN);
  Serial.println(panicBool);
  if (panicBool == HIGH) {
    currentPanic = true;
  } else {
    currentPanic = false;
  }
}
