/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ConnectionUtil.ConnectionFactory;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author aishwarya
 */
public class OrganicCompoundDAO {
    private Connection connection1;
    private Statement statement1;
    public OrganicCompoundDAO()
    {
        
    }
    public int addCompound(String name,int carbons,int hydrogen,int type,int bond1,int bond2) throws SQLException
    {
       int status=0;
        connection1 = ConnectionFactory.getConnection();
           statement1 = connection1.createStatement();
         try{
        System.out.print("Trying");
        status=statement1.executeUpdate("insert into organic_compounds(name,carbons,hydrogen,type,bond1,bond2) values('"+name+"','"+carbons+"','"+hydrogen+"','"+type+"','"+bond1+"','"+bond2+"');");
        System.out.println("Data is successfully inserted!");
        }
        catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
           
       return status;
    }
    
}