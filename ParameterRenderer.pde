public class ParameterRenderer extends Renderer {
    ITestSpecification ts;

    public ParameterRenderer(ITestSpecification ts) {
        super();
        this.ts = ts;
    }

    public void prepare() {
        super.prepare();

        IDecorationRenderer dr = new DecorationParameterRenderer();
        IDecorationFactory factory = new DecorationFactory();
        
        for (int i = 0; i < super.n ; i++) {
            super.decorations.add(factory.create(dr, image, 0, 128));
        }
    }

    public void draw() {
        for (IDecoration d : super.decorations) {
            d.draw();
        }
    }
}