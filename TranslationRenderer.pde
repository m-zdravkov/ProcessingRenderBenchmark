public class TranslationRenderer extends Renderer {
    ITestSpecification ts;

    public TranslationRenderer(ITestSpecification ts) {
        super();
        this.ts = ts;
    }

    public void prepare() {
        super.prepare();

        IDecorationRenderer dr = new DecorationTranslationRenderer();
        IDecorationFactory factory = new DecorationFactory();
        
        for (int i = 0; i < super.n ; i++) {
            super.decorations.add(factory.create(dr, image, 128, 128));
        }
    }

    public void draw() {
        for (IDecoration d : super.decorations) {
            d.draw();
        }
    }
}