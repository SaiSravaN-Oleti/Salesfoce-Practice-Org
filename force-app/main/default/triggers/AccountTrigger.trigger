trigger AccountTrigger on Account (before insert,Before Update) 
{
    //Contact delete 
    if(trigger.isbefore && trigger.isInsert)
    {
        AccHelperHandler.con(trigger.new);
    }
    //trim mr. if some one add
    
    if(trigger.isBefore && (trigger.isInsert || trigger.isupdate))
    {
        AccHelperHandler.SalutationRemove(trigger.new);
    }  
    
    //update the description field if some one update phone filed with past phoneno and new phone number
    if(trigger.isBefore &&  trigger.isupdate)
    {
        AccHelperHandler.upDescription(trigger.new , trigger.old);
    }
}