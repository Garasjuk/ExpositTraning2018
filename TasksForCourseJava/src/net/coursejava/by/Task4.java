package net.coursejava.by;

import java.util.Scanner;

public class Task4 {

	public static void main(String[] args) {

		int gcd;
		Scanner in = new Scanner(System.in);
		System.out.println("LCM and GCD");
		System.out.print("a: ");
		int a = in.nextInt();
		System.out.print("b: ");
		int b = in.nextInt();

		gcd = isLCMandGCD(a, b);
		
		System.out.println("LCM: " + (a*b)/gcd );
		System.out.println("GCD: " +gcd );
		
		in.close();
	}

	public static int isLCMandGCD(int a, int b) {
		if (b == 0) {
			return a;
		} else {
			return isLCMandGCD(b, a % b);
		}
	}
}
