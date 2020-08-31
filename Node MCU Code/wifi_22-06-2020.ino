#include <BearSSLHelpers.h>
#include <CertStoreBearSSL.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiAP.h>
#include <ESP8266WiFiGeneric.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266WiFiScan.h>
#include <ESP8266WiFiSTA.h>
#include <ESP8266WiFiType.h>
#include <WiFiClient.h>
#include <WiFiClientSecure.h>
#include <WiFiClientSecureAxTLS.h>
#include <WiFiClientSecureBearSSL.h>
#include <WiFiServer.h>
#include <WiFiServerSecure.h>
#include <WiFiServerSecureAxTLS.h>
#include <WiFiServerSecureBearSSL.h>
#include <WiFiUdp.h>

WiFiClient client;
WiFiServer server(80);
unsigned char cmd[6];


const int IN1=16;
const int IN2=1;
const int IN3=14;
const int IN4=13;
const int EN1=15;
const int EN2=5;


void setup() {
  Serial.begin(9600);
 // Serial.println("Someone is connected to me!");
 // IPAddress myIP = WiFi.softAPIP();
 // Serial.print("AP IP address: ");
 // Serial.println(myIP);
  
  pinMode(14, OUTPUT);
  pinMode(16, OUTPUT);
  pinMode(1, OUTPUT);
  pinMode(13, OUTPUT);
  digitalWrite(14, LOW);
  digitalWrite(16, LOW);
  digitalWrite(1, LOW);
  digitalWrite(13, LOW);
  analogWrite(EN1,512);
  analogWrite(EN2,512);
  WiFi.mode(WIFI_AP);
  WiFi.softAP("MWCW_2");
  server.begin();
  // put your setup code here, to run once:


}

void loop() {
  client = server.available();
  if(client){
    Serial.println("Someone is connected to me!");

    while(client.connected()) {
    while(!client.available()) {
    if(!client.connected()) break;
        delay(1);
      }

    char a = client.read();

    switch (a)
    {
       case 'a': {analogWrite(EN1,451); analogWrite(EN2,412);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);break;}
                /*{/*digitalWrite(3, HIGH);digitalWrite(7, HIGH);digitalWrite(5, HIGH);digitalWrite(6, HIGH);delay(700);
                digitalWrite(3, LOW);digitalWrite(7, LOW);digitalWrite(5, LOW);digitalWrite(6, LOW);delay(700);
                digitalWrite(3, HIGH);digitalWrite(7, HIGH);digitalWrite(5, HIGH);digitalWrite(6, HIGH);delay(700);
                digitalWrite(3, LOW);digitalWrite(7, LOW);digitalWrite(5, LOW);digitalWrite(6, LOW);delay(700);
                digitalWrite(3, HIGH);digitalWrite(7, HIGH);digitalWrite(5, HIGH);digitalWrite(6, HIGH);delay(700);
                digitalWrite(3, LOW);digitalWrite(7, LOW);digitalWrite(5, LOW);digitalWrite(6, LOW);delay(700);*/
                //break;}
      case 'b': {analogWrite(EN1,451); analogWrite(EN2,412);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);break;}
                /*{/*digitalWrite(3, HIGH);digitalWrite(7, HIGH);digitalWrite(5, HIGH);digitalWrite(6, HIGH);delay(700);
                digitalWrite(3, LOW);digitalWrite(7, LOW);digitalWrite(5, LOW);digitalWrite(6, LOW);delay(700);
                digitalWrite(3, HIGH);digitalWrite(7, HIGH);digitalWrite(5, HIGH);digitalWrite(6, HIGH);delay(700);
                digitalWrite(3, LOW);digitalWrite(7, LOW);digitalWrite(5, LOW);digitalWrite(6, LOW);delay(700);
                digitalWrite(3, HIGH);digitalWrite(7, HIGH);digitalWrite(5, HIGH);digitalWrite(6, HIGH);delay(700);
                digitalWrite(3, LOW);digitalWrite(7, LOW);digitalWrite(5, LOW);digitalWrite(6, LOW);delay(700);*/
                //break;}
      case 'c': {analogWrite(EN1,805); analogWrite(EN2,750);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);delay(500);digitalWrite(IN1,HIGH);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,HIGH);break;}
      case 'd': {analogWrite(EN1,805); analogWrite(EN2,750);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);delay(500);digitalWrite(IN1,HIGH);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,HIGH);break;}
      case 'e': {analogWrite(EN1,451); analogWrite(EN2,412);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);break;}
      case 'f': {analogWrite(EN1,451); analogWrite(EN2,412);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);break;}
      case 'g': {analogWrite(EN1,451); analogWrite(EN2,412);digitalWrite(IN1,HIGH);digitalWrite(IN2,LOW);digitalWrite(IN3,HIGH);digitalWrite(IN4,LOW);break;}
      case 'h': {analogWrite(EN1,805); analogWrite(EN2,750);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);delay(500);digitalWrite(IN1,LOW);digitalWrite(IN2,HIGH);digitalWrite(IN3,HIGH);digitalWrite(IN4,LOW);break;}
      case 'i': {analogWrite(EN1,805); analogWrite(EN2,750);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);delay(500);digitalWrite(IN1,LOW);digitalWrite(IN2,HIGH);digitalWrite(IN3,HIGH);digitalWrite(IN4,LOW);break;}
      case 'j': {analogWrite(EN1,805); analogWrite(EN2,750);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);delay(500);digitalWrite(IN1,HIGH);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,HIGH);break;}
      case 'k': {analogWrite(EN1,805); analogWrite(EN2,750);digitalWrite(IN1,LOW);digitalWrite(IN2,LOW);digitalWrite(IN3,LOW);digitalWrite(IN4,LOW);delay(500);digitalWrite(IN1,LOW);digitalWrite(IN2,HIGH);digitalWrite(IN3,HIGH);digitalWrite(IN4,LOW);break;}
      
    }
  }
  // put your main code here, to run repeatedly:

}
}
