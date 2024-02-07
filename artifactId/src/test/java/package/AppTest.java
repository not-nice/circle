package package;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class AppTest {

    @Test
    public void testCalculateCircleArea() {
        App app = new App();
        double radius = 5.0;
        double expectedArea = Math.PI * Math.pow(radius, 2);
        double actualArea = app.calculateCircleArea(radius);
        assertEquals(expectedArea, actualArea, 0.001, "Area calculation is incorrect");
    }
}
