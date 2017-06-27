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
public class VSEPRDAO {
    private Connection connection1;
    private Statement statement1;
    public VSEPRDAO()
    {
        
    }
    public int addCompound(String cname,int ep,int lp,String shape) throws SQLException
    {
       int status=0;
        connection1 = ConnectionFactory.getConnection();
           statement1 = connection1.createStatement();
         try{
             ep=ep-1;
        System.out.print("Trying");
          status=statement1.executeUpdate("insert into VSEPR(compound_name,shape_id,lonepairs,shape) values('"+cname+"','"+ep+"','"+lp+"','"+shape+"');");
        System.out.println("Data is successfully inserted!");
        }
        catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
           
       return status;
    }
    
}