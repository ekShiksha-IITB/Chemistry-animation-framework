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
public class DisReaction {
    private int id, reaction_id, n1,n2,p1,p2;
    private String reactant1,reactant2,product1,product2;
    private String type, reaction;
   
      public DisReaction()
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
    public int getReactant1Number()
    {
        return this.n1;
    }
     public int getReactant2Number()
    {
        return this.n2;
    }
    public int getProduct1Number()
    {
        return this.p1;
    }
    public int getProduct2Number()
    {
        return this.p2;
    }
    public String getReactant1()
    {
        return this.reactant1;
    }
    public String getReactant2()
    {
        return this.reactant2;
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

    public void setAll(int id,int r_id,int n1,int n2,int p1,int p2, String reactant1,String reactant2,String product1, String product2,String type, String reaction)
    {
        this.id=id;
        this.reaction_id=r_id;
        this.n1=n1;
        this.n2=n2;
        this.p1=p1;
        this.p2=p2;
        this.reactant1=reactant1;
        this.reactant2=reactant2;
        this.product1=product1;
        this.product2=product2;
        this.type=type;
        this.reaction=reaction;
    }
    
}
