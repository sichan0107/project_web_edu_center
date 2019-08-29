package registration.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import registration.model.dto.QuestionDTO;
import registration.model.dto.RegistrationDTO;
import registration.model.util.DBUtil;

public class QuestionDAO {
	
		
	public static boolean addQuestion(QuestionDTO question) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into question values(?, ?, ?)");
			pstmt.setString(1, question.getName());
			pstmt.setString(2, question.getEmail());
			pstmt.setString(3, question.getContent());
			
			int result = pstmt.executeUpdate();
		
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	public static ArrayList<QuestionDTO> getAllQuestion() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QuestionDTO> list = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from question");
			rset = pstmt.executeQuery();
			
			list = new ArrayList<QuestionDTO>();
			while(rset.next()){
				list.add(new QuestionDTO(rset.getString(1), rset.getString(2), rset.getString(3)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}
