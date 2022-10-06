public class MessagingUtility 
{
	Public pageReference show()
    {
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        String [] toaddress = new String[]{'oletisravan@gmail.com'};
          	msg.setToAddresses(toaddress);
        String [] toccaddress = new String[]{'rickeysravan@gmail.com'};
            msg.setCcAddresses(toccaddress);
        String [] toBccaddress = new String[]{'saisravanoleti@gmail.com'};
            msg.setCcAddresses(toccaddress);
        
        msg.setSubject('Employee-Holiday');
        msg.setPlainTextBody('Anything as per recuriments');
        msg.setHtmlBody('<h1> Hello this is test Message</h1><br/> <p> Please dont replay to this message </p>');
        msg.setTemplateId('00X5j000000pjvo');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{msg});
        return null;   
    }
}