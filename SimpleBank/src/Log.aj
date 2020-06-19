import java.io.File;
import java.util.Calendar;

public aspect Log {
    
	
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.    
    pointcut transaction(): call(* moneyMake*(..));
    after(): transaction(){
    	//Inserte aquí código para escribir en el file una transacción de tipo depósito o (realizar transacción)
    	System.out.println("****Transacción realizada*****");
    }
    
    pointcut retiro(): call(* moneyWithdraw*(..));
    after(): retiro(){
    	//Inserte aquí código para escribir en el file una transacción de tipo retiro o (realizar retiro)
    	System.out.println("****Transacción realizada*****");
    }
    
    //aquí se cerraría el file
}