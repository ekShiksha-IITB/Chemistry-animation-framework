/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author aishwarya
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ConnectionUtil.ConnectionFactory;
import ConnectionUtil.DBUtil;
import Objects.Topic;
import DAO.SubtopicDAO;
import Objects.Subtopic;
import java.util.*;
public class TopicDAO {
    
    private Connection connection;
    private Statement statement;
 
    public TopicDAO() { }
    
    public static List<Topic> getTopic() throws SQLException {
        List<Topic> topics = new ArrayList<Topic>();

        try (
            Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from topic");
        ) {
            while (rs.next()) {
                Topic topic = new Topic();
                          // System.out.println("Hi DAO");

                SubtopicDAO subtopicDAO=new SubtopicDAO();
                List<Subtopic> subtopics=subtopicDAO.getSubtopic(rs.getInt("topic_id"));
                topic.setAll(rs.getString("topic_name"), rs.getString("description"), rs.getInt("topic_id"),subtopics);

                topics.add(topic);
            }
        }
          // System.out.println("Hi");
        return topics;
}
}