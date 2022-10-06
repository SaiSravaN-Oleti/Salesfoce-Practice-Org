@isTest
public class DndLeadTransferTest 
{
	Static testMethod void testBatchClass()
    {
     	DndLeadTransfer bc = new DndLeadTransfer();
        bc.query = 'Select Id, Name , Phone ,Email,DND__c from Lead where DND__c = True Limit 200';
        test.startTest();
        Database.executeBatch(bc,200);
        test.stopTest();
    }
    Static testMethod void batchContext()
    {
       	List<Lead> scope = new List<lead> ();
        List<DNDLead__c> Dlist = New List<DNDLead__c>();
        for (integer i = 0 ; i<200;i++)
        {
            DNDLead__c dnd = new DNDLead__c();
            dnd.Name = 'Name update' ;
            Dlist.add(dnd);
        }
        insert Dlist;
        Delete Scope;
    }
}