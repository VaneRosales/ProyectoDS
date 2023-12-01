
package Models;

import java.util.Date;

public class ViewModelClientes {

    //ATRIBUTOS
    private int ID_Cliente;
    private String nombresCliente;
    private String apellidosCliente;
    private String dUI;
    private String telefonoCliente;
    private String email;
    private int ID_Direccion;
    private String direccionCompleta;
    
     public int getID_Cliente() {
        return ID_Cliente;
    }

    public void setID_Cliente(int ID_Cliente) {
        this.ID_Cliente = ID_Cliente;
    }

    public String getNombresCliente() {
        return nombresCliente;
    }

    public void setNombresCliente(String nombresCliente) {
        this.nombresCliente = nombresCliente;
    }

    public String getApellidosCliente() {
        return apellidosCliente;
    }

    public void setApellidosCliente(String apellidosCliente) {
        this.apellidosCliente = apellidosCliente;
    }

    public String getdUI() {
        return dUI;
    }

    public void setdUI(String dUI) {
        this.dUI = dUI;
    }

    public String getTelefonoCliente() {
        return telefonoCliente;
    }

    public void setTelefonoCliente(String telefonoCliente) {
        this.telefonoCliente = telefonoCliente;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getID_Direccion() {
        return ID_Direccion;
    }

    public void setID_Direccion(int ID_Direccion) {
        this.ID_Direccion = ID_Direccion;
    }

    public String getDireccionCompleta() {
        return direccionCompleta;
    }

    public void setDireccionCompleta(String direccionCompleta) {
        this.direccionCompleta = direccionCompleta;
    }
}
