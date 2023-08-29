package e_oop.myRpg;

public class Monster {
	public String name;
	int maxHp;
	int maxMp;
	public int hp;
	int mp;
	int att;
	int def;
	item[] items;	// 드랍아이템

	
	public Monster(String name, int maxHp,  int hp, int att, int def, item[] items) {
		this.name = name;
		this.maxHp = maxHp;
		this.hp = hp;
		this.att = att;
		this.def = def;
		this.items = items;
	}

	
	public item itemDrop() {
		return items[(int)(Math.random() * items.length)];
	}

}
