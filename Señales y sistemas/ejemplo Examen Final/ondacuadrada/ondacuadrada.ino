int arm=3;
//double f=0.0;
//double f[1257*arm];
double fr=0.0;//[1257];
double bn;
double t=0.0;
int A=1;
int cont=0;
int c=0;
//int na[arm];


void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);

}

void loop() {
  double f[arm][629];
  if (c==0){
      for (int n=1;n<=arm;n++){
        bn=A*(1-2*cos(n*PI)+cos(2*n*PI))/(n*PI);
        while(t<=2*PI){
            //if (cont==0){
              //f[cont*n]=bn*sin(n*t);
              
            //}
            //else{
              //f[cont*n]=f[cont*n-1]+bn*sin(n*t);
            //}
            //Serial.println(f[n-1][cont]);
            f[n-1][cont]=bn*sin(n*t);
            t=t+0.01;
            cont=cont+1;
        }
      t=0.0;
      cont=0;
    }
    c=c+1;
 }

 for (int n=0;n<629;n++){
    for(int i=0;i<arm;i++){
      fr+=f[i][n];
    }
    Serial.println(fr);
    fr=0.0;

  }
  
}
