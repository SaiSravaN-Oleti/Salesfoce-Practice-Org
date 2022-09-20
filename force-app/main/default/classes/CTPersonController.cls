public with sharing class CTPersonController 
{
    public static String getToken(String mobileNo) 
    {
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);

        //get the string value of Hash Blob
        return EncodingUtil.base64Encode(hash); 
    }
    public static List<Person__c> getRecentHealthChanges()
    {
        return [SELECT Id FROM Person__c ORDER BY Status_Update_Date__c  DESC LIMIT 100];
    }

    /**
     * Search a person by name, token or mobile
     * @return List<Person__c>
     */
    public static List<Person__c> searchPeople(String searchTerm)
    {
        // appending the wild card
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
            FROM Person__c
            WHERE Name LIKE :searchTerm
                OR Mobile__c LIKE :searchTerm
                OR Token__c LIKE :searchTerm
            ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }

    /**
     * Search a person by id
     * @return Person__c
     */
    public static Person__c getPersonById(String personId){
        List<Person__c> people = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
                FROM Person__c
                WHERE Id =:personId];
        if(people != null && people.size() > 0){
            return people[0];
        }
        return null;
    }
}