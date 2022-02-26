package kr.green.freeboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.green.freeboard.vo.FreeBoardVO;
import kr.green.jdbc.JDBCUtil;

public class FreeBoardDAOImpl implements FreeBoardDAO{
	private static FreeBoardDAO instance = new FreeBoardDAOImpl();
	private FreeBoardDAOImpl() {
		;
	}
	public static FreeBoardDAO getInstance() {
		return instance;
	}

	@Override
	public int selectCount(Connection conn) throws SQLException {
		int count = 0;
		String sql = "select count(*) from freeboard";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		count = rs.getInt(1);
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		return count;
	}

	@Override
	public FreeBoardVO selectByIdx(Connection conn, int idx) throws SQLException {
		FreeBoardVO vo = null;
		String sql = "select * from freeboard where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			vo.setIdx(rs.getInt("idx"));
			vo.setName(rs.getString("name"));
			vo.setPassword(rs.getString("password"));
			vo.setSubject(rs.getString("subject"));
			vo.setContent(rs.getString("content"));
			vo.setRegDate(rs.getTimestamp("regDate"));
			vo.setHit(rs.getInt("hit"));
			vo.setIp(rs.getString("ip"));
		}
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
		return vo;
	}

	@Override
	public List<FreeBoardVO> selectList(Connection conn, int startNo, int pageSize) throws SQLException {
		List<FreeBoardVO> list = null;
		String sql = "select * from freeboard order by idx desc limit ?, ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startNo);
		pstmt.setInt(2, pageSize);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			list = new ArrayList<FreeBoardVO>();
			do {
				FreeBoardVO vo = new FreeBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setPassword(rs.getString("password"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setRegDate(rs.getTimestamp("regDate"));
				vo.setHit(rs.getInt("hit"));
				vo.setIp(rs.getString("ip"));
				
				list.add(vo);
			}while(rs.next());
		}
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
		return list;
	}

	@Override
	public int insert(Connection conn, FreeBoardVO vo) throws SQLException {
		int count = 0;
		String sql = "insert into freeboard (name,password,subject,content,ip) values (?,password(?),?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getPassword());
		pstmt.setString(3, vo.getSubject());
		pstmt.setString(4, vo.getContent());
		pstmt.setString(5, vo.getIp());
		count = pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		return count;
	}

	@Override
	public int update(Connection conn, FreeBoardVO vo) throws SQLException {
		int count = 0;
		String sql = "update freeboard set subject=?, content=?, regDate=now(), ip=? where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getSubject());
		pstmt.setString(2, vo.getContent());
		pstmt.setString(3, vo.getIp());
		pstmt.setInt(4, vo.getIdx());
		count = pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		return count;
	}

	@Override
	public int delete(Connection conn, int idx) throws SQLException {
		int count = 0;
		String sql = "delete from freeboard where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		count = pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		return count;
	}

	@Override
	public int passwordCheck(Connection conn, int idx, String password) throws SQLException {
		int count = 0;
		String sql = "select count(*) from freeboard where idx=? and password=password(?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		count = rs.getInt(1);
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
		return count;
	}

	@Override
	public int incrementHit(Connection conn, int idx) throws SQLException {
		int count = 0;
		String sql = "update freeboard set hit = hit+1 where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		count = pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		return count;
	}

}
