Global class CalcAnnualRevBatchState implements Database.Batchable<SObject>,Database.Stateful
{
    Global Decimal tAR = 0.0; //Total lead Annualrevenue initial state==0
    Global Database.QueryLocator Start (Database.BatchableContext BC)
    {
        String 	q = 'Select id, lastname, annualrevenue from Lead' ;
        return Database.getQueryLocator(q);
    }
    Global Void Execute(Database.BatchableContext BC , List<Lead> Scope)
    {
        For(Lead obj : Scope)
        {
           Lead aRLead = New Lead ();
           tAR = tAR + aRLead.AnnualRevenue;
            system.debug('TOtal:...:-'+tAR);
        }
    }
    Global Void Finish(Database.BatchableContext BC)
    {
        
    }
}