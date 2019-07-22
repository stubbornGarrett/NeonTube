float pieceCount = 60;  //Count of Segments
float vertiCount = 40;  //Edges of the "Circle"
Piece[] pieces;       //Segments, which build the tube
float time = 0;
int colorSeed = 0;

void setup(){
  size(900, 900);
  //fullScreen();
  pieces = new Piece[int(pieceCount)];
  for(int p = 0; p < pieceCount; p++){
    pieces[p] = new Piece(width/2, height/2, (width/pieceCount*(p+1))*1/pieceCount*(p+1), p/pieceCount, int(vertiCount));
  }
}

void draw(){
  background(10);
  for(int p = 0; p < pieceCount; p++){
    pieces[p].setPosition(mouseX-(mouseX-width/2)*p/pieceCount, mouseY-(mouseY-height/2)*p/pieceCount);
    pieces[p].addRotation(2); // 0 - 360
    //pieces[p].increasDiameter(2); //experimental
    pieces[p].updateVertices();
    pieces[p].updateQuadsColor(getColorPaternQuad(colorSeed, p, pieces[p]));
    pieces[p].updateLinesColor(getColorPaternLine(colorSeed, p, pieces[p]));
    pieces[p].updateCirclColor(getColorPaternCirc(colorSeed, p, pieces[p]));
  }
  
  for(int p = 0; p < pieceCount-1; p++){
    pieces[p].display(pieces[p+1], float(p));
  }
  time += .1; // Controls speed of color change
  if(time >= 999999){
    time = 0;
  }
}

void mouseClicked(){
  if(colorSeed <= 5){
    colorSeed += 1;
  }else{
    colorSeed = 0;
  }
}

color getColorPaternQuad(int seed, int cnt, Piece p){
  float r, g, b;
  switch(seed){
    case 0:
      r = 255;
      g = 0;
      b = 255;
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    case 1: //
      r = 255*((sin(time-PI)+1)*.9);
      g = 255*((cos(time)+1)*.9);
      b = 255*((cos(time)+1)*.9);
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    case 2: //Breathing purple
      r = 255*((cos(time)+1)*.9);
      g = 0;
      b = 255*((cos(time)+1)*.9);
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    case 3: //Negative Blue Grid
      r = 155*(cnt/pieceCount)*1;
      g = 0;
      b = 255*(cnt/pieceCount)*1.9;
      return color(r*p.depth, g*p.depth, b*p.depth);
    case 4: //Grid Rainbow
      return color( 0, 0, 0);
    case 5: //Full Rainbow
      r = 255*((cos(time+cnt*.2)+1)*.9);
      g = 255*((cos(time+cnt*.2+PI/2)+1)*.9);
      b = 255*((cos(time+cnt*.2+PI)+1)*.9);
      return color(r*p.depth*1.6, g*p.depth*1.6, b*p.depth*1.6);
    case 6:
      r = 255;
      g = 255;
      b = 255;
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    default:
      return color(255, 255, 255);
  }
}

color getColorPaternLine(int seed, int cnt, Piece p){
  float r, g, b;
  switch(seed){
    case 0:
      r = 0;
      g = 255;
      b = 255;
      return color(r*p.depth*1.8, g*p.depth*1.8, b*p.depth*1.8);
    case 1: //
      r = 255*((sin(time-PI)+1)*.9);
      g = 255*((cos(time)+1)*.9);
      b = 255*((cos(time)+1)*.9);
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    case 2: //Breathing purple
      r = 255-255*((cos(time)+1)*.9);
      g = 0;
      b = 0;
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    case 3: //Negative Blue Grid
      r = 0;
      g = 255*((pieceCount-cnt)/pieceCount)*1.9;
      b = 255*((pieceCount-cnt)/pieceCount)*1.9;
      return color(r*p.depth, g*p.depth, b*p.depth);
    case 4: //Grid Rainbow
      r = 255*((cos(time+cnt*.2)+1)*.9);
      g = 255*((sin(time+cnt*.2-PI)+1)*.9);
      b = 255*((cos(time+cnt*.2+PI)+1)*.9);
      return color(r*p.depth*1.6, g*p.depth*1.6, b*p.depth*1.6);
    case 5: //Full Rainbow
      r = 255*((cos(time+cnt*.2)+1)*.9);
      g = 255*((cos(time+cnt*.2+PI/2)+1)*.9);
      b = 255*((cos(time+cnt*.2+PI)+1)*.9);
      return color(r*p.depth*1.6, g*p.depth*1.6, b*p.depth*1.6);
    case 6:
      r = 0;
      g = 0;
      b = 0;
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    default:
      return color(0, 0, 0);
  }
}

color getColorPaternCirc(int seed, int cnt, Piece p){
  float r, g, b;
  switch(seed){
    case 0:
      r = 0;
      g = 255;
      b = 255;
      return color(r*p.depth, g*p.depth, b*p.depth);
    case 1: //
      r = 255*((sin(time-PI)+1)*.9);
      g = 255*((cos(time)+1)*.9);
      b = 255*((cos(time)+1)*.9);
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    case 2: //Breathing purple
      r = 255-255*((cos(time)+1)*.9);
      g = 0;
      b = 255-255*((cos(time)+1)*.9);
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    case 3: //Negative Blue Grid
      r = 0;
      g = 255*((pieceCount-cnt)/pieceCount)*1.9;
      b = 255*((pieceCount-cnt)/pieceCount)*1.9;
      return color(r*p.depth, g*p.depth, b*p.depth);
    case 4: //Grid Rainbow
      r = 255*((cos(time+cnt*.2)+1)*.9);
      g = 255*((sin(time+cnt*.2-PI)+1)*.9);
      b = 255*((cos(time+cnt*.2+PI)+1)*.9);
      return color(r*p.depth*1.6, g*p.depth*1.6, b*p.depth*1.6);
    case 5: //Full Rainbow
      r = 255*((cos(time+cnt*.2)+1)*.9);
      g = 255*((cos(time+cnt*.2+PI/2)+1)*.9);
      b = 255*((cos(time+cnt*.2+PI)+1)*.9);
      return color(r*p.depth*1.6, g*p.depth*1.6, b*p.depth*1.6);
    case 6:
      r = 0;
      g = 0;
      b = 0;
      return color(r*p.depth*.8, g*p.depth*.8, b*p.depth*.8);
    default:
      return color(0, 0, 0);
  }
}
