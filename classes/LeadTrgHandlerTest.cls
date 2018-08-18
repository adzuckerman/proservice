/*
Created by: MB(GTR) - 26-Mar-2018
Summary: Application Trg handler class-Used for Opportunity mapping to application object
*/
@isTest
public class LeadTrgHandlerTest
{
    static string leadAssignmentStatus;
	// test setup data
	@testSetup
    static void setupData()
    {
        leadAssignmentStatus = 'Get Lead Assignment';
        user tUser = [SELECT id, Alias FROM User WHERE Profile.Name = 'System Administrator' AND isActive = true LIMIT 1];
        // create custom setting - leadSettings
        insert new Lead_Assignment_Ids__c(
            Island_BDM_Hawaii__c = tUser.Alias,
            Island_BDM_Kauai__c = tUser.Alias,
            Island_BDM_Lanai__c = tUser.Alias,
            Island_BDM_Maui__c = tUser.Alias,
            Island_BDM_Molokai__c = tUser.Alias,
            Major_Account_BDM__c = tUser.Alias,
            Major_Account_WSE_Count__c = 100,
            Lead_Assignment_Status__c = 'Get Lead Assignment'
        );
        
        // create recordtype map
        Map<string, RecordType> mAccRecTypes = new Map<string, RecordType>(); 
        for(RecordType rt : [SELECT id, Developername, Name FROM RecordType WHERE SObjectType = 'Account' AND DeveloperName in ('Account_Clients', 'Account_Prospects')])
            mAccRecTypes.put(rt.DeveloperName, rt);
        
        // insert 'Account (Clients)' type account
        Account clientAcc = new Account(RecordTypeId=mAccRecTypes.get('Account_Clients').id, Name='test company client partner', Sales_BDM__c=tUser.Id);
        insert clientAcc;
        // create related opportunity
        Opportunity clientOpp = new Opportunity(Accountid=clientAcc.id, Name = 'Test Opp Client', OwnerId = tUser.Id, StageName='1st Meeting Set', CloseDate = Date.today(), X1st_Meeting_Occurred__c = true);
        insert clientOpp;
        // insert 'Account (Prospect)' type account
        Account prospectAcc = new Account(RecordTypeId=mAccRecTypes.get('Account_Prospects').id, Name='test company prospect', Sales_BDM__c=tUser.Id);
        insert prospectAcc;
        // create related opportunity
        Opportunity propspectOpp = new Opportunity(Accountid=prospectAcc.id, Name = 'Test Opp Prospect', OwnerId = tUser.Id, StageName='1st Meeting Set', CloseDate = Date.today(), X1st_Meeting_Occurred__c = true);
        insert propspectOpp;
        // insert leads - Blank Island
        insert new Lead(company='test company blank island', Island_s__c = '', Status = 'New', FirstName = 'FirstName1', LastName = 'LastName1');
        // insert leads - Multiple Islands
        insert new Lead(company='test company blank island', Island_s__c = 'Hawaii;Oahu', Status = 'New', FirstName = 'FirstName1', LastName = 'LastName1');
        // insert leads - Hawaii (Big Island)
        insert new Lead(company='test company Hawaii', Island_s__c = 'Hawaii', Status = 'New', FirstName = 'FirstName1', LastName = 'LastName1');
        // insert lead Kauai
        insert new Lead(company='test company Kauai', Island_s__c = 'Kauai', Status = 'New', FirstName = 'FirstName2', LastName = 'LastName2');
        // insert lead Lanai
        insert new Lead(company='test company Lanai', Island_s__c = 'Lanai', Status = 'New', FirstName = 'FirstName2', LastName = 'LastName2');
        // insert lead Maui
        insert new Lead(company='test company Maui', Island_s__c = 'Maui', Status = 'New', FirstName = 'FirstName2', LastName = 'LastName2');
        // insert lead Molokai
        insert new Lead(company='test company Molokai', Island_s__c = 'Molokai', Status = 'New', FirstName = 'FirstName2', LastName = 'LastName2');
        // Oahu leads below
        // insert lead - Expected employees > 100
        insert new Lead(company='test company emp', Island_s__c = 'Oahu', Estimated_Number_of_EEs__c = 101, Status = 'New', FirstName = 'FirstName3', LastName = 'LastName3');
        // insert lead - client partner - queue assignment
        insert new Lead(company='test company client partner', Island_s__c = 'Oahu', Estimated_Number_of_EEs__c = 99, Status = 'New', FirstName = 'FirstName4', LastName = 'LastName4');
        // insert lead - prospect
        insert new Lead(company='test company prospect', Island_s__c = 'Oahu', Estimated_Number_of_EEs__c = 50, Status = 'New', FirstName = 'FirstName4', LastName = 'LastName4');
        // insert lead - client referral
        insert new Lead(company='test company prospect', Island_s__c = 'Oahu', Estimated_Number_of_EEs__c = 50, Status = 'New', FirstName = 'FirstName4', LastName = 'LastName4', Referred_by_Client_Partner__c = clientAcc.Id);
    }
    
    
    @isTest
    static void testBlankIslands()
    {
        Test.startTest();
        Lead l = [SELECT Company, Status, Island_s__c, OwnerId FROM Lead WHERE Island_s__c = '' LIMIT 1];
        l.Status = 'Get Lead Assignment';
        try {
        	update l;
        }
        catch (Exception e) {
            System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }
        Test.stopTest();
    }
    @isTest
    static void testMultipleIslands()
    {
        Test.startTest();
        Lead l = [SELECT Company, Status, Island_s__c, OwnerId FROM Lead WHERE Island_s__c = 'Hawaii;Oahu' LIMIT 1];
        l.Status = 'Get Lead Assignment';
        try {
        	update l;
        }
        catch (Exception e) {
            System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }
        Test.stopTest();
    }
    @isTest
    static void testHawaiiIsland()
    {
        Test.startTest();
        
        Lead l = [SELECT Company, Status, Island_s__c, OwnerId FROM Lead WHERE Island_s__c = 'Hawaii' LIMIT 1];        
        l.Status = 'Get Lead Assignment';
        update l;
        
        Test.stopTest();
    }
    @isTest
    static void testKauaiIsland()
    {
        Test.startTest();
        
        Lead l = [SELECT Company, Status, Island_s__c, OwnerId FROM Lead WHERE Island_s__c = 'Kauai' LIMIT 1];        
        l.Status = 'Get Lead Assignment';
        update l;
        
        Test.stopTest();
    }
    @isTest
    static void testLanaiIsland()
    {
        Test.startTest();
        
        Lead l = [SELECT Company, Status, Island_s__c, OwnerId FROM Lead WHERE Island_s__c = 'Lanai' LIMIT 1];        
        l.Status = 'Get Lead Assignment';
        update l;
        
        Test.stopTest();
    }
    @isTest
    static void testMauiIsland()
    {
        Test.startTest();
        
        Lead l = [SELECT Company, Status, Island_s__c, OwnerId FROM Lead WHERE Island_s__c = 'Maui' LIMIT 1];        
        l.Status = 'Get Lead Assignment';
        update l;
        
        Test.stopTest();
    }
    @isTest
    static void testMolokaiIsland()
    {
        Test.startTest();
        
        Lead l = [SELECT Company, Status, Island_s__c, OwnerId FROM Lead WHERE Island_s__c = 'Molokai' LIMIT 1];        
        l.Status = 'Get Lead Assignment';
        update l;
        
        Test.stopTest();
    }
    @isTest
    static void testMajorAccountAssignment()
    {
        Test.startTest();
        Lead l = [SELECT Company, Status, Island_s__c, OwnerId FROM Lead WHERE Island_s__c = 'Oahu' AND Estimated_Number_of_EEs__c >= 100];
        l.Status = 'Get Lead Assignment';
        update l;
        Test.stopTest();
    }
    @isTest
    static void testUnableToAssign()
    {
        Lead[] leads = new List<Lead>();
        Test.startTest();
        for(Lead l: [SELECT Company, Status, Island_s__c, OwnerId FROM Lead WHERE Island_s__c = 'Oahu' AND Estimated_Number_of_EEs__c < 100]) 
        {
            l.Status = 'Get Lead Assignment';
            leads.add(l);
        }
        try {
        	update leads;
        }
        catch (Exception e) {
            System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }
        
        Test.stopTest();
    }
        
}