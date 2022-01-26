package kr.co.repository;

import java.util.List;

import kr.co.domain.SearchVO;

public interface SearchDAO {

	List<SearchVO> rankinglist();

	void search(SearchVO svo);

}
