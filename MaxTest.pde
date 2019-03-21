public class MaxTest extends Test implements ITest {
    ITestSpecification ts;

    public MaxTest(ITestSpecification ts) {
        super(ts);
        this.ts = ts;
    }

    public String getDescription() {
        return "Max framerate: control test";
    }
}