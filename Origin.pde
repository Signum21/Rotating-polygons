//baseSides supports from 4 to 10 sides
final int baseSides = 10, len = 200;

int rotationAngle = 0, currentIndex = 0;
float angleDifference;
PVector traslPoint = new PVector(0, 0);
final ArrayList<Polygon> polygons = new ArrayList<Polygon>();
final Polygon base = new Polygon(baseSides);

void settings(){    
  final float widthC = base.getVertex(round(baseSides/3.0)).x*2+len+2;
  final float heightC = abs(base.getVertex(ceil(baseSides/2.0)).y)+2;
  size((int)widthC, (int)heightC);
}

void setup(){
  stroke(255);
  noFill();
  
  for(int a = baseSides-1; a >= 3; a--){
    polygons.add(new Polygon(a));
  }
  angleDifference = base.angle - polygons.get(polygons.size()-1).angle;
}

void draw(){
  background(0);
  translate(width/2+len/2, height-1);
  base.display();  
  movePolygons();
  
  if(rotationAngle >= angleDifference){
    setNextRotationVertex();
  }
}

void movePolygons(){
  translate(traslPoint.x, traslPoint.y);
  
  for(Polygon pol : polygons){
    pushMatrix();
    rotate(radians(map(rotationAngle, 0, angleDifference, 0, base.angle - pol.angle)));
    pol.display();  
    popMatrix();
  }
  rotationAngle += 2;
}

void setNextRotationVertex(){
  traslPoint = base.getVertex((++currentIndex + 1) % baseSides);
   
  for(Polygon pol : polygons){
    pol.createVertices(base.getVertex(currentIndex % baseSides), traslPoint, currentIndex, baseSides);
  }
  rotationAngle = 0;
}