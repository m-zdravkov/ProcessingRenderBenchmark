public abstract class Test implements ITest {
    protected int timeStarted;
    protected ITestSpecification ts;

    public Test(ITestSpecification ts) {
        this.ts = ts;
    }

    public void prepare() {

    }
    
    public void run() {
        timeStarted = millis();
    }

    public int getTime() {
        return millis() - timeStarted;
    }

    public String getDescription() {
        return "No test description";
    }
}