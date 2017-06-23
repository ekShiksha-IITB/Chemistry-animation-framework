/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ConnectionUtil.ConnectionFactory;
import ConnectionUtil.DBUtil;
import Objects.Element;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author aishwarya
 */
public class LatticeExamplesDAO {
     
    private Connection connection;
    private Statement statement;
    public LatticeExamplesDAO(){
        
    }
    public List<String> getExamples(int lattice_id) throws SQLException {
        String query = "SELECT * FROM `lattice_examples` WHERE lattice_id="+lattice_id;
        ResultSet rs = null;
       List<String> examples = new ArrayList<String>();

        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            while (rs.next()) {
               String example=rs.getString("example_name");
               examples.add(example);
            }
        } finally {
            DBUtil.close(rs);
            DBUtil.close(statement);
            DBUtil.close(connection);
        }
        return examples;
    }
    
     public int addExample(String ename,String lname,int l_id) throws SQLException
    {
       int status=0;
        connection = ConnectionFactory.getConnection();
        PreparedStatement statement1;
        String sql = "INSERT INTO lattice_examples (example_name,lattice_name,lattice_id) VALUES (?, ?, ?)";
        statement1 = connection.prepareStatement(sql);
         try{
            
             
                statement1.setString(1, ename);
                   statement1.setString(2, lname);
                statement1.setInt(3, l_id);
                 status=statement1.executeUpdate();

          System.out.println("Data is successfully inserted!");
        }
        catch(Exception e){
        e.printStackTrace();
        }
           
       return status;
    }
}
