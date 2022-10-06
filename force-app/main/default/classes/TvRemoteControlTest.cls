@isTest
public class TvRemoteControlTest 
{
	@isTest static void testVolIncrease()
    {
        TvRemoteControl rc = new TvRemoteControl(10); //invoke object rc by passing value it invoc costructor
        Integer newVol = rc.increaseVolume(15);  //calling method 1
        system.assertEquals(25, newVol);   
    }
	@isTest static void testVolIncreaseMax()
    {
        TvRemoteControl rc = new TvRemoteControl(10); //invoke object rc by passing value it invoc costructor
        Integer newVol = rc.increaseVolume(90);  //calling method 1
        system.assertEquals(50, newVol);   
    }
    @isTest static void testVolDecrease()
    {
        TvRemoteControl rc = new TvRemoteControl(20);
		Integer decVol = rc.decreaseVolume(15); //calling method 2
        system.assertEquals(5, decVol);
    }
    @isTest static void testVolDecreaseMin()
    {
        TvRemoteControl rc = new TvRemoteControl(10);
		Integer decVol = rc.decreaseVolume(100); //calling method 2
        system.assertEquals(0, decVol);
    }
    @isTest static void testmenu()
    {
       	string k = TvRemoteControl.getMenuOptions();
        system.assertEquals(null, k);
        system.assertEquals('', k);   
    }
}