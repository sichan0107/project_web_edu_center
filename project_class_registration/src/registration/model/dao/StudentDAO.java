package registration.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import registration.model.dto.StudentDTO;
import registration.model.util.DBUtil;

public class StudentDAO {
	
	//학생 회원 가입
	public static boolean addStudent(StudentDTO student) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into student values(?, ?, ?)");
			pstmt.setString(1, student.getStudentId());
			pstmt.setString(2, student.getStudentName());
			pstmt.setString(3, student.getStudentPw());
			
			int result = pstmt.executeUpdate();
		
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//학생 탈퇴
	public static boolean deleteStudent(String studentId) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from student where student_id=?");
			pstmt.setString(1, studentId);
			
			int count = pstmt.executeUpdate();
			
			if(count !=0 ){
				result = true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return result;
	}
	
	//학생 정보 수정
	public static boolean updateStudent(String studentId, String studentPw, String studentName) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("update student set student_pw = ?, student_name = ? where student_id=?");
			pstmt.setString(1, studentPw);
			pstmt.setString(2, studentName);
			pstmt.setString(3, studentId);
			
			int result = pstmt.executeUpdate();
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//특정 학생 검색
	public static StudentDTO getStudent(String studentId) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		StudentDTO student = null;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from student where student_id=?");
			pstmt.setString(1, studentId);
			rset = pstmt.executeQuery();
			if(rset.next()){
				student = new StudentDTO(rset.getString(1), rset.getString(2), rset.getString(3));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return student;
	}
	
	
	//모든 학생 검색
	public static ArrayList<StudentDTO> getAllStudent() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<StudentDTO> list = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from student");
			rset = pstmt.executeQuery();
			
			list = new ArrayList<StudentDTO>();
			while(rset.next()){
				list.add(new StudentDTO(rset.getString(1), rset.getString(2), rset.getString(3)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}
