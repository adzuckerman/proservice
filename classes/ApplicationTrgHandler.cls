/*
Created by: MB(GTR) - 26-Mar-2018
Summary: Application Trg handler class-Used for Opportunity mapping to application object
*/
public class ApplicationTrgHandler extends TriggerHandler 
{ 
    protected override void beforeInsert()
    {
        List<Application__c> applications = (List<Application__c>) trigger.new;
        //Set<string> LegalBusinesses = new Set<string>();
        updateApplicationReferences(applications);        
    }
    protected override void beforeUpdate()
    {
        List<Application__c> applications = (List<Application__c>) trigger.new;
        updateApplicationReferences(applications);
    }
    // Method updates Account, Opportunity, and Primary Contact lookups on Application
    private void updateApplicationReferences(List<Application__c> applications)
    {
        // search for account > replace Legal Name on App with Legal Name (ref_Account_Name__c) lookup (matching account)
        // - get related Opportunity > app.Opportunity_Name__c with matched Opp
        // - get Primary Contact on Opp > get primary contact from Matched Opp and put it on App primary contact (ref_Primary_Contact__c)
        // - change record type from web to Salesforce
        
        String LegalBusinesses;
        String dba;
        Map<string, Account> mapAccLegalName = new Map<string, Account>();
        
        for(Application__c app: applications) 
        {
            if (!String.isBlank(app.Legal_Business_Name__c) ) LegalBusinesses = app.Legal_Business_Name__c;
            if (!String.isBlank(app.DBA__c) ) dba = app.DBA__c;
        }
        if(!String.isBlank(LegalBusinesses) )
        {
            // map of Accounts with Opp
            System.debug('LegalBusinesses:' + LegalBusinesses);
            // build map of Opp with Accounts on the basis of legal business name
            for(Account acc: [SELECT Id, 
                              (SELECT Id, Primary_Contact__c
                               FROM Opportunities 
                               WHERE Stagename NOT IN ('Closed Lost', 'Closed Won', 'Disqualified'))
                              FROM Account 
                              WHERE (Client_Legal_Name__c LIKE:'%' + LegalBusinesses +'%' OR Name LIKE:'%'+LegalBusinesses+'%') ])
            {
                //mapOppLegalName.put(opp.Account.Client_Legal_Name__c, opp);
                mapAccLegalName.put(LegalBusinesses, acc);
            }
            System.debug('mapOppLegalName:' + mapAccLegalName);
        }
        if ( !String.isBlank(dba))
        {
            // build map of Opp with Accounts on the basis of dba
            for(Account acc: [SELECT Id, 
                              (SELECT Id, Primary_Contact__c
                               FROM Opportunities 
                               WHERE Stagename NOT IN ('Closed Lost', 'Closed Won', 'Disqualified'))
                              FROM Account 
                              WHERE (Client_Legal_Name__c LIKE:'%' + dba +'%' OR Name LIKE:'%'+dba+'%') ])
            {
                //mapOppLegalName.put(opp.Account.Client_Legal_Name__c, opp);
                mapAccLegalName.put(dba, acc);
            }
        }
        
        // update application record with opp id
        Account matchedAcc;
        for(Application__c app: applications)
        {
            if(mapAccLegalName.containsKey(app.Legal_Business_Name__c)) 
            {
                matchedAcc = mapAccLegalName.get(app.Legal_Business_Name__c);
            }
            else if(mapAccLegalName.containsKey(app.DBA__c)) 
            {
                matchedAcc = mapAccLegalName.get(app.DBA__c);
            }
            if(matchedAcc <> null)
            {
                app.ref_Account_Name__c = matchedAcc.Id;
                app.Opportunity_Name__c = matchedAcc.Opportunities == null ? null: matchedAcc.Opportunities[0].Id;
                if (matchedAcc.Opportunities <> null) { app.ref_Primary_Contact__c = matchedAcc.Opportunities[0].Primary_Contact__c == null ? null:matchedAcc.Opportunities[0].Primary_Contact__c; }
                app.RecordTypeId = [SELECT Id FROM RecordType WHERE SObjectType = 'Application__c' AND DeveloperName = 'Salesforce'].Id;
            }
        }
        
    }
}