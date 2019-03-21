public class ParameterTest extends Test implements ITest {
    ITestSpecification ts;
    ParameterRenderer pr;

    public ParameterTest(ITestSpecification ts) {
        super(ts);
        this.ts = ts;
        pr = new ParameterRenderer(ts);
    }

    public String getDescription() {
        return "Render by passing the object's parameters in method";
    }

    public void prepare() {
        pr.prepare();
    }

    public void run() {
        super.run();
        pr.draw();
    }
}