/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objects;

/**
 *
 * @author abhi
 */
public class Reactions {
    
    private int id;
    private String type, reaction;
    public Reactions()
    {
    }
    public int getId()
    {
        return this.id;
    }
    public String getType()
    {
        return this.type;
    }
    public String getReaction()
    {
        return this.reaction;
    }
    public void setAll(int id, String type, String reaction)
    {
        this.id=id;
        this.type=type;
        this.reaction=reaction;
    }
    
    
}
