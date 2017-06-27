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
public class DReaction {
    private int id, reaction_id, n,p1,p2;
    private String reactant,product1,product2;
    private String type, reaction;
   
      public DReaction()
    {
        
    }
    public int getDRId()
    {
        return this.id;
    }
    public int getRId()
    {
        return this.reaction_id;
    }
    public int getReactantNumber()
    {
        return this.n;
    }
    public int getProduct1Number()
    {
        return this.p1;
    }
    public int getProduct2Number()
    {
        return this.p2;
    }
    public String getReactant()
    {
        return this.reactant;
    }
    public String getProduct1()
    {
        return this.product1;
    }
    public String getProduct2()
    {
        return this.product2;
    }
      public String getType()
    {
        return this.type;
    }
    public String getReaction()
    {
        return this.reaction;
    }

    public void setAll(int id,int r_id,int n,int p1,int p2, String reactant,String product1, String product2,String type, String reaction)
    {
        this.id=id;
        this.reaction_id=r_id;
        this.n=n;
        this.p1=p1;
        this.p2=p2;
        this.reactant=reactant;
        this.product1=product1;
        this.product2=product2;
        this.type=type;
        this.reaction=reaction;
    }
    
}
