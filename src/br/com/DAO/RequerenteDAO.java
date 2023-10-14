package br.com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.DTO.RequerenteDTO;


public class RequerenteDAO {
	
	Connection con;
	PreparedStatement pstm;
	ResultSet rs;
	
	public void cadastrarRequerente(RequerenteDTO requerenteDTO) {
		String sql = "insert into requerente(nome, cpfCnpj, senha, email, telefone, dataCriacao) values(?, ?, ?, ?, ?, sysdate())";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, requerenteDTO.getNome());			
			pstm.setString(2, requerenteDTO.getCpfCnpj());
			pstm.setString(3, requerenteDTO.getSenha());
			pstm.setString(4, requerenteDTO.getEmail());
			pstm.setString(5, requerenteDTO.getTelefone());
			
			pstm.execute();
			pstm.close();
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
	
	}
	
	public RequerenteDTO loginRequerente(String cpfCnpj, String senha) {
		
		RequerenteDTO requerenteDTO = new RequerenteDTO();
		
		String sql = "select codigo, nome, cpfCnpj from requerente where cpfCnpj = " + cpfCnpj + " and senha = " + senha;
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);			
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				requerenteDTO.setCodigo(rs.getInt("codigo"));
				requerenteDTO.setNome(rs.getString("nome"));
				requerenteDTO.setCpfCnpj(rs.getNString("cpfCnpj"));			
			}
			
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return requerenteDTO;
	}
	
	public int buscaCodigoRequerente(String cpfCnpj) {
		
		int codigo = 0;
		String sql = "select codigo from requerente where cpfCnpj =" + cpfCnpj;
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);			
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				codigo = rs.getInt("codigo");
			}
			
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return codigo;
	}
}