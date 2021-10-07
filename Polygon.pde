class Polygon{
  final PVector[] vertices;
  final float angle;
  final int sideLength;
  
  Polygon(int sides, int _sideLength){    
    sideLength = _sideLength;
    angle = (float)180*(sides-2)/sides;
    vertices = new PVector[sides];
    createVertices(new PVector(-sideLength, 0), new PVector(0, 0), 0, 1);
  }
  
  void display(){
    beginShape();
    
    for(PVector p : vertices){
      vertex(p.x, p.y);
    }
    endShape(CLOSE);
  }
  
  void createVertices(PVector currentVertex, PVector _traslPoint, int index, int rotations){
    float x = 0, y = 0; 
    vertices[0] = new PVector(currentVertex.x, currentVertex.y).sub(_traslPoint);
    vertices[1] = new PVector(0, 0);
      
    for(int b = 2; b < vertices.length; b++){
      x = x + sideLength * cos(radians((180+angle)*(b-1)-360/rotations*index));
      y = y + sideLength * sin(radians((180+angle)*(b-1)-360/rotations*index));
      vertices[b] = new PVector(x, y);
    }
  }
  
  PVector getVertex(int pos){
    return vertices[pos];
  }

  int getSides(){
    return vertices.length;
  }
}
