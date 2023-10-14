package br.com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.DTO.StatusDTO;

public class StatusDAO {

	Connection con;
	PreparedStatement pstm;
	ResultSet rs;
	ArrayList<StatusDTO> listaStatus = new ArrayList<>();
	
	public void cadastrarStatus(StatusDTO statusDTO) {
		String sql = "insert into status(descricao) values(" + statusDTO.getDescricao() + ")";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.execute();
			pstm.close();
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
	
	}
	
	public ArrayList<StatusDTO> listarStatus() {
		
		String sql = "select codigo, descricao from status";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);			
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				StatusDTO statusDTO = new StatusDTO();
				statusDTO.setCodigo(rs.getInt("codigo"));
				statusDTO.setDescricao(rs.getString("descricao"));

				listaStatus.add(statusDTO);
			}
			
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return listaStatus;
	}
	
	public String buscaStatusDescricao(int codigo) {
		
		String descricao = "";
		String sql = "select descricao from status where codigo =" + codigo;
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);			
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				descricao = rs.getString("descricao");
			}
			
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return descricao;
	}
	
	public int buscaCodigoStatus(String descricao) {
		
		int codigo = 0;
		String sql = "select codigo from status where descricao =" + descricao;
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
