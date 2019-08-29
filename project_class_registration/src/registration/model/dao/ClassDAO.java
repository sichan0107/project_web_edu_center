package registration.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import registration.model.dto.ClassDTO;
import registration.model.util.DBUtil;

public class ClassDAO {
	
	//강의 추가
	public static boolean addClass(ClassDTO classDTO) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into class values(?, ?, ?, ?,? ,?,?,?,?, ?)");
			pstmt.setString(1, classDTO.getClassCode());
			pstmt.setInt(2, classDTO.getClassPrice());
			pstmt.setString(3, classDTO.getClassName());
			pstmt.setString(4, classDTO.getClassTime());
			pstmt.setString(5, classDTO.getTeacherName());
			pstmt.setString(6, classDTO.getStartDay());
			pstmt.setString(7, classDTO.getEndDay());
			pstmt.setString(8, classDTO.getSimpleIntro());
			pstmt.setString(9, classDTO.getDetailIntro());
			pstmt.setInt(10, classDTO.getMaxStudent());
			
		
			
			int result = pstmt.executeUpdate();
		
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//강의 삭제
	public static boolean deleteClass(String classCode) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from class where class_code=?");
			pstmt.setString(1, classCode);
			
			int count = pstmt.executeUpdate();
			
			if(count !=0 ){
				result = true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return result;
	}
	
	//강의 수정
	public static boolean updateClass(String classCode, String classPrice , String className, String classTime,  String teacherName,
			String startDay, String endDay, String simpleIntro, String detailIntro, String maxStudent
			) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("update class set class_price = ? , class_name = ?, class_time = ?, teacher_name = ? , start_day = ?, end_day =? , simple_intro =? , detail_intro = ?, max_student = ? where class_code=?");
			
			pstmt.setString(1, classCode);
			pstmt.setString(2, classPrice);
			pstmt.setString(3, className);
			pstmt.setString(4, classTime);
			pstmt.setString(5, teacherName);
			pstmt.setString(6, startDay);
			pstmt.setString(7, endDay);
			pstmt.setString(8, simpleIntro);
			pstmt.setString(9, detailIntro);
			pstmt.setString(10, maxStudent);
			
			int result = pstmt.executeUpdate();
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//특정 강의 검색
	public static ClassDTO getClass(String classCode) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ClassDTO classDTO = null;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from class where class_code =?");
			pstmt.setString(1, classCode);
			rset = pstmt.executeQuery();
			if(rset.next()){
				classDTO = new ClassDTO(rset.getString(1), rset.getInt(2), rset.getString(3), rset.getString(4),rset.getString(5), rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9), rset.getInt(10));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return classDTO;
	}
	
	public static ArrayList<ClassDTO> getClassById(String teacherName) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ClassDTO> list = new ArrayList<>();
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from class where teacher_name = ?");
			pstmt.setString(1, teacherName);
			rset = pstmt.executeQuery();
			while(rset.next()){
				list.add(new ClassDTO(rset.getString(1), rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9), rset.getInt(10)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
	
	
	//모든 강의 검색
	public static ArrayList<ClassDTO> getAllClass() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ClassDTO> list = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from class");
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ClassDTO>();
			while(rset.next()){
				list.add(new ClassDTO(rset.getString(1), rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9), rset.getInt(10)) );
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}
