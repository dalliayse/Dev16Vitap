public  class DummyDataCreation {
    public static void topTenOpp(){
List<Opportunity> opp = [select id,name, amount,description from Opportunity where amount != null order by amount desc limit 10];
for (Opportunity eachOpp : opp){
    eachOpp.description='This is one of the top 10 opportunities.Please work on this properly';
system.debug('Update description + eachOpp');
}
update opp;
    }
//2.soru
public static List<Opportunity> CreateOpp (id accId, integer n){
List<Opportunity> oppList= new List<Opportunity>();
if(n<=0){
    system.debug('Please tell us how many opportunities needs to be create');
}else{
    Account acc =[select id, name, annualRevenue from account where id =: accId ];
    
    for(integer i=1; i<=n; i++){
Opportunity opp= new Opportunity();
opp.CloseDate = Date.today().addYears(3);
opp.StageName = 'Prospecting';
opp.Amount = acc.AnnualRevenue/n;
opp.Name = acc.Name;
opp.AccountId = acc.Id;
oppList.add(opp);
    }
insert oppList; 

}
return oppList;
}
public static void addContact(){
    List<Account> noContact = [select id, name from Account where Id NOT IN (select accountId from Contact)];
    List<Contact> contactUpdate = new List<Contact>();

    for(account acc : noContact){
        Contact c = new Contact();
        c.AccountId = acc.Id;
        c.LastName=acc.Name;
       contactUpdate.add(c);
    }
insert contactUpdate;
}
public static void deleteOpp(){
        List<Opportunity> listOpp = [select id, name, stageName, amount from opportunity where StageName = 'Closed Lost' and amount<20000];
        delete listOpp;
}
}