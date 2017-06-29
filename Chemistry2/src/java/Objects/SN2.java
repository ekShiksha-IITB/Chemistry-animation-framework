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

public class SN2 {

    private String Grp1, Grp2, Grp3, Grp4, Leaving_group, Adding_group;
            
    public SN2()
    {
        
    }
    public String getGrp1()
    {
        return Grp1;
    }
    public String getGrp2()
    {
        return Grp2;
    }
    public String getGrp3()
    {
        return Grp3;
    }
    public String getLeaving_group()
    {
        return Leaving_group;
    }
    public String getGrp4()
    {
        return Grp4;
    }
    public String getAdding_group()
    {
        return Adding_group;
    }
    
     
    public void setAll(String Grp1,String Grp2,String Grp3,String Leaving_group,String Grp4,String Adding_group)
    {
      this.Grp1=Grp1;
      this.Grp2=Grp2;
      this.Grp3=Grp3;
      this.Leaving_group=Leaving_group;
      this.Grp4=Grp4;
      this.Adding_group=Adding_group;
    }
}