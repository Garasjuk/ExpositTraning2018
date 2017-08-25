package net.coursejava.by;

import java.util.Scanner;

public class Task5 {
	static int count = 1;

	public static void main(String[] args) {

		Scanner in = new Scanner(System.in);
		System.out.println("PALINDROM");
		System.out.print("word: ");
		String  a = in.next();

		System.out.println("Palindrom: " + isPalindrom(a));
		
		in.close();
	}

	public static boolean isPalindrom(String a) {

		char[] chars = a.toCharArray();
		int count = chars.length, i=0;
		
		while(i <= count){
			if (chars[i] == chars[count-1]){
				i++;
				count--;
			}	
			else {
				return false; 
			}
		}
			return true;
	}
}
