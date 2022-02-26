package kr.green.freeboard.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kr.green.freeboard.vo.FreeBoardVO;

public interface FreeBoardDAO {
	int selectCount(Connection conn) throws SQLException;
	FreeBoardVO selectByIdx(Connection conn, int idx) throws SQLException;
	List<FreeBoardVO> selectList(Connection conn, int startNo, int pageSize) throws SQLException;
	int insert(Connection conn, FreeBoardVO vo) throws SQLException;
	int update(Connection conn, FreeBoardVO vo) throws SQLException;
	int delete(Connection conn, int idx) throws SQLException;
	int passwordCheck(Connection conn, int idx, String password) throws SQLException;
	int incrementHit(Connection conn, int idx) throws SQLException;
}
