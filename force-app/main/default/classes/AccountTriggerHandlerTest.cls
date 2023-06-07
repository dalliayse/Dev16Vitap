@isTest
public class AccountTriggerHandlerTest {
    @istest
    private static void testUpdateDesc1() {
        //INSERT
        List<account> listAcc = new list<account>{
            new account(name = 'May', phone = '7775556666', Industry = 'Energy'),
            new account(name = 'June', Active__c = 'Yes'),
            new account(name = 'Sunday', Industry = 'Energy', Active__c = 'Yes')
        };
        insert listAcc;

        //so, for two account records we should have description updated
        //assert that description has 'Enjoy'
        List<account> getAccounts = [select id, name, active__c, description from account];
        for (account eachAcc : getAccounts) {
            if (eachAcc.active__c == 'Yes') {
                assert.areEqual('Account is now active. Enjoy Enjoy buddy!', eachAcc.description);
                assert.isTrue(eachAcc.description.contains('Enjoy'));
            } else {
                assert.isNull(eachAcc.description);
            }
        }
    }

    @istest
    private static void testUpdateDesc2() {
        //INSERT with active as No or Null
        List<account> listAcc = new list<account>{
            new account(name = 'May', phone = '7775556666', Industry = 'Energy'),
            new account(name = 'June'),
            new account(name = 'Sunday', Industry = 'Energy', Active__c = 'No')
        };
        insert listAcc;

        //Update, active field to Yes
        for (Account a : listAcc) {
            a.Active__c = 'Yes';
        }
        update listAcc;

        //so, for all account records we should have description updated
        //assert that description has 'Enjoy'
        List<account> getAccounts = [select id, name, active__c, description from account];
        for (account eachAcc : getAccounts) {
            if (eachAcc.active__c == 'Yes') {
                assert.areEqual('Account is now active. Enjoy Enjoy buddy!', eachAcc.description);
                assert.isTrue(eachAcc.description.contains('Enjoy'));
            }
        }
    }
}
