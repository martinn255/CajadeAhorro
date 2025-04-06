import java.util.Scanner;

public class CajaAhorro {
    private double saldo;
    private int cantEx;
    private int cantMaxEx = 3;
    Scanner tec = new Scanner(System.in);

    //Constructores 
    public CajaAhorro(double saldo) {   //controlador
        setSaldo(saldo);
    }
    public CajaAhorro(double saldo,int cantEx) { // Para Trabajar las variables
        this(saldo);
        this.cantEx = cantEx;
    }
    public CajaAhorro(){    //Si no le doy un valor a una variable me da un valor default
        this(1,0);
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
    public void Extraccion(double extra) {
        //System.out.println(cantEx);
        //System.out.println(cantMaxEx);
        int ba;
        if(cantEx < cantMaxEx){
            if(extra > 0 && this.saldo >= extra){
                System.out.println("Desea Retirar el Monto dado: " + extra + "  1)Si 2)No");
                ba = tec.nextInt();
                if(ba==1){
                    this.saldo = this.saldo - extra;
                    cantEx++;
                } else {
                    System.out.println("Operacion Cancelada");
                }
                
            } else {
                System.out.println("Valor a Extraer Incorrecto O Saldo Insuficiente");
            }
        } else {
            System.out.println("Cantidad de Extracciones Maximas de este Mes alcanzadas");
        }
    }
    
    //Getters
    public double getSaldoActual (){
        return this.saldo;
    }
    public int getCantEx(){
        return this.cantEx;
    }
    public int getCantMaxEx(){
        return this.cantMaxEx;
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
