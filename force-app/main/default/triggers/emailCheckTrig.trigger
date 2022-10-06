trigger emailCheckTrig on Contact (before insert) 
{
    set<string> conSet=new set<string>();
    
    for(contact con:trigger.New)
    {
        conSet.add(con.email);    
    }

    list<string> conSet2=new list<string>();
    
    for(contact conList:[SELECT email FROM contact where email IN :conSet])
    {
        conSet2.add(conList.email);
    }
    for(contact c:trigger.new)
    {
        if(conSet2.contains(c.email))
        {
            c.addError('Email id already exists');           
        }
    }

}