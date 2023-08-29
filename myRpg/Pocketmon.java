package e_oop.myRpg;

import java.util.ArrayList;
import java.util.Scanner;



	public class Pocketmon {

		 String type;
		 String name;
		 int def;
		 int att;
		 int hp;
		 int level;
		 int exp;
		 int maxHp;
//		 int maxMp;
		 
		
		public Pocketmon(String name, String type, int def, int att, int maxHp, int hp) {
			this.name = name;
			this.type = type;
			this.def = def;
			this.att = att;
			this.hp = hp;
			this.level = 1;
			this.exp = 0;
			this.maxHp = maxHp;
		}

	
//		@Override
//		public String toString() {
//			return "Pocketmon [type=" + type + ", name=" + name + ", def=" + def + ", att=" + att + ", hp=" + hp
//					+ ", level=" + level + ", exp=" + exp + ", maxHp=" + maxHp + ", maxMp=" + maxMp + "]";
//		}



		public void attack(Monster m) {
			
			int damage = att - m.def;
			damage = damage <= 0 ? 1 : damage;
			m.hp = m.hp < damage ? m.hp - m.hp : m.hp - damage;
			System.out.println(name + "가 공격으로 " + m.name + "에게 " + damage + "만큼 데미지를 주었습니다.");
			System.out.println(m.name + "의 남은 HP : " + m.hp);		
		}

	
	}
