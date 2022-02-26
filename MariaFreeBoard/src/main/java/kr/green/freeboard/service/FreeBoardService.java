package kr.green.freeboard.service;

import kr.green.freeboard.vo.FreeBoardVO;
import kr.green.freeboard.vo.PagingVO;

public interface FreeBoardService {
	PagingVO<FreeBoardVO> selectList(int currentPage, int pageSize, int blockSize);
	FreeBoardVO selecetByIdx(int idx, boolean isHit);
	int insert(FreeBoardVO vo);
	int update(FreeBoardVO vo);
	int delete(FreeBoardVO vo);
}
