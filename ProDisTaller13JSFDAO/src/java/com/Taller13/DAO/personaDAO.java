/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Taller13.DAO;

/**
 *
 * @author Miguel
 */
import com.Taller13.vos.persona;
import java.io.File;
import java.io.FileInputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;



import java.util.logging.Level;
import java.util.logging.Logger;

public class personaDAO {
  // ----------------------------------------------------
  // Constantes
  // ----------------------------------------------------

  // ----------------------------------------------------
  // Consultas
  // ----------------------------------------------------
  // ----------------------------------------------------
  // Atributos
  // ----------------------------------------------------
  /**
   * conexion con la base de datos
   */
  public Connection conexion;
  /**
   * nombre del usuario para conectarse a la base de datos.
   */
  private String usuario;
  /**
   * clave de conexión a la base de datos.
   */
  private String clave;
  /**
   * URL al cual se debe conectar para acceder a la base de datos.
   */
  private String cadenaConexion;

  /**
   * constructor de la clase. No inicializa ningun atributo.
   */
  public personaDAO() {
    inicializar();
  }

  // -------------------------------------------------
  // Métodos
  // -------------------------------------------------
  /**
   * obtiene ls datos necesarios para establecer una conexion Los datos se obtienen a partir de un archivo properties.
   *
   * @param path ruta donde se encuentra el archivo properties.
   */
  public void inicializar() {
    try {
//			File arch = new File(ARCHIVO_CONEXION);
//			Properties prop = new Properties();
//			FileInputStream in = new FileInputStream(arch);
//
//			prop.load(in);
//			in.close();

//			cadenaConexion = prop
//					.getProperty("url"); // El
      // url,
      // el
      // usuario
      // y
      // passwd
      // deben
      // estar
      // en
      // un
      // archivo
      // de
      // propiedades.
      // url: "jdbc:oracle:thin:@chie.uniandes.edu.co:1521:chie10";
      cadenaConexion = "jdbc:mysql://localhost:3306/taller";
//			usuario = prop.getProperty("usuario"); // "s2501aXX";
      usuario = "root"; // "s2501aXX";
//			clave = prop.getProperty("clave"); // "c2501XX";
      clave = "miguelcamargo9"; // "c2501XX";
//			final String driver = prop
//					.getProperty("driver");
      final String driver = "com.mysql.jdbc.Driver";

      Class.forName(driver);

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  /**
   * Método que se encarga de crear la conexión con el Driver Manager a partir de los parametros recibidos.
   *
   * @param url direccion url de la base de datos a la cual se desea conectar
   * @param usuario nombre del usuario que se va a conectar a la base de datos
   * @param clave clave de acceso a la base de datos
   * @throws SQLException si ocurre un error generando la conexión con la base de datos.
   */
  private void establecerConexion(String url, String usuario, String clave)
          throws SQLException {
    try {
      System.out.println("url " + url + " usr " + usuario + " pwd " + clave);
      conexion = DriverManager.getConnection(url, usuario, clave);
    } catch (SQLException exception) {
      throw new SQLException(
              "ERROR: personaDAO obteniendo una conexi—n.");
    }
  }

  /**
   * Cierra la conexión activa a la base de datos. Además, con=null.
   *
   * @param con objeto de conexión a la base de datos
   * @throws SistemaCinesException Si se presentan errores de conexión
   */
  public void closeConnection(Connection connection) throws Exception {
    try {
      connection.close();
      connection = null;
    } catch (SQLException exception) {
      throw new Exception(
              "ERROR: personaDAO: closeConnection() = cerrando una conexión.");
    }
  }

  // ---------------------------------------------------
  // Métodos asociados a los casos de uso: Consulta
  // ---------------------------------------------------
    /*
   * metodo que inserta una serie nueva
   */
  public void insertarPersona(persona miPersona) throws Exception {
    try {
      establecerConexion(cadenaConexion, usuario, clave);
      PreparedStatement insercion = conexion.prepareStatement(
              "insert into persona (nombre,apellido,documento) values(?,?,?)");
      insercion.setString(1, miPersona.getNombre());
      insercion.setString(2, miPersona.getApellido());
      insercion.setInt(3, miPersona.getDocumento());
      insercion.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(personaDAO.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      if (conexion != null) {
        try {
          closeConnection(conexion);
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
    }
  }
  
  
    public void actualizarPersona(persona miPersona) throws Exception {
    try {
      establecerConexion(cadenaConexion, usuario, clave);
      PreparedStatement insercion = conexion.prepareStatement(
              "update persona set nombre = ?, apellido = ?, documento = ? where id = ? ");
      insercion.setString(1, miPersona.getNombre());
      insercion.setString(2, miPersona.getApellido());
      insercion.setInt(3, miPersona.getDocumento());
      insercion.setInt(4, miPersona.getId());
      insercion.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(personaDAO.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      if (conexion != null) {
        try {
          closeConnection(conexion);
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
    }
  }

  /*
   * metodo para eliminar persona
   */
  public void eliminarPersona(String nombre) throws Exception {
    try {
      establecerConexion(cadenaConexion, usuario, clave);
      Statement insercion = conexion.createStatement();
      String sql = "delete from persona where persona.nombre like '%" + nombre + "%'";

      int delete = insercion.executeUpdate(sql);

      if (delete == 1) {
        System.out.println("fila borrada");
      } else {
        System.out.println("fila no borrada");
      }
    } catch (SQLException ex) {
      Logger.getLogger(personaDAO.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      if (conexion != null) {
        try {
          closeConnection(conexion);
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
    }
  }

  /*
   * metodo para traer personas
   */
  public List<persona> traerPersonas() throws Exception {
    List<persona> misPersonas = new ArrayList<persona>();
    try {
      establecerConexion(cadenaConexion, usuario, clave);

      ResultSet resultados = conexion.createStatement().
              executeQuery("select id, nombre, apellido, documento from taller.persona ");

      while (resultados.next()) {
        Integer id = resultados.getInt(1);
        String nombre = resultados.getString(2);
        String apellido = resultados.getString(3);
        Integer documento = resultados.getInt(4);
        persona miPersona = new persona(nombre, apellido, documento);
        miPersona.setId(id);
        misPersonas.add(miPersona);
      }


    } catch (SQLException ex) {
      Logger.getLogger(personaDAO.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      if (conexion != null) {
        try {
          closeConnection(conexion);
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
    }
    return misPersonas;
  }
}
