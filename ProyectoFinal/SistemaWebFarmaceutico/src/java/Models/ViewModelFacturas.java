
package Models;

import java.util.Date;


public class ViewModelFacturas {

    //Atributos
    private int ID_Factura;
    private String numFact;
    private String creditoFiscal;
    private String iVA;
    private Double montoTotal;
    private int ID_Venta;
    private Date fechaVenta;
    private String cliente;
    private String empleado;
    private String nombreMedicamento;
    private int cantidadProdVenta;
    private Double precioUnitario;
    
    public int getID_Factura() {
        return ID_Factura;
    }

    public void setID_Factura(int ID_Factura) {
        this.ID_Factura = ID_Factura;
    }

    public String getNumFact() {
        return numFact;
    }

    public void setNumFact(String numFact) {
        this.numFact = numFact;
    }

    public String getCreditoFiscal() {
        return creditoFiscal;
    }

    public void setCreditoFiscal(String creditoFiscal) {
        this.creditoFiscal = creditoFiscal;
    }

    public String getiVA() {
        return iVA;
    }

    public void setiVA(String iVA) {
        this.iVA = iVA;
    }

    public Double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(Double montoTotal) {
        this.montoTotal = montoTotal;
    }

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

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
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
