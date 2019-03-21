public class TranslationTest extends Test implements ITest {
    ITestSpecification ts;
    TranslationRenderer tr;

    public TranslationTest(ITestSpecification ts) {
        super(ts);
        this.ts = ts;
        tr = new TranslationRenderer(ts);
    }

    public String getDescription() {
        return "Render by translating and rotating the object manually";
    }

    public void prepare() {
        tr.prepare();
    }

    public void run() {
        super.run();
        tr.draw();
    }
}