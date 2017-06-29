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
import Objects.DisReaction;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author abhi
 */
public class DisReactionDAO {
    private Connection connection1;
    private Statement statement1;
 
    public DisReactionDAO() { }
 
    public List<DisReaction> getSingleReactions(String reactant1,String reactant2) throws SQLException {
         List<DisReaction> reactions = new ArrayList<DisReaction>();
         Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            String query="xyz";
            if(reactant1=="" && reactant2!="")
            { query="select * from displacement_reaction c where (c.reactant_1=\""+reactant2+"\" or c.reactant_2=\""+reactant2+"\" ) ";
            System.out.print("1\n");
            }else if(reactant1!="" && reactant2=="")
            {query="select * from displacement_reaction c where (c.reactant_1=\""+reactant1+"\" or c.reactant_2=\""+reactant1+"\" ) ";
            System.out.print("2\n");
            }else
            {query="select * from displacement_reaction c where c.reactant_1=\""+reactant1+"\" and c.reactant_2=\""+reactant2+"\"";
            System.out.print("3\n");
            }System.out.print(query);
            ResultSet rs = statement.executeQuery(query);
                 try {
            
            while (rs.next()) {
                DisReaction reaction = new DisReaction();
                reaction.setAll(rs.getInt("dis_id"), rs.getInt("n1"),rs.getInt("n2"),rs.getInt("p1"),rs.getInt("p2"),rs.getString("reactant_1"),rs.getString("reactant_2"),rs.getString("product_1"),rs.getString("product_2"),rs.getString("reaction"));
                reactions.add(reaction);
            }
        }
        finally {
            DBUtil.close(rs);
            DBUtil.close(statement);
            DBUtil.close(connection);
        }

        return reactions;
    }
     public List<DisReaction> getDoubleReactions(String reactant1,String reactant2) throws SQLException {
         List<DisReaction> reactions = new ArrayList<DisReaction>();
         Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            String query="xyz";
            if(reactant1=="" && reactant2!="")
            { query="select * from doubledisplacement_reaction c where (c.reactant_1=\""+reactant2+"\" or c.reactant_2=\""+reactant2+"\" )";
            System.out.print("1\n");
            }else if(reactant1!="" && reactant2=="")
            {query="select * from doubledisplacement_reaction c where (c.reactant_1=\""+reactant1+"\" or c.reactant_2=\""+reactant1+"\" ) ";
            System.out.print("2\n");
            }else
            {query="select * from doubledisplacement_reaction c where c.reactant_1=\""+reactant1+"\" and c.reactant_2=\""+reactant2+"\" ";
            System.out.print("3\n");
            }System.out.print(query);
            ResultSet rs = statement.executeQuery(query);
                 try {
            
            while (rs.next()) {
                DisReaction reaction = new DisReaction();
                reaction.setAll(rs.getInt("ddis_id"), rs.getInt("n1"),rs.getInt("n2"),rs.getInt("p1"),rs.getInt("p2"),rs.getString("reactant_1"),rs.getString("reactant_2"),rs.getString("product_1"),rs.getString("product_2"),rs.getString("reaction"));
                reactions.add(reaction);
            }
        }
        finally {
            DBUtil.close(rs);
            DBUtil.close(statement);
            DBUtil.close(connection);
        }

        return reactions;
    }
     
     public int addSReaction(String reactant_1,int n1,String reactant_2,int n2,String product_1,int p1,String product_2,int p2,String reaction) throws SQLException
    {
       int status=0;
        connection1 = ConnectionFactory.getConnection();
        PreparedStatement statement1;
        String sql = "INSERT INTO displacement_reaction (reactant_1,n1,reactant_2,n2,product_1,p1,product_2,p2,reaction) VALUES (?, ?, ?,?,?,?,?,?,?)";
        statement1 = connection1.prepareStatement(sql);
         try{
                statement1.setString(1, reactant_1);
                statement1.setInt(2, n1);
                statement1.setString(3,reactant_2);
                statement1.setInt(4, n2);
                statement1.setString(5,product_1);
                statement1.setInt(6, p1);
                statement1.setString(7,product_2);
                statement1.setInt(8, p2);
                statement1.setString(9,reaction);
                status=statement1.executeUpdate();

          System.out.println("Data is successfully inserted!");
        }
        catch(Exception e){
        e.printStackTrace();
        }
           
       return status;
    }
     
     public int addDReaction(String reactant_1,int n1,String reactant_2,int n2,String product_1,int p1,String product_2,int p2,String reaction) throws SQLException
    {
       int status=0;
        connection1 = ConnectionFactory.getConnection();
        PreparedStatement statement1;
        String sql = "INSERT INTO doubledisplacement_reaction (reactant_1,n1,reactant_2,n2,product_1,p1,product_2,p2,reaction) VALUES (?, ?, ?,?,?,?,?,?,?)";
        statement1 = connection1.prepareStatement(sql);
         try{
                statement1.setString(1, reactant_1);
                statement1.setInt(2, n1);
                statement1.setString(3,reactant_2);
                statement1.setInt(4, n2);
                statement1.setString(5,product_1);
                statement1.setInt(6, p1);
                statement1.setString(7,product_2);
                statement1.setInt(8, p2);
                statement1.setString(9,reaction);
                status=statement1.executeUpdate();

          System.out.println("Data is successfully inserted!");
        }
        catch(Exception e){
        e.printStackTrace();
        }
           
       return status;
    }
}
// Correct query: select * from reactions r, combination_reaction c where c.reactant_1="H2" and c.reactant_2="Cl2" and r.reaction_id=c.reaction_id
