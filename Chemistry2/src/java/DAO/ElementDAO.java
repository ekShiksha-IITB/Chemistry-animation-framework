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
import Objects.Element;
import java.util.ArrayList;
import java.util.List;
 
public class ElementDAO {

   
    private Connection connection;
    private Statement statement;
 
    public ElementDAO() { }
 
    public Element getElement(int atomic_number) throws SQLException {
        String query = "SELECT * FROM Element WHERE atomic_number=" + atomic_number;
        ResultSet rs = null;
        Element element = null;
        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            if (rs.next()) {
                element = new Element();
                element.setAll(rs.getString("name"), rs.getString("symbol"), rs.getString("type"),rs.getInt("atomic_number") , rs.getInt("periodic_group"), rs.getInt("period"),rs.getInt("table_group"), rs.getInt("table_period"), rs.getInt("valence_electrons"), rs.getInt("k_shell"), rs.getInt("l_shell"), rs.getInt("m_shell"), rs.getInt("n_shell"), rs.getInt("o_shell"), rs.getInt("p_shell"), rs.getInt("q_shell"), rs.getDouble("molar_mass"));

            }
        } finally {
            DBUtil.close(rs);
            DBUtil.close(statement);
            DBUtil.close(connection);
        }
        System.out.print(element+" is the element");
        return element;
    }
     public List<Element> getElements() throws SQLException {
        String query = "SELECT * FROM Element where atomic_number!=0";
        ResultSet rs = null;
       List<Element> elements = new ArrayList<Element>();

        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            while (rs.next()) {
                Element element = new Element();
                element.setAll(rs.getString("name"), rs.getString("symbol"), rs.getString("type"),rs.getInt("atomic_number") , rs.getInt("periodic_group"), rs.getInt("period"), rs.getInt("table_group"), rs.getInt("table_period"),rs.getInt("valence_electrons"), rs.getInt("k_shell"), rs.getInt("l_shell"), rs.getInt("m_shell"), rs.getInt("n_shell"), rs.getInt("o_shell"), rs.getInt("p_shell"), rs.getInt("q_shell"), rs.getDouble("molar_mass"));
                elements.add(element);
            }
        } finally {
            DBUtil.close(rs);
            DBUtil.close(statement);
            DBUtil.close(connection);
        }
        return elements;
    }

}

/*
public class ProductDAO {

    private DataSource dataSource;

    public ProductDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Product> list() throws SQLException {
        List<Product> products = new ArrayList<Product>();

        try (
            Connection connection = dataSource.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT id, name, description, price FROM product");
            ResultSet resultSet = statement.executeQuery();
        ) {
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getLong("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getBigDecimal("price"));
                products.add(product);
            }
        }

        return products;
    }

}
*/