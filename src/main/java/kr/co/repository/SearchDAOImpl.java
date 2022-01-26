package kr.co.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.SearchVO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	private SqlSession sqlSession;
	private String NS = "kr.co.search";

	@Override
	public List<SearchVO> rankinglist() {
		
		return sqlSession.selectList(NS + ".rankinglist");
	}

	@Override
	public void search(SearchVO svo) {
		
		sqlSession.insert(NS + ".search", svo);
	}

}
