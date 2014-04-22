package clases;

public class tipo implements java.io.Serializable
{
	private static final long serialVersionUID = -1538616967730468913L;
	private int idTipo;
	private String nombre;
	
	public tipo(){}

	public int getIdTipo()
	{
		return idTipo;
	}

	public void setIdTipo(int id_tipo)
	{
		this.idTipo = id_tipo;
	}

	public String getNombre()
	{
		return nombre;
	}

	public void setNombre(String nombreTipo)
	{
		this.nombre = nombreTipo;
	}
}