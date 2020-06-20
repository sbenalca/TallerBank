import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public aspect Log {

	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();

	// Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con
	// los tipos de transacciones realizadas.
	pointcut transaction(): call(* moneyMake*(..));

	after(): transaction(){
		// Inserte aquí código para escribir en el file una transacción de tipo depósito
		// o (realizar transacción)
		String fecha = cal.getTime().toString();
		System.out.println("****Transacción realizada*****");
		System.out.println("Tipo de transaccion: " + "Transacción" + " Hora: " + getTime());
	}

	pointcut retiro(): call(* moneyWithdraw*(..));

	after(): retiro(){
		// Inserte aquí código para escribir en el file una transacción de tipo retiro o
		// (realizar retiro)
		String fecha = cal.getTime().toString();
		System.out.println("****Transacción realizada*****");
		System.out.println("Tipo de transaccion: " + "Depósito" + " Hora: " + getTime());
	}

	public String getTime() {
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		String formattedDate = dateFormat.format(date);
		return formattedDate;
	}

	// aquí se cerraría el file
}