class Polygon{    
    constructor(sides, _sideLength){    
      this.sideLength = _sideLength;
      this.angle = float(180*(sides-2)/sides);
      this.vertices = Array(sides);
      this.createVertices(createVector(-this.sideLength, 0), createVector(0, 0), 0, 1);
    }
    
    display(){
      beginShape();
      
      for(let p of this.vertices){
        vertex(p.x, p.y);
      }
      endShape(CLOSE);
    }
    
    createVertices(currentVertex, _traslPoint, index, rotations){
      let x = 0, y = 0; 
      this.vertices[0] = createVector(currentVertex.x, currentVertex.y).sub(_traslPoint);
      this.vertices[1] = createVector(0, 0);
        
      for(let b = 2; b < this.vertices.length; b++){
        x = x + this.sideLength * cos(radians((180+this.angle)*(b-1)-360/rotations*index));
        y = y + this.sideLength * sin(radians((180+this.angle)*(b-1)-360/rotations*index));
        this.vertices[b] = createVector(x, y);
      }
    }
    
    getVertex(pos){
      return this.vertices[pos];
    }
  
    getSides(){
      return this.vertices.length;
    }
  }
  