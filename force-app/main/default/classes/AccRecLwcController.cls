public with sharing class AccRecLwcController 
{   
    @AuraEnabled(Cacheable = true)
    public static List<Account> accList()
    {
        return [Select Id,Name,Phone from Account WITH SECURITY_ENFORCED LIMIT 10];
    }
}