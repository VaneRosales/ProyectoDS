
package Models;

import java.util.Date;

public class ViewModelEmpleados {
    
        //ATRIBUTOS
    private int ID_Empleado;
    private String nombresEmpleado;
    private String apellidosEmpleado;
    private String DUI_Empleado;
    private String ISSS_Empleado;
    private Date fechaNacEmpleado;
    private String telefonoEmpleado;
    private String email;
    private int ID_Cargo;
    private String cargo;
    private int ID_Direccion;
    private String direccionCompleta;
    
   
    public int getID_Empleado() {
        return ID_Empleado;
    }
    public void setID_Empleado(int ID_Empleado) {
        this.ID_Empleado = ID_Empleado;
    }

   
    public String getNombresEmpleado() {
        return nombresEmpleado;
    }
    public void setNombresEmpleado(String nombresEmpleado) {
        this.nombresEmpleado = nombresEmpleado;
    }


    public String getApellidosEmpleado() {
        return apellidosEmpleado;
    }
    public void setApellidosEmpleado(String apellidosEmpleado) {
        this.apellidosEmpleado = apellidosEmpleado;
    }

    public String getDUI_Empleado() {
        return DUI_Empleado;
    }
    public void setDUI_Empleado(String DUI_Empleado) {
        this.DUI_Empleado = DUI_Empleado;
    }


    public String getISSS_Empleado() {
        return ISSS_Empleado;
    }
    public void setISSS_Empleado(String ISSS_Empleado) {
        this.ISSS_Empleado = ISSS_Empleado;
    }


    public Date getFechaNacEmpleado() {
        return fechaNacEmpleado;
    }
    public void setFechaNacEmpleado(Date fechaNacEmpleado) {
        this.fechaNacEmpleado = fechaNacEmpleado;
    }


    public String getTelefonoEmpleado() {
        return telefonoEmpleado;
    }
    public void setTelefonoEmpleado(String telefonoEmpleado) {
        this.telefonoEmpleado = telefonoEmpleado;
    }


    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }


    public int getID_Cargo() {
        return ID_Cargo;
    }
    public void setID_Cargo(int ID_Cargo) {
        this.ID_Cargo = ID_Cargo;
    }
    
    public String getCargo() {
        return cargo;
    }
    public void setCargo(String cargo) {
        this.cargo = cargo;
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
   
   