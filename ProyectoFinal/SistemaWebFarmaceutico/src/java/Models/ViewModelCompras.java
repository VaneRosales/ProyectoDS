
package Models;

import java.util.Date;


public class ViewModelCompras {

    //atributos
    private int ID_Compra;
    private Date fechaCompra;
    private Double montoCompra;
    private int ID_Proveedor;
    private String nombreProveedor;
    private int cantidadProdCompra;
    private int ID_Medicamento;
    private String nombreMedicamento;
    
    public int getID_Compra() {
        return ID_Compra;
    }

    public void setID_Compra(int ID_Compra) {
        this.ID_Compra = ID_Compra;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public Double getMontoCompra() {
        return montoCompra;
    }

    public void setMontoCompra(Double montoCompra) {
        this.montoCompra = montoCompra;
    }

    public int getID_Proveedor() {
        return ID_Proveedor;
    }

    public void setID_Proveedor(int ID_Proveedor) {
        this.ID_Proveedor = ID_Proveedor;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public int getCantidadProdCompra() {
        return cantidadProdCompra;
    }

    public void setCantidadProdCompra(int cantidadProdCompra) {
        this.cantidadProdCompra = cantidadProdCompra;
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
}
