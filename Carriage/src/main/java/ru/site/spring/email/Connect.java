package ru.site.spring.email;

import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;

public class Connect {
	public Session connctEmail(final Properties prop) {
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(prop.getProperty("mail.username"), prop.getProperty("mail.password"));
                    }
                });
        return session;
}
}
