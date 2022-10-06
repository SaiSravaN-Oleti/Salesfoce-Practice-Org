public class  AccHelperHandler 
{
    Public static void con (list<Account> A)
    {
	    List<String> recName = new List<String> ();
    	for (Account acc : A)
    		{
        		recName.add (acc.Name);
    		}
    
    	List<Contact> conList = [Select Id,Name from contact where Name IN : recName];
    
    	if(conList.size()>0)
    	{
        	Delete conList;
    	}

    }
    Public Static Void SalutationRemove (list<Account> B)
    {
        for(Account acc : B)
        {
            acc.name= acc.Name.removeStart('Mr.');
        } 
    }
   
    
    Public static void upDescription(List<Account> newValues, List<Account> oldValues)
    {
        for(integer i = 0 ; i < newValues.size() ; i++)
    	{
        	if(newValues[i].phone!=oldValues[i].phone)
        	{
           		newValues[i].description='Past Phone No Is:-'+ oldValues[i].phone +' And New PhoneNo Is:-'+ newValues[i].phone;
        	}
   		}
    }
}