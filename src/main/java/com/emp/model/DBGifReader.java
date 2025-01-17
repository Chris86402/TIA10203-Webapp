package com.emp.model;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class DBGifReader extends HttpServlet {

    Connection con;

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("image/gif");
        ServletOutputStream out = res.getOutputStream();

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(
                "select pic from club where id = 1");

            if (rs.next()) {
                BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("pic"));
                byte[] buf = new byte[4 * 1024]; // 4K buffer
                int len;
                while ((len = in.read(buf)) != -1) {
                    out.write(buf, 0, len);
                }
                in.close();
            } else {
                res.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcsample?serverTimezone=Asia/Taipei", "root", "123456");
        } catch (ClassNotFoundException e) {
            throw new UnavailableException("Couldn't load JdbcOdbcDriver");
        } catch (SQLException e) {
            throw new UnavailableException("Couldn't get db connection");
        }
    }

    public void destroy() {
        try {
            if (con != null) con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}