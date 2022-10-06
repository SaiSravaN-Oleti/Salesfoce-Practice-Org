/*Write a Trigger to count the child Contacts records on Account ?
 * It is a RollUPSummary Scenario If the relation ship is Master Detail Then we can go with our of box features,
 * If the relationship is look we go with this trigger
 * Pre Requesite is Create custom filed Named (Count_of_Contacts__c) dataType is Number on Account object
 * */ 
trigger CountOfContact on Contact (after insert,after update,after delete,after undelete) 
{   
    Set<id> AccIds = new set<Id>();
    if(Trigger.isAfter && Trigger.isDelete)
    {
    for(contact con:trigger.old)
      {
          AccIds.add(con.AccountId);
      }
    }
  if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUndelete))
    {
    for(contact con:trigger.new)
      {
          AccIds.add(con.AccountId);
      }
    }
  if(Trigger.isAfter && Trigger.isUpdate)
    {
    for(contact con:trigger.new)
      {
          AccIds.add(con.AccountId);
            Contact old_Val_OnContact = Trigger.oldMap.get(con.id);
            AccIds.add(old_Val_OnContact.AccountId);
      }
    }
    List<account> accList = [Select id,Count_of_Contacts__c,(Select id from Contacts) from Account Where ID IN:AccIds];
    for(Account acc : accList)
    {
        acc.Count_of_Contacts__c = acc.Contacts.size();
    }
    try
    {
        update accList;
    }
    Catch(Exception e)
    {
        System.debug('Exception :'+e.getMessage());
    }
}