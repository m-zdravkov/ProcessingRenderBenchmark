public abstract class Renderer {
    // Specified values
    protected PImage image;
    protected Integer n;
    protected List<IDecoration> decorations;

    public Renderer() {
        // img = loadImage("res/image.png");
    }

    protected void prepare() {
        getSpecifiedValues();

        decorations = new ArrayList<IDecoration>();
    }

    protected void getSpecifiedValues() {
        image = (PImage)ts.get("image");
        n = (int)ts.get("n");
    }
}