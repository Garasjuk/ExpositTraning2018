package net.coursejava.by;

import java.util.Scanner;

public class Task2 {
	static int count = 1;
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("FIBONACHI numbers");
		System.out.print("enter numbers: ");
		int num = in.nextInt();
		System.out.print("Our numbers: ");
		while (true) {
			int total = isFibonachi(count);
			if (total >= num) break;
			System.out.print(isFibonachi(count) + " ");
			count++;
		}
		System.out.println();
		in.close();
	}
	
	public static int isFibonachi(int n) {
		if (n < 2)
			return 1;
		return isFibonachi(n-1) + isFibonachi(n-2);
	}
}
