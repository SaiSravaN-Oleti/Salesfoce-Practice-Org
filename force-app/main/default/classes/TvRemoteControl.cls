public class TvRemoteControl 
{
	Integer Volume;		//Empty variable
    Static final Integer Max_Volume = 50; //fixed value like max value is 50
    public TvRemoteControl(Integer v) //constructor method with parameter getting integer V 
    {
        Volume = v; //asign the value give in invoke time  to volume
    }
    Public Integer increaseVolume(Integer amount) //method  with perameter
    {
        volume +=amount;          // here above volume become  above vol + now amount like 10+30 10 is v 30 is amount
        if(volume > Max_Volume)  //if above vol is more than max then go inside ans set volume to Max_volume
        {
            volume = Max_Volume; 
        }
        return Volume;  
    }
    Public Integer decreaseVolume(Integer amount)  
    {
        volume -=amount;
        if(volume < 0 )
        {
            volume = 0;
        }
        return Volume;
    }
    Public static String getMenuOptions()
    {
        return 'Settings';
    }
}