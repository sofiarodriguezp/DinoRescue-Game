class Corazon{
 float posXV; 
 float posYV;
 float tamV;

   Corazon(float posXVtemp, float posYVtemp, float tamVtemp){
    posXV = posXVtemp;
    posYV = posYVtemp;
    tamV = tamVtemp;
   
    }
      void show(){
    image(corazon,posXV,posYV,tamV,tamV);
  } 
}
