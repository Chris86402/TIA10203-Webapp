package com.emp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ProTypeJDBCDAO implements ProTypeDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/db01?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO producttype (producttypeid,typename,createdby,lastupdatedby) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT producttypeid,typename,createdby,datecreated,lastupdatedby,lastupdated FROM producttype order by producttypeid";
	private static final String GET_ONE_STMT = "SELECT producttypeid,typename,createdby,datecreated,lastupdatedby,lastupdated FROM producttype where producttypeid = ?";
	private static final String DELETE = "DELETE FROM producttype where producttypeid = ?";
	private static final String UPDATE = "UPDATE producttype set typename=?, lastupdatedby=? where producttypeid = ?";

	@Override
	public void insert(ProTypeVO proTypeVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, proTypeVO.getProductTypeId());
			pstmt.setString(2, proTypeVO.getTypeName());
			pstmt.setString(3, proTypeVO.getCreatedBy());
			pstmt.setString(4, proTypeVO.getLastUpdatedBy());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(ProTypeVO proTypeVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, proTypeVO.getTypeName());
			pstmt.setString(2, proTypeVO.getLastUpdatedBy());
			pstmt.setInt(3, proTypeVO.getProductTypeId());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer proTypeId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, proTypeId);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public ProTypeVO findByPrimaryKey(Integer proTypeId) {

		ProTypeVO proTypeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, proTypeId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// proTypeVO 也稱為 Domain objects
				proTypeVO = new ProTypeVO();
				proTypeVO.setProductTypeId(rs.getInt("producttypeid")); // 查詢回來的值 set給proTypeVO物件(一筆資料)
				proTypeVO.setTypeName(rs.getString("typename"));
				proTypeVO.setCreatedBy(rs.getString("createdby"));
				proTypeVO.setDateCreated(rs.getTimestamp("datecreated"));
				proTypeVO.setLastUpdatedBy(rs.getString("lastupdatedby"));
				proTypeVO.setLastUpdated(rs.getTimestamp("lastupdated"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return proTypeVO;
	}

	@Override
	public List<ProTypeVO> getAll() {
		List<ProTypeVO> list = new ArrayList<ProTypeVO>();
		ProTypeVO proTypeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// proTypeVO 也稱為 Domain objects
				proTypeVO = new ProTypeVO();
				proTypeVO = new ProTypeVO();
				proTypeVO.setProductTypeId(rs.getInt("producttypeid")); // 查詢回來的值 set給proTypeVO物件(一筆資料)
				proTypeVO.setTypeName(rs.getString("typename"));
				proTypeVO.setCreatedBy(rs.getString("createdby"));
				proTypeVO.setDateCreated(rs.getTimestamp("datecreated"));
				proTypeVO.setLastUpdatedBy(rs.getString("lastupdatedby"));
				proTypeVO.setLastUpdated(rs.getTimestamp("lastupdated"));
				list.add(proTypeVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {
		ProTypeJDBCDAO dao = new ProTypeJDBCDAO();

		// 新增
//		ProTypeVO proTypeVO1 = new ProTypeVO();
//		proTypeVO1.setProductTypeId(6);
//		proTypeVO1.setTypeName("高級禮盒");
//		proTypeVO1.setCreatedBy("chris1");
//		proTypeVO1.setLastUpdatedBy("chris2");
//		dao.insert(proTypeVO1);

		// 修改
//		ProTypeVO proTypeVO2 = new ProTypeVO();
//		proTypeVO2.setProductTypeId(1);
//		proTypeVO2.setTypeName("999大禮包");
//		proTypeVO2.setLastUpdatedBy("chris3");
//		dao.update(proTypeVO2);

		// 刪除
//		dao.delete(3);

		// pk查詢
//		ProTypeVO proTypeVO3 = dao.findByPrimaryKey(4);
//		System.out.print(proTypeVO3.getProductTypeId());
//		System.out.print(proTypeVO3.getTypeName() + ",");
//		System.out.print(proTypeVO3.getCreatedBy() + ",");
//		System.out.print(proTypeVO3.getDateCreated() + ",");
//		System.out.print(proTypeVO3.getLastUpdatedBy() + ",");
//		System.out.print(proTypeVO3.getLastUpdated());
//		System.out.println("-------------------------");

		// all查詢
		List<ProTypeVO> list = dao.getAll();
		for (ProTypeVO aProTypeVO : list) {
			System.out.print(aProTypeVO.getProductTypeId() + ",");
			System.out.print(aProTypeVO.getTypeName() + ",");
			System.out.print(aProTypeVO.getCreatedBy() + ",");
			System.out.print(aProTypeVO.getDateCreated() + ",");
			System.out.print(aProTypeVO.getLastUpdatedBy() + ",");
			System.out.print(aProTypeVO.getLastUpdated());
			System.out.println();
		}

	}

}
