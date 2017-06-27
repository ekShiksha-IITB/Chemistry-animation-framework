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
public class CReaction {
    private int id, reaction_id, r1,r2,p;
    private String reactant1,reactant2,product;
    private String type, reaction;
   
      public CReaction()
    {
        
    }
    public int getCRId()
    {
        return this.id;
    }
    public int getRId()
    {
        return this.reaction_id;
    }
    public int getReactant1Number()
    {
        return this.r1;
    }
    public int getReactant2Number()
    {
        return this.r2;
    }
    public int getProductNumber()
    {
        return this.p;
    }
    public String getReactant1()
    {
        return this.reactant1;
    }
    public String getReactant2()
    {
        return this.reactant2;
    }
    public String getProduct()
    {
        return this.product;
    }
      public String getType()
    {
        return this.type;
    }
    public String getReaction()
    {
        return this.reaction;
    }

    public void setAll(int id,int r_id,int r1,int r2,int p, String reactant1,String reactant2, String product,String type, String reaction)
    {
        this.id=id;
        this.reaction_id=r_id;
        this.r1=r1;
        this.r2=r2;
        this.p=p;
        this.reactant1=reactant1;
        this.reactant2=reactant2;
        this.product=product;
        this.type=type;
        this.reaction=reaction;
    }
    
}
