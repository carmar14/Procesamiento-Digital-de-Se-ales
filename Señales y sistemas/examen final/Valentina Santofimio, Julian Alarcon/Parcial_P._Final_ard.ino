int arm=15;
double fr=0.0;//[1257];
double bn;
double an;
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
  //double f[arm][629];
  double f[arm][63];
      for (int n=1;n<=arm;n++){
        if (n==1)
        {
          an=0;
          bn=A*0.5;
        }
        else
        {
          an=(A/PI)*(cos(n*PI)+1)/(1-(n*n));
         
          bn=0;
        }
        while(t<=2*PI){
            
            f[n-1][cont]=bn*sin(n*t)+an*cos(n*t);
            t=t+0.1;
            cont=cont+1;
        }
      t=0.0;
      cont=0;
      c=c+1;
    }
    


 for (int n=0;n<63;n++){
    for(int i=0;i<arm;i++){
      fr+=f[i][n];
    }
    Serial.println(fr +(A/PI));
    fr=0.0;

  }
  
}
