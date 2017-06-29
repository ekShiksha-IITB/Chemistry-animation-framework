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
import Objects.DReaction;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author abhi
 */
public class DReactionDAO {
    private Connection connection1;
    private Statement statement1;
 
    public DReactionDAO() { }
 
    public List<DReaction> getReactions(String reactant) throws SQLException {
         List<DReaction> reactions = new ArrayList<DReaction>();
         Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            String query="select * from decomposition_reaction d where d.reactant=\""+reactant+"\"";
            ResultSet rs = statement.executeQuery(query);
                 try {
            
            while (rs.next()) {
                DReaction reaction = new DReaction();
                reaction.setAll(rs.getInt("dr_id"),rs.getInt("n"),rs.getInt("p1"),rs.getInt("p2"),rs.getString("reactant"),rs.getString("product_1"),rs.getString("product_2"),rs.getString("reaction"));
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
    
     public int addReaction(String reactant,int n,String product_1,int p1,String product_2,int p2,String reaction) throws SQLException
    {
       int status=0;
        connection1 = ConnectionFactory.getConnection();
        PreparedStatement statement1;
        String sql = "INSERT INTO decomposition_reaction (reactant,n,product_1,p1,product_2,p2,reaction) VALUES (?, ?, ?,?,?,?,?)";
        statement1 = connection1.prepareStatement(sql);
         try{
                statement1.setString(1, reactant);
                statement1.setInt(2, n);
                statement1.setString(3,product_1);
                statement1.setInt(4, p1);
                statement1.setString(5,product_2);
                statement1.setInt(6, p2);
                statement1.setString(7,reaction);
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

