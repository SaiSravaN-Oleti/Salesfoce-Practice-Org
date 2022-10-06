public class Arithmetic {
	Public static integer numOne = 10;
	Public static integer numTwo = 10;
	Public static integer myTest;
    public static integer add()
    {
        myTest = numOne + numTwo;
        System.debug('Result Addition is :'+myTest);
    	return myTest;
    }
        public static integer sub()
    {
        myTest = numOne - numTwo;
        System.debug('Result Subtraction  is :'+myTest);
    	return myTest;
    }
    public static integer mul()
    {
        myTest = numOne * numTwo;
        System.debug('Result Multiplication is :'+myTest);
    	return myTest;
    }
    public static integer div()
    {
        myTest = numOne / numTwo;
        System.debug('Result Division is :'+myTest);
    	return myTest;
    }
    
}