public class SponacularApi 
{
    Private static final String SPOONACULAR_API = 'https://api.spoonacular.com';
    Private static final String API_KEY = '0695e53c11a8478db7c100a9836bd48e';
	public static void getRandomRecipe()
 	{
	//INVOKE A HTTP  INSTANCE
	Http http = new Http();
	//INVOKE A HTTP REQUEST INSTANCE
	HttpRequest request = new HttpRequest();
	request.setEndpoint(SPOONACULAR_API+'/recipes/random?apiKey='+API_KEY);
	request.setMethod('GET');

	//INVOKE A HTTP RESPPONCE INSTANCE // CALLOUT
	HttpResponse response = http.send(request);
	// If the request is successful, parse the JSON response.
	System.debug('Response' +response.getStatusCode());
	if(response.getStatusCode() == 200) 
		{
			System.debug('Response' +response.getBody());
		}
 	}
    
    public static void getRecipeByIngredients(String ingredients)
 	{
	//INVOKE A HTTP  INSTANCE
	Http http = new Http();
	//INVOKE A HTTP REQUEST INSTANCE
	HttpRequest request = new HttpRequest();
        //https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,
        //+flour,+sugar&number=2
	request.setEndpoint(SPOONACULAR_API+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
	request.setMethod('GET');

	//INVOKE A HTTP RESPPONCE INSTANCE // CALLOUT
	HttpResponse response = http.send(request);
	// If the request is successful, parse the JSON response.
	System.debug('Response' +response.getStatusCode());
	if(response.getStatusCode() == 200) 
		{
			System.debug('Response' +response.getBody());
		}
 	}
	public static void getRecipe(String recipeId)
 	{
	//INVOKE A HTTP  INSTANCE
	Http http = new Http();
	//INVOKE A HTTP REQUEST INSTANCE
	HttpRequest request = new HttpRequest();
        //https://api.spoonacular.com/recipes/{id}/information
	request.setEndpoint(SPOONACULAR_API+'/recipes/'+recipeId+'/information?apiKey='+API_KEY);
	request.setMethod('GET');

	//INVOKE A HTTP RESPPONCE INSTANCE // CALLOUT
	HttpResponse response = http.send(request);
	// If the request is successful, parse the JSON response.
	System.debug('Response' +response.getStatusCode());
	if(response.getStatusCode() == 200) 
		{
			System.debug('Response' +response.getBody());
		}
 	}    
}