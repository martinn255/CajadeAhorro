import java.util.Scanner;

public class CajaAhorro {
    private double saldo;
    Scanner tec = new Scanner(System.in);
    //Constructores 
    public CajaAhorro(double saldo) {   //controlador
        setSaldo(saldo);
    }
    //public CajaAhorro(double saldo) { // Para Trabajar las variables
       // this(saldo);
   // }
    public CajaAhorro(){    //Si no le doy un valor a una variable me da un valor default
        this(1);
    }
    public void Deposito(double depo) {
        
        int b;
        if(depo > 0){
            System.out.println("Desea Depositar el Monto dado: " + depo + "  1)Si 2)No");
            b = tec.nextInt();
            if(b==1){
                this.saldo = this.saldo + depo;
                System.out.println("Se Deposito con exito");
            } else {
                System.out.println("No se Deposito Operacion Cancelada");
            }
        } else{
            System.out.println("Valor Incorrecto");
        }
       
    }
   /*public void Extraccion {

    }*/
    //Getters
    public double getSaldoActual (){
        return this.saldo;
    }
    //Setters
    public void setSaldo(double saldo){
        if(saldo<0){
            this.saldo = 0;
        } else {
            this.saldo = saldo;
        }
    }

}
