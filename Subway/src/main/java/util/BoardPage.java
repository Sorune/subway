package util;

public class BoardPage {
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String pagingStr = "";
		
		// 단계 3 : 전체 페이지 수 계산
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));
		
		// 단계 4 : '이전 페이지 블록 바로가기' 출력
		int pageTemp = (((pageNum -1) / blockPage) * blockPage) + 1;
		if(pageTemp != 1) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href'" + reqUrl + "?pageNum=" + (pageTemp -1)
					+ "'>[이전 블록]</a>";
		}
		
		// 단계 5 : 각 페이지 번호 출력
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				// 현재 페이지는 링크를 걸지 않음
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			}else {
				pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp
						+ "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		
		// 단계 6 : '다음 페이지 블록 바로가기' 출력
		if(pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
						+ "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages
						+ "'>[마지막 페이지]</a>";
		}
		
			return pagingStr;
	}
	
	public static String pagingStr2(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl ,
			String searchField2, String searchWord2) {
		// 페이지 넘길시 href 에 매개변수 pageNum뿐만 아니라 searchField, searchWord 도 반환해줘야한다 pagingStr누를경우 검색조건이 갱신된다.
		String pagingStr = "";
		
		// 단계 3 : 전체 페이지 수 계산
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));
		
		// 단계 4 : '이전 페이지 블록 바로가기' 출력
		int pageTemp = (((pageNum -1) / blockPage) * blockPage) + 1;
		if(pageTemp != 1) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=1"+ "&searchField=" + searchField2 + "&searchWord="+ searchWord2 +"'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href'" + reqUrl + "?pageNum=" + (pageTemp -1)
					+ "&searchField=" + searchField2 + "&searchWord="+ searchWord2 +"'>[이전 블록]</a>";
		}
		
		// 단계 5 : 각 페이지 번호 출력
				int blockCount = 1;
				while(blockCount <= blockPage && pageTemp <= totalPages) {
					if(pageTemp == pageNum) {
						// 현재 페이지는 링크를 걸지 않음
						pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
					}else {
						pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp
								+ "&searchField=" + searchField2 + "&searchWord="+ searchWord2 +"'>" + pageTemp + "</a>&nbsp;";
					}
					pageTemp++;
					blockCount++;
				}
		
		// 단계 6 : '다음 페이지 블록 바로가기' 출력
		if(pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
						+ "&searchField=" + searchField2 + "&searchWord="+ searchWord2 +"'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages
						+ "&searchField=" + searchField2 + "&searchWord="+ searchWord2 +"'>[마지막 페이지]</a>";
		}
		
			return pagingStr;
	}

}
