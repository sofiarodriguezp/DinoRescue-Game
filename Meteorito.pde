
class Meteorito{
  float posXM;
  float posYM;
  float tamM;
  
  boolean impactoM;

  Meteorito(){
    posXM = 0;
    posYM = height-70;
    tamM = 60;  
    
    impactoM = false;
  }
      void displayI(){
    image(meteorito,posXM,posYM,tamM,tamM);
  }
  
      void displayD(){
    image(meteorito,posXM+width,posYM-250,tamM,tamM);
  }
  
      void displayI2(){
    image(meteorito,posXM,posYM-500,tamM,tamM);
  }
  
      void displayD2(){
    image(meteorito,posXM+width,posYM-750,tamM,tamM);
  }  

  void actionI(){
    posXM+=15;
  }
  
  void actionD(){
    posXM-=15;
  }  

  void impactoMDino(){
   impactoM = true; 
  }  
}
