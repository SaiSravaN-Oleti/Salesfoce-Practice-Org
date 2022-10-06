trigger genderSalutation on Student__c (before insert) {
    
    for (Student__c s : trigger.new)
    {
        if(s.Gender__c == 'Male')
        {
            s.Name = 'Mr.'+s.Name;
        }
        else
        {
            s.Name = 'Ms.'+s.Name;
        }
        
    }
    
}