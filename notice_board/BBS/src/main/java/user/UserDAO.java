//데베 불러오는 DAO
package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs; 
	
	public void userDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS" ;
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.idbc.Driver"); 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("연결성공!");
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	public int login(String userID, String userPassword) {
		String SQL = "SELCET userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); //해킹을 방지하기 위해 물음표에 해당하는 내용으로 유저 아이디를 넣고 실제 데이터 베이스에는 아이디 존재 여부 확인 후 가져옴
			rs = pstmt.executeQuery();
			if (rs.next()) { //다음 결과가 존재 한다면
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}
				else 
					return 0; //비밀번호 틀림
			}
			else 
			return -1; //아이디가 없음
		} catch (Exception e) {
		e.printStackTrace();
		}
		return -2; // 데이터베이스 오류 으미
	}
}