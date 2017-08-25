package net.coursejava.by;

import java.util.Scanner;

public class Task3 {
	static int count = 1;

	public static void main(String[] args) {

		Scanner in = new Scanner(System.in);
		System.out.println("CROSS");
		System.out.println("Line 1");
		System.out.print("x1: ");
		int x1 = in.nextInt();
		System.out.print("y1: ");
		int y1 = in.nextInt();
		System.out.print("x2: ");
		int x2 = in.nextInt();
		System.out.print("y2: ");
		int y2 = in.nextInt();
		System.out.println("Line 2");
		System.out.print("a1: ");
		int a1 = in.nextInt();
		System.out.print("b1: ");
		int b1 = in.nextInt();
		System.out.print("a2: ");
		int a2 = in.nextInt();
		System.out.print("b2: ");
		int b2 = in.nextInt();

		System.out.print(isCross(x1, y1, x2, y2, a1, b1, a2, b2) + " ");
		in.close();
	}

	public static boolean isCross(int x1, int y1, int x2, int y2, int a1,
			int b1, int a2, int b2) {

		int x, y, n, m;

		if (y2 - y1 != 0) {
			n = (x2 - x1) / (y2 - y1);
			if (b2 - b1 != 0) {
				m = (a2 - a1) / (b2 - b1);
				if (n != m) {
					x = ((x1 * y2 - x2 * y1) * (a2 - a1) - (a1 * b2 - a2 * b1)
							* (x2 - x1))
							/ ((y1 - y2) * (a2 - a1) - (b1 - b2) * (x2 - x1));
					y = ((b1 - b2) * x - (a1 * b2 - a2 * b1)) / (a2 - a1);
					return true;

				} else {
					return false;
				}
			} else {
				return false;
			}
		} else {
			return true;
		}
	}
}
