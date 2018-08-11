package ru.site.spring.utility;

import java.io.ByteArrayOutputStream;

public class PasswordString {

	public  ByteArrayOutputStream getPassword() {
		ByteArrayOutputStream output = new ByteArrayOutputStream();

        String laters = "abcdefghijklmnopqrstuvwxyz";
        String digits = "1234567890";
        StringBuffer passw = new StringBuffer();

        for (int i=0; i<4; i++) {
            passw.append(laters.charAt((int)(Math.random()*26)));
        }
        for (int i=0; i<2; i++) {
            passw.append(digits.charAt((int)(Math.random()*10)));
        }
        for (int i=0; i<2; i++) {
            passw.append(laters.toUpperCase().charAt((int)(Math.random()*26)));
        }

        try {
            output.write(passw.toString().getBytes());
        } 
        catch (Exception e){

        }
        System.out.println( "pass " + output );
        return output;
	}
}
