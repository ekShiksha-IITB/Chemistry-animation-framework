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
public class Subtopic {
    private String subtopic_name,description,tip;
    private int sub_id,topic_id;
    
    public Subtopic()
    {
        
    }
    public String getSubtopicName()
    {
        return subtopic_name;
    }
     public String getDescription()
    {
        return description;
    }
      public String getTip()
    {
        return tip;
    }
    public int getSubId()
    {
        return sub_id;
    }
     public int getTopicId()
    {
        return topic_id;
    }
    
    public void setAll(String subtopic_name,int sub_id,int topic_id,String description,String tip)
    {
      this.subtopic_name=subtopic_name;
      this.sub_id=sub_id;
      this.topic_id=topic_id;
      this.description=description;
      this.tip=tip;
    }
}