public class SoqlDemo2 {
    public static void projectSOQL1(){
        list<salesforce_project__c> sp = [select id, name, project_name__c, status__c from salesforce_project__c where Status__c = 'New'];

        for (Salesforce_Project__c eachSP : sp) {
            system.debug('project name is ' + eachSP.Project_Name__c + ', its status is ' + eachSP.Status__c);
        }
    }

    public static void projectSOQL1(string status){
        //[soql ]
        list<salesforce_project__c> sp = [select id, name, project_name__c, status__c from salesforce_project__c where Status__c = :status];//binding data :

        for (Salesforce_Project__c eachSP : sp) {
            system.debug('project name is ' + eachSP.Project_Name__c + ', its status is ' + eachSP.Status__c);
        }
    }
    
}