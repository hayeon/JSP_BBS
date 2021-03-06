package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	// 여러개의 함수를 사용하기 때문에 함수끼리의 마찰을 없애기 위해 pstmt 사용 x

	public BbsDAO() { // 데베에 접근해서 데이터를 가져오는 역할
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=Asia/Seoul";
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

	public String getDate() { // 현재 시간을 가져오는 함수
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류로 공백 출력
	}

	public int getNext() { // 현재 시간을 가져오는 함수
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC"; // 내림차순으로 가장 마지막 번호를 가져옴
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 쓰인 게시물이 없는 경우( 첫 게시물인 경우)
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류로 공백 출력
	}

	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES(?,?,?,?,?)"; // 내림차순으로 가장 마지막 번호를 가져옴
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); //다음번에 쓰일 게시글 번호
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6,1);
			
			// INSERT문에는 필요없음 rs = pstmt.executeQuery();
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류로 공백 출력
	}

	}
