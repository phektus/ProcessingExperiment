int max_walkers = 100;
Walker[] walkers = new Walker[max_walkers+1];

class Walker {
  int x;
  int y;
  int r;
  int g;
  int b;

  Walker() {
    x = width/int(random(1,10));
    y = height/int(random(1,10));
    r = int(random(1,255));
    g = int(random(1,255));
    b = int(random(1,255));
  }
  
  float getNextStep() {
    Random generator = new Random();
    float num = (float) generator.nextGaussian();
    int max = -5;
    float mean = random(-max,max);
    float sd = (mean/5.0) * random(-max,max);
    return sd * num + mean;
  }

  void display() {
    stroke(r,g,b);
    point(x,y);
  }

  void step() {
    float r = random(1);
    float stepx = 1;
    float stepy = 1;

    if (r < 0.10 && mouseX > 0 && mouseY > 0) {   
      // go to direction of mouse
      if (x > mouseX) stepx = -1;
      else stepx = 1;
      if (y > mouseY) stepy = -1;
      else stepy = 1;

    } else if (r > 0.10 && r < 0.65) {
      stepx = int(random(3))-1;
      stepy = int(random(3))-1;
      
    } else {
      stepx = random(-1,1) * this.getNextStep();
      stepy = random(-1,1) * this.getNextStep();
    }   	

    x += stepx;
    y += stepy;
  }
}

void setup() {
  size(640,480);
  for(int x=0; x <= max_walkers; x++) {
    walkers[x] = new Walker();
  }
  background(0);
}

void draw() {
  for(int x=0; x <= max_walkers; x++) {
    Walker walker = walkers[x];
    walker.step();
    walker.display();
  }
}
