trigger recCheck on Account (after insert , after update) 
{
    if(TriggerRec.flag!= true)  //here we check flag
    {
    if(trigger.isAfter && trigger.isInsert)
    {
        TriggerRec.flag= true ;  //here we are setting flag 
        Account acc = [SELECT id,Name FROM Account WHERE Name = 'Samio' LIMIT 1];
        acc.Name = 'NewSamio';
        update acc;
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        Account a = new Account(Name = 'Aaiyao VaduAma');
        insert a;       
    }  
       
    }
}