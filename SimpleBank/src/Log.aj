import java.io.File;
import java.util.Calendar;

public aspect Log {
    
	
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.    
    pointcut transaction(): call(* moneyMake*(..));
    after(): transaction(){
    	//Inserte aqu� c�digo para escribir en el file una transacci�n de tipo dep�sito o (realizar transacci�n)
    	System.out.println("****Transacci�n realizada*****");
    }
    
    pointcut retiro(): call(* moneyWithdraw*(..));
    after(): retiro(){
    	//Inserte aqu� c�digo para escribir en el file una transacci�n de tipo retiro o (realizar retiro)
    	System.out.println("****Transacci�n realizada*****");
    }
    
    //aqu� se cerrar�a el file
}