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
	
	public UserDAO() { //데베에 접근해서 데이터를 가져오는 역할
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=Asia/Seoul" ;
			 String dbID = "root";
			   String dbPassword = "root";
			   Class.forName("com.mysql.jdbc.Driver");
			   conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			   System.out.println("데베연결!");

			  } catch (Exception e) {
			   e.printStackTrace();
			   System.out.println("연결실패 ㅠ");
			  }
			 }

			 public int login(String userID, String userPassword) {
			  String SQL = "SELECT userPassword FROM User WHERE userID=?";
			  try {
			   pstmt = conn.prepareStatement(SQL);
			   pstmt.setString(1, userID);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
			    if(rs.getString(1).equals(userPassword))
			     return 1;  // 로그인 성공
			    else
			     return 0;  // 비밀번호 불일치
			   }
			   return -1;  // 아이디가 없음
			   
			  } catch(Exception e) {
			   e.printStackTrace();
			  }
			  return -2; // 데이터 베이스 오류

			 }
			 public int join (User user) {
				 String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
				 try {
					 pstmt = conn.prepareStatement(SQL);
					 pstmt.setString(1, user.getUserID());
					 pstmt.setString(2, user.getUserPassword());
					 pstmt.setString(3, user.getUserName());
					 pstmt.setString(4, user.getUserGender());
					 pstmt.setString(5, user.getUserEmail());
					 return pstmt.executeUpdate(); //statement 결과
				} catch (Exception e) {
					e.printStackTrace();
				}
				 return -1; //오류 발생
			 }
			}

