
class Dinosaurio{
  
  float posXD;
  float posYD;
  float tamD;
  float velXD;
  float velYD;
  float gravD;
  float piso;
    
    Dinosaurio (float posXDtemp, float posYDtemp, float tamDtemp, float velXDtemp, float velYDtemp, float gravDtemp){
     posXD = posXDtemp;
     posYD = posYDtemp;
     tamD = tamDtemp;
     velXD = velXDtemp;
     velYD = velYDtemp;
     gravD = gravDtemp;
   }

///////////////////////////////////////////////////////////////////////////////////////////////////////   
//DINO 1 

  void displayI(){
    image (dinojuegoI, posXD,posYD,tamD,tamD);   
  }
//DINO 2  
  void displayD(){
   image (dinojuegoD,posXD,posYD-250,tamD,tamD); 
  }
//DINO 3  
  void displayI2(){
    image (dinojuegoI, posXD,posYD-500,tamD,tamD);   
  }
//DINO 4  
  void displayD2(){
   image (dinojuegoD,posXD,posYD-750,tamD,tamD); 
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////  
//COLISION IZQUIERDA
boolean hitsI(Meteorito met){
  float posXD1 = posXD + tamD * 0.5;
  float posYD1 = posYD + tamD * 0.5;
  float posXM1 = met.posXM + met.tamM * 0.5;
  float posYM1 = met.posYM + met.tamM * 0.5;
  return collideM (posXD1, posYD1, tamD, posXM1, posYM1, met.tamM);
}

boolean hitsI(Fuego fire){
  float posXD1 = posXD + tamD * 0.5;
  float posYD1 = posYD + tamD * 0.5;
  float posXM1 = fire.posXF + fire.tamF * 0.5;
  float posYM1 = fire.posYF + fire.tamF * 0.5;
  return collideM (posXD1, posYD1, tamD, posXM1, posYM1, fire.tamF);
}

boolean hitsI(Huevo egg){
  float posXD1 = posXD + tamD * 0.5;
  float posYD1 = posYD + tamD * 0.5;
  float posXH1 = egg.posXH + egg.tamH * 0.5;
  float posYH1 = egg.posYH + egg.tamH * 0.5;
  return collideH (posXD1, posYD1, tamD, posXH1, posYH1, egg.tamH);
}

//COLISION DERECHA
boolean hitsD(Meteorito met){
  float posXD1 = posXD + tamD * 0.5;
  float posYD1 = posYD + tamD * 0.5;
  float posXM1 = met.posXM + met.tamM * 0.5;
  float posYM1 = met.posYM + met.tamM * 0.5;
  return collideM (posXD1, posYD1, tamD, posXM1+width, posYM1, met.tamM);
}

boolean hitsD(Fuego fire){
  float posXD1 = posXD + tamD * 0.5;
  float posYD1 = posYD + tamD * 0.5;
  float posXM1 = fire.posXF + fire.tamF * 0.5;
  float posYM1 = fire.posYF + fire.tamF * 0.5;
  return collideM (posXD1, posYD1, tamD, posXM1+width, posYM1, fire.tamF);
}

boolean hitsD(Huevo egg){
  float posXD1 = posXD + tamD * 0.5;
  float posYD1 = posYD + tamD * 0.5;
  float posXH1 = egg.posXH + egg.tamH * 0.5;
  float posYH1 = egg.posYH + egg.tamH * 0.5;
  return collideH (posXD1, posYD1, tamD, posXH1+width, posYH1, egg.tamH);
}


////////////////////////////////////////////////////////////////////////////////////////////////////////  
void moveR(){ 
  posXD = posXD + velXD;
}
void moveL(){
  posXD = posXD - velXD;  
}

void jumpD(){
 if (posYD ==  height-160 || posYD == height-410 || posYD == height-660 || posYD == height-910){
   velYD =-9;
 }
}
////////////////////////////////////////////////////////////////////////////////////////////
 //SALTO
void actionI(){
 posYD += velYD; 
 velYD += gravD;
 posYD = constrain(posYD, 0, height-160); 
}
void actionD(){
 posYD += velYD; 
 velYD += gravD;
 posYD = constrain(posYD, 0, height-160); 
}
void actionI2(){
 posYD += velYD; 
 velYD += gravD;
 posYD = constrain(posYD, 0, height-160); 
}

void actionD2(){
 posYD += velYD; 
 velYD += gravD;
 posYD = constrain(posYD, 0, height-160); 
}

void land(){
 posYD = height-160; 
}

void upI(){
  posXD = 0;
}

}
//////////////////////////////////////////////////////////////////////////////////////////////////
//estaba en 3
//COLISION METEORITO
boolean collideM (float posXD, float posYD, float tamD, float posXM, float posYM, float tamM){
  if ( dist(posXD, posYD, posXM, posYM) <= (tamD/5)+(tamM/5) ) {
    return true;
    
  }
    return false;
  }
  
//COLISION FUEGO
boolean collideF (float posXD, float posYD, float tamD, float posXF, float posYF, float tamF){
  if ( dist(posXD, posYD, posXF, posYF) <= (tamD/5)+(tamF/5) ) {
    return true;

  }
    return false;
  }

//ATRAPAR HUEVOS
boolean collideH (float posXD, float posYD, float tamD, float posXH, float posYH, float tamH){
  if ( dist(posXD, posYD, posXH, posYH) <= (tamD/3)+(tamH/3) ) {
    return true;
  }
    return false;
  }
