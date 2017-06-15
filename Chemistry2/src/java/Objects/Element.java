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

import java.util.*;
 
public class Element {

    private String name, symbol, type;
    private int z,periodic_group,period,table_group,table_period,valence_electrons,k,l,m,n,o,p,q;
    private double molar_mass;
    
    public Element()
    {
        
    }
    public String getName()
    {
        return name;
    }
    public String getSymbol()
    {
        return symbol;
    }
    public String getType()
    {
        return type;
    }
    public int getAtomicNumber()
    {
        return z;
    }
    public int getGroup()
    {
        return periodic_group;
    }
    public int getPeriod()
    {
        return period;
    }
    public int getTableGroup()
    {
        return table_group;
    }
    public int getTablePeriod()
    {
        return table_period;
    }
    public int getValenceElectrons()
    {
        return valence_electrons;
    }
    public int getK()
    {
        return k;
    }
        public int getL()
    {
        return l;
    }
        
        public int getM()
    {
        return m;
    }    public int getN()
    {
        return n;
    }    public int getO()
    {
        return o;
    }    public int getP()
    {
        return p;
    }    public int getQ()
    {
        return q;
    }    public double getMolarMass()
    {
        return molar_mass;
    }
    public void setAll(String name,String symbol,String type, int z,int group,int period,int table_group,int table_period,int valence_electrons,int k,int l,int m,int n, int o,int p,int q,double molar_mass)
    {
      this.name=name;
      this.symbol=symbol;
      this.type=type;
      this.z=z;
      this.periodic_group=group;
      this.period=period;
      this.table_group=table_group;
      this.table_period=table_period;
      this.valence_electrons=valence_electrons;
      this.k=k;
      this.l=l;
      this.m=m;
      this.n=n;
      this.o=o;
      this.p=p;
      this.q=q;
      this.molar_mass=molar_mass;
    }
 
    
}