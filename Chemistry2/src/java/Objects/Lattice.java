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
public class Lattice {
    private int id;
    private String name, constraint_side, constraint_angle,description;
    public Lattice()
    {
        
    }
    public int getId()
    {
        return this.id;
    }
    public String getName()
    {
        return this.name;
    }
    public String getSideConstraint()
    {
        return this.constraint_side;
    }
    public String getAngleConstraint()
    {
        return this.constraint_angle;
    }
    public String getDescription()
    {
        return this.description;
    }
    public void setAll(int id, String name, String side, String angle, String desc)
    {
        this.id=id;
        this.name=name;
        this.constraint_side=side;
        this.constraint_angle=angle;
        this.description=desc;
    }
    
}