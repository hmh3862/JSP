package kr.green.freeboard.service;

import java.sql.Connection;
import java.util.List;

import kr.green.freeboard.dao.FreeBoardDAO;
import kr.green.freeboard.dao.FreeBoardDAOImpl;
import kr.green.freeboard.vo.FreeBoardVO;
import kr.green.freeboard.vo.PagingVO;
import kr.green.jdbc.JDBCUtil;

public class FreeBoardServiceImpl implements FreeBoardService{
	private static FreeBoardService instance = new FreeBoardServiceImpl();
	private FreeBoardServiceImpl() {
		;
	}
	public static FreeBoardService getInstance() {
		return instance;
	}
	
	@Override
	public PagingVO<FreeBoardVO> selectList(int currentPage, int pageSize, int blockSize) {
		PagingVO<FreeBoardVO> pagingVO = null;
		Connection conn = null;
		FreeBoardDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = FreeBoardDAOImpl.getInstance();
			//--
			int totalCount = dao.selectCount(conn);
			pagingVO = new PagingVO<FreeBoardVO>(currentPage, pageSize, blockSize, totalCount);
			List<FreeBoardVO> list = dao.selectList(conn, pagingVO.getStartNo(), pagingVO.getPageSize());
			pagingVO.setList(list);
			//--
			conn.commit();
		} catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return pagingVO;
	}

	@Override
	public FreeBoardVO selecetByIdx(int idx, boolean isHit) {
		FreeBoardVO vo = null;
		Connection conn =null;
		FreeBoardDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = FreeBoardDAOImpl.getInstance();
			//--
			vo = dao.selectByIdx(conn, idx);
			if(vo!=null) {
				if(isHit) {
					dao.incrementHit(conn, idx);
					vo.setHit(vo.getHit()+1);
				}
			}
			//--
			conn.commit();
		} catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		
		return vo;
	}

	@Override
	public int insert(FreeBoardVO vo) {
		int count = 0;
		Connection conn = null;
		FreeBoardDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = FreeBoardDAOImpl.getInstance();
			if(vo!=null) {
				count = dao.insert(conn, vo);
			}
			conn.commit();
		} catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return count;
	}

	@Override
	public int update(FreeBoardVO vo) {
		int count = 0;
		Connection conn = null;
		FreeBoardDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = FreeBoardDAOImpl.getInstance();
			if(vo!=null) {
				if(dao.passwordCheck(conn, vo.getIdx(), vo.getPassword())==1) {
					count = dao.update(conn, vo);
				}
			}
			conn.commit();
		} catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return count;
	}

	@Override
	public int delete(FreeBoardVO vo) {
		int count = 0;
		Connection conn = null;
		FreeBoardDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = FreeBoardDAOImpl.getInstance();
			if(vo!=null) {
				if(dao.passwordCheck(conn, vo.getIdx(), vo.getPassword())==1) {
					count = dao.delete(conn, vo.getIdx());
				}
			}
			conn.commit();
		} catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return count;
	}

}
