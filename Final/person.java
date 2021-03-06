import java.util.*;
public class person{
  private String name;
  private double disCh; //chance of disease
  private double eveCh; //chance of bone breaking
  private int health; // 1 -> 4 | very poor -> good
  private int food; // [1, 2, 4] lb of food   
  private double work; //work rate

  public person(String n){
     name = n;
     disCh = 0;
     eveCh = 0;
     health = 4; //start [good]
     food = 4; //[filling] start
     work = 0.1; //steady, strenuous, grueling (0.1, 0.3, 0.6) -- 0 if resting
  }
    
  public int getHealth(){
     return health;
  }

  public void setHealth(int a){ // +- 1
      health += a;
  }
  
  public void setName(String n){
    name = n;
  }
  
  public String getName(){
    return name;
  }
  
  public void setWork(double c){
    work = c;
  }
  
  public double getWork(){
    return work;
  }
     
  public void setFood(int c){ 
    food = c;
  }
  
  public int getFood(){
    return food;
  }

  private int Disease(){
      double factor = 4 - 1.45 - work * 1.3 - .55/health;
      if (food != 0) {factor = 4 - 1.25/food - work * 1.3 - .45/health;}

      if (disCh > factor){
    return (int)(Math.random() * 5) + 1;//cholera, dysentary, typhoid, cholera, measles
      }
    System.out.println("Dis factor: " + factor);
    return 0;
  }
  
  private int Event(){
      double factor = 4 - 1.45 - work * 1.3 - .55/health;
      if (food != 0) {factor = 4 - 1.25/food - work*1.3 - .45/health;}
      
      if (eveCh > factor){
   return (int)(Math.random() * 3) + 1;//exhaustion, broken bone, malnutrition 
      }

      System.out.println("Eve factor: " + factor);
      return 0;
  }

  public String update(){
      String[] events = {"", "exhaustion", "broken bone", "malnutrition"};
      String[] diseases = {"", "cholera", "dysentery", "typhoid", "cholera", "measles"};
      
      eveCh = Math.random() * 2.6;
      disCh = Math.random() * 2.6;
      int e = Event();
      int d = Disease();
      
      if (d != 0) return diseases[d];
      if (e != 0) return events[d];
      
      if (eveCh < food/50.) return "HEAL";
      else return "NONE";
      
  }

   /* public static void main(String[] args){ //Test for person class
      person[] crew = new person[5];
      for (int c = 0; c< crew.length; c++){
    crew[c] = new person("" + c);
      }

      for (int c = 0; c < crew.length; c++){
    System.out.println("Name: " + crew[c].getName());
    System.out.println("\nBefore update()");
    System.out.println("Health: " + crew[c].getHealth());
          System.out.println("EVENTS: " + crew[c].update());    
    System.out.println("\nAfter update()");
    System.out.println("Health: " + crew[c].getHealth());
    System.out.println("\nChances:");
    System.out.println("Event Ch: " + crew[c].eveCh);
    System.out.println("Disease Ch: " + crew[c].disCh);
    System.out.println("----------------------------\n");
  }
    }*/
}