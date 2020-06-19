#define pinSensor A0
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

int PPMTreshold = 5;
bool alert=false;
long sec = 0;
long currMillis = 0;
float alertInterval = 0;
int stateUpdate = 0;

String ssid= "anugerah store"; 
String password= "12051997"; 
WiFiServer server(80); 
float ppm = 0;
int state = 1;

void refreshState(){
//  if (WiFi.status() == WL_CONNECTED) {
//      HTTPClient http;
//      http.begin("http://192.168.1.51:3000/api/getState");            
//      http.addHeader("Content-Type", "application/x-www-form-urlencoded");
//           
//      int httpCode1= http.GET();
//      
//      if (httpCode1 > 0) {
//        String res = http.getString();
//        state = res.toInt();
//      } else {
//        Serial.println("No Response");
//      }
//      
//      //Serial.println("http code: " + String(httpCode));
//      http.end();
//    } else {
//      Serial.println("Not connected");
//    }

}

void setup()
{
//  WiFi.begin(ssid, password); 
//  int timeout = 0;
//  while(WiFi.status() != WL_CONNECTED && timeout!=10) {
//    delay(500);
//    Serial.println("Connecting..."); 
//    timeout++;
//  }
//  
  server.begin(); 
  Serial.begin(9600); 
  Serial.println("Connected"); 
  Serial.begin(9600);
  pinMode(D0,OUTPUT);
  
  refreshState();
}
  long RL = 1000; // 1000 Ohm
  long Ro = 830; // 830 ohm ( SILAHKAN DISESUAIKAN)}
  
  void loop()
{
  sec=millis()/1000;
 if(state==1){
  if(millis()/1000>sec){
   

   int sensorvalue = analogRead(pinSensor); // membaca nilai ADC dari sensor
   float VRL= sensorvalue*5.00/1024;  // mengubah nilai ADC ( 0 - 1023 ) menjadi nilai voltase ( 0 - 5.00 volt )
   Serial.print("VRL : ");
   Serial.print(VRL);
   Serial.println(" volt");
  
   float Rs = ( 5.00 * RL / VRL ) - RL;
   Serial.print("Rs : ");
   Serial.print(Rs);
   Serial.println(" Ohm");
  
   ppm = 100 * pow(Rs / Ro,-1.53); // ppm = 100 * ((rs/ro)^-1.53);
   Serial.print("CO : ");
   Serial.print(ppm);
   Serial.println(" ppm");
   
   Serial.println();
   if(ppm>50&&ppm<200){
    alertInterval=1;
   }else if(ppm>200){
    alertInterval=2;
   }else{
    alertInterval=0;
   }

   if(sec%3==0){
//      if (WiFi.status() == WL_CONNECTED) {
//        HTTPClient http;
//        http.begin("http://192.168.1.51:3000/sendPPM");            
//        http.addHeader("Content-Type", "application/x-www-form-urlencoded");
//             
//        int httpCode1= http.POST("ppm="+String(ppm));
//        
//        if (httpCode1 > 0) {
//          String res = http.getString();
//          Serial.println("payload: " + res);
//        } else {
//          Serial.println("No Response");
//        }
//        
//        //Serial.println("http code: " + String(httpCode));
//        http.end();
//      } else {
//        Serial.println("Not connected");
//      }
//     }
  
 }

 
  if(alertInterval==1){
    pinMode(D1,OUTPUT);
    digitalWrite(D0, (millis() / 1000) % 2);
    digitalWrite(D1,(millis()/500)%2);
    if((millis()/500)%2==0){
      pinMode(D1,INPUT);
    }
  }else if(alertInterval==2){
    pinMode(D1,OUTPUT);
    digitalWrite(D0, (millis() / 500) % 2);
    digitalWrite(D1,(millis()/250)%2);
    if((millis()/250)%2==0){
      pinMode(D1,INPUT);
    }
  }else{
    digitalWrite(D0,LOW);
    pinMode(D1,INPUT);
  }
 }
 if(sec%5==0 && stateUpdate==0){
    refreshState();
    stateUpdate = 1;
 }else if(sec%5!=0 && stateUpdate==1){
  stateUpdate =0;
 }
 
  
}
}
