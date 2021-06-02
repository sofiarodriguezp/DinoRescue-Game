//DINORESCUE 

//En este juego la misión es llevar al dinosaurio a la parte superior de la pantalla
//con las teclas de las flechas se puede mover el dinosaurio hacia los lados, 
//bajarlo más rápido del salto y subir al siguiente piso,
//y con la tecla espaciadora se realiza el salto del dinosaurio.

//Hay que evitar los meteoritos que causan una "muerte" inmediata,
//y los fuegos que causan la perdida de una de las vivas (hay tres en total),
//pero estas se pueden recuperar con los huevos, que además otorgan más puntos al puntaje-.
//El puntaje se toma según el tiempo que dure el jugador con vida.

//Todas las pantallas tienen una tecla para cambiar entre ellas
//Pantalla de inicio = "r"
//Pantalla de instrucciones = "i"
//Pantalla de juego 1 = "a"
//Pantalla de juego 2 = "b"
//Pantalla de juego 3 = "c"
//Pantalla de juego 4 = "d"
//Pantalla de perder = "p"
//Pantalla de ganar = "g"



//SONIDO
import processing.sound.*;
SoundFile sonidoFuego;
SoundFile sonidoHuevo;



//IMAGENES
PImage fondointro;
PImage metintro;
PImage botonplayintro;
PImage instrucciones;
PImage botonnext;
PImage fondojuego;
PImage corazon;
PImage dinojuegoI;
PImage dinojuegoD;
PImage arriba;
PImage fuego;
PImage meteorito;
PImage huevo;
PImage meta;
PImage fondoperder;
PImage fondoganar;
PImage botonagain;
PImage botonexit;

//FONT
PFont font;

//ESTADOS
int pantalla;
int INTRO = 1;
int INSTR =2;
int GAME1 =3;
int GAME2 =4;
int GAME3 =5;
int GAME4 =6;
int LOSE =7;
int WIN =8;

//VARIABLES
int posXmetintro=width;
int posYmetintro=0;
int posXdinoinstru=width+100;
int posXfireinstru=width+600;
int posXmetinstru=width+1100;
int posXegginstru=width+1600;

int vida = 0;
int muerte = 0;

int contadorPuntos = 0;

//PUNTAJE
Table scores;

int atraparHuevos;

int tiempoInicial;
int tiempoJuego;


//CLASES
Dinosaurio dino;

Corazon cora1;
Corazon cora2;
Corazon cora3;


ArrayList<Fuego> fire = new ArrayList<Fuego>();
ArrayList<Meteorito> met = new ArrayList<Meteorito>();
ArrayList<Huevo> egg = new ArrayList<Huevo>();

