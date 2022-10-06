public class ContactHelperHandler {
	public static void countcon(list<Contact>  newList , list<Contact>  oldList)
    {
        set <id> accountIds = new set <id>();
        
        for(contact c:newlist)
        {
            if(c.accountId!=Null)
            {
                accountIds.add(c.accountId);
            }
        }
        
        for(contact c:oldlist)
        {
            if(c.accountId!=Null)
            {
                accountIds.add(c.accountId);
            }
        }
        list<account> accounts = [select id,Count_of_Contacts__c from account];
        
    }
}