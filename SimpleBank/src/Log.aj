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
		// Inserte aqu� c�digo para escribir en el file una transacci�n de tipo dep�sito
		// o (realizar transacci�n)
		String fecha = cal.getTime().toString();
		System.out.println("****Transacci�n realizada*****");
		System.out.println("Tipo de transaccion: " + "Transacci�n" + " Hora: " + getTime());
	}

	pointcut retiro(): call(* moneyWithdraw*(..));

	after(): retiro(){
		// Inserte aqu� c�digo para escribir en el file una transacci�n de tipo retiro o
		// (realizar retiro)
		String fecha = cal.getTime().toString();
		System.out.println("****Transacci�n realizada*****");
		System.out.println("Tipo de transaccion: " + "Dep�sito" + " Hora: " + getTime());
	}

	public String getTime() {
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		String formattedDate = dateFormat.format(date);
		return formattedDate;
	}

	// aqu� se cerrar�a el file
}