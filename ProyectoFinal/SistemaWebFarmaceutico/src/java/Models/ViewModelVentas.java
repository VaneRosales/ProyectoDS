
package Models;

import java.util.Date;

public class ViewModelVentas {

    //atributos
    private int ID_Venta;
    private Date fechaVenta;
    private Double montoVenta;
    private int ID_Cliente;
    private String cliente;
    private int ID_Empleado;
    private String empleado;
    private int ID_Medicamento;
    private String nombreMedicamento;
    private int cantidadProdVenta;
    private Double precioUnitario;
    
    public int getID_Venta() {
        return ID_Venta;
    }

    public void setID_Venta(int ID_Venta) {
        this.ID_Venta = ID_Venta;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public Double getMontoVenta() {
        return montoVenta;
    }

    public void setMontoVenta(Double montoVenta) {
        this.montoVenta = montoVenta;
    }

    public int getID_Cliente() {
        return ID_Cliente;
    }

    public void setID_Cliente(int ID_Cliente) {
        this.ID_Cliente = ID_Cliente;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public int getID_Empleado() {
        return ID_Empleado;
    }

    public void setID_Empleado(int ID_Empleado) {
        this.ID_Empleado = ID_Empleado;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public int getID_Medicamento() {
        return ID_Medicamento;
    }

    public void setID_Medicamento(int ID_Medicamento) {
        this.ID_Medicamento = ID_Medicamento;
    }

    public String getNombreMedicamento() {
        return nombreMedicamento;
    }

    public void setNombreMedicamento(String nombreMedicamento) {
        this.nombreMedicamento = nombreMedicamento;
    }

    public int getCantidadProdVenta() {
        return cantidadProdVenta;
    }

    public void setCantidadProdVenta(int cantidadProdVenta) {
        this.cantidadProdVenta = cantidadProdVenta;
    }

    public Double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(Double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }
    
}
