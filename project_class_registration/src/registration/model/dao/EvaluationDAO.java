package registration.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import registration.model.dto.EvaluationDTO;
import registration.model.dto.RegistrationDTO;
import registration.model.util.DBUtil;

public class EvaluationDAO {
	//수강평 추가
	public static boolean addEvaluation(EvaluationDTO evaluation) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into evaluation values(?, ?, ?, ?)");
			pstmt.setString(1, evaluation.getClassCode());
			pstmt.setString(2, evaluation.getStudentId());
			pstmt.setString(3, evaluation.getEvaluationContent());
			pstmt.setString(4, evaluation.getEvaluationDay());
			
			int result = pstmt.executeUpdate();
		
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//수강평 삭제
	public static boolean deleteEvaluation(String studentId) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from evaluation where student_id=?");
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
	
	//수강평 수정
	public static boolean updateEvaluation(String classCode, String studentId, String evaluationContent, String evaluationDay) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("update evaluation set evaluation_day = ?, evaluation_content = ? where class_code=? and student_id=?");
			pstmt.setString(1, evaluationDay);
			pstmt.setString(2, evaluationContent);
			pstmt.setString(3, classCode);
			pstmt.setString(4, studentId);
			
			int result = pstmt.executeUpdate();
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//수강평 보여주기
	public static ArrayList<EvaluationDTO> getEvaluation(String classCode) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		 ArrayList<EvaluationDTO> evaluation = null;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from evaluation where class_code=?");
			pstmt.setString(1, classCode);
			rset = pstmt.executeQuery();
			evaluation = new ArrayList<EvaluationDTO>();
			while(rset.next()){
				evaluation.add(new EvaluationDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return evaluation;
	}
	
	
	//모든 수강평 목록 가져오기
	public static ArrayList<EvaluationDTO> getAllEvaluation() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<EvaluationDTO> list = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from evaluation");
			rset = pstmt.executeQuery();
			
			list = new ArrayList<EvaluationDTO>();
			while(rset.next()){
				list.add(new EvaluationDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}
