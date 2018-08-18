public class ContactAllHelper {
    
    public static void CreateNewLeadFromContact(Contact c) {
        
        FeedItem post = new FeedItem();
        List<LeadFromContactField__mdt> allFields = [Select Contact_Field__c, Lead_Field__c From LeadFromContactField__mdt];
		List<Lead> leadList = new List<Lead>();
        
        if (allFields.size() > 0) {
            Lead theLead = new Lead();
            for (LeadFromContactField__mdt field : allFields) {
                if (field.Contact_Field__c.Contains('.')) {
                    //example: if the lead's company name should be 'Account.Name'
                    try {
                        string[] fields = field.Contact_Field__c.Split('\\.');
                        theLead.put(field.Lead_Field__c, c.getSObject(fields[0]).get(fields[1]));
                    }
                    catch(Exception ex) {
                        theLead.put(field.Lead_Field__c, ' ');
                    }
                }
                else {
                	theLead.put(field.Lead_Field__c, c.get(field.Contact_Field__c));
                }
            }
            theLead.Contact_Generated_From__c = c.Id;
            insert theLead;
            
            List<FeedItem> postList = new List<FeedItem>();
            post.ParentId = c.Id;
            post.Title = c.Name;
            post.Body = 'A new Lead, '+ theLead.FirstName + ' ' + theLead.LastName +', was generated from this Contact on ' + Date.today();
            post.LinkUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/' + theLead.Id;
            postList.add(post);
            
            post = new FeedItem();
            post.ParentId = theLead.Id;
            post.Title = theLead.Name;
            post.Body = 'This Lead was generated from the Contact, ' + c.FirstName + ' ' + c.LastName +', on '  + Date.today();
            post.LinkUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/' + theLead.Contact_Generated_From__c;
            postList.add(post);
            
            insert postList;
        }  
    }

}