package registration.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import registration.model.dto.TeacherDTO;
import registration.model.util.DBUtil;

public class TeacherDAO {

	
	public static boolean addTeacher(TeacherDTO teacher) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into teacher values(?, ?, ?)");
			pstmt.setString(1, teacher.getTeacherId());
			pstmt.setString(2, teacher.getTeacherName());
			pstmt.setString(3, teacher.getTeacherPw());
			int result = pstmt.executeUpdate();
			
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	
	public static boolean deleteTeacher(String TeacherId) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from Teacher where Teacher_id=?");
			pstmt.setString(1, TeacherId);
			
			int count = pstmt.executeUpdate();
			
			if(count !=0 ){
				result = true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return result;
	}
	
	
	public static boolean updateTeacher(String teahcerId, String teahcerPw, String teahcerIntro, String teacherName) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("update Teacher set Teacher_pw = ?, teacher_name = ? where Teacher_id=?");
			pstmt.setString(1, teahcerPw);
			pstmt.setString(2, teacherName);
			pstmt.setString(3, teahcerId);
			
			int result = pstmt.executeUpdate();
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	
	public static TeacherDTO getTeacher(String TeacherId) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		TeacherDTO Teacher = null;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from Teacher where Teacher_id=?");
			pstmt.setString(1, TeacherId);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				Teacher = new TeacherDTO(rset.getString(1), rset.getString(2), rset.getString(3));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return Teacher;
	}
	
	
	
	public static ArrayList<TeacherDTO> getAllTeacher() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<TeacherDTO> list = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from Teacher");
			rset = pstmt.executeQuery();
			
			list = new ArrayList<TeacherDTO>();
			while(rset.next()){
				list.add(new TeacherDTO(rset.getString(1), rset.getString(2), rset.getString(3)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}
