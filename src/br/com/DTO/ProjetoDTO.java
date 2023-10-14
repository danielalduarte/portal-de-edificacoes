package br.com.DTO;

public class ProjetoDTO {
	
	private int codigo;
	private String nome;
	private String protocolo;
	private String processo;
	private String incricaoIptu;
	private String alvara;
	private String inicioObra;
	private int responsavelTecnico;
	private int requerente;
	private int status;
	private String subtipoStatus;

	private String requerimento;
	private String dataCriacao;
	private String dataAtualizacao;
	
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
	public String getProtocolo() {
		return protocolo;
	}
	public void setProtocolo(String protocolo) {
		this.protocolo = protocolo;
	}
	public String getProcesso() {
		return processo;
	}
	public void setProcesso(String processo) {
		this.processo = processo;
	}
	public String getIncricaoIptu() {
		return incricaoIptu;
	}
	public void setIncricaoIptu(String incricaoIptu) {
		this.incricaoIptu = incricaoIptu;
	}
	public String getAlvara() {
		return alvara;
	}
	public void setAlvara(String alvara) {
		this.alvara = alvara;
	}
	public String getInicioObra() {
		return inicioObra;
	}
	public void setInicioObra(String inicioObra) {
		this.inicioObra = inicioObra;
	}
	public int getResponsavelTecnico() {
		return responsavelTecnico;
	}
	public void setResponsavelTecnico(int responsavelTecnico) {
		this.responsavelTecnico = responsavelTecnico;
	}
	public int getRequerente() {
		return requerente;
	}
	public void setRequerente(int requerente) {
		this.requerente = requerente;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRequerimento() {
		return requerimento;
	}
	public void setRequerimento(String requerimento) {
		this.requerimento = requerimento;
	}
	public String getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(String dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	public String getDataAtualizacao() {
		return dataAtualizacao;
	}
	public void setDataAtualizacao(String dataAtualizacao) {
		this.dataAtualizacao = dataAtualizacao;
	}
	public String getSubtipoStatus() {
		return subtipoStatus;
	}
	public void setSubtipoStatus(String subtipoStatus) {
		this.subtipoStatus = subtipoStatus;
	}
	
}
