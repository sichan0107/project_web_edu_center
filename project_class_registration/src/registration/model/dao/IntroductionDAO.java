package registration.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import registration.model.dto.IntroductionDTO;
import registration.model.util.DBUtil;

public class IntroductionDAO {
	//강의소개글 추가
	public static boolean addIntroduction(IntroductionDTO introduction) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into introduction values(?, ?, ?, ?, ?)");
			pstmt.setString(1, introduction.getClassCode());
			pstmt.setString(2, introduction.getIntroVideo());
			pstmt.setString(3, introduction.getIntroDay());
			pstmt.setString(4, introduction.getIntroContent());
			
			int result = pstmt.executeUpdate();
		
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//강의소개글 삭제
	public static boolean deleteIntroduction(String classCode) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from introduction where class_code=?");
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
	
	//강의소개글 수정
	public static boolean updateIntroduction(String classCode, String introVideo, String introDay, String introContent) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("update introduction set intro_content = ? where class_code=?");
			pstmt.setString(1, classCode);
			pstmt.setString(2, introVideo);
			pstmt.setString(3, introDay);
			pstmt.setString(4, introContent);
			
			int result = pstmt.executeUpdate();
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	

	//강의소개글 보여주기
	public static IntroductionDTO getIntroduction(String classCode) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		IntroductionDTO introduction = null;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from introduction where class_code=?");
			pstmt.setString(1, classCode);
			rset = pstmt.executeQuery();
			if(rset.next()){
				introduction = new IntroductionDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return introduction;
	}
	
}
