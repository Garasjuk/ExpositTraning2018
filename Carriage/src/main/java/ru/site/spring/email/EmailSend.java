package ru.site.spring.email;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class EmailSend {
	
	private static final Log log = LogFactory.getLog(EmailSend.class);
	
	public void sendMessage(String email, String title, String text) throws IOException {
	        EmailProperties emailProperties = new EmailProperties();
	        Properties prop = emailProperties.getConnectEmain();

	        Connect connect = new Connect();
	        Session session = connect.connctEmail(prop);
	        try {
	            Message message = new MimeMessage(session);
	            // from
	            message.setFrom(new InternetAddress(prop.getProperty("mail.username")));
	            // to
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	            // title
	            message.setSubject(title);
	            // text
	            message.setText(text);

	            Transport.send(message);

	           log.info("Email Sent successfully...." + email);

	        } catch (MessagingException e) {
	            throw new RuntimeException(e);
	        } catch (Exception e) {
	            log.error("Error: ", e);
	        }
	}
}
