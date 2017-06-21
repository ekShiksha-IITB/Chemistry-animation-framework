/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ConnectionUtil.ConnectionFactory;
import ConnectionUtil.DBUtil;
import Objects.Hydrocarbon;

 
public class HydrocarbonDAO {
    
    private Connection connection;
    private Statement statement;
 
    public HydrocarbonDAO() { }
 
    public Hydrocarbon getHydrocarbon(int hydro_id) throws SQLException {
        String query = "SELECT * FROM properties WHERE hydro_id=" + hydro_id;
        ResultSet rs = null;
        Hydrocarbon hydrocarbon = null;
        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            if (rs.next()) {
                hydrocarbon = new Hydrocarbon();
                hydrocarbon.setAll( rs.getString("hydro_name"), rs.getString("hybrid_type"), rs.getString("atomic_orbitals"), rs.getInt("s_orbitals"),rs.getInt("p_orbitals") , rs.getInt("groups_attached_to_carbon"), rs.getInt("angle_beetween_each_pair"),rs.getString("spatial_arrangement") , rs.getInt("s_character"), rs.getInt("p_character") ,rs.getString("shape"),rs.getString("example"));
            }
        } finally {
            DBUtil.close(rs);
            DBUtil.close(statement);
            DBUtil.close(connection);
        }
        System.out.print(hydrocarbon+" is the hydrocarbon");
        return hydrocarbon;
    }
}
     
