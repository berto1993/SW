package clases;

import java.util.LinkedList;

public class produccion implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3368270324492027289L;
	private int id_pro;
	private String titulo;
	private String sinopsis;
	private String trailer;
	private String fecha;
	private String tipo;
	private String genero;
	private String director;
	private LinkedList<fotograma> listaFotos=new LinkedList<fotograma>();
	private LinkedList<actor> listaActores=new LinkedList<actor>();
	
	public produccion(){}
		
	public String getTitulo() {
		return this.titulo;
	}
	public void setTitulo(String tit) {
		this.titulo=tit;
	}
	public int getIdPro() {
		return id_pro;
	}
	public void setIdPro(int idp) {
		id_pro=idp;
	}
	public String getSinopsis() {
		return this.sinopsis;
	}
	public void setSinopsis(String sin) {
		sinopsis=sin;
	}
	public String getTrailer() {
		return this.trailer;
	}
	public void setTrailer(String tra) {
		trailer=tra;
	}
	public String getFecha() {
		return this.fecha;
	}
	public void setFecha(String fe) {
		fecha=fe;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public LinkedList<fotograma> getListaFotos() {
		return listaFotos;
	}

	public void setListaFotos(LinkedList<fotograma> listaFotos) {
		this.listaFotos = listaFotos;
	}

	public LinkedList<actor> getListaActores() {
		return listaActores;
	}

	public void setListaActores(LinkedList<actor> listaActores) {
		this.listaActores = listaActores;
	}
	
}