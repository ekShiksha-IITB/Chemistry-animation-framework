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
import Objects.Compound;

 
public class CompoundDAO {
    
    private Connection connection;
    private Statement statement;
 
    public CompoundDAO() { }
 
    public Compound getAlkanes(int example) throws SQLException {
        String query = "SELECT * FROM organic_compounds WHERE id=" + example;
        ResultSet rs = null;
        Compound alkanes = null;
        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            if (rs.next()) {
                alkanes = new Compound();
                alkanes.setAll( rs.getInt("carbons"), rs.getInt("hydrogen"), rs.getInt("bond1"), rs.getInt("bond2") , rs.getInt("type"));
            }
        } finally {
            DBUtil.close(rs);
            DBUtil.close(statement);
            DBUtil.close(connection);
        }
        System.out.print(alkanes+" is the alkanes");
        return alkanes;
    }
    
}
     