////////////////////////////////////////////////////////////////////////////////////////////
void setup(){
 fullScreen();
 
//SONIDO
sonidoFuego = new SoundFile (this, "Yoshi Mlem - Sound Effect.mp3");
sonidoHuevo = new SoundFile (this, "Mario Coin Sound - Sound Effect.mp3");
 
//FONT
font = loadFont("Simplex.vlw");
textFont(font);

//IMAGENES
fondointro = loadImage("Portada-18.png");
metintro = loadImage ("MetIntro-19.png");
botonplayintro = loadImage("BotonPlay-10.png");
instrucciones = loadImage("FondoInstru-11.jpg");
botonnext = loadImage("BotonNext-16.png");
fondojuego = loadImage("FondoJuego-01.jpg");
corazon = loadImage("Vida-06.png");
dinojuegoI = loadImage("DinoJuego-02.png");
dinojuegoD = loadImage("DinoPlay-13.png");
fuego = loadImage("Fuego-03.png");
meteorito = loadImage("Meteorito-04.png");
huevo = loadImage("Huevo-05.png");
arriba = loadImage("UpSign-22.png");
meta = loadImage("FinishGoal-24.png");
fondoperder = loadImage("FondoPerder-08.jpg");
fondoganar = loadImage("FondoGanar-12.jpg");
botonagain = loadImage("BotonAgain-15.png");
botonexit = loadImage("BotonExit-14.png");

pantalla = INTRO;

//CLASES
dino = new Dinosaurio (width-160,height-160, 160, 20,0,0.5);

cora1 = new Corazon (width -100, height-1070, 50);
cora2 = new Corazon (width -200, height-1070, 50);
cora3 = new Corazon (width -300, height-1070, 50);


//tiempoInicial = millis();

//scores = new Table();
//scores.addColumn("score");
//scores.addColumn("date");
scores = loadTable("data/scores.csv", "header");

}
////////////////////////////////////////////////////////////////////////////////////////////
//ACCION DINOSAURIO
void keyPressed(){
 if (keyCode==RIGHT){
  dino.moveR(); 
 }
 if (keyCode==LEFT){
  dino.moveL();
 }
 if (keyCode==DOWN){
  dino.land();
 }
 //SALTO
 if (key==' '){
   dino.jumpD();
 } 
}
/////////////////////////////////////////////////////////////////////////////////////////////
//BOTONES CAMBIO DE ESTADOS
void keyReleased(){
  if (key=='r'){
  pantalla=INTRO;  
  }
  else if(key=='p'){
   pantalla=LOSE; 
  }
  else if(key=='i'){
   pantalla=INSTR; 
  }
  else if(key=='a'){
   pantalla=GAME1; 
   tiempoInicial = millis();
  }
  else if(key=='b'){
   pantalla=GAME2; 
  }
  else if(key=='c'){
   pantalla=GAME3; 
  }
  else if(key=='d'){
   pantalla=GAME4; 
  } 
  else if(key=='g'){
   pantalla=WIN; 
  }  
}

