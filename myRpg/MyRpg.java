package e_oop.myRpg;

import java.util.Scanner;

import java.util.Arrays;

public class MyRpg {
	Pocketmon p;
	Trainer t;
	Pocketmon[] pocketmons;
	Scanner sc = new Scanner(System.in);
	item[] items;
	
	MyRpg(){
		 t = new Trainer("지우");
		 pocketmons  = new Pocketmon[6];
		 
		 items = new item[5];
		 items[0] = new item("상처약", 20, 0, 0);
		 items[1] = new item("고급 상처약",50, 0, 0);
		  	 
	}
	

	public static void main(String[] args) {
		new MyRpg().start();

	}
	
	void start() {
			System.out.println("|￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣|");				
			System.out.println(			"포켓몬 게임을 시작합니다.");
			System.out.println("|＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿| ");
			System.out.println("(\\__/)  || ");
			System.out.println("( ㅇㅅㅇ). ││");
			System.out.println("/ . . . .づ");
		while(true) {
			System.out.println("1.내정보\t2.배틀\t3.아이템확인\t0.종료");
			int input = 0;
			input = Integer.parseInt(sc.nextLine());
			
			switch (input) {
			case 1:
				t.showInfo();
				break;
			case 2:
				hunt();
				break;
			case 3:
				t.useItem();
				break;
			case 0: 
				System.out.println("|￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣|");				
				System.out.println(			"포켓몬 게임을 종료합니다.");
				System.out.println("|＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿| ");
				System.out.println("(\\__/)  || ");
				System.out.println("( ㅠㅅㅠ). ││");
				System.out.println("/ . . . .づ");
				System.exit(0);	// 프로그램을 종료시키는 메서드
				break;
				
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
				break;
			}
		}
	}
		private void hunt() {
		Monster m = new Monster("로켓단", 50, 40, 40, 40, new item[] {items[1],items[0],items[2]});
		System.out.println(m.name + "를 만났습니다. 전투를 시작합니다.");
		t.randomfight();
			
		int input = 0;
		battle : while(true) {
			System.out.println("1.공격\t2.도망\t3.아이템사용");
			input = Integer.parseInt(sc.nextLine());
			switch (input) {
			case 1:		
				t.attack(m);
				if(m.hp <= 0) {
					System.out.println(m.name + "을(를) 처치했습니다.");
					// 캐릭터가 경험치를 얻는다.
					t.getExp(50);
					
					item item1 = m.itemDrop();
					t.getitem(item1);
				break battle;
				}
				t.defence(m);
				if(t.randomfight.hp <=0) {
					t.randomfight.hp = 1;
					System.out.println(t.randomfight.name + "이 죽었습니다.");
					break battle;
				}
				
				break;
				
			case 2:
				System.out.println("무사히 도망쳤다.");
				break battle;
			case 3:
				t.useItem();
				break;
			}
		}
		
	}
		
		
}