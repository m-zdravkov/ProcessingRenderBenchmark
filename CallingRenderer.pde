public class CallingRenderer extends Renderer {
    ITestSpecification ts;

    public CallingRenderer(ITestSpecification ts) {
        super();
        this.ts = ts;
    }

    public void prepare() {
        super.prepare();

        IDecorationRenderer dr = new DecorationCallingRenderer();
        IDecorationFactory factory = new DecorationFactory();
        
        for (int i = 0; i < super.n ; i++) {
            super.decorations.add(factory.create(dr, image, 128, 0));
        }
    }

    public void draw() {
        for (IDecoration d : super.decorations) {
            d.draw();
        }
    }
}