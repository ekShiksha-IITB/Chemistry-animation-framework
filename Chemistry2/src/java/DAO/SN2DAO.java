/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ConnectionUtil.ConnectionFactory;
import ConnectionUtil.DBUtil;
import Objects.SN2;

 
public class SN2DAO {
    
    private Connection connection;
    private Statement statement;
 
    public SN2DAO() { }
 
    public SN2 getSN2(int options) throws SQLException {
        String query = "SELECT * FROM organic_sn2 WHERE organic_reaction_ID=" + options;
        ResultSet rs = null;
        SN2 sn2 = null;
        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            if (rs.next()) {
                sn2 = new SN2();
                sn2.setAll( rs.getString("Grp1"), rs.getString("Grp2"), rs.getString("Grp3"), rs.getString("Leaving_group"), rs.getString("Grp4"),rs.getString("Adding_group"));
            }
        } finally {
            DBUtil.close(rs);
            DBUtil.close(statement);
            DBUtil.close(connection);
        }
        System.out.print(sn2+" is the sn2");
        return sn2;
    }
    
}
     