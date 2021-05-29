
class Huevo{
  float posXH;
  float posYH;
  float tamH;
  
  boolean impactoH;
  
  Huevo(){
    posXH = 0;
    posYH = height-240;
    tamH = 60;
    
    impactoH = false;
  }
 
    void displayI(){
      if (impactoH == false){      
    image(huevo,posXH,posYH,tamH,tamH);
  }
    }
  
    void displayD(){
      if (impactoH == false){        
    image(huevo,posXH+width,posYH-250,tamH,tamH);
      }
  }

    void displayI2(){
      if (impactoH == false){        
    image(huevo,posXH,posYH-500,tamH,tamH);
      }
  }
  
    void displayD2(){
      if (impactoH == false){        
    image(huevo,posXH+width,posYH-750,tamH,tamH);
      }
  }  

  void actionI(){
    posXH+=20;
  }

  void actionD(){
    posXH-=20;
  }
  
  void impactoHDino(){
   impactoH = true; 
  }
  
}
