package bean;

import java.sql.*;

public class Data {
    String drive = "com.mysql.jdbc.Driver", user = "root", pass = "root";
    String url = "jdbc:mysql://localhost:3306/web?serverTimezone=GMT";
    Connection con = null;
    Statement smt = null;
    ResultSet rs = null;
    public Data() {
        try {
            Class.forName(drive);
            con = DriverManager.getConnection(url, user, pass);
            smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            System.out.print("数据库连接成功！");
        } catch (Exception e) {
            System.out.print(e);
        }
    }
    public int exeU(String sql) {//更新语句
        int n = 0;
        try {
            n = smt.executeUpdate(sql);
        } catch (Exception e) {
            System.out.print(e);
        }
        return n;
    }

    public ResultSet exeQ(String sql) {//返回一个查询ResultSet
        try {
            rs = smt.executeQuery(sql);
        } catch (Exception e) {
            System.out.print(e);
        }
        return rs;
    }
    public void close() {//关闭数据库
        try {
            if (rs != null)
                rs.close();
            smt.close();
            con.close();
            System.out.println("数据库断开连接！");
        } catch (Exception e) {
            System.out.print(e);
        }
    }
}
