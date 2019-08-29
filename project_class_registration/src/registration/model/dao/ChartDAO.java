package registration.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import registration.model.dto.ChartDTO;
import registration.model.util.DBUtil;

public class ChartDAO {
	public static ArrayList<ChartDTO> getAllChart() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ChartDTO> list = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select c.class_name, now(new.class_code) from class c, (select class_code from registration group by class_code) new where c.class_code = new.class_code order by now(new.class_code) desc");
			rset = pstmt.executeQuery();
			list = new ArrayList<ChartDTO>();
			while(rset.next()){
				list.add(new ChartDTO(rset.getString(1), rset.getInt(2)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}
