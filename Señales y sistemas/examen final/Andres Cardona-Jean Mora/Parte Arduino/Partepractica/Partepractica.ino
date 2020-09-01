int arm=10;
double fr=0.0;
double ft=0.0;
double An;
double t=0.0;
int A=3;
int cont=0;
int c=0;
double T=2*PI;


void setup() {
 
Serial.begin(9600);

}

void loop() {
  double f[arm][629];
  
  for (int n=1;n<=arm;n++){
    An=2*A*(cos(n*PI)-1)/(n*n*PI*PI);
    //An=(1/(2*n-1)^2)*cos((2*(2*n-1)*PI*t)/T);
    while(t<=2*PI){
    
        f[n-1][cont]=An*cos(n*t);
        t=t+0.01;
        cont=cont+1;
    }
  t=0.0;
  cont=0;
}
   

 for (int n=0;n<629;n++){
    for(int i=0;i<arm;i++){
      fr+=f[i][n];
      //ft=fr+A/2;
    }
    ft=fr+(A/2);
    Serial.println(ft);
    fr=0.0;

  }
 //arm+=1;
 //if (arm>17)arm=1;
}
