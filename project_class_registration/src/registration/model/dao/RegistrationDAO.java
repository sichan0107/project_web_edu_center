package registration.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import registration.model.dto.RegistrationDTO;
import registration.model.util.BasicDBUtil;
import registration.model.util.DBUtil;

public class RegistrationDAO {
	public static boolean addRegistration(RegistrationDTO registration) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{//result('A1')
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into registration values(?, ?, ?, ?, ?, ?, result(?))");
			pstmt.setString(1, registration.getClassCode());
			pstmt.setString(2, registration.getClassName());
			pstmt.setString(3, registration.getStudentId());
			pstmt.setString(4, registration.getTeacherName());
			pstmt.setString(5, registration.getStartDay());
			pstmt.setString(6, registration.getEndDay());
			pstmt.setString(7, registration.getClassCode());
			int result = pstmt.executeUpdate();
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	
	
	
	public static ArrayList<RegistrationDTO> getRegistration(String classCode) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RegistrationDTO> registration = null;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from registration where class_code=?");
			pstmt.setString(1, classCode);
			rset = pstmt.executeQuery();
			registration = new ArrayList<RegistrationDTO>();
			while(rset.next()){
				registration.add(new RegistrationDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return registration;
	}
	
	
	public static ArrayList<RegistrationDTO> getRegistrationById(String studentId) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RegistrationDTO> registration = null;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from registration where student_id=?");
			pstmt.setString(1, studentId);
			rset = pstmt.executeQuery();
			registration = new ArrayList<RegistrationDTO>();
			while(rset.next()){
				registration.add(new RegistrationDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7)));
			}
			System.out.println(registration+"     a");
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return registration;
	}
	
	
	public static ArrayList<RegistrationDTO> getAllResitration() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RegistrationDTO> list = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from registration");
			rset = pstmt.executeQuery();
			
			list = new ArrayList<RegistrationDTO>();
			while(rset.next()){
				list.add(new RegistrationDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
	
	
	public static boolean deleteRegistration(String studentId, String classCode) throws SQLException {
		Connection conn = null;
		CallableStatement cstmt = null;
		boolean result = false;
		try {
			conn = BasicDBUtil.getConnection();
			cstmt = conn.prepareCall("{CALL autoupdate(?,?)}");
			cstmt.setString(1, studentId);
			cstmt.setString(2, classCode);
			int count = cstmt.executeUpdate();
			if(count!=0) {
				result=true;
			}
		} finally {
			DBUtil.close(conn, cstmt);
		}
		return result;
	}
}
