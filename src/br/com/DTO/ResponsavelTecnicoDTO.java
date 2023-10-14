package br.com.DTO;

import java.time.LocalDateTime;

public class ResponsavelTecnicoDTO {
	
	private int codigo;
	private String nome;
	private String cpfCnpj;
	private String senha;
	private String email;
	private String telefone;
	private String crea;
	private LocalDateTime dataCriacao;
	private int profissao;
	private String subtipoProfissao;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpfCnpj() {
		return cpfCnpj;
	}
	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getCrea() {
		return crea;
	}
	public void setCrea(String crea) {
		this.crea = crea;
	}
	public LocalDateTime getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(LocalDateTime dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	public int getProfissao() {
		return profissao;
	}
	public void setProfissao(int profissao) {
		this.profissao = profissao;
	}
	public String getSubtipoProfissao() {
		return subtipoProfissao;
	}
	public void setSubtipoProfissao(String subtipoProfissao) {
		this.subtipoProfissao = subtipoProfissao;
	}
	

}
