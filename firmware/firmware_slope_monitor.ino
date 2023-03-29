/*
   25/06/2020
   Fabrício Sousa
   Exemplo IBM Watson IoT Platform + Planta IoT
   Hardware: new NodeMCU LoLin V3 + Sensor umidade solo


   Logica:
   1. efetua conexao com a rede WiFi
   2. obtem a grandeza de umidade do solo
   3. conecta no servidor MQTT IBM Watson IoT Platform
   4. publica a JSON string para o topico 
   
   referencias Bluemix e IoTF:
   Autor: FilipeFlop
   https://www.filipeflop.com/blog/planta-iot-com-esp8266-nodemcu/
   
*/


#include <ESP8266WiFi.h>
#include <PubSubClient.h>


//atualize SSID e senha WiFi
const char* ssid = "HackaTruckVisitantes";
const char* password = "";


//D4 only for Lolin board
#define LED_BUILTIN D4
#define INCLINOMETRO 16
#define UMIDADE 5


//Atualize os valores de Org, device type, device id e token
#define ORG "k7vm21"
#define DEVICE_TYPE "monitorDeEncostas"
#define DEVICE_ID "monitorDeEncostas2023"
#define TOKEN "12345678"


//broker messagesight server
char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
char topic[] = "iot-2/evt/status/fmt/json";
char authMethod[] = "use-token-auth";
char token[] = TOKEN;
char clientId[] = "d:" ORG ":" DEVICE_TYPE ":" DEVICE_ID;



float umidade = 0.0;
char umidadestr[6];


WiFiClient wifiClient;
PubSubClient client(server, 1883, NULL, wifiClient);


