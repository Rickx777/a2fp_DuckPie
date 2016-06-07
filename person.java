import java.util.*;
public class person{
  private String name;
  private double disCh; //chance of disease
  private double eveCh; //chance of bone breaking
  private int health; // 1 -> 4 | very poor -> good
  private int food; // [1, 2, 4] lb of food 	
  private double work; //work rate (

  public person(String n){
     name = n;
     disCh = 0;
     eveCh = 0;
     health = 4; //start [good]
     food = 1; //[filling] start
     work = 0.6; //steady, strenuous, grueling (0.1, 0.3, 0.6) -- 0 if resting
  }
    
  public int getHealth(){
     return health;
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
    double factor = 0.4 + health/10. + food/10. - work/1.37;
    if (disCh > factor){
	return (int)(Math.random() * 5) + 1;//cholera, dysentary, typhoid, cholera, measles
    }
    System.out.println("Dis factor: " + factor);
    return 0;
  }
  
  private int Event(){
    double factor = 0.4 + health/10. + food/10. - work/1.37;
    if (eveCh > factor){
	return (int)(Math.random() * 3) + 1;//exhaustion, broken bone, malnutrition 
    }
    System.out.println("Eve factor: " + factor);
    return 0;
  }

  public void update(){
      disCh = (Math.random() * 4) * 0.12;
      eveCh = (Math.random() * 4) * 0.12;
      System.out.println("Event: " + Event());
      System.out.println("Disease: " + Disease());
  }

    public static void main(String[] args){ //Test for person class
      person[] crew = new person[5];
      for (int c = 0; c< crew.length; c++){
	  crew[c] = new person("" + c);
      }

      for (int c = 0; c < crew.length; c++){
	  System.out.println("Name: " + crew[c].getName());
	  System.out.println("\nBefore update()");
	  System.out.println("Health: " + crew[c].getHealth());
          crew[c].update();	  
	  System.out.println("\nAfter update()");
	  System.out.println("Health: " + crew[c].getHealth());
	  System.out.println("\nChances:");
	  System.out.println("Event Ch: " + crew[c].eveCh);
	  System.out.println("Disease Ch: " + crew[c].disCh);
	  System.out.println("----------------------------\n");
	}
    }
}
