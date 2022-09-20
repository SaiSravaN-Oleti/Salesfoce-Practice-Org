public class LoginControllerLwc {
    @AuraEnabled 
    public Static void createNewUser(String uName, String passWd, String phNo, String mailId) {
        Login__c newLogin = new Login__c();
        newLogin.Name = uName;
        newLogin.Password__c = passWd;
        newLogin.Phone__c = phNo;
        newLogin.Email__c = mailId;
        insert newLogin;
    }
    @AuraEnabled 
    public static List<Login__c> validateLogin(String Uname, String passWd) {
        List<Login__c> listOfLogis = [SELECT Id,Name,Password__c from Login__c WHERE Name=:Uname AND Password__c=:passWd];
        return listOfLogis;
    }
}