/*
Created by: MB(GTR) - 19-Mar-2018
Summary: Lead Trg handler class-Used for custom Lead assignments
*/

public class LeadTrgHandler extends TriggerHandler
{ 
    public id oppBDM;
    
    protected override void beforeUpdate() 
    {
        // Lead custom settings
        Lead_Assignment_Ids__c leadSettings = Lead_Assignment_Ids__c.getOrgDefaults();
        // Leads being updated
        List<Lead> leads = (List<Lead>) trigger.new;
        // For referral account matching
        Set<id> referralAccountIds = new Set<id>();
        Map<id, Account> mapReferralAccounts;
        // For company account matching
        Set<string> companyAccounts = new Set<string>();
        Map<string, Account> mapClientAccounts;
        Map<string, Account> mapProspectAccounts;
        
        // Put together list of qualified leads to process
        List<Lead> qualifiedLeads = New List<Lead>();
        for(Lead l: leads)
        {
            system.debug('l.status:' + l.status + ' | leadSettings.Lead_Assignment_Status__c : ' + leadSettings.Lead_Assignment_Status__c);
            
            // check if lead status is Lead_Assignment_Status__c and its old status was not Lead_Assignment_Status__c
            if(l.status == leadSettings.Lead_Assignment_Status__c && ((Lead)trigger.oldMap.get(l.Id)).Status <> leadSettings.Lead_Assignment_Status__c) {
                   qualifiedLeads.add(l);
            }
            if(!String.isBlank(l.Referred_by_Client_Partner__c)) {
                referralAccountIds.add(l.Referred_by_Client_Partner__c);
            }
            if(!String.isBlank(l.Company) ) {
                companyAccounts.add(l.company);
            }
        }
        
        // Process the leads qualified leads
        if(qualifiedLeads.size() > 0)
        {
            if(referralAccountIds.size() > 0 ) 
            {
                mapReferralAccounts = new Map<id, Account>([SELECT name, BDM__c, Sales_BDM__c 
                                                            FROM Account WHERE id IN: referralAccountIds AND RecordType.Name = 'Account (Clients)']);
            }
            if(companyAccounts.size() > 0)
            {
                mapClientAccounts = new Map<string, Account>();
                mapProspectAccounts = new Map<string, Account>();
                for(account acc: [SELECT name, BDM__c, Sales_BDM__c, RecordType.Name,
                                  (SELECT StageName, OwnerId, X1st_Meeting_Occurred__c, X1st_Meeting_Date__c FROM Opportunities WHERE StageName = 'Closed Lost' ) 
                                  FROM Account WHERE Name IN: companyAccounts])
                {
                    if(acc.RecordType.Name == 'Account (Clients)') mapClientAccounts.put(acc.Name, acc);
                    else if (acc.RecordType.Name == 'Account (Prospects)') mapProspectAccounts.put(acc.Name, acc);
                }
            }
            for(Lead ql: qualifiedLeads)
            {
                System.debug('mapProspectAccounts: ' + mapProspectAccounts.containsKey(ql.Company) ); 
                // approval will be fired only when the following field is TRUE
                ql.Updated_from_code__c = true;
                
                // Check that at least 1 island has been selected.  If not, return early with an error.
                if (String.isBlank(ql.Island_s__c)) {
                    ql.Island_s__c.addError('Please choose 1 or more to ensure proper geographic assignment');
                    return;
                }
                
                system.debug('islands:' + ql.Island_s__c);
                List<String> islands = ql.Island_s__c.split(';');
                
                // 0. Junk check to make moving conditionals below easier
                if (false) {
                    return;
                }
                // 0.1 If multiple islands are selected defer back to the user to manually assign
                else if (islands.size() > 1) {
                    ql.Island_s__c.addError('Multiple islands are selected, please manually assign this lead based on the rotor distribution rules');
                    return;
                }
                // 1. Island (territory) rules are always processed first
                else if (islands.contains('Hawaii'))
                {
                    // Assign to BDM defined for Hawaii (Big Island)
                    List<User> newOwnerID = [SELECT Id FROM User WHERE Alias = :leadSettings.Island_BDM_Hawaii__c LIMIT 1];
                    
                    // If no BDM is currently assigned to this island in the settings error and return
                    if (newOwnerID.size() == 0) {
                        ql.addError('No BDM assigned to Hawaii (Big Island), please manually assign');
                        return;
                    }
                    
                    ql.OwnerId = newOwnerID[0].Id;
                }
                else if (islands.contains('Kauai'))
                {
                    // Assign to BDM defined for Kauai
                    List<User> newOwnerID = [SELECT Id FROM User WHERE Alias = :leadSettings.Island_BDM_Kauai__c LIMIT 1];
                    
                    // If no BDM is currently assigned to this island in the settings error and return
                    if (newOwnerID.size() == 0) {
                        ql.addError('No BDM assigned to Kauai, please manually assign');
                        return;
                    }
                    
                    ql.OwnerId = newOwnerID[0].Id;
                }
                else if (islands.contains('Lanai'))
                {
                    // Assign to BDM defined for Lanai
                    List<User> newOwnerID = [SELECT Id FROM User WHERE Alias = :leadSettings.Island_BDM_Lanai__c LIMIT 1];
                    
                    // If no BDM is currently assigned to this island in the settings error and return
                    if (newOwnerID.size() == 0) {
                        ql.addError('No BDM assigned to Lanai, please manually assign');
                        return;
                    }
                    
                    ql.OwnerId = newOwnerID[0].Id;
                }
                else if (islands.contains('Maui'))
                {
                    // Assign to BDM defined for Maui
                    List<User> newOwnerID = [SELECT Id FROM User WHERE Alias = :leadSettings.Island_BDM_Maui__c LIMIT 1];
                    
                    // If no BDM is currently assigned to this island in the settings error and return
                    if (newOwnerID.size() == 0) {
                        ql.addError('No BDM assigned to Maui, please manually assign');
                        return;
                    }
                    
                    ql.OwnerId = newOwnerID[0].Id;
                }
                else if (islands.contains('Molokai'))
                {
                    // Assign to BDM defined for Molokai
                    List<User> newOwnerID = [SELECT Id FROM User WHERE Alias = :leadSettings.Island_BDM_Molokai__c LIMIT 1];
                    
                    // If no BDM is currently assigned to this island in the settings error and return
                    if (newOwnerID.size() == 0) {
                        ql.addError('No BDM assigned to Molokai, please manually assign');
                        return;
                    }
                    
                    ql.OwnerId = newOwnerID[0].Id;
                }
                // Should be Oahu leads only beyond this point
                // 2. By estimated worksite employee count - If 100 or more then assign to major account BDM (Major Account Manager)
                else if(ql.Estimated_Number_of_EEs__c >= leadSettings.Major_Account_WSE_Count__c) 
                {
                    List<User> newOwnerID = [SELECT Id FROM User WHERE Alias = :leadSettings.Major_Account_BDM__c LIMIT 1];
                    
                    // If no BDM is currently assigned to large accounts in the settings error and return
                    if (newOwnerID.size() == 0) {
                        ql.addError('No BDM assigned to major accounts, please manually assign');
                        return;
                    }
                    ql.OwnerId = newOwnerID[0].Id;
                }
                //  3. relationship: 
                else if (!String.isBlank(ql.Referred_by_Client_Partner__c) && mapReferralAccounts <> null)
                {
                    System.debug('Inside cond 3a');
                    // 3a. Look at the Referred Account Field on Lead > Look at the BDM associated with the Account - Assign Lead to that BDM 
                    ql.OwnerId = mapReferralAccounts.get(ql.Referred_by_Client_Partner__c).Sales_BDM__c;
                }
                else if (mapClientAccounts <> null && mapClientAccounts.containsKey(ql.Company) && mapClientAccounts.get(ql.Company).Opportunities <> null)
                {
                    System.debug('Inside cond 3b' + JSON.serialize(mapClientAccounts) );
                    // 3b. Will search for existing Account (client) by exact name on Company field on Lead - If found and matches - will look at BDM lookup field on Account  
                    if(String.isBlank(mapClientAccounts.get(ql.Company).Sales_BDM__c)) ql.addError('Lead has a matching account with Opportunity but Opp BDM is not set.');
                    else ql.OwnerId = mapClientAccounts.get(ql.Company).Sales_BDM__c;
                }
                
                // 4.   Step 1: Find a matching Account - Prospect
                else if (mapProspectAccounts.containsKey(ql.Company) && checkAccountsWithOpp90DaysOrLess(mapProspectAccounts, ql.Company))
                {
                    System.debug('Inside cond 4b > ' + oppBDM);
                    ql.OwnerId = oppBDM;
                }
                else
                {
                    System.debug('Unable to get lead assignment');
                    // assign round-robin
                    ql.Updated_from_code__c = false;
                    // assign this lead to an open queue
                    // ql.OwnerId = leadSettings.Open_Queue_ID__c;
                    ql.addError('Unable to get lead assignment, please manually assign this lead based on rotor distribution rules');
                }
                
            }
        }
    }
    
