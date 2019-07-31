package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

    private Connection connection = null;
    
    // Mysql
    //private final String driverName = "com.mysql.jdbc.Driver";
    //private final String username = "root";
    //private final String password = "admin";        
    //private final String url = "jdbc:mysql://localhost/treinamento";
    
    
    
    // Postgres
    private final String driverName = "org.postgresql.Driver";
    private final String username =  "postgres";
    private final String password =  "postgres";              
    private final String url = "jdbc:postgresql://localhost:5433/postgres";      
    
    public Conexao() throws Exception {
		try {
		    Class.forName(driverName).newInstance();
	
		    connection = DriverManager.getConnection(url, username, password);
	
		    connection.setAutoCommit(false);
		} 
		catch (final Exception e) {
		    e.printStackTrace();
		    throw e;
		}
    }

    public Conexao(final Connection connection) {
    	this.connection = connection;
    }

    public void closeConnection() {
		try {
		    connection.close();
		    System.out.println("Fechou uma conexão.");
		} 
		catch (final Exception e) {
		    e.printStackTrace();
		}
    }

    public void commit() {
		try {
		    if (!connection.isClosed()) {
		    	connection.commit();
		    	connection.close();
		    }
		} 
		catch (final Exception e) {
		    e.printStackTrace();
		}
    }

    public Connection getConnection() {
    	System.out.println("Abriu uma conexão.");
    	return connection;
    }

    public void rollback() {
		try {
		    if (!connection.isClosed()) {
			connection.rollback();
			connection.close();
		    }
		} catch (final Exception e) {
		    e.printStackTrace();
		}
    }
    
    public static void main(String args[]) {
    	try {
    		Conexao conexao = new Conexao();
    		conexao.getConnection();
    		conexao.closeConnection();
    	}
    	catch(Exception e) {
    		
    	}
    }

}
