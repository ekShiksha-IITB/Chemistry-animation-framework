/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objects;

/**
 *
 * @author aishwarya
 */
import java.util.*;

public class Topic {
    private String topic_name,description;
    private int topic_id;
    private List<Subtopic> subtopics;
    
    public Topic()
    {
        
    }
    public String getTopicName()
    {
        return topic_name;
    }
    public int getTopicId()
    {
        return topic_id;
    }
    public String getDescription()
    {
        return description;
    }
    public List<Subtopic> getSubtopics()
    {
        return subtopics;
    }
    
    public void setAll(String topic_name,String description,int topic_id,List<Subtopic> subtopics)
    {
      this.topic_name=topic_name;
      this.description=description;
      this.topic_id=topic_id;
      this.subtopics=subtopics;
    }
}