    private boolean checkAccountsWithOpp90DaysOrLess(Map<string, Account> accWithOpps, String leadCompany)
    {
        // 4b.  Step 1: Find a matching Account - Prospect
        //      Step 2: find a Closed Lost Opportunity - If only one, end of story, assign BDM to that lead 
        //      Step 3: If more than one closed lost opportunity, find the 1st meeting date is within 90 days of the lead creation date assign this lead to the BDM of that opportunity/ Most recent date will be selected if two 1st meetings date within 90 days.  
        
        // this method returns true if the 1stMeeting create within 90 days and sets the lead owner to Opp BDM
        boolean condOppWith1stMeeting90Below = false;
        system.debug('4. checkAccountsWithOpp90Below:' + accWithOpps + ' - ' + leadCompany + '-condOppWith1stMeeting90Below:' + condOppWith1stMeeting90Below);
        // this method checks if the lead company exists in 
        if (accWithOpps.containsKey(leadCompany) && accWithOpps.get(leadCompany).Opportunities.size() > 0)
        {
            // check related Opps
            for(Opportunity opp: accWithOpps.get(leadCompany).Opportunities) 
            {
                // assign Lead to the Opp Owner (BDM)
                oppBDM = opp.OwnerId;
                system.debug('opp.X1st_Meeting_Occurred__c' + opp.X1st_Meeting_Occurred__c);
                if(opp.X1st_Meeting_Occurred__c == true && (opp.X1st_Meeting_Date__c.daysBetween(System.today()) <= 90)) 
                {
                    system.debug('X1st_Meeting_Occurred__c' + opp.X1st_Meeting_Occurred__c);
                    // 
                    condOppWith1stMeeting90Below = true;
                    oppBDM = opp.OwnerId;
                    return condOppWith1stMeeting90Below;
                }
                
            }
        }
        return condOppWith1stMeeting90Below;
        
    }
    
}