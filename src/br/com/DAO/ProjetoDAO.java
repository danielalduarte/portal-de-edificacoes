package br.com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.DTO.ProjetoDTO;

public class ProjetoDAO {
	Connection con;
	PreparedStatement pstm;
	ResultSet rs;
	ArrayList<ProjetoDTO> listaProjetos = new ArrayList<>();
	
	
	public void cadastrarProjeto(String nomeProjeto, String cpfCnpjResponsavel, String cpfCnpjRequerente) {
		
		String requerimento = geraRequerimento();
		
		String sql = "insert into projeto(nome, responsavelTecnico, requerente, status, dataCriacao, dataAtualizacao, requerimento) values(?, (select codigo from responsaveltecnico where cpfCnpj = ?), (select codigo from requerente where cpfCnpj = ?), 1, sysdate(), sysdate(), ?)";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, nomeProjeto);			
			pstm.setString(2, cpfCnpjResponsavel);
			pstm.setString(3, cpfCnpjRequerente);
			pstm.setString(4, requerimento);
			
			pstm.execute();
			pstm.close();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	
	}
	
	public ArrayList<ProjetoDTO> listarProjetos(String nome, String protocolo, String processo, String inscricaoIptu, String alvara, String dataInicioObra, String status, String requerimento, String responsavelTecnico, String requerente, String cpfCnpjResponsavel, String cpfCnpjRequerente) {
		
		String sql = "select p.codigo, p.nome, p.requerimento, s.descricao, concat(cast(datediff(sysdate(), p.dataAtualizacao) as char(10)), ' dia(s) atrás') as dataAtualizacao\r\n" + 
				"from projeto p\r\n" + 
				"	left join responsaveltecnico rt on rt.codigo = p.responsavelTecnico\r\n" + 
				"    left join requerente r on r.codigo = p.requerente\r\n" + 
				"    left join status s on s.codigo = p.status\r\n" + 
				"where (p.nome like concat('%', '" + nome + "','%') or '" + nome + "' = '') \r\n" + 
				"	and (p.protocolo like concat('%', '" + protocolo + "','%') or '" + protocolo + "' = '')\r\n" + 
				"	and (p.processo  like concat('%', '" + processo + "','%') or '" + processo + "' = '')\r\n" + 
				"	and (p.inscricaoIptu like concat('%','" + inscricaoIptu + "','%') or '" + inscricaoIptu + "' = '')\r\n" + 
				"	and (p.alvara like concat('%','" + alvara + "','%') or '" + alvara + "' = '')\r\n" + 
				"	and (p.inicioObra like concat('%', '" + dataInicioObra + "','%') or '" + dataInicioObra + "' = '')\r\n" + 
				"	and (s.descricao like concat('%','" + status + "','%') or '" + status + "' = '')\r\n" + 
				"	and (p.requerimento like concat('%','" + requerimento + "','%') or '" + requerimento + "' = '')\r\n" + 
				"	and (rt.nome like concat('%','" + responsavelTecnico + "','%') or '" + responsavelTecnico + "' = '')\r\n" + 
				"	and (r.nome like concat('%','" + requerente + "','%') or '" + requerente + "' = '')\r\n" + 
				"	and (rt.cpfCnpj like concat('%','" + cpfCnpjResponsavel + "','%') or '" + cpfCnpjResponsavel + "' = '')\r\n" + 
				"	and (r.cpfCnpj like concat('%','" + cpfCnpjRequerente + "','%') or '" + responsavelTecnico + "' = '')\r\n" +
				"order by p.codigo desc";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			
			System.out.println(sql);
			
			pstm = con.prepareStatement(sql);
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				ProjetoDTO projetoDTO = new ProjetoDTO();
				projetoDTO.setCodigo(rs.getInt("codigo"));
				projetoDTO.setNome(rs.getString("nome"));
				projetoDTO.setRequerimento(rs.getString("requerimento"));
				projetoDTO.setSubtipoStatus(rs.getString("descricao"));
				projetoDTO.setDataAtualizacao(rs.getString("dataAtualizacao"));

				listaProjetos.add(projetoDTO);
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return listaProjetos;
	}
	
	public ArrayList<ProjetoDTO> listaProjetosPorCpfCnpj(String cpfCnpj) {
		
		String sql = "select p.codigo, p.nome, p.requerimento, s.descricao from projeto p left join responsaveltecnico rt on rt.codigo = p.responsavelTecnico left join requerente r on r.codigo = p.requerente left join status s on s.codigo = p.status where rt.cpfCnpj = '" + cpfCnpj + "' or r.cpfCnpj = '" + cpfCnpj + "' order by p.codigo desc";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			
			pstm = con.prepareStatement(sql);
			
			System.out.println(sql);
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				ProjetoDTO projetoDTO = new ProjetoDTO();
				projetoDTO.setCodigo(rs.getInt("codigo"));
				projetoDTO.setNome(rs.getString("nome"));
				projetoDTO.setRequerimento(rs.getString("requerimento"));
				projetoDTO.setSubtipoStatus(rs.getString("descricao"));

				listaProjetos.add(projetoDTO);
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return listaProjetos;
	}
	
	public ProjetoDTO buscaProjetoPorCodigo(int codigo) {
		
		ProjetoDTO projetoDTO = new ProjetoDTO();
		
		String sql = "select p.codigo, upper(p.nome) as nome, case when p.requerimento is null then '' else p.requerimento end as requerimento, upper(s.descricao) as descricao, cast(p.dataAtualizacao as char(20)) as dataAtualizacao, case when p.alvara is null then '' else p.alvara end as alvara, case when p.processo is null then '' else p.processo end as processo from projeto p left join status s on s.codigo = p.status where p.codigo =" + codigo;
		con = new ConexaoDAO().conexaoBD();
		
		try {
			
			System.out.println(sql);
			
			pstm = con.prepareStatement(sql);
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				
				projetoDTO.setCodigo(rs.getInt("codigo"));
				projetoDTO.setNome(rs.getString("nome"));
				projetoDTO.setRequerimento(rs.getString("requerimento"));
				projetoDTO.setSubtipoStatus(rs.getString("descricao"));
				projetoDTO.setDataAtualizacao(rs.getString("dataAtualizacao"));
				projetoDTO.setAlvara(rs.getString("alvara"));
				projetoDTO.setProcesso(rs.getString("processo"));
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return projetoDTO;
	}	
	
	public String geraRequerimento() {
		
		String requerimento = "";
		String sql = "select concat('REQ', date_format(sysdate(), '%Y'), lpad(cast(max(codigo) + 1 as char(10)), 6, '0')) as requerimento from projeto";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			pstm = con.prepareStatement(sql);			
			
			rs = pstm.executeQuery(sql);
			
			while (rs.next()) {
				requerimento = rs.getString("requerimento");
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println("requerimento: " + requerimento);
		
		return requerimento;
	}
	
}
