@isTest
public class testQuoteCloneTrigger{

    static testmethod void test_method1(){
        
        //Create Quote - Associated to Henoheno LLC
        Account a = new Account(Name='Test Account');
        insert a;
        
        //Create Quote - Associated to Henoheno LLC
        Opportunity o = new Opportunity(
            Name='Test Opp',
            StageName='1st Meeting Set',
            CloseDate=Date.newInstance(2018, 12, 31),
            Startup_Company__c='Yes',
            X1st_Meeting_Occurred__c=true);
        insert o;
        
        //Create Quote - Associated to Henoheno LLC
        SBQQ__Quote__c q = new SBQQ__Quote__c(SBQQ__Account__c = a.Id, SBQQ__Opportunity2__c = o.Id);
        insert q;
             
        //Cloning the above Quote Record q
        SBQQ__Quote__c qCloneCopy = q.clone(false, false, false, false);

        
        Test.StartTest();
        insert qCloneCopy;
        Test.StopTest();
        
    }
}