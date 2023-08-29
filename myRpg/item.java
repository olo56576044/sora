package e_oop.myRpg;

public class item {
	String name;
	int hp;
	int att;
	int def;
	
	item(String name, int hp, int att, int def){
		this.name = name;
		this.hp = hp;
		this.att = att;
		this.def = def;
	}

	public String itemInfo() {
		String info = name + " : ";
		if(hp > 0) info += "체력+" + hp;
		if(att > 0) info += "공격+" + att;
		if(def > 0) info += "방어+" + def;
		return info;
	}
	
	
}
