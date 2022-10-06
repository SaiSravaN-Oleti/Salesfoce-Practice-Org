public class ReverseString {
public static void getreverse(string originalString)
{
String [] StringList= new List<String>();
StringList= originalString.split(''); // convert String to Array
string reversedString='';
for(integer i=StringList.size()-1;i>=0;i--)
{
reversedString=reversedString+originalString.substring(i,i+1);
}
System.debug('originalString--> '+originalString);
System.debug('reversedString--> '+reversedString);
}
}