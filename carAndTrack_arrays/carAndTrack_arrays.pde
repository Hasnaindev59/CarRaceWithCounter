//Car car; //<>//
RaceTrack track;
boolean raceOver;
Car [] multiple;

void setup() {
  size(1000, 600);
  track = new RaceTrack();
  //car = new Car(track.getStartPosition(), 100, 60, color(200, 100, 100));
  raceOver = false;
  multiple = new Car[10];

  for ( int index = 0; index < multiple.length; index++) {
    multiple [index] = new Car(track.getStartPosition(), 60 * index + 30, 60, color(random(255), random(255), random(255)));
  }
}

void draw() {
  background(70);
  track.display();
  /*car.display();
   if (!raceOver) {
   if (car.getPosition() >= track.getFinishPosition()) {
   raceOver = true;
   println("Press 's' to restart");
   } else {
   car.move();
   }
   
   if (car.getPosition() >= track.getFinishPosition()) {
   raceOver = true;
   print ( "WINNER");
   
   }
   */


  for ( int index = 0; index < multiple.length; index++) {
    if (!raceOver) {

      multiple[index].display () ;
      multiple[index].move();

      if (multiple[index].getPosition() >= track.getFinishPosition()) {

        raceOver = true;
        println("Press 's' to restart");
      }
    } else {
      multiple[index].display () ;
    }
    //}
  }
}

void keyPressed() {
  if (key == 's' && raceOver) {
    int counter=0;
    int winner = 0;
    float startLine = track.getStartPosition();
    //car.setPosition(startLine);
    for ( int index = 0; index < multiple.length; index++) {
      if (multiple[index].getPosition() >= track.getFinishPosition()) {
        counter++;
        winner = index;
      }
      multiple[index].setPosition(track.getStartPosition());
      
    }
    if ( counter==1) {
      multiple[winner].increaseScore();
    }
    
    raceOver = false;
  }
}
