package registration.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import registration.model.dto.PastRegistrationDTO;
import registration.model.dto.StudentDTO;
import registration.model.util.DBUtil;

public class PastRegistrationDAO {

	
	public static boolean addPastRegistration(PastRegistrationDTO record) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into student values(?, ?)");
			pstmt.setString(1, record.getStudentId());
			pstmt.setString(2, record.getClassCode());
			
			int result = pstmt.executeUpdate();
		
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	public static ArrayList<PastRegistrationDTO> getAllPastRegistration() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PastRegistrationDTO> list = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from pastRegistratoin");
			rset = pstmt.executeQuery();
			
			list = new ArrayList<PastRegistrationDTO>();
			while(rset.next()){
				list.add(new PastRegistrationDTO(rset.getString(1), rset.getString(2)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}
