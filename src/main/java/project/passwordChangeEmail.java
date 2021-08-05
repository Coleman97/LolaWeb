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

public class passwordChangeEmail {
	public String getRandom() {
		Random rnd = new Random();
		int num = rnd.nextInt(999999);
		
		return String.format("%06d", num);
	}
	
	public boolean sendpassChangeEmail(User user) {
		boolean text = false;
		
		String toEmail = user.getEmail();
		String fromEmail ="tobbycole12@gmail.com"; 
		String password = "messi12barca";
		
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
			
			mess.setText("We got the notification for the password change. Verify Account with this code: " + user.getCode() +
					" to be able to validate the password change.");
			
			Transport.send(mess);
			
			text = true ;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return text;
	}
}

