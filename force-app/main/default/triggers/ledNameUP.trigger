trigger ledNameUP on Lead (After insert,Before insert) 
{   
    List<String> emtld = new List<String> ();
	for (lead l : trigger.new)
    {
        emtld.add('Mr.'+l.Name);
    }
}