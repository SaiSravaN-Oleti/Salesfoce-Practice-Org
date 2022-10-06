global class DndLeadTransfer implements Database.Batchable<SObject>
{
    Public string query = 'Select Id, Name , Phone ,Email,DND__c from Lead where DND__c = True ';
    global Database.QueryLocator start (Database.BatchableContext BC)
    {
        Return Database.getQueryLocator(query);
    }
   
    global Void execute(Database.BatchableContext BC, List<Lead> scope)
    {
        List<DNDLead__c> Dlist = New List<DNDLead__c>();
        for (Lead l:scope)
        {
            DNDLead__c dnd = new DNDLead__c();
            dnd.Name = l.Name ;
            dnd.DLeadPhone__c = l.Phone;
            dnd.DLeadMail__c = l.Email;
            Dlist.add(dnd);
        }
        insert Dlist;
        Delete scope;
    }
    global Void Finish(Database.BatchableContext BC)
    {
        list<user> Umail = [Select Email from User where FirstName ='Rickey' ];
        string mymail ;
        for(user e:Umail)
        {
 
        }
    }
}

/* To Invoke Above batch 
 * 
 * 
DndLeadTransfer xyz = new DndLeadTransfer();
Try
{
Database.executeBatch(xyz);
}
Catch(Exception e )
{
    System.debug('Errorwas'+e);
}
*
*
*/