void draw(){
  
    //println(sonidoFuego.position());
    //  println(sonidoHuevo.position());
////////////////////////////////////////////////////////////////////////////////////////////  
  //PRIMERA ESCENA (INTRO)
  if(pantalla == INTRO){
    
    fill(#130E24);
    rect(0,0, width, height);   
    fill(255);
    noStroke();
    ellipse (random(width),random(height),10,10);
    ellipse (random(width),random(height),10,10);
    ellipse (random(width),random(height),10,10);

    
    image(metintro, posXmetintro, posYmetintro, 200,200);
       posXmetintro = posXmetintro -50;
       if (posXmetintro <-100){
         posXmetintro =width;
       }
       posYmetintro = posYmetintro +50;
       if (posYmetintro >height){
         posYmetintro =0;
       } 
    image(metintro, posXmetintro+700, posYmetintro-500, 200,200);
       posXmetintro = posXmetintro -50;
       if (posXmetintro <-100){
         posXmetintro =width;
       }
       posYmetintro = posYmetintro +50;
       if (posYmetintro >height){
         posYmetintro =0;
       }       
    
   imageMode(CORNER); 
   image(fondointro,0,0,width,height);
   
   //BOTON PLAY
   imageMode(CENTER);
   image(botonplayintro,width-400,height-250,300,300);
   if(mousePressed ==true){
     if(mouseX>width-450 && mouseX<width-350 || mouseY>height-300 && mouseY<height-200){
       pantalla = INSTR;
    }
   }   
  }
////////////////////////////////////////////////////////////////////////////////////////////  
//ESCENA (INSTRUCCIONES)  
  else if (pantalla == INSTR){
   imageMode(CORNER);
   image (instrucciones,0,0);
       //Dinosaurio
       image (dinojuegoI, posXdinoinstru,height-160,160,160);
       posXdinoinstru = posXdinoinstru - 7;
       if (posXdinoinstru < -100){
        posXdinoinstru = width; 
       }
       //Fuego
       image (fuego,posXfireinstru, height-60,60,60);
       posXfireinstru = posXfireinstru -7;
       if (posXfireinstru <-100){
         posXfireinstru =width;
       }
       //Meteorito
       image (meteorito,posXmetinstru, height-60,60,60);
       posXmetinstru = posXmetinstru -7;
       if (posXmetinstru <-100){
         posXmetinstru =width;
       }       
       //Huevo
       image (huevo,posXegginstru, height-60,60,60);
       posXegginstru = posXegginstru -7;
       if (posXegginstru <-100){
         posXegginstru =width;
       }       
       
       //Botón
       imageMode (CENTER);
       image (botonnext, width-150, height/2,200,200);
       if(mousePressed == true){
       if(mouseX>width-250 && mouseX<width-50 || mouseY>height-440 && mouseY<height-540){
       pantalla = GAME1;
       tiempoInicial = millis();
       }
       }      
  }  

////////////////////////////////////////////////////////////////////////////////////////////
//ESCENA (JUEGO)
//PISO 1
  else if (pantalla == GAME1){
   imageMode(CORNER);
   image (fondojuego,0,0);      
   image (arriba,50,830,120,90);

   
  dino.displayI();
  dino.actionI();
    
//FUEGO
    if (random(1) < 0.009) {
    fire.add(new Fuego());
  } 
   for (Fuego f : fire) {
    f.actionI();
    f.displayI(); 
    
     if (dino.hitsI(f)){ 
      f.impactoFDino();      
      sonidoFuego.play();
      //noLoop();
       muerte = muerte+2;
    }   
  }
//METEORITO
   if (random(1) < 0.005) {
      met.add(new Meteorito());
    } 
     for (Meteorito m : met) {
      m.actionI();
      m.displayI();
      
     if (dino.hitsI(m)){
      pantalla = LOSE;
   int mes = month();
   int dia = day();
   int hora = hour();
   int min = minute();
   
   String GameDate = mes+"-"+dia+" "+hora+":"+min;
   
   TableRow fila = scores.addRow();
   fila.setInt("score", tiempoJuego);
   fila.setString("date", GameDate);
   
   saveTable(scores, "data/scores.csv");
     //noLoop();
    }
    }
//HUEVO
    if (random(1) < 0.006) {
    egg.add(new Huevo());
  } 
   for (Huevo h : egg) {
    h.actionI();
    h.displayI();  
    
    if (dino.hitsI(h)){
      h.impactoHDino();
      sonidoHuevo.play();
      
      contadorPuntos = contadorPuntos + 1;
     
      
      if (muerte<=0){
      muerte = 0;      
    }
    else if(muerte >= 1){
      muerte = muerte -1;
    }
    }
    
  }

  //CAMBIO CON FLECHA
  if( keyPressed == true && pantalla == GAME1 && dino.posXD <= 100){
 if (keyCode==UP){
  pantalla = GAME2; 
 }
  }  
}
//////////////////////////////////////////////////////////7
//PISO 2
  else if (pantalla == GAME2){
   imageMode(CORNER);
   image (fondojuego,0,0);
   
   image (arriba,1760,580,120,90);
   
     dino.displayD();
     dino.actionD();

//FUEGO
    if (random(1) < 0.009) {
    fire.add(new Fuego());
  } 
   for (Fuego f : fire) {
    f.actionD();
    f.displayD(); 
    
     if (dino.hitsD(f)){
      f.impactoFDino(); 
      sonidoFuego.play();
      muerte = muerte+2;
    }    
  }
  
//METEORITO
   if (random(1) < 0.005) {
      met.add(new Meteorito());
    } 
     for (Meteorito m : met) {
      m.actionD();
      m.displayD(); 
      
       if (dino.hitsD(m)){
        pantalla = LOSE;
   int mes = month();
   int dia = day();
   int hora = hour();
   int min = minute();
   
   String GameDate = mes+"-"+dia+" "+hora+":"+min;
   
   TableRow fila = scores.addRow();
   fila.setInt("score", tiempoJuego);
   fila.setString("date", GameDate);
   
   saveTable(scores, "data/scores.csv");
      }
    }
//HUEVO
    if (random(1) < 0.007) {
    egg.add(new Huevo());
  } 
   for (Huevo h : egg) {
    h.actionD();
    h.displayD(); 
    
    if (dino.hitsD(h)){
      h.impactoHDino();
      sonidoHuevo.play();
      
      contadorPuntos = contadorPuntos + 1;
      
      if (muerte<=0){
      muerte = 0;      
    }
    else if(muerte >= 1){
      muerte = muerte -1;
    }      
    }
  }  

  //CAMBIO CON FLECHA
  if( keyPressed == true && pantalla == GAME2 && dino.posXD >= 1600){
 if (keyCode==UP && pantalla == GAME2){
  pantalla = GAME3; 
 }
  }  
  }
  //////////////////////////////////////////////////////////////7
//PISO 3
  else if (pantalla == GAME3){
   imageMode(CORNER);
   image (fondojuego,0,0);
   
   image (arriba,50,330,120,90);

   
     dino.displayI2();
     dino.actionI2();
     
     //FUEGO
    if (random(1) < 0.009) {
    fire.add(new Fuego());
  } 
   for (Fuego f : fire) {
    f.actionI();
    f.displayI2();  
    
     if (dino.hitsI(f)){
      f.impactoFDino(); 
      sonidoFuego.play();
        muerte = muerte+2;
    }    
  }
  
//METEORITO
   if (random(1) < 0.005) {
      met.add(new Meteorito());
    } 
     for (Meteorito m : met) {
      m.actionI();
      m.displayI2(); 
      
     if (dino.hitsI(m)){
      pantalla = LOSE;
   int mes = month();
   int dia = day();
   int hora = hour();
   int min = minute();
   
   String GameDate = mes+"-"+dia+" "+hora+":"+min;
   
   TableRow fila = scores.addRow();
   fila.setInt("score", tiempoJuego);
   fila.setString("date", GameDate);
   
   saveTable(scores, "data/scores.csv");
    }
    }
//HUEVO
    if (random(1) < 0.007) {
    egg.add(new Huevo());
  } 
   for (Huevo h : egg) {
    h.actionI();
    h.displayI2(); 
    
    if (dino.hitsI(h)){
      h.impactoHDino(); 
      sonidoHuevo.play();
      
      contadorPuntos = contadorPuntos + 1;
      
      if (muerte<=0){
      muerte = 0;      
    }
    else if(muerte >= 1){
      muerte = muerte -1;
    }
    }   
  }  

  //CAMBIO CON FLECHA
  if( keyPressed == true && pantalla == GAME3 && dino.posXD <= 100){
 if (keyCode==UP && pantalla == GAME3){
  pantalla = GAME4; 
 }
  }
  }
//////////////////////////////////////////////////////////////////////
//PISO 4
  else if (pantalla == GAME4){
   imageMode(CORNER);
   image (fondojuego,0,0);

     dino.displayD2();
     dino.actionD2();

     
     //META
   image (meta,width-300,height-1000,300,150);     
     if (dino.posXD >=1600){
     pantalla = WIN;
     
     
   int mes = month();
   int dia = day();
   int hora = hour();
   int min = minute();
   
   String GameDate = mes+"-"+dia+" "+hora+":"+min;
   
   TableRow fila = scores.addRow();
   fila.setInt("score", tiempoJuego);
   fila.setString("date", GameDate);
   
   saveTable(scores, "data/scores.csv");
     }     
     
     //FUEGO
    if (random(1) < 0.009) {
    fire.add(new Fuego());
  } 
   for (Fuego f : fire) {
    f.actionD();
    f.displayD2();
    
     if (dino.hitsD(f)){
      f.impactoFDino();  
      sonidoFuego.play();
      muerte = muerte+2;
    }    
  }

//METEORITO
   if (random(1) < 0.005) {
      met.add(new Meteorito());
    } 
     for (Meteorito m : met) {
      m.actionD();
      m.displayD2();  
      
     if (dino.hitsD(m)){
      pantalla = LOSE;
   int mes = month();
   int dia = day();
   int hora = hour();
   int min = minute();
   
   String GameDate = mes+"-"+dia+" "+hora+":"+min;
   
   TableRow fila = scores.addRow();
   fila.setInt("score", tiempoJuego);
   fila.setString("date", GameDate);
   
   saveTable(scores, "data/scores.csv");
    }
    }
//HUEVO
    if (random(1) < 0.007) {
    egg.add(new Huevo());
  } 
   for (Huevo h : egg) {
    h.actionD();
    h.displayD2(); 
    
    if (dino.hitsD(h)){
      h.impactoHDino(); 
      sonidoHuevo.play();
      
      contadorPuntos = contadorPuntos + 1;
      
      if (muerte<=0){
      muerte = 0;      
    }
    else if(muerte >= 1){
      muerte = muerte -1;
    }      
    }    
  }
  }

//////////////////////////////////////////////////////////////////////////////////////////// 
if (pantalla==GAME1 || pantalla==GAME2 || pantalla==GAME3 || pantalla==GAME4){
  
  if(muerte <=3){
   cora1.show();
   cora2.show();
   cora3.show();
  }
  else if (muerte>=4 && muerte <=7){
   cora1.show();
   cora2.show();
  }
  else if (muerte>=8 && muerte <=11){
   cora1.show();    
  }
  else if (muerte>=12){
    pantalla = LOSE;
    
    //PUNTAJE
   int mes = month();
   int dia = day();
   int hora = hour();
   int min = minute();
   
   String GameDate = mes+"-"+dia+" "+hora+":"+min;
   
   TableRow fila = scores.addRow();
   fila.setInt("score", tiempoJuego);
   fila.setString("date", GameDate);
   
   saveTable(scores, "data/scores.csv");
  }
// println (muerte);
 
 
 //PUNTAJE
  tiempoJuego = (millis() - tiempoInicial)/10 + (contadorPuntos*10);

    fill(0);
   text(str(tiempoJuego),width/2,50);
  
}
////////////////////////////////////////////////////////////////////////////////////////////
//ESCENA FINAL (PERDER)
    else if (pantalla == LOSE){
   imageMode(CORNER);
   image (fondoperder,0,0);   
      
   //Puntaje
   fill(255);
   text(str(tiempoJuego),width/2,height-50);   
  
    //Botones
       imageMode (CENTER);
       image (botonexit, width-1720, height-150,200,200);
       if(mousePressed == true){
       if(mouseX>width-1570 && mouseX<width-1870 || mouseY>height-200 && mouseY<height-100){
       exit();
       }
       }
       //PLAY AGAIN
       imageMode (CENTER);
       image (botonagain, width-200, height-940,200,200);
       if(mousePressed == true){
       if(mouseX>width-300 && mouseX<width || mouseY>height-840 && mouseY<height-1040){
         
       pantalla = GAME1;  
       tiempoInicial = millis();
       contadorPuntos = 0;
       muerte = 0;       
       dino = new Dinosaurio (width-160,height-160, 160, 20,0,0.5);  
        fire = new ArrayList<Fuego>();
        met = new ArrayList<Meteorito>();
        egg = new ArrayList<Huevo>();
 
       
       }
       }       
       
   
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//ESCENA FINAL (GANAR)
 else if( pantalla == WIN){
   imageMode (CORNER);
   image (fondoganar,0,0);
   
   //Puntaje
   fill(255);
   text(str(tiempoJuego),width/2,90);  
   
    //Botones
       imageMode (CENTER);
       image (botonexit, width-1740, height-900,200,200);
       if(mousePressed == true){
       if(mouseX>width-1690 && mouseX<width-1790 || mouseY>height-950 && mouseY<height-850){
       exit();
       }
       }    
     //PLAY AGAIN
       imageMode (CENTER);
       image (botonagain, width-1740, height-200,200,200);
       if(mousePressed == true){
       if(mouseX>width-1790 && mouseX<width-1690 || mouseY>height-100 && mouseY<height-300){
         
       pantalla = GAME1;  
       tiempoInicial = millis();
       contadorPuntos = 0;
       muerte = 0;       
       dino = new Dinosaurio (width-160,height-160, 160, 20,0,0.5);
        fire = new ArrayList<Fuego>();
        met = new ArrayList<Meteorito>();
        egg = new ArrayList<Huevo>();
 
       
       }
       }       
   
 }
 
}
