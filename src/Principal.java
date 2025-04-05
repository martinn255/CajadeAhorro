//import java.time.LocalDate;
import java.util.Scanner;

public class Principal {
    public static void main(String[] args){
        CajaAhorro n = new CajaAhorro();
        CajaAhorro n2 = new CajaAhorro();
        CajaAhorro n3 = new CajaAhorro();
        double val,val2,val3,nuevo;
        Scanner teclado = new Scanner(System.in);
        int opc;
        
        n.setSaldo(50);
        n2.setSaldo(-70);
        
        val = n.getSaldoActual();//saldo correcto
        val2 = n2.getSaldoActual();//saldo incorrecto
        val3 = n3.getSaldoActual();//saldo default

        System.out.println(val);
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
                nuevo = teclado.nextDouble();
                n.Deposito(nuevo);
                break;
                /*case 2:
                break;*/
                case 3:
                System.out.println("-----------------------------------");
                val = n.getSaldoActual();
                System.out.println(val);
                break;
            }
            
        } while(opc!=0);
    }
}
