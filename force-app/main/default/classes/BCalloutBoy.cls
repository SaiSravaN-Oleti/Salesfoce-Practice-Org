public class BCalloutBoy 
{
    public static String getCasesFromSalesforceOrgB()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://sravans-dev-ed.my.salesforce.com/services/apexrest/Cases');
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer !AREAQBkL3qbOw_fPjBvF0p41aA9MdO4t8fMLWlACcCkGg0SzenhIXr9c3Sde__OUZe.wzvlNYgajinr7aq2uY8OrlmcQ9jOo');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            system.debug('############### '+ response.getBody());
            return response.getBody();
        }
        return '';
    }
}