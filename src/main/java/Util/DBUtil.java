package Util;

import bean.SQLInformation;
import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DBUtil {

    private static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    public static Connection getConnection() {
        MysqlDataSource mySqlDS = new MysqlDataSource();

        mySqlDS.setUrl("jdbc:mysql://localhost:3306/" + SQLInformation.databaseName);
        mySqlDS.setUser(SQLInformation.username);
        mySqlDS.setPassword(SQLInformation.password);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try(Connection connection = mySqlDS.getConnection()){
            return mySqlDS.getConnection();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    public static Connection getConnection(String database, String user, String password) {
        MysqlDataSource mySqlDS = new MysqlDataSource();

        mySqlDS.setUrl("jdbc:mysql://localhost:3306/" + database);
        mySqlDS.setUser(user);
        mySqlDS.setPassword(password);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try(Connection connection = mySqlDS.getConnection()){
            return mySqlDS.getConnection();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }
}
