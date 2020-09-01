int a=4;
double F1=0.0;
double an;
int A=1;
int cont=0;
int c=0;
double t=0.0;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
double F[a][63];

{
  for(int n=2;n<=a;n++)
  {
  
    //an = (2*A)*((sin(PI*n))-((PI*n)*cos(n*PI)))/(pow(n,2)*pow(PI,2));
    an = (1/PI)*(((-1/(n+1))*(cos(n*PI)-1))+((-1/(1-n))*(cos(n*PI)-1)));
    while(t<=2*PI)
    {
      F[n-1][cont]=an*cos(n*t);
      t=t+0.1;
      cont=cont+1;
    }
    t=0.0;
    cont=0;
  }
 
}
for(int n=0;n<63;n++)
{
  for(int i=0;i<a;i++)
  {
    F1+=F[i][n];
    }
    Serial.println(F1+((2*A)/PI));
    F1=0.0;
    
  }
  
}
