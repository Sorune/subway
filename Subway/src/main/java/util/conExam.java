package util;

import java.util.Scanner;

import DAO.CondimentDAO;
import DTO.CondimentDTO;

public class conExam {
	CondimentDTO conDTO = new CondimentDTO();
	static CondimentDAO conDAO ;

	public static void main(String[] args) throws Exception {

		System.out.println("1.제품리스트, 2.제품 추가, 3.제품정보수정 4.제품삭제");
		Scanner in = new Scanner(System.in);

		switch (in.nextInt()) {
		case 1:// 제품 리스트
			conDAO.readCondiment();
			break;
		case 2:// 제품 추가

			String conName = "conName";
			int conPrice = 7777;
			int conCount = 1;
			String conKind = "conKind";
			conDAO.insertCondimentDAO(conName, conPrice, conCount, conKind);
			break;

		case 3:// 제품정보수정
			System.out.println("업데이트할 제품번호 입력");
			System.out.println(">>>");
			int menu_id = in.nextInt();
			if (conDAO.isFindCondiment(menu_id)) {
			}

			System.out.println("이릅수정: >>>");
			String name = in.next();

			System.out.println("가격수정: >>>");
			int price = in.nextInt();

			System.out.println("재고량 수정: >>>");
			int count = in.nextInt();

			System.out.println("종류수정: >>>");
			String kind = in.next();

			conDAO.updateCondimentDAO(menu_id, name, price, count, kind);
			break;
		case 4:
			//4.제품삭제
			System.out.println("삭제할 메뉴넘버 입력 >>>");
			int menu_id1 = in.nextInt();
			conDAO.deleteCondimentDTO(menu_id1, true);
			
			
			break;

		}

	}

}
