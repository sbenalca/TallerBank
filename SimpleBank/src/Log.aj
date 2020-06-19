import java.io.File;
import java.util.Calendar;

public aspect Log {

	//por editar
    File file = new File("log");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.    
    pointcut transaction(): call(* money*(..));
    after(): transaction(){
    	
    	System.out.println("****Transacción realizada*****");
    }
}