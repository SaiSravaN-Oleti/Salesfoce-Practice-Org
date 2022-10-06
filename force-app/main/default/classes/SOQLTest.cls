public class SOQLTest 
{
    Public static void GetRecordsCount()
    {
        // Static SOQL Query.
        	integer recordsCount = [Select count() from Account];
        	system.debug('Account Records Count....: '+ recordsCount);
                
        // Dynamic SOQL Query.
        	string accountsQuery = 'Select count() from Account';
        	integer accountRecordsCount = Database.countQuery(accountsQuery);
        	system.debug('Records Count is...: '+ accountRecordsCount);
        
        // Number of SOQL Queries we have used in the Transaction..
        	System.debug('Number of SOQL Queries Used...: '+ System.Limits.getQueries());
        	System.debug('CPU Cycle Time used...: '+ System.Limits.getCpuTime());
        	System.debug('Number of Records Retrieved....: '+ system.Limits.getQueryRows());
        	system.debug('Number of DML Statements used....: '+ system.Limits.getDmlStatements());
    }
}