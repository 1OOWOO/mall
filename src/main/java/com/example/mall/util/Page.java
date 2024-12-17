package com.example.mall.util;

import lombok.Data;

@Data
public class Page {
	private Integer currentPage; // 현재 페이지
	private Integer rowPerPage; // 리스트 출력 범위
	private Integer countTotalRow; // 리스트 전체행 개수
	private Integer numPerPage; // 페이지 개수

	// 현재 페이지 첫번째 행 인덱스
	public Integer countBeginRow() {
		return (currentPage - 1) * rowPerPage;
	}

	// 마지막 페이지
	public Integer countLastPage() {
		if (countTotalRow == null)
			return 0;
		Integer lastPage = countTotalRow / rowPerPage; // 페이지 수 계산
		if (countTotalRow % rowPerPage != 0)
			lastPage++;
		return lastPage;
	}

	// 페이지 첫번째 값 계산
	public Integer countBeginPageNum() {
		return (currentPage - 1) / 10 * 10 + 1;
	}

	// 페이지 마지막 값 계산
	public Integer countEndPageNum() {
		Integer endPageNum = countBeginPageNum() + (numPerPage - 1); // 그룹 마지막 페이지
		if (countLastPage() < endPageNum)
			endPageNum = countLastPage(); // 총 페이지 수 작을시 조정.
		return endPageNum;
	}
}
