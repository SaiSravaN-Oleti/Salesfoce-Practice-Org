public class PublisherDiscount 
{
    public Decimal discount{set;get;}
    
    public decimal  discount(Decimal Price , String custType)
    {
        If(custType == 'Premimium')
        {
            discount = Price*0.10;
        }
        else
        {
            discount = Price*0.05; 	
        }
           return discount;

    }
}