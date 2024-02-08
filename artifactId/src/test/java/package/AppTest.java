package package;

iimport static org.junit.Assert.assertEquals;
import org.junit.Test;

public class AppTest {

    @Test
    public void testAddition() {
        assertEquals(10, App.add(5, 5), 0);
    }

    @Test
    public void testSubtraction() {
        assertEquals(5, App.subtract(10, 5), 0);
    }

    @Test
    public void testMultiplication() {
        assertEquals(25, App.multiply(5, 5), 0);
    }

    @Test
    public void testDivision() {
        assertEquals(2, App.divide(10, 5), 0);
    }

    @Test
    public void testSquareRoot() {
        assertEquals(2, App.squareRoot(4), 0);
    }

    @Test
    public void testPower() {
        assertEquals(8, App.power(2, 3), 0);
    }

    @Test
    public void testSine() {
        assertEquals(0.5, App.sin(30), 0.01);
    }

    @Test
    public void testCosine() {
        assertEquals(0.5, App.cos(60), 0.01);
    }

    @Test
    public void testTangent() {
        assertEquals(1, App.tan(45), 0.01);
    }

    @Test
    public void testLogarithm() {
        assertEquals(2, App.log(100), 0);
    }
}
