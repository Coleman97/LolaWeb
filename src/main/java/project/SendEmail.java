package project;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	
	public String getRandom() {
		Random rnd = new Random();
		int num = rnd.nextInt(999999);
		
		return String.format("%06d", num);
	}
	
	public boolean sendEmail(User user) {
		boolean text = false;
		
		String toEmail = user.getEmail();
		String fromEmail ="lolafashionstyle21@gmail.com"; 
		String password = "Godkind2021";
		
		try {
			
			Properties pr = new Properties();
			pr.put("mail.smtp.host", "smtp.gmail.com");
			pr.put("mail.smtp.port", "587");
			pr.put("mail.smtp.auth", "true");
			pr.put("mail.smtp.starttls.enable", "true");  
			pr.put("mail.smtp.socketFactory.port", "587");
			pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			
			///get session
			Session session = Session.getInstance(pr, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
			});
			
			Message mess = new MimeMessage(session);
			
			
			mess.setFrom(new InternetAddress(fromEmail));
			mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			
			mess.setSubject("Email Verification");
			
			mess.setText("Registeration Successful. Verify Account with this code: " + user.getCode());
			
			Transport.send(mess);
			
			text = true ;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return text;
	}
}
