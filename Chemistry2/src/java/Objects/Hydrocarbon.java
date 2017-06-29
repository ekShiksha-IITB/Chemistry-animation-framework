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

public class Hydrocarbon {

    private String hydro_name,hybrid_type, atomic_orbitals, type, spatial_arrangement,shape,example;
    private int s_orbitals,p_orbitals,groups_attached_to_carbon,s_character,p_character,angle_beetween_each_pair; 
    
    public Hydrocarbon()
    {
        
    }
    public String gethydro_name()
    {
        return hydro_name;
    }
    public String gethybrid_type()
    {
        return hybrid_type;
    }
    public String getatomic_orbitals()
    {
        return atomic_orbitals;
    }
    public int gets_orbitals()
    {
        return s_orbitals;
    }
    public int getp_orbitals()
    {
        return p_orbitals;
    }
    public int getgroups_attached_to_carbon()
    {
        return groups_attached_to_carbon;
    }
    public int getangle_beetween_each_pair()
    {
        return angle_beetween_each_pair;
    }
    public String getspatial_arrangement()
    {
        return spatial_arrangement;
    }
    
    public int gets_character()
    {
        return s_character;
    }
    public int getp_character()
    {
        return p_character;
    }
    public String getshape()
    {
        return shape;
    }
    public String getexample()
    {
        return example;
    }
     
    public void setAll(String hydro_name,String hybrid_type,String atomic_orbitals,int s_orbitals, int p_orbitals,int groups_attached_to_carbon,int angle_beetween_each_pair,String spatial_arrangement,int s_character,int p_character,String shape,String example)
    {
      this.hydro_name=hydro_name;
      this.hybrid_type=hybrid_type;
      this.atomic_orbitals=atomic_orbitals;
      this.s_orbitals=s_orbitals;
      this.p_orbitals=p_orbitals;
      this.groups_attached_to_carbon=groups_attached_to_carbon;
      this.angle_beetween_each_pair=angle_beetween_each_pair;
      this.spatial_arrangement=spatial_arrangement;
      this.s_character=s_character;
      this.p_character=p_character;
      this.shape=shape;
      this.example=example;
    }
}