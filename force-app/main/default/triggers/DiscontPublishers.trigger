trigger DiscontPublishers on Publisher__c (before insert,before update) {
    
	if(trigger.isbefore && (trigger.isInsert || trigger.isUpdate))
    {
    	for(Publisher__c p : trigger.new)
    	{
        	PublisherDiscount pd = new PublisherDiscount ();
        	p.AfterDiscount__c = pd.discount(p.Price__c,p.Type__c);
    	}        
    }

}