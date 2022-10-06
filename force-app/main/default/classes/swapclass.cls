public class swapclass 
{
    //Swapping without using 3rd Variable
	public static void swapWithoutTemp()
    {
        integer a=10, b=20;
        a=a+b;
        b=a-b;
        a=a-b;
        system.debug('AfterSwap "a" Value is :'+a);
        system.debug('AfterSwap "b" Value is :'+b);
    }

    //Swapping with using 3rd/temp Variable
    public static void swapWithTemp()
    {
        integer a=10, b=20;
		integer c = a;
        a = b;
        b = c;
        system.debug('AfterSwap "a" Value is :'+a);
        system.debug('AfterSwap "b" Value is :'+b);    
    }
    
    /* invoke above methods 
     * swapclass.swapWithoutTemp()
     * swapclass.swapWithTemp() 
     */
}