@isTest
public class ContactAllHelperTest {
	
    @isTest (SeeAllData = true)
    static void testCreateNewLeadFromContact() {
        
        Account testAccount = new Account
            (
            	Name = 'ThisIsATestAccount'
            );
        insert testAccount;
        
        Contact testContact = new Contact
            (
            	FirstName = 'John',
                LastName = 'Mak',
                Account = testAccount,
                AccountId = testAccount.Id
            );
        insert testContact;
        
        Test.startTest();
        ContactAllHelper.CreateNewLeadFromContact(testContact);
        Test.stopTest();
        
        Lead result = new Lead();
        try {
        	result = [Select Id, FirstName, LastName, Company, Contact_Generated_From__c From Lead Where FirstName = :testContact.FirstName and LastName = :testContact.LastName and Company = :testContact.Account.Name];
        }
        catch(Exception ex) {
            result = null;
        }
        system.assert(result != null);
        system.assert(result.Contact_Generated_From__c == testContact.Id);
    }
}