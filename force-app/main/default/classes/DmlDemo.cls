public class DmlDemo {
    public static void dmlInsert1(){
        account acc= new account();
        acc.Name='Salesforce';
        
        insert acc;
        System.debug(acc);
    }
}