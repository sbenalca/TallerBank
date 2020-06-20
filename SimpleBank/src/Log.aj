import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
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
		String hora_actual = getTime();

		writeFile("Deposito", hora_actual);
	}

	pointcut retiro(): call(* moneyWithdraw*(..));

	after(): retiro(){
		// Inserte aquí código para escribir en el file una transacción de tipo retiro o
		// (realizar retiro)
		String hora_actual = getTime();

		writeFile("Retiro", hora_actual);
	}

	public String getTime() {
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		String formattedDate = dateFormat.format(date);
		return formattedDate;
	}

	public void writeFile(String t, String h) {
		try {
			System.out.println("****Transacción realizada*****");
			System.out.println("Tipo de transaccion: " + t + ", Hora: " + h);
			FileWriter archivo;
			File objFile = new File("Log.txt");
			if (objFile.createNewFile()) {
				// System.out.println("File created: " + objFile.getName());
				archivo = new FileWriter(objFile, true);
				archivo.write("===================== REGISTRO DE TRANSACCIONES =====================" + "\r\n");

			} else {
				archivo = new FileWriter(objFile, true);
				archivo.write("Tipo de transaccion: " + t + " , Hora: " + h + ";" + "\r\n");

			}

			archivo.close();

		} catch (IOException e) {
			System.out.println("An error occurred.");
			e.printStackTrace();
		}
	}

	// aquí se cerraría el file
}