var rotationAngle, currentIndex;
var angleDifference;
var traslPoint;
var polygons;
var base;

function initializeFields(_baseSides, _len) {
  rotationAngle = 0;
  currentIndex = 0;
  polygons = [];
  traslPoint = createVector(0, 0);
  base = new Polygon(_baseSides, _len);
}

function setup(){
  const baseSides = int(document.getElementById("base_sides").value);
  const len = int(document.getElementById("side_length").value);
  initializeFields(baseSides, len);

  const widthC = base.getVertex(round(baseSides/3.0)).x*2+len+2;
  const heightC = abs(base.getVertex(ceil(baseSides/2.0)).y)+2;
  createCanvas(int(widthC), int(heightC));

  stroke(255);
  noFill();
  
  for(let a = base.getSides()-1; a >= 3; a--){
    polygons.push(new Polygon(a, base.sideLength));
  }
  angleDifference = base.angle - polygons[(polygons.length-1)].angle;
}

function draw(){
  background(0);
  translate(width/2 + base.sideLength/2, height-1);
  base.display();  
  movePolygons();
  
  if(rotationAngle >= angleDifference){
    setNextRotationVertex();
  }
}

function movePolygons(){
  translate(traslPoint.x, traslPoint.y);
  
  for(let pol of polygons){
    push();
    rotate(radians(map(rotationAngle, 0, angleDifference, 0, base.angle - pol.angle)));
    pol.display();  
    pop();
  }
  rotationAngle += 2;
}

function setNextRotationVertex(){
  traslPoint = base.getVertex((++currentIndex + 1) % base.getSides());
   
  for(let pol of polygons){
    pol.createVertices(base.getVertex(currentIndex % base.getSides()), traslPoint, currentIndex, base.getSides());
  }
  rotationAngle = 0;
}