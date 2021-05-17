package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtils;
import vo.AlreadyVO;
import vo.InjectionVO;
import vo.MemberVO;

public class VaccineDAO {
	public ArrayList<MemberVO> memberList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(" select p_no, p_name, (substr(p_birth,1,4) || '년' || substr(p_birth,5,2) || '월' || substr(p_birth,7,2) || '일') p_birth ,(p_tel1 || '-' || p_tel2 || '-' || p_tel3)p_tel, decode(p_gender,'M','남','F','여') p_gender,\r\n" + 
					"decode(p_city,'10','서울','20','경기','30','부산','40','대구') p_city from tbl_cust order by p_no");
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setP_no(rs.getString("p_no"));
				vo.setP_name(rs.getString("p_name"));
				vo.setP_birth(rs.getString("p_birth"));
				vo.setP_tel(rs.getString("p_tel"));
				vo.setP_city(rs.getString("p_city"));
				vo.setP_gender(rs.getString("p_gender"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(conn, ps, rs);
		}
		return list;
	}
	public ArrayList<AlreadyVO> alreadyList() {
		ArrayList<AlreadyVO> list = new ArrayList<AlreadyVO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement("select p_seno,a.p_no,p_name,c.i_code,i_name,TO_CHAR(p_date,'YYYY-MM-DD') as p_date  \r\n" + 
					"from tbl_cust a, tbl_order b , tbl_injection c\r\n" + 
					"where a.p_no = b.p_no and b.i_code = c.i_code");
			rs = ps.executeQuery();
			while(rs.next()) {
				AlreadyVO vo = new AlreadyVO();
				vo.setP_seno(rs.getInt("p_seno"));
				vo.setP_no(rs.getString("p_no"));
				vo.setP_name(rs.getString("p_name"));
				vo.setI_code(rs.getString("i_code"));
				vo.setI_name(rs.getString("i_name"));
				vo.setP_date(rs.getDate("p_date"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtils.close(conn, ps,rs);
		}
		return list;
	}
	
	public ArrayList<InjectionVO> injectionList(){
		ArrayList<InjectionVO> list = new ArrayList<InjectionVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement("select b.i_code, i_name, count(*) as cnt\r\n" + 
					"from tbl_order a,tbl_injection b\r\n" + 
					"where a.i_code = b.i_code\r\n" + 
					"group by (b.i_code, i_name)\r\n" + 
					"order by cnt desc");
			rs = ps.executeQuery();
			while(rs.next()) {
				InjectionVO vo = new InjectionVO();
				vo.setI_code(rs.getString("i_code"));
				vo.setI_name(rs.getString("i_name"));
				vo.setCnt(rs.getString("cnt"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtils.close(conn, ps,rs);
		}
		return list;
	}
	public int vaccineInsert(AlreadyVO vo)throws SQLException {
		int n= 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement("insert into tbl_order values(?,?,?,?)");
			ps.setInt(1, vo.getP_seno());
			ps.setString(2, vo.getI_code());
			ps.setString(3, vo.getP_no());
			ps.setDate(4, vo.getP_date());
			n= ps.executeUpdate();
			if(n > 0) {
				conn.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtils.close(conn, ps);
		}
		return n;
	}
	public int getMaxpseno() {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int pseno = 0;
		
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement("select max(p_seno)+1 p_seno from tbl_order");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				pseno = rs.getInt("p_seno");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtils.close(conn, ps, rs);
		}
		return pseno;
	}
}
