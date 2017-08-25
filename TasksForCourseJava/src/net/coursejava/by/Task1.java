package net.coursejava.by;

import java.util.Scanner;

public class Task1 {
	static int count = 1;

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("PRIME numbers");
		System.out.print("enter numbers: ");
		int num = in.nextInt();
		System.out.print("Our numbers: ");
		while (count <= num) {
			if (isPrime(count))
				System.out.print(" " + count + " ");
			count++;
		}
		System.out.println();
		in.close();
	}

	public static boolean isPrime(int N) {
		if (N < 2)
			return false;
		for (int i = 2; i * i <= N; i++)
			if (N % i == 0)
				return false;
		return true;
	}
}
