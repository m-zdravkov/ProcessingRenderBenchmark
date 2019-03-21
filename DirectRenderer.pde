public class DirectRenderer extends Renderer {
    ITestSpecification ts;

    public DirectRenderer(ITestSpecification ts) {
        super();
        this.ts = ts;
    }

    public void prepare() {
        getSpecifiedValues();
    }

    public void draw() {
        for (int i = 0; i < n; i++) {
            image(image, 0 ,0);
        }
    }
}