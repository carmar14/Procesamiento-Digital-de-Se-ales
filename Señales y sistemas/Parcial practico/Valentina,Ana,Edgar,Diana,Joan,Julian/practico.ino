double n=0;
double tfd1;
double tfd2;
double tfd3;
double tfd4;
double tfd5;
double u=1;
int D=1;
int C=0;
int i=0;
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

tfd1=(-0.9+(0.856*pow(0.9048,n)))*u;
tfd2=(-0.9+(0.856*pow(0.9048,n)))*u;
tfd3=(-(207/238)+(0.8277*pow(0.9048,n)))*u;
tfd4=(-(71/70)+(0.970*pow(0.9048,n)))*u;
tfd5=(-(1927/2380)+(0.770*pow(0.9048,n)))*u;
Serial.print(tfd1);
Serial.print(",");
Serial.print(tfd2);
Serial.print(",");
Serial.print(tfd3-1);
Serial.print(",");
Serial.print(tfd4);
Serial.print(",");
Serial.println(tfd5-1);


n=n+0.1;

}
