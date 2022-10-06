trigger trigMailStudent on Student__c (before insert) 
{
    string msg = 'Mail alreday exist';
 	set<String> emtMail = new set<String>();
    List<String> existingMail = new List<String>();
    
    for (Student__c s : trigger.new)
    {
		emtMail.add(s.Email__c);
    }
    System.debug(+emtMail);
    for (Student__c es : [Select Name, Email__c from Student__c Where ID In :emtMail])
    {
        existingMail.add(es.Email__c);
    }

	for(Student__c now:trigger.new)   
    {
        if (existingMail.contains(now.Email__c))
        {
            now.Email__c.addError(+msg);
        }
    }
}