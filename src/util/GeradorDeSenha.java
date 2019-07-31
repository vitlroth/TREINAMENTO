package util;

import java.util.Random;

public class GeradorDeSenha {

	public static void main(String[] args) {
		// Instancia um objeto da classe Random

		Random rand = new Random();

		

		for (int i = 0; i < 7; i++) {
			int a = rand.nextInt(10);
			System.out.print(a);	
		}
		
		

	}

}
