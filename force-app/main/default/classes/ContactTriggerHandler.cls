public with sharing class ContactTriggerHandler 
{ 
    public static void insertHandler(List<Contact> newList) 
    {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newList)
        {
            if(String.isNotBlank(con.AccountId))
            {
                accountIds.add(con.AccountId);
            }
        }
        ContactTriggerHandler.activeConService(accountIds);
    }
    public static void updateHandler(List<Contact> newList, Map<id,Contact> oldMapList) 
    {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newList)
        {
            if(String.isNotBlank(con.AccountId) && oldMapList.get(con.id).Active__c != con.Active__c )
            {
                accountIds.add(con.AccountId);
            }
            else if ( oldMapList.get(con.id).AccountId != con.AccountId ) 
            {
                accountIds.add(con.AccountId);
                accountIds.add(oldMapList.get(con.id).AccountId);
            }
        }
        ContactTriggerHandler.activeConService(accountIds);
    }
    public static void deleteHandler(List<Contact> oldList) 
    {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : oldList)
        {
            if(String.isNotBlank(con.AccountId))
            {
                accountIds.add(con.AccountId);
            }
        }
        ContactTriggerHandler.activeConService(accountIds);
    }
    public static void undeleteHandler(List<Contact> newList) 
    {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newList)
        {
            if(String.isNotBlank(con.AccountId))
            {
                accountIds.add(con.AccountId);
            }
        }
        ContactTriggerHandler.activeConService(accountIds);
    }
    public static void activeConService(Set<Id> accIds)
    {
        List<Account> results = [SELECT Id,Active_Contacts__C,(SELECT Id from Contacts where Active__c = True) FROM Account WHERE Id in:accIds];
        List<Account> accountsToUpdate = new List<Account>();
        for(Account result : results)
        {
            String accId = result.Id;
            Integer totalContacts = result.Contacts.size();
            Account acc =new Account(Id= accId,Active_Contacts__c = totalContacts);
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;
    }
}