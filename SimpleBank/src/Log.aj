import java.io.File;
import java.util.Calendar;

public aspect Log {

	//por editar
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(*create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    pointcut transaction(): call(* generateTra*(..));
    after(): transaction(){
    	
    	System.out.println("****Transacción realizada*****");
    }
}