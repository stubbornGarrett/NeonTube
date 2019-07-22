class Piece{
  float xPos, yPos, diameter, direction, depth;
  int vertCount;
  color quadColor, lineColor, circColor;
  Vertice[] vertices;
  
  Piece(float x, float y, float d, float dep, int vCnt){
    xPos = x;
    yPos = y;
    diameter = d;
    direction = 0;
    depth = dep;
    vertCount = vCnt;
    
    vertices = new Vertice[vertCount];
    for(int v = 0; v < vertCount; v++){
      float xCord = xPos+diameter*cos(PI*((360.0/vertCount*v)+direction)/180.0);
      float yCord = yPos+diameter*sin(PI*((360.0/vertCount*v)+direction)/180.0);
      vertices[v] = new Vertice(xCord, yCord, color(255*depth*1.8, 0, 250*depth*1.8), color(0, 155*depth*1.8, 155*depth*1.8), color(155*depth*1.8, 0, 155*depth*1.8));
    }
  }
  
  void display(Piece nextPiece, float depth){
    for(int v = 0; v < vertCount; v++){
      //Quads
      noStroke();
      fill(quadColor);
      if(v < vertCount-1){
        quad(vertices[v].xPos, vertices[v].yPos, vertices[v+1].xPos, vertices[v+1].yPos, nextPiece.vertices[v+1].xPos, nextPiece.vertices[v+1].yPos, nextPiece.vertices[v].xPos, nextPiece.vertices[v].yPos);
      }else{
        quad(vertices[v].xPos, vertices[v].yPos, vertices[0].xPos, vertices[0].yPos, nextPiece.vertices[0].xPos, nextPiece.vertices[0].yPos, nextPiece.vertices[v].xPos, nextPiece.vertices[v].yPos);
      }
      
      //Circles
      stroke(circColor);
      noFill();
      if(v < vertCount-1){
        line(vertices[v].xPos, vertices[v].yPos, vertices[v+1].xPos, vertices[v+1].yPos);
      }else{
        line(vertices[v].xPos, vertices[v].yPos, vertices[0].xPos, vertices[0].yPos);
      }
      
      //Lines
      stroke(lineColor);
      noFill();
      line(vertices[v].xPos, vertices[v].yPos, nextPiece.vertices[v].xPos, nextPiece.vertices[v].yPos);
    }
  }
  
  void setPosition(float x, float y){
    xPos = x;
    yPos = y;
  }
  
  void addRotation(float degree){
    if(direction+degree > 360){
      direction = (direction+degree)-360;
    }else{
      direction += degree;
    }
  }
  
  void increasDiameter(float add){
    diameter += add;
  }
  
  void updateVertices(){
    for(int v = 0; v < vertCount; v++){
      vertices[v].setPosition(xPos+diameter*cos(PI*((360/vertCount*v)+direction)/180.0), yPos+diameter*sin(PI*((360/vertCount*v)+direction)/180.0));
    }
  }

  void updateQuadsColor(color c){
    for(int v = 0; v < vertCount; v++){
      quadColor = c;
    }
  }

  void updateLinesColor(color c){
    for(int v = 0; v < vertCount; v++){
      lineColor = c;
    }
  }

  void updateCirclColor(color c){
    for(int v = 0; v < vertCount; v++){
      circColor = c;
    }
  }
}
