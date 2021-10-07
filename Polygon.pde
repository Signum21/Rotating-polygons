class Polygon{
  final PVector[] vertices;
  final float angle;
  
  Polygon(int sides){    
    angle = (float)180*(sides-2)/sides;
    vertices = new PVector[sides];
    createVertices(new PVector(-len, 0), new PVector(0, 0), 0, 1);
  }
  
  void display(){
    beginShape();
    
    for(PVector p : vertices){
      vertex(p.x, p.y);
    }
    endShape(CLOSE);
  }
  
  void createVertices(PVector punto1, PVector punto2, int index, int rotations){
    float x = 0, y = 0; 
    vertices[0] = new PVector(punto1.x, punto1.y).sub(punto2);
    vertices[1] = new PVector(0, 0);
      
    for(int b = 2; b < vertices.length; b++){
      x = x + len * cos(radians((180+angle)*(b-1)-360/rotations*index));
      y = y + len * sin(radians((180+angle)*(b-1)-360/rotations*index));
      vertices[b] = new PVector(x, y);
    }
  }
  
  PVector getVertex(int pos){
    return vertices[pos];
  }
}
