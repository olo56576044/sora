package e_oop.myRpg;

import java.util.Arrays;
import java.util.Scanner;

public class Trainer {
		String name;
		item[] items;
		Pocketmon[] pocketmons;
		Pocketmon randomfight;

		
		Trainer(String name) {
			this.name = name;
			this.items = new item[5];
			this.pocketmons = new Pocketmon[6];
			 pocketmons[0] = new Pocketmon("피카츄", "전기", 30, 50, 100, 100);
			 pocketmons[1] = new Pocketmon("파이리", "불", 30, 50, 100,100);
			 pocketmons[2] = new Pocketmon("꼬부기", "물", 30, 50,100,100);
			 pocketmons[3] = new Pocketmon("구구", "비행", 30, 50, 100,100);
			 pocketmons[4] = new Pocketmon("잠만보", "노말", 30, 50, 100,100);
			 pocketmons[5] = new Pocketmon("고오스", "고스트", 30, 50, 100,100);
		}

		public void showInfo() {
			System.out.println("=============================================");
			System.out.println("------------------- 상 태 ---------------------");
			System.out.println("이름 : " + name);
			System.out.println("------------------- 포켓몬 --------------------");
			for(int i = 0; i < pocketmons.length; i++) {
				if(pocketmons[i] != null) {
					System.out.println("포켓몬 이름 : " + pocketmons[i].name);		
					System.out.print(" 레벨 : " + pocketmons[i].level);
					System.out.print(" 타입 " + pocketmons[i].type);
					System.out.print(" 경험치 : " + pocketmons[i].exp);
					System.out.print(" 체력 " + pocketmons[i].maxHp +" / " + pocketmons[i].hp);
					System.out.print(" 공격력 " + pocketmons[i].att);
					System.out.print(" 방어력 " + pocketmons[i].def);
					System.out.println(" ");
				}
			}
			System.out.println("------------------- 아이템 --------------------");
			for(int i = 0; i < items.length; i++) {
				if(items[i] != null) {
					System.out.println(items[i].itemInfo());
				}
			}
			System.out.println("=============================================");
		}

		public void attack(Monster m) {
			int damage = randomfight.att - m.def;
			damage = damage <= 0 ? 1 : damage;
			m.hp = m.hp < damage ? m.hp - m.hp : m.hp - damage;
			System.out.println(randomfight.name + "가 공격으로 " + m.name + "에게 " + damage + "만큼 데미지를 주었습니다.");
			System.out.println(m.name + "의 남은 HP : " + m.hp);
			
		}

		public void getExp(int exp) {
			System.out.println(randomfight.name +  " " +  exp + " 의 경험치를 획득하였습니다.");
			randomfight.exp += exp;
			while(100 <= randomfight.exp) {
				// 레벨업
				levelUp();
				randomfight.exp -= 100;			
			}
		}

		private void levelUp() {
			randomfight.level++;
			randomfight.maxHp += 2;
			randomfight.att += 3;
			randomfight.def += 2;
			randomfight.hp = randomfight.maxHp;
			System.out.println("LEVEL UP!!");
		}
		
		void randomfight() {
			randomfight = pocketmons[(int)(Math.random()*6)];
		}


		public void defence(Monster m) {
			int damage = m.att - randomfight.def;
			damage = damage <= 0 ? 1 : damage;
			randomfight.hp = randomfight.hp < damage ? randomfight.hp - randomfight.hp : randomfight.hp - damage;
			System.out.println(m.name + "가 공격으로 " + randomfight.name + "에게 " + damage + "만큼 데미지를 주었습니다.");
			System.out.println(randomfight.name + "의 남은 HP : " + randomfight.hp);
			
		}

		public void getitem(item item1) {
			if(item1 != null) {
				for(int i = 0; i < items.length; i++) {
					if(items[i] == null) {
						items[i] = item1;
						System.out.println(items[i].name +"을 획득했다! ");
						break;
					}
				}
			}
			
			
		}

		public void useItem() {
			for(int k = 0; k < items.length; k++) {
				if(items[k] != null) {
					Scanner sc = new Scanner(System.in);
					for(int i = 0; i < items.length; i++) {
						if(items[i] != null) {
							System.out.print(i+1 + "." + items[i].name + ": hp회복" + items[i].hp + "/ " );
						}
					}
					int input = 0;
					input = Integer.parseInt(sc.nextLine());
					item useditem = items[input - 1];
					System.out.println("사용할 포켓몬을 선택해주세요");
					for(int i = 0; i < pocketmons.length; i++) {
						if(pocketmons[i] != null) {
							System.out.println(i+1 + "." + pocketmons[i].name);							
							System.out.print(" 타입 " + pocketmons[i].type);
							System.out.print(" 체력 " + pocketmons[i].maxHp +" / " + pocketmons[i].hp);
							System.out.print(" 공격력 " + pocketmons[i].att);
							System.out.print(" 방어력 " + pocketmons[i].def);
							System.out.println(" ");
						}
					}
					int input1 = 0;
					input1 = Integer.parseInt(sc.nextLine());
					pocketmons[input1-1].hp = pocketmons[input1-1].hp + useditem.hp < pocketmons[input1-1].maxHp ? pocketmons[input1-1].hp + useditem.hp : pocketmons[input1-1].maxHp;
					items[input-1] = null;
					System.out.println(useditem.name + "(를)을 사용하여" + pocketmons[input1-1].name + "(이)가 hp를" + useditem.hp + "회복하였습니다");
					break;					
				}
			}		
		}

		

}