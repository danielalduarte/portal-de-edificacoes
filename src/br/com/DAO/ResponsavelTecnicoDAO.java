package br.com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.DTO.ResponsavelTecnicoDTO;


public class ResponsavelTecnicoDAO {
	
	Connection con;
	PreparedStatement pstm;
	ResultSet rs;
	
	public void cadastrarResponsavelTecnico(ResponsavelTecnicoDTO responsavelTecnicoDTO) {
		String sql = "insert into responsaveltecnico(nome, cpfCnpj, senha, email, telefone, crea, profissao, dataCriacao) values(?, ?, ?, ?, ?, ?, ?, sysdate())";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, responsavelTecnicoDTO.getNome());			
			pstm.setString(2, responsavelTecnicoDTO.getCpfCnpj());
			pstm.setString(3, responsavelTecnicoDTO.getSenha());
			pstm.setString(4, responsavelTecnicoDTO.getEmail());
			pstm.setString(5, responsavelTecnicoDTO.getTelefone());
			pstm.setString(6, responsavelTecnicoDTO.getCrea());
			pstm.setInt(7, responsavelTecnicoDTO.getProfissao());
			
			pstm.execute();
			pstm.close();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	
	}
	
	public ResponsavelTecnicoDTO loginResponsavelTecnico(String cpfCnpj, String senha) {
		
		ResponsavelTecnicoDTO responsavelTecnicoDTO = new ResponsavelTecnicoDTO();
		
		String sql = "select codigo, nome, cpfCnpj from responsaveltecnico where cpfCnpj = " + cpfCnpj + " and senha = " + senha;
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);			
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				
				responsavelTecnicoDTO.setCodigo(rs.getInt("codigo"));
				responsavelTecnicoDTO.setNome(rs.getString("nome"));
				responsavelTecnicoDTO.setCpfCnpj(rs.getString("cpfCnpj"));
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " " + responsavelTecnicoDTO.toString());
		}
		
		return responsavelTecnicoDTO;
	}
	
	public int buscaCodigoResponsavelTecnico(String cpfCnpj) {
		
		int codigo = 0;
		String sql = "select codigo from responsaveltecnico where cpfCnpj =" + cpfCnpj;
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);			
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				codigo = rs.getInt("codigo");
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return codigo;
	}
	
	public ResponsavelTecnicoDTO buscaResponsavelTecnicoPorCpfCnpf(String cpfCnpj) {
		
		ResponsavelTecnicoDTO responsavelTecnicoDTO = new ResponsavelTecnicoDTO();
		
		String sql = "select rt.codigo, rt.nome, rt.cpfCnpj, rt.email, rt.telefone, rt.crea, p.descricao from responsaveltecnico rt join profissao p on p.codigo = rt.profissao where cpfCnpj =" + cpfCnpj;
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);			
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				responsavelTecnicoDTO.setCodigo(rs.getInt("codigo"));
				responsavelTecnicoDTO.setNome(rs.getString("nome"));
				responsavelTecnicoDTO.setCpfCnpj(rs.getString("cpfCnpj"));
				responsavelTecnicoDTO.setEmail(rs.getString("email"));
				responsavelTecnicoDTO.setTelefone(rs.getString("telefone"));
				responsavelTecnicoDTO.setCrea(rs.getString("crea"));
				responsavelTecnicoDTO.setSubtipoProfissao(rs.getString("descricao"));
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return responsavelTecnicoDTO;
	}
	
}
