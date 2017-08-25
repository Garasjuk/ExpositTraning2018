package net.coursejava.by;

import java.util.Scanner;

public class Task6 {
	static int count = 1;

	public static void main(String[] args) {

		Scanner in = new Scanner(System.in);
		System.out.println("SEARCH NUMBER");
		System.out.print("Text: ");
		String a = in.next();

		System.out.println("With out number: " + isSearchNumber(a));

		in.close();
	}

	public static String isSearchNumber(String a) {

		char[] chars = a.toCharArray();
		String chare = "";
		int count = chars.length, i = 0;

		while (i < count) {
			if (chars[i] >= '0' && chars[i] <= '9') {
				i++;
			} else {
				chare = chare + String.valueOf(chars[i]);
				i++;
			}
		}
		return chare;
	}
}
