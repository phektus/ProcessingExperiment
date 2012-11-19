// array to keep track of how often the random numbers are picked
int [] randomCounts;

void setup()  {
  size(640, 240);
  randomCounts = new int[20]; 
}

void draw() {
  background(255);
  stroke(0);
  fill(175);
  int w = width/randomCounts.length;
  
  // pick a random member and increase the count  
  int index = int(random(randomCounts.length));
  int increment = int(random(0,2));
  randomCounts[index] += increment;
  
  // graph that shit
  for(int x=0; x < randomCounts.length; x++) {
    rect(x*w, height-randomCounts[x], w-1,  randomCounts[x]);
  }
}
