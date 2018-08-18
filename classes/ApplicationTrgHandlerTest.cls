/*
Created by: MB(GTR) - 26-Mar-2018
Summary: Application Trg handler class-Used for Opportunity mapping to application object
*/
@isTest
public class ApplicationTrgHandlerTest
{
    @isTest
    static void testApplicationBeforeInsert()
    {
        // create account
        Account acc = new Account (Name = 'Test Account', Client_Legal_Name__c = 'Test Legal Account' );
        insert acc;
        // create opportunity
        Opportunity opp = new Opportunity (Name = 'Test Opportunity', AccountId = acc.Id, StageName = '1st Meeting Set', CloseDate = Date.today(), Deal_Size__c='100+' );
        insert opp;
        
        // insert application record
        Application__c app = new Application__c(Legal_Business_Name__c = 'Test Legal');
        insert app;
        
        // fetch whether or not trigger is active
        ApexTrigger appTrg = [Select Id, Status FROM ApexTrigger WHERE name = 'ApplicationTrg'];
        
        if (appTrg.Status == 'Active') {
            // assert if the application's Opp is updated
            app = [SELECT Legal_Business_Name__c, Opportunity_Name__c, RecordType.Name FROM Application__c WHERE Id =: app.Id];
            System.assertEquals(opp.Id, app.Opportunity_Name__c);
            System.assertEquals('Salesforce', app.RecordType.Name);
        }
    }
	@isTest
    static void testApplicationBeforeUpdate()
    {
        // create account
        Account acc = new Account (Name = 'Test Account', Client_Legal_Name__c = 'Test Legal Account' );
        insert acc;
        // create opportunity
        Opportunity opp = new Opportunity (Name = 'Test Opportunity', AccountId = acc.Id, StageName = '1st Meeting Set', CloseDate = Date.today(), Deal_Size__c='100+' );
        insert opp;
        
        // insert application record
        Application__c app = new Application__c(Legal_Business_Name__c = 'Unmatched account');
        insert app;
        
        app.Legal_Business_Name__c = 'Test Legal';
        update app;
        
        // fetch whether or not trigger is active
        ApexTrigger appTrg = [Select Id, Status FROM ApexTrigger WHERE name = 'ApplicationTrg'];
        
        if (appTrg.Status == 'Active') {
            // assert if the application's Opp is updated
            app = [SELECT Legal_Business_Name__c, Opportunity_Name__c, RecordType.Name FROM Application__c WHERE Id =: app.Id];
            System.assertEquals(opp.Id, app.Opportunity_Name__c);
            System.assertEquals('Salesforce', app.RecordType.Name);
        }
    }
    @isTest
    static void testApplicationBeforeInsertDBA()
    {
        // create account
        Account acc = new Account (Name = 'Test Account', Client_Legal_Name__c = 'Test Legal Account' );
        insert acc;
        // create opportunity
        Opportunity opp = new Opportunity (Name = 'Test Opportunity', AccountId = acc.Id, StageName = '1st Meeting Set', CloseDate = Date.today(), Deal_Size__c='100+' );
        insert opp;
        
        // insert application record
        Application__c app = new Application__c(Legal_Business_Name__c = 'Unmatched legal name', DBA__c = 'Legal Account');
        insert app;
        
        // fetch whether or not trigger is active
        ApexTrigger appTrg = [Select Id, Status FROM ApexTrigger WHERE name = 'ApplicationTrg'];
        
        if (appTrg.Status == 'Active') {
            // assert if the application's Opp is updated
            app = [SELECT Legal_Business_Name__c, Opportunity_Name__c, RecordType.Name FROM Application__c WHERE Id =: app.Id];
            System.assertEquals(opp.Id, app.Opportunity_Name__c);
            System.assertEquals('Salesforce', app.RecordType.Name);
        }
    }
}