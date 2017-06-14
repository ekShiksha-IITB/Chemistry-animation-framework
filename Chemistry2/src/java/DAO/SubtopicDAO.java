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
import Objects.Subtopic;
import Objects.Topic;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author aishwarya
 */
public class SubtopicDAO {
    private Connection connection1;
    private Statement statement1;
 
    public SubtopicDAO() { }
 
    public List<Subtopic> getSubtopic(int topic_id) throws SQLException {
         List<Subtopic> subtopics = new ArrayList<Subtopic>();
         Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from subtopic where topic_id="+ topic_id);
         
        try {
            
            while (rs.next()) {
                Subtopic subtopic = new Subtopic();
                subtopic.setAll(rs.getString("subtopic_name"), rs.getInt("sub_id"), rs.getInt("topic_id"));

                subtopics.add(subtopic);
            }
        }
        finally {
            DBUtil.close(rs);
            DBUtil.close(statement);
            DBUtil.close(connection);
        }

        return subtopics;
    }
}