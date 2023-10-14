package br.com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexaoDAO {
	public Connection conexaoBD() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/portaldeedificacoes?user=root&password=@Regis1984";
			con = DriverManager.getConnection(url);
		} catch (Exception e) {

		}
		return con;
	}
}
