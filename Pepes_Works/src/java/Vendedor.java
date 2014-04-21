
public class Vendedor extends Usuario{
    private String tipo;
    private int comision;
    
    public Vendedor(String rut, String contrasenna, String nombre){
          super(rut,contrasenna,nombre);
          this.tipo="vendedor";
          this.comision=0;
   
    }
    public int ObtenerComision(){
        return this.comision;        
    }
    
    public void editarComision(int comision){
        this.comision=comision;        
    }
}
