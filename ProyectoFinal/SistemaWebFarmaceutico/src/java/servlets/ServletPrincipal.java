
package servlets;

import Models.ViewModelClientes;
import Models.ViewModelCompras;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Models.ViewModelEmpleados;
import Models.ViewModelFacturas;
import Models.ViewModelMedicamentos;
import Models.ViewModelProveedores;
import Models.ViewModelUsuarios;
import Models.ViewModelVentas;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ServletPrincipal extends HttpServlet {
    private final String usuario = "sa";
    private final String contrasenia = "root";
    private final String servidor = "localhost:1433";
    private final String bd ="Farmacia";
    
    String url ="jdbc:sqlserver://"
            + servidor
            +";databaseName=" + bd
            +";user=" + usuario
            +";password=" + contrasenia
            +";encrypt=false;trustServerCertificate=false;";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");            
            out.println("</head>");
            out.println("<body>");
            
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
// USUARIOS************************************************************************************
    public void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaUsuarios";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelUsuarios> listaUsuarios = new ArrayList<>();
                while (rs.next()) {
                    ViewModelUsuarios usuario = new ViewModelUsuarios();
                    usuario.setID_Usuario(rs.getInt("ID_Usuario"));
                    usuario.setID_Empleado(rs.getInt("ID_Empleado"));
                    usuario.setEmpleado(rs.getString("empleado"));
                    usuario.setID_Rol(rs.getInt("ID_Rol"));
                    usuario.setNombreRol(rs.getString("nombreRol"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setClave(rs.getString("clave"));
                    
                    listaUsuarios.add(usuario);
                }               
                request.setAttribute("listaUsuarios", listaUsuarios);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //pte
    public void agregarUsuario(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String ID_Empleado = request.getParameter("ID_Empleado");
        String ID_Rol = request.getParameter("ID_Rol");
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
       

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Usuarios values (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, ID_Empleado);
                pstmt.setString(2, ID_Rol);
                pstmt.setString(3, usuario);
                pstmt.setString(4, clave);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //pte
    public void modificarUsuario(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Usuario = request.getParameter("ID_Usuario");
        String ID_Empleado = request.getParameter("ID_Empleado");
        String ID_Rol = request.getParameter("ID_Rol");
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                
                String sql = "update Usuarios set "
                 + "ID_Empleado='"+ID_Empleado+"', "
                 + "ID_Rol='"+ID_Rol+"', "
                 + "Usuario='"+usuario+"', " 
                 + "Clave='"+clave+"' " 
                 + "where ID_Usuario='"+ID_Usuario+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //pte
    public void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) {
        String ID_Usuario = request.getParameter("ID_Usuario");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Usuarios where ID_Usuario='" + ID_Usuario + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    } 
    

// FACTURAS************************************************************************************
    public void mostrarFacturas(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaFactura";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelFacturas> listaFacturas = new ArrayList<>();
                while (rs.next()) {
                    ViewModelFacturas factura = new ViewModelFacturas();
                    factura.setID_Factura(rs.getInt("ID_Factura"));
                    factura.setNumFact(rs.getString("numFact"));
                    factura.setCreditoFiscal(rs.getString("creditoFiscal"));
                    factura.setiVA(rs.getString("iVA"));
                    factura.setMontoTotal(rs.getDouble("montoTotal"));
                    factura.setID_Venta(rs.getInt("ID_Venta"));
                    factura.setFechaVenta(rs.getDate("fechaVenta"));
                    factura.setCliente(rs.getString("cliente"));
                    factura.setEmpleado(rs.getString("empleado"));
                    factura.setNombreMedicamento(rs.getString("nombreMedicamento"));
                    factura.setCantidadProdVenta(rs.getInt("cantidadProdVenta"));
                    factura.setPrecioUnitario(rs.getDouble("precioUnitario"));
                    
                    listaFacturas.add(factura);
                }               
                request.setAttribute("listaFacturas", listaFacturas);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //pte
    public void agregarFactura(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String nombreProveedor = request.getParameter("nombreProveedor");
        String telefonoProveedor = request.getParameter("telefonoProveedor");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");
       

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Proveedores values (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombreProveedor);
                pstmt.setString(2, telefonoProveedor);
                pstmt.setString(3, email);
                pstmt.setString(4, ID_Direccion);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //pte
    public void modificarFactura(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Proveedor = request.getParameter("ID_Proveedor");
        String nombreProveedor = request.getParameter("nombreProveedor");
        String telefonoProveedor = request.getParameter("telefonoProveedor");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");
        

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                
                String sql = "update Proveedores set "
                 + "NombreProveedor='"+nombreProveedor+"', "
                 + "TelefonoProveedor='"+telefonoProveedor+"', "
                 + "Email='"+email+"', " 
                 + "ID_Direccion='"+ID_Direccion+"' " 
                 + "where ID_Proveedor='"+ID_Proveedor+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //pte
    public void eliminarFactura(HttpServletRequest request, HttpServletResponse response) {
        String ID_Proveedor = request.getParameter("ID_Proveedor");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Proveedores where ID_Proveedor='" + ID_Proveedor + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    } 
    
    
// VENTAS************************************************************************************
    public void mostrarVentas(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaVentas";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelVentas> listaVentas = new ArrayList<>();
                while (rs.next()) {
                    ViewModelVentas venta = new ViewModelVentas();
                    venta.setID_Venta(rs.getInt("ID_Venta"));
                    venta.setFechaVenta(rs.getDate("fechaVenta"));
                    venta.setMontoVenta(rs.getDouble("montoVenta"));
                    venta.setID_Cliente(rs.getInt("ID_Cliente"));
                    venta.setCliente(rs.getString("cliente"));
                    venta.setID_Empleado(rs.getInt("ID_Empleado"));
                    venta.setEmpleado(rs.getString("empleado"));
                    venta.setID_Medicamento(rs.getInt("ID_Medicamento"));
                    venta.setNombreMedicamento(rs.getString("nombreMedicamento"));
                    venta.setCantidadProdVenta(rs.getInt("cantidadProdVenta"));
                    venta.setPrecioUnitario(rs.getDouble("precioUnitario"));
                    listaVentas.add(venta);
                }               
                request.setAttribute("listaVentas", listaVentas);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //pte
    public void agregarVenta(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String nombreProveedor = request.getParameter("nombreProveedor");
        String telefonoProveedor = request.getParameter("telefonoProveedor");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");
       

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Proveedores values (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombreProveedor);
                pstmt.setString(2, telefonoProveedor);
                pstmt.setString(3, email);
                pstmt.setString(4, ID_Direccion);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //pte
    public void modificarVenta(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Proveedor = request.getParameter("ID_Proveedor");
        String nombreProveedor = request.getParameter("nombreProveedor");
        String telefonoProveedor = request.getParameter("telefonoProveedor");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");
        

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                
                String sql = "update Proveedores set "
                 + "NombreProveedor='"+nombreProveedor+"', "
                 + "TelefonoProveedor='"+telefonoProveedor+"', "
                 + "Email='"+email+"', " 
                 + "ID_Direccion='"+ID_Direccion+"' " 
                 + "where ID_Proveedor='"+ID_Proveedor+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //pte
    public void eliminarVenta(HttpServletRequest request, HttpServletResponse response) {
        String ID_Proveedor = request.getParameter("ID_Proveedor");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Proveedores where ID_Proveedor='" + ID_Proveedor + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    } 
    
    
// COMPRAS************************************************************************************
    public void mostrarCompras(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaCompras";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelCompras> listaCompras = new ArrayList<>();
                while (rs.next()) {
                    ViewModelCompras compra = new ViewModelCompras();
                    compra.setID_Compra(rs.getInt("ID_Compra"));
                    compra.setFechaCompra(rs.getDate("fechaCompra"));
                    compra.setMontoCompra(rs.getDouble("montoCompra"));
                    compra.setID_Proveedor(rs.getInt("ID_Proveedor"));
                    compra.setNombreProveedor(rs.getString("nombreProveedor"));
                    compra.setCantidadProdCompra(rs.getInt("cantidadProdCompra"));
                    compra.setID_Medicamento(rs.getInt("ID_Medicamento"));
                    compra.setNombreMedicamento(rs.getString("nombreMedicamento"));
                    listaCompras.add(compra);
                }               
                request.setAttribute("listaCompras", listaCompras);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //pte
   /* public void agregarCompra(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String fechaCompra = request.getParameter("fechaCompra");//compras
        String montoCompra = request.getParameter("montoCompra");//compras
        String ID_Proveedor = request.getParameter("ID_Proveedor");//compras
        String cantidadProdCompra = request.getParameter("cantidadProdCompra");//detallecompras
        String ID_Medicamento = request.getParameter("ID_Medicamento");//detallecompras
        
        // se usara una transaccion para asegurar la insercion en ambas tabla
        Connection conn = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url);
            request.setAttribute("mensaje_conexion", "Ok!");
            conn.setAutoCommit(false);  // Inicia la transacción

            String sqlCompras = "insert into Compras values (?, ?, ?)";
            try(PreparedStatement pstmtCompras = conn.prepareStatement(sqlCompras)){   
                pstmtCompras.setString(1, fechaCompra);
                pstmtCompras.setString(2, montoCompra);
                pstmtCompras.setString(3, ID_Proveedor);
                
                ResultSet resultSet =pstmtCompras.executeQuery();
                
                if(resultSet.next()){
                    int idCompraGenerado = resultSet.getInt(1);
                    
                    // Insertar en la tabla Detalle_Compras utilizando el ID generado
                    String sqlDetalleCompras = "insert into Detalle_Compras values (?, ?, ?)";
                    try (PreparedStatement pstmtDet = conn.prepareStatement(sqlDetalleCompras)) {
                        pstmtDet.setInt(1, idCompraGenerado);
                        pstmtDet.setString(2, cantidadProdCompra);
                        pstmtDet.setString(3, ID_Medicamento);

                        pstmtDet.executeUpdate();
                    }
                }else{
                    // Manejar el caso en el que no se generó un ID
                throw new SQLException("No se generó un ID para Compras.");
                }
            }
            conn.commit();
            request.getSession().setAttribute("exito", true);

        }catch (SQLException | ClassNotFoundException ex) {
            // En caso de error, revierte la transacción
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }

            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        } finally {
            // Asegúrate de cerrar la conexión
            try {
                if (conn != null) {
                    conn.setAutoCommit(true);  // Restaura el modo de autocommit por si acaso
                    conn.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
        
    }
    //pte
    public void modificarCompra(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Compra = request.getParameter("ID_Compra");//compras
        String fechaCompra = request.getParameter("fechaCompra");//compras
        String montoCompra = request.getParameter("montoCompra");//compras
        String ID_Proveedor = request.getParameter("ID_Proveedor");//compras
        String cantidadProdCompra = request.getParameter("cantidadProdCompra");//detallecompras
        String ID_Medicamento = request.getParameter("ID_Medicamento");//detallecompras
        
        Connection conn= null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url);
            request.setAttribute("mensaje_conexion", "Ok!");
            conn.setAutoCommit(false);
                
            String sqlCompras = "update Compras set "
                 + "FechaCompra=?, "
                 + "MontoCompra=?, "
                 + "ID_Proveedor=? "
                 + "where ID_Compra=?";
            
            try (PreparedStatement pstmtCompras = conn.prepareStatement(sqlCompras)) {
            pstmtCompras.setString(1, fechaCompra);
            pstmtCompras.setString(2, montoCompra);
            pstmtCompras.setString(3, ID_Proveedor);
            pstmtCompras.setString(4, ID_Compra);

            int registrosCompras = pstmtCompras.executeUpdate();

            // Modificar en la tabla Detalle_Compras
            String sqlDetalleCompras = "update Detalle_Compras set "
                + "Cantidad=?, "
                + "ID_Medicamento=? "
                + "where ID_Compra=?";
            
            try (PreparedStatement pstmtDetalleCompras = conn.prepareStatement(sqlDetalleCompras)) {
                pstmtDetalleCompras.setString(1, cantidadProdCompra);
                pstmtDetalleCompras.setString(2, ID_Medicamento);
                pstmtDetalleCompras.setString(3, ID_Compra);

                int registrosDetalleCompras = pstmtDetalleCompras.executeUpdate();

                // Si llegas hasta aquí sin excepciones, confirma la transacción
                conn.commit();

                // Setear el atributo exito en la sesión
                request.getSession().setAttribute("exito", true);
            }
        }
                
                
            
        } catch (SQLException | ClassNotFoundException ex) {
            // En caso de error, revierte la transacción
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }

            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        } finally {
            // Asegúrate de cerrar la conexión
            try {
                if (conn != null) {
                    conn.setAutoCommit(true);  // Restaura el modo de autocommit por si acaso
                    conn.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }
    //pte
    public void eliminarCompra(HttpServletRequest request, HttpServletResponse response) {
        String ID_Compra = request.getParameter("ID_Compra");
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url);
            conn.setAutoCommit(false);  // Inicia la transacción

            // Eliminar de la tabla Detalle_Compras
            String sqlDetalleCompras = "delete from Detalle_Compras where ID_Compra=?";
            try (PreparedStatement pstmtDetalleCompras = conn.prepareStatement(sqlDetalleCompras)) {
                pstmtDetalleCompras.setString(1, ID_Compra);

                int registrosDetalleCompras = pstmtDetalleCompras.executeUpdate();

                // Eliminar de la tabla Compras
                String sqlCompras = "delete from Compras where ID_Compra=?";
                try (PreparedStatement pstmtCompras = conn.prepareStatement(sqlCompras)) {
                    pstmtCompras.setString(1, ID_Compra);

                    int registrosCompras = pstmtCompras.executeUpdate();


                    // Si llegas hasta aquí sin excepciones, confirma la transacción
                    conn.commit();

                    // Setear el atributo exito en la sesión
                    request.getSession().setAttribute("exito", true);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            // En caso de error, revierte la transacción
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }

            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        } finally {
            // Asegúrate de cerrar la conexión
            try {
                if (conn != null) {
                    conn.setAutoCommit(true);  // Restaura el modo de autocommit por si acaso
                    conn.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    } */
    

// PROVEEDORES************************************************************************************
    public void mostrarProveedores(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaProveedores";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelProveedores> listaProveedores = new ArrayList<>();
                while (rs.next()) {
                    ViewModelProveedores proveedor = new ViewModelProveedores();
                    proveedor.setID_Proveedor(rs.getInt("ID_Proveedor"));
                    proveedor.setNombreProveedor(rs.getString("nombreProveedor"));
                    proveedor.setTelefonoProveedor(rs.getString("telefonoProveedor"));
                    proveedor.setEmail(rs.getString("email"));
                    proveedor.setID_Direccion(rs.getInt("ID_Direccion"));
                    proveedor.setDireccionCompleta(rs.getString("direccionCompleta"));
                    listaProveedores.add(proveedor);
                }               
                request.setAttribute("listaProveedores", listaProveedores);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public void agregarProveedor(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String nombreProveedor = request.getParameter("nombreProveedor");
        String telefonoProveedor = request.getParameter("telefonoProveedor");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");
       

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Proveedores values (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombreProveedor);
                pstmt.setString(2, telefonoProveedor);
                pstmt.setString(3, email);
                pstmt.setString(4, ID_Direccion);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    public void modificarProveedor(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Proveedor = request.getParameter("ID_Proveedor");
        String nombreProveedor = request.getParameter("nombreProveedor");
        String telefonoProveedor = request.getParameter("telefonoProveedor");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");
        

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                
                String sql = "update Proveedores set "
                 + "NombreProveedor='"+nombreProveedor+"', "
                 + "TelefonoProveedor='"+telefonoProveedor+"', "
                 + "Email='"+email+"', " 
                 + "ID_Direccion='"+ID_Direccion+"' " 
                 + "where ID_Proveedor='"+ID_Proveedor+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    public void eliminarProveedor(HttpServletRequest request, HttpServletResponse response) {
        String ID_Proveedor = request.getParameter("ID_Proveedor");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Proveedores where ID_Proveedor='" + ID_Proveedor + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    } 
    
// CLIENTES************************************************************************************
    public void mostrarClientes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaClientes";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelClientes> listaClientes = new ArrayList<>();
                while (rs.next()) {
                    ViewModelClientes cliente = new ViewModelClientes();
                    cliente.setID_Cliente(rs.getInt("ID_Cliente"));
                    cliente.setNombresCliente(rs.getString("nombresCliente"));
                    cliente.setApellidosCliente(rs.getString("apellidosCliente"));
                    cliente.setdUI(rs.getString("dUI"));
                    cliente.setTelefonoCliente(rs.getString("telefonoCliente"));
                    cliente.setEmail(rs.getString("email"));
                    cliente.setID_Direccion(rs.getInt("ID_Direccion"));
                    cliente.setDireccionCompleta(rs.getString("direccionCompleta"));
                    listaClientes.add(cliente);
                }               
                request.setAttribute("listaClientes", listaClientes);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public void agregarCliente(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String nombresCliente = request.getParameter("nombresCliente");
        String apellidosCliente = request.getParameter("apellidosCliente");
        String dUI = request.getParameter("dUI");
        String telefonoCliente = request.getParameter("telefonoCliente");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");

       

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Clientes values (?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresCliente);
                pstmt.setString(2, apellidosCliente);
                pstmt.setString(3, dUI);
                pstmt.setString(4, telefonoCliente);
                pstmt.setString(5, email);
                pstmt.setString(6, ID_Direccion);
                
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    public void modificarCliente(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Cliente = request.getParameter("ID_Cliente");
        String nombresCliente = request.getParameter("nombresCliente");
        String apellidosCliente = request.getParameter("apellidosCliente");
        String dUI = request.getParameter("dUI");
        String telefonoCliente = request.getParameter("telefonoCliente");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");
        

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                
                String sql = "update Clientes set "
                 + "NombresCliente='"+nombresCliente+"', "
                 + "ApellidosCliente='"+apellidosCliente+"', "
                 + "DUI='"+dUI+"', "
                 + "TelefonoCliente='"+telefonoCliente+"', "
                 + "Email='"+email+"', " 
                 + "ID_Direccion='"+ID_Direccion+"' " 
                 + "where ID_Cliente='"+ID_Cliente+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    public void eliminarCliente(HttpServletRequest request, HttpServletResponse response) {
        String ID_Cliente = request.getParameter("ID_Cliente");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Clientes where ID_Cliente='" + ID_Cliente + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    } 
    
// MEDICAMENTO************************************************************************************
    public void mostrarMedicamentos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Medicamentos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelMedicamentos> listaMedicamentos = new ArrayList<>();
                while (rs.next()) {
                    ViewModelMedicamentos medicamento = new ViewModelMedicamentos();
                    medicamento.setID_Medicamento(rs.getInt("ID_Medicamento"));
                    medicamento.setNombreMedicamento(rs.getString("nombreMedicamento"));
                    medicamento.setDescripcionMedicamento(rs.getString("descripcionMedicamento"));
                    medicamento.setPrecioUnitario(rs.getDouble("precioUnitario"));
                    medicamento.setExistencia(rs.getInt("existencia"));
                    medicamento.setFechaVencimiento(rs.getDate("fechaVencimiento"));
                    
                    listaMedicamentos.add(medicamento);
                }               
                request.setAttribute("listaMedicamentos", listaMedicamentos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public void agregarMedicamento(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String nombreMedicamento = request.getParameter("nombreMedicamento");
        String descripcionMedicamento = request.getParameter("descripcionMedicamento");
        String precioUnitario = request.getParameter("precioUnitario");
        String existencia = request.getParameter("existencia");
        String fechaVencimiento = request.getParameter("fechaVencimiento");
        
       

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Medicamentos values (?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombreMedicamento);
                pstmt.setString(2, descripcionMedicamento);
                pstmt.setString(3, precioUnitario);
                pstmt.setString(4, existencia);
                pstmt.setString(5, fechaVencimiento );
                
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    public void modificarMedicamento(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Medicamento = request.getParameter("ID_Medicamento");
        String nombreMedicamento = request.getParameter("nombreMedicamento");
        String descripcionMedicamento = request.getParameter("descripcionMedicamento");
        String precioUnitario = request.getParameter("precioUnitario");
        String existencia = request.getParameter("existencia");
        String fechaVencimiento = request.getParameter("fechaVencimiento");
        
        

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                
                String sql = "update Medicamentos set "
                 + "NombreMedicamento='"+nombreMedicamento+"', "
                 + "DescripcionMedicamento='"+descripcionMedicamento+"', "
                 + "PrecioUnitario='"+precioUnitario+"', "
                 + "Existencia='"+existencia+"', "
                 + "FechaVencimiento='"+fechaVencimiento+"' "
                 + "where ID_Medicamento='"+ID_Medicamento+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    public void eliminarMedicamento(HttpServletRequest request, HttpServletResponse response) {
        String ID_Medicamento = request.getParameter("ID_Empleado");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Medicamentos where ID_Medicamento='" + ID_Medicamento + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    } 
    
// EMPLEADO***************************************************************************************
    
    public void mostrarEmpleados(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaEmpleados";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelEmpleados> listaEmpleados = new ArrayList<>();
                while (rs.next()) {
                    ViewModelEmpleados empleado = new ViewModelEmpleados();
                    empleado.setID_Empleado(rs.getInt("ID_Empleado"));
                    empleado.setNombresEmpleado(rs.getString("nombresEmpleado"));
                    empleado.setApellidosEmpleado(rs.getString("apellidosEmpleado"));
                    empleado.setDUI_Empleado(rs.getString("DUI_Empleado"));
                    empleado.setISSS_Empleado(rs.getString("ISSS_Empleado"));
                    empleado.setFechaNacEmpleado(rs.getDate("fechaNacEmpleado"));
                    empleado.setTelefonoEmpleado(rs.getString("telefonoEmpleado"));
                    empleado.setEmail(rs.getString("email"));
                    empleado.setID_Cargo(rs.getInt("ID_Cargo"));
                    empleado.setCargo(rs.getString("cargo"));
                    empleado.setID_Direccion(rs.getInt("ID_Direccion"));
                    empleado.setDireccionCompleta(rs.getString("direccionCompleta"));
                    listaEmpleados.add(empleado);
                }               
                request.setAttribute("listaEmpleados", listaEmpleados);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefonoEmpleado");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");
        String ID_Cargo = request.getParameter("ID_Cargo");
       

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Empleados values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresEmpleado);
                pstmt.setString(2, apellidosEmpleado);
                pstmt.setString(3, DUI_Empleado);
                pstmt.setString(4, ISSS_Empleado);
                pstmt.setString(5, fechaNacEmpleado);
                pstmt.setString(6, telefonoEmpleado);
                pstmt.setString(7, email);
                pstmt.setString(8, ID_Direccion);
                pstmt.setString(9, ID_Cargo);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    public void modificarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Empleado = request.getParameter("ID_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefonoEmpleado");
        String email = request.getParameter("email");
        String ID_Direccion = request.getParameter("ID_Direccion");
        String ID_Cargo = request.getParameter("ID_Cargo");
        

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                
                String sql = "update Empleados set "
                 + "NombresEmpleado='"+nombresEmpleado+"', "
                 + "ApellidosEmpleado='"+apellidosEmpleado+"', "
                 + "DUI_Empleado='"+DUI_Empleado+"', "
                 + "ISSS_Empleado='"+ISSS_Empleado+"', "
                 + "FechaNacEmpleado='"+fechaNacEmpleado+"', "
                 + "TelefonoEmpleado='"+telefonoEmpleado+"', "
                 + "Email='"+email+"', " 
                 + "ID_Direccion='"+ID_Direccion+"', " 
                 + "ID_Cargo='"+ID_Cargo+"' "
                 + "where ID_Empleado='"+ID_Empleado+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    public void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        String ID_Empleado = request.getParameter("ID_Empleado");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Empleados where ID_Empleado='" + ID_Empleado + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    } 
     
   
// GET Y POST********************************************************************************
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if(accion == null){
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
            
        } else if(accion.equals("Login")){
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
            
        } else if(accion.equals("GestionarEmpleados")){
            mostrarEmpleados(request,response);
            request.getRequestDispatcher("Empleados/GestionarEmpleados.jsp").forward(request,response); 
            
        } else if(accion.equals("GestionarMedicamentos")){
            mostrarMedicamentos(request,response);
            request.getRequestDispatcher("Medicamentos/GestionarMedicamentos.jsp").forward(request,response);
            
        } else if(accion.equals("GestionarClientes")){
            mostrarClientes(request,response);
            request.getRequestDispatcher("Clientes/GestionarClientes.jsp").forward(request,response);
            
        } else if(accion.equals("GestionarProveedores")){
            mostrarProveedores(request,response);
            request.getRequestDispatcher("Proveedores/GestionarProveedores.jsp").forward(request,response);
        
        }else if(accion.equals("GestionarCompras")){
            mostrarCompras(request,response);
            request.getRequestDispatcher("Compras/GestionarCompras.jsp").forward(request,response);
        
        }else if(accion.equals("GestionarVentas")){
            mostrarVentas(request,response);
            request.getRequestDispatcher("Ventas/GestionarVentas.jsp").forward(request,response);
        
        }else if(accion.equals("GestionarFacturas")){
            mostrarFacturas(request,response);
            request.getRequestDispatcher("Facturas/GestionarFacturas.jsp").forward(request,response);
            
        }else if(accion.equals("GestionarUsuarios")){
            mostrarUsuarios(request,response);
            request.getRequestDispatcher("Usuarios/GestionarUsuarios.jsp").forward(request,response);
        
        //REDIRECCION PARA JSP DE AGREGAR
        } else if (accion.equals("AgregarEmpleado")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("Empleados/AgregarEmpleado.jsp").forward(request, response);
            
        } else if (accion.equals("AgregarMedicamento")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("Medicamentos/AgregarMedicamento.jsp").forward(request, response);
            
        } else if (accion.equals("AgregarCliente")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("Clientes/AgregarCliente.jsp").forward(request, response);
        
        }else if (accion.equals("AgregarProveedor")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("Proveedores/AgregarProveedor.jsp").forward(request, response);
        
        }else if (accion.equals("AgregarCompra")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("Compras/AgregarCompra.jsp").forward(request, response);
        
        }else if (accion.equals("AgregarUsuario")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("Usuarios/AgregarUsuario.jsp").forward(request, response);
        }
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        

        if(accion.equals("Login")){
            String usuario = request.getParameter("tfUsuario");
            String contrasenia = request.getParameter("tfContrasenia");
            
            try(PrintWriter print = response.getWriter()){
                if(usuario.equals("admin") && contrasenia.equals("root")){
                    request.getRequestDispatcher("Paneles/PanelAdministrador.jsp").forward(request, response);
                    
                }else{
                    print.println("<!DOCTYPE html>");
                    print.println("<html>");
                    print.println("<head>");
                    print.println("<title>Servlet ServletPrincipal</title>");            
                    print.println("</head>");
                    print.println("<body>");
                    print.println("<h1>ERROR: El usuario o la contraseña son erroneos.</h1>");
                    print.println("</body>");
                    print.println("</html>");
                }
            }
        }
         //CAPTURA DE DATOS ENVIADOS POR POST
        if (accion.equals("AgregarEmpleado")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarEmpleado(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarEmpleado");
        } else if (accion.equals("ModificarEmpleado")) {
            modificarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        } else if (accion.equals("EliminarEmpleado")) {
            eliminarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        }
        
        else if (accion.equals("AgregarMedicamento")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarMedicamento(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR Medicamento
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarMedicamento");
        }else if (accion.equals("ModificarMedicamento")) {
            modificarMedicamento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarMedicamentos");
        } else if (accion.equals("EliminarMedicamento")) {
            eliminarMedicamento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarMedicamentos");
            
            
        }else if (accion.equals("AgregarCliente")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarCliente(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR Cliente
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCliente"); 
        }else if (accion.equals("ModificarCliente")) {
            modificarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarClientes");
        } else if (accion.equals("EliminarCliente")) {
            eliminarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarClientes");
            
            
        }else if (accion.equals("AgregarProveedor")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarProveedor(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarProveedor");
        }else if (accion.equals("ModificarProveedor")) {
            modificarProveedor(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarProveedores");
        } else if (accion.equals("EliminarProveedor")) {
            eliminarProveedor(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarProveedores");
        
            
        /*}else if (accion.equals("AgregarCompra")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarCompra(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCompra");
        }else if (accion.equals("ModificarCompra")) {
            modificarCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCompras");
        } else if (accion.equals("EliminarCompra")) {
            eliminarCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCompras");
        */
            
        }else if (accion.equals("AgregarUsuario")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarUsuario(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarUsuario");
        }else if (accion.equals("ModificarUsuario")) {
            modificarUsuario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarUsuarios");
        } else if (accion.equals("EliminarUsuario")) {
            eliminarUsuario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarUsuarios");
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
