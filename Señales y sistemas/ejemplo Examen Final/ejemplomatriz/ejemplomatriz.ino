int m[3][3];
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for(int i=0;i<3;i++){
    for (int j=0;j<3;j++){
        m[i][j]=i+j;
        if(j<2){
          
          Serial.print(m[i][j]);
          Serial.print(" ");
        }
        if(j==2){
          Serial.print( m[i][j]);
          Serial.println("New");
        }
      }
  }
}
