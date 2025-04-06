//import java.time.LocalDate;
import java.util.Scanner;

public class Principal {
    public static void main(String[] args){
        CajaAhorro n = new CajaAhorro();
        CajaAhorro n2 = new CajaAhorro();
        //CajaAhorro n3 = new CajaAhorro();
        double val,depo,extra;
        //double val2,val3;
        Scanner teclado = new Scanner(System.in);
        int opc,cant;
        
        n.setSaldo(50);
        n2.setSaldo(-70);
        
        val = n.getSaldoActual();//saldo correcto
       // val2 = n2.getSaldoActual();//saldo incorrecto
        //val3 = n3.getSaldoActual();//saldo default

        System.out.println(val);
        System.out.println(n.getCantEx());
        //System.out.println(val2);
        //System.out.println(val3);
        do{
            System.out.println("-----------------------------------");
            System.out.println("----MENU------");
            System.out.println("1)Depositar Saldo");
            System.out.println("2)Extraccion de saldo");
            System.out.println("3)Consultar saldo ");
            System.out.println("0)Salir");
            System.out.println("Ingrese Opcion: ");
            opc = teclado.nextInt();

            switch(opc){
                case 1:
                System.out.println("-----------------------------------");
                System.out.println("Ingrese Valor a Depositar");
                depo = teclado.nextDouble();
                n.Deposito(depo);
                break;
                case 2:
                System.out.println("-----------------------------------");
                System.out.println("Ingrese valor a Extraer");
                extra = teclado.nextDouble();
                n.Extraccion(extra);
                cant = n.getCantMaxEx() - n.getCantEx();
                System.out.println("Cantidad de Extracciones Disponibles: " + cant);
                break;
                case 3:
                System.out.println("-----------------------------------");
                System.out.println("El Saldo Actual es: ");
                val = n.getSaldoActual();
                System.out.println(val);
                break;
            }

        } while(opc!=0);
        teclado.close();
    }
}
