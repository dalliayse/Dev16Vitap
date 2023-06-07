public class DeleteOppBatch implements Database.Batchable<sObject>,Database.Stateful{
    
    public Integer count = 0;
    
        public Database.QueryLocator start(Database.BatchableContext BC) {
            Database.QueryLocator Query = Database.getQueryLocator([select id from Opportunity where StageName = 'Closed Lost']);
            return Query;

            //2.yontem
           // String Query = .select id from Opportunity where StageName =\'closed Lost\'';
           // return Database.getAsyncLocator(Query);
        }
    
        public void execute(Database.BatchableContext BC, List<Opportunity> scope) {
            if(scope != null){
            count += scope.size();
          delete scope;
            }
        }
    
        public void finish(Database.BatchableContext BC) {
            System.debug('Total records deleted' + count);
        }
    
    }
