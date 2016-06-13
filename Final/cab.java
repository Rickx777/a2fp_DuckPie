public class cab{
	int food;
	int money;
	int wheels;
	int oxen;
	int clothing;
	int health;

public cab(int m){
	money = m;
}


public cab(int m, int f, int w, int o, int c, int h){
	food = f; money = m; wheels = w; oxen = o; clothing = c; health = h;
}

public void setMoney(int a){
	money = a;
}

}