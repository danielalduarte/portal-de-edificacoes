package br.com.DTO;

public class HistoricoDTO {
	private int codigo;
	private String descricao;
	private String dataCriacao;
	private int projeto;
	private String subtipoProjetoNome;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(String dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	public int getProjeto() {
		return projeto;
	}
	public void setProjeto(int projeto) {
		this.projeto = projeto;
	}
	public String getSubtipoProjetoNome() {
		return subtipoProjetoNome;
	}
	public void setSubtipoProjetoNome(String subtipoProjetoNome) {
		this.subtipoProjetoNome = subtipoProjetoNome;
	}
	
}
