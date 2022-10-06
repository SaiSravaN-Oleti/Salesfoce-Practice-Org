public class TestBatchClass implements Database.Batchable<SObject>
{
	public Database.QueryLocator start (Database.BatchableContext BC)
    {
        String anyName = 'Select Id , Name from Account' ;
        Return Database.getQueryLocator(anyName);
    }
    Public void Execute (Database.BatchableContext BC , List<SObject> anyVar)
    {
        database.delete (anyVar,False);
    }
    Public void Finish (Database.BatchableContext BC)
    {
        System.debug('Sorry I Dont know , You know this after learning email concept :😒😒');
    }
}