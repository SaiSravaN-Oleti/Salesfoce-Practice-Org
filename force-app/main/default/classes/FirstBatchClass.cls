Global class FirstBatchClass implements Database.Batchable<SObject>
{
	Global Database.QueryLocator Start (Database.BatchableContext BC)
    {
        String K = 'Select Name , OnBoard__c ,Active__c ,Skill_Set__c From Candidate_Form__c';
        Return Database.getQueryLocator(K);
    }
    Global Void Execute (Database.BatchableContext BC , List <Candidate_Form__c> anyCan)
    {     
		For (Candidate_Form__c x : anyCan)
        {
            if(x.Name == 'Zakkeer')
            {
                x.Name = 'Zaplalo Zack';
         		Update x;
            }
        }
        
    }
    Global Void Finish (Database.BatchableContext BC)
    {
        //Anycode
    }
}

/* ** For Isnvoking **
 * FirstBatchClass xyz = new FirstBatchClass();
 * Database.Execute(xyz);
*/