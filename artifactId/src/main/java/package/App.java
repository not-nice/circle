package package;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Welcome to the Scientific Calculator!");

        while (true) {
            System.out.println("Enter an operation (+, -, *, /, sqrt, pow, sin, cos, tan, log, exit):");
            String operation = scanner.nextLine();

            if (operation.equals("exit")) {
                System.out.println("Exiting the calculator. Goodbye!");
                break;
            }

            double result = 0.0;

            switch (operation) {
                case "+":
                    System.out.println("Enter the first number:");
                    double num1 = scanner.nextDouble();
                    System.out.println("Enter the second number:");
                    double num2 = scanner.nextDouble();
                    result = num1 + num2;
                    break;
                case "-":
                    System.out.println("Enter the first number:");
                    num1 = scanner.nextDouble();
                    System.out.println("Enter the second number:");
                    num2 = scanner.nextDouble();
                    result = num1 - num2;
                    break;
                case "*":
                    System.out.println("Enter the first number:");
                    num1 = scanner.nextDouble();
                    System.out.println("Enter the second number:");
                    num2 = scanner.nextDouble();
                    result = num1 * num2;
                    break;
                case "/":
                    System.out.println("Enter the dividend:");
                    num1 = scanner.nextDouble();
                    System.out.println("Enter the divisor:");
                    num2 = scanner.nextDouble();
                    if (num2 == 0) {
                        System.out.println("Error: Division by zero!");
                        continue;
                    }
                    result = num1 / num2;
                    break;
                case "sqrt":
                    System.out.println("Enter the number:");
                    num1 = scanner.nextDouble();
                    result = Math.sqrt(num1);
                    break;
                case "pow":
                    System.out.println("Enter the base:");
                    num1 = scanner.nextDouble();
                    System.out.println("Enter the exponent:");
                    num2 = scanner.nextDouble();
                    result = Math.pow(num1, num2);
                    break;
                case "sin":
                    System.out.println("Enter the angle in degrees:");
                    num1 = scanner.nextDouble();
                    result = Math.sin(Math.toRadians(num1));
                    break;
                case "cos":
                    System.out.println("Enter the angle in degrees:");
                    num1 = scanner.nextDouble();
                    result = Math.cos(Math.toRadians(num1));
                    break;
                case "tan":
                    System.out.println("Enter the angle in degrees:");
                    num1 = scanner.nextDouble();
                    result = Math.tan(Math.toRadians(num1));
                    break;
                case "log":
                    System.out.println("Enter the number:");
                    num1 = scanner.nextDouble();
                    result = Math.log10(num1);
                    break;
                default:
                    System.out.println("Invalid operation!");
                    continue;
            }

            System.out.println("Result: " + result);
            scanner.nextLine(); // Consume newline left-over after nextDouble()
        }

        scanner.close();
    }
}
