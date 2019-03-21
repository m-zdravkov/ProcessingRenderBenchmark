public class DirectTest extends Test implements ITest {
    ITestSpecification ts;
    DirectRenderer dr;

    public DirectTest(ITestSpecification ts) {
        super(ts);
        this.ts = ts;
        dr = new DirectRenderer(ts);
    }

    public String getDescription() {
        return "Direct rendering: control test";
    }

    public void prepare() {
        dr.prepare();
    }

    public void run() {
        super.run();
        dr.draw();
    }
}