void setup() {
  Serial.begin(115200);
  Serial.println();
  Serial.println("Iniciando...");

  pinMode(INCLINOMETRO,OUTPUT); 
  pinMode(UMIDADE,OUTPUT);
  digitalWrite(INCLINOMETRO,LOW);
  digitalWrite(UMIDADE,LOW);

  Serial.print("Conectando na rede WiFi "); Serial.print(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("[INFO] Conectado WiFi IP: ");
  Serial.println(WiFi.localIP());


  pinMode(LED_BUILTIN, OUTPUT);
}


//Função: faz a leitura do nível de umidade
//Parâmetros: nenhum
//Retorno: umidade percentual (0-100)
//Observação: o ADC do NodeMCU permite até, no máximo, 3.3V. Dessa forma,
//            para 3.3V, obtem-se (empiricamente) 978 como leitura de ADC
float FazLeituraUmidade(void)
{
    int ValorADC;
    float UmidadePercentual;
    delay(100);
    digitalWrite(UMIDADE,HIGH);
    delay(1000);
 
     ValorADC = analogRead(0);   //978 -> 3,3V
     
     UmidadePercentual = 100 * ((978-(float)ValorADC) / 978);
     
     digitalWrite(UMIDADE,LOW);
 
     return UmidadePercentual;
}

bool inRange(float val, float minimum, float maximum)
{
  return (((minimum+2.5) < val) && (val <= (maximum+2.5)));
}


float inclinometro(void)
{
    int ValorADC;
    float anguloInclinacao;
     delay(100);
     digitalWrite(INCLINOMETRO,HIGH);
     delay(1000); 
     ValorADC = analogRead(0);   //978 -> 3,3V

     //557 = 0
     //878 = 90 
     //878-557 = 321 == 90

     anguloInclinacao = (((float)ValorADC-557)*90)/321;

     digitalWrite(INCLINOMETRO,LOW);
 
     return anguloInclinacao;
}

float angleToSegmentos(float anguloInclinacao){
  
        if (anguloInclinacao < 0) {
          anguloInclinacao = 0;
        }
        else if (anguloInclinacao > 90) {
          anguloInclinacao = 90;
        }
        else if (inRange(anguloInclinacao, 0, 5)) {
          anguloInclinacao = 5;
        }
        else if (inRange(anguloInclinacao, 5, 10)) {
          anguloInclinacao = 10;
        }
        else if (inRange(anguloInclinacao, 10, 15)) {
          anguloInclinacao = 15;
        }
        else if (inRange(anguloInclinacao, 15, 20)) {
          anguloInclinacao = 20;
        }
        else if (inRange(anguloInclinacao, 20, 25)) {
          anguloInclinacao = 25;
        }
        else if (inRange(anguloInclinacao, 25, 30)) {
          anguloInclinacao = 30;
        }
        else if (inRange(anguloInclinacao, 30, 35)) {
          anguloInclinacao = 35;
        }
        else if (inRange(anguloInclinacao, 35, 40)) {
          anguloInclinacao = 40;
        }
        else if (inRange(anguloInclinacao, 40, 45)) {
          anguloInclinacao = 45;
        }
        else if (inRange(anguloInclinacao, 45, 50)) {
          anguloInclinacao = 50;
        }
        else if (inRange(anguloInclinacao, 50, 55)) {
          anguloInclinacao = 55;
        }
        else if (inRange(anguloInclinacao, 55, 60)) {
          anguloInclinacao = 60;
        }
        else if (inRange(anguloInclinacao, 60, 65)) {
          anguloInclinacao = 65;
        }
        else if (inRange(anguloInclinacao, 65, 70)) {
          anguloInclinacao = 70;
        }
        else if (inRange(anguloInclinacao, 70, 75)) {
          anguloInclinacao = 75;
        }
        else if (inRange(anguloInclinacao, 75, 80)) {
          anguloInclinacao = 80;
        }
        else if (inRange(anguloInclinacao, 80, 85)) {
          anguloInclinacao = 85;
        }
        else if (inRange(anguloInclinacao, 85, 87.5)) {
          anguloInclinacao = 90;
        }
        else{
          anguloInclinacao = 0;          
         }

         return anguloInclinacao;
}

void loop() {


  if (!!!client.connected()) {
    Serial.print("Reconnecting client to ");
    Serial.println(server);
    while (!!!client.connect(clientId, authMethod, token)) {
      Serial.print(".");
      delay(500);
    }
    Serial.println();
  }


  float umidade = FazLeituraUmidade();
  delay(100);
  float inclinacao = inclinometro();
  float inclinacaoSegmentos = angleToSegmentos(inclinacao);
  
  // Conversao Floats para Strings
  char TempString[32];  //  array de character temporario
  char TempStringInclinacao[32];  //  array de character temporario
  char TempStringInclinacaoSegmentos[32];  //  array de character temporario


  dtostrf(umidade, 2, 1, TempString);
  dtostrf(inclinacao, 2, 1, TempStringInclinacao);
  dtostrf(inclinacaoSegmentos, 2, 1, TempStringInclinacaoSegmentos);
  String umidadestr =  String(TempString);
  String inclinacaostr =  String(TempStringInclinacao);
  String inclinacaoSegmentosstr =  String(TempStringInclinacaoSegmentos);


  // Prepara JSON para IOT Platform
  int length = 0;


  String payload = "{\"d\":{\"umidade\":\"" + umidadestr + "\",\"inclinacaoDegrees\":\"" + inclinacaostr + "\",\"inclinacaoSegmentos\":\"" + inclinacaoSegmentosstr + "\" }}";


  length = payload.length();
//  Serial.print(F("\nData length"));
//  Serial.println(length);


  Serial.print("Sending payload: ");
  Serial.println(payload);


  if (client.publish(topic, (char*) payload.c_str())) {
    Serial.println("Publish ok");
    digitalWrite(LED_BUILTIN, LOW);
    delay(500);
    digitalWrite(LED_BUILTIN, HIGH);
    delay(500);
  } else {
    Serial.println("Publish failed");
    Serial.println(client.state());
  }
}
