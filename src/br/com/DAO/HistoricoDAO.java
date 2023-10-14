package br.com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.DTO.HistoricoDTO;

public class HistoricoDAO {
	
	Connection con;
	PreparedStatement pstm;
	ResultSet rs;
	ArrayList<HistoricoDTO> listaHistorico = new ArrayList<>();
	
	public void cadastrarHistorico(String descricao, String projeto) {
		
		String sql = "insert into historico(descricao, dataCriacao, projeto) values('" + descricao + "', sysdate(), (select codigo from projeto where nome = '" + projeto + "' order by codigo desc limit 1))";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);			
			pstm.execute();
			pstm.close();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	
	}
	
	public ArrayList<HistoricoDTO> listaHistoricoPorCpfCnpj(String cpfCnpj) {
		
		String sql = "select h.codigo, h.descricao, concat(cast(datediff(sysdate(), p.dataAtualizacao) as char(10)), ' dia(s) atrás') as dataAtualizacao, p.nome from historico h join projeto p on p.codigo = h.projeto left join responsaveltecnico rt on rt.codigo = p.responsavelTecnico left join requerente r on r.codigo = p.requerente where rt.cpfCnpj = '" + cpfCnpj + "' or r.cpfCnpj = '" + cpfCnpj + "' order by p.codigo desc";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			
			pstm = con.prepareStatement(sql);
			
			System.out.println(sql);
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				HistoricoDTO historicoDTO = new HistoricoDTO();
				historicoDTO.setCodigo(rs.getInt("codigo"));
				historicoDTO.setDescricao(rs.getString("descricao"));
				historicoDTO.setDataCriacao(rs.getString("dataAtualizacao"));
				historicoDTO.setSubtipoProjetoNome(rs.getString("nome"));

				listaHistorico.add(historicoDTO);
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return listaHistorico;
	}

}
