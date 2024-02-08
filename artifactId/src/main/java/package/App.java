package package;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class CircleAreaCalculatorApplication {

    public static void main(String[] args) {
        SpringApplication.run(CircleAreaCalculatorApplication.class, args);
    }

    @GetMapping("/calculateArea")
    public String calculateArea(@RequestParam double radius) {
        double area = calculateCircleArea(radius);
        return String.format("The area of the circle with radius %.2f is: %.2f", radius, area);
    }

    private double calculateCircleArea(double radius) {
        return Math.PI * Math.pow(radius, 2);
    }
}
