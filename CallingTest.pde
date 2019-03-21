public class CallingTest extends Test implements ITest {
    ITestSpecification ts;
    CallingRenderer cr;

    public CallingTest(ITestSpecification ts) {
        super(ts);
        this.ts = ts;
        cr = new CallingRenderer(ts);
    }

    public String getDescription() {
        return "Render by calling back to the object's parameters";
    }

    public void prepare() {
        cr.prepare();
    }

    public void run() {
        super.run();
        cr.draw();
    }
}