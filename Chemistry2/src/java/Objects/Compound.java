/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objects;

/**
 *
 * @author shreya
 */

public class Compound {

    private int carbons, hydrogen, bond1, bond2,type;
    
    public Compound()
    {
        
    }
    public int getcarbons()
    {
        return carbons;
    }
    public int gethydrogen()
    {
        return hydrogen;
    }
    public int getbond1()
    {
        return bond1;
    }
    public int getbond2()
    {
        return bond2;
    }
    public int gettype()
    {
        return type;
    }
    
    public void setAll(int carbons,int hydrogen,int bond1,int bond2,int type)
    {
      this.carbons=carbons;
      this.hydrogen=hydrogen;
      this.bond1=bond1;
      this.bond2=bond2;
      this.type=type;
    }
}