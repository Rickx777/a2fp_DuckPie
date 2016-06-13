public class cab{
	int food;
	double money;
	int wheels;
	int oxen;
	int clothing;
	int health;
	int bullets;

public cab(double m){
	money = m;
	food = 0;
	wheels = 0;
	oxen = 0;
	clothing = 0;
	bullets = 0;
	health = 0;
}


public cab(double m, int f, int w, int o, int c, int b, int h){
	money = m; food = f;  wheels = w; oxen = o; clothing = c; bullets = b; health = h;
}

public void setMoney(double a){
	money = a;
}

}