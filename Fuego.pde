
class Fuego{
  float posXF;
  float posYF;
  float tamF;
  
  boolean impactoF;
  
  Fuego(){
    posXF = 0;
    posYF = height-70;
    tamF = 60;
    
    impactoF = false;
    
  }
 
    void displayI(){
      if (impactoF == false){
    image(fuego,posXF,posYF,tamF,tamF);
      }
  }
  
    void displayD(){
      if (impactoF == false){      
    image(fuego,posXF+width,posYF-250,tamF,tamF);
  }
    }
  
    void displayI2(){
      if (impactoF == false){      
    image(fuego,posXF,posYF-500,tamF,tamF);
  }
    }
  
    void displayD2(){
      if (impactoF == false){      
    image(fuego,posXF+width,posYF-750,tamF,tamF);
  }  
    }

  void actionI(){
    posXF+=20;
  }
  
  void actionD(){
    posXF-=20;    
  }
  
  void impactoFDino(){
   impactoF = true; 
  }
  
}
