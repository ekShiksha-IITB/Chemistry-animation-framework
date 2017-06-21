/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author aishwarya
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ConnectionUtil.ConnectionFactory;
import ConnectionUtil.DBUtil;
import Objects.Lattice;
import java.util.*;
public class LatticeDAO {
    
    private Connection connection;
    private Statement statement;
 
    public LatticeDAO() { }
    
    public static List<Lattice> getLattices() throws SQLException {
        List<Lattice> lattices = new ArrayList<Lattice>();

        try (
            Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Lattices");
        ) {
            while (rs.next()) {
                Lattice lattice = new Lattice();
                lattice.setAll(rs.getInt("lattice_id"),rs.getString("lattice_name"), rs.getString("constraint_side"), rs.getString("constraint_angle"),rs.getString("description"));
                lattices.add(lattice);
            }
        }
          // System.out.println("Hi");
        return lattices;
}
}