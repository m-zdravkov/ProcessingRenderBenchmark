/**
 * A decoration is an object in the world, which holds positional information,
 * but not collision data. For collisions, use a prop.
 */

public interface IDecoration {
    public IPosition getPosition();
    public void setPosition(IPosition position);
    public float getX();
    public float getY();
    public float getAngle();
    public void setAngle(float rad);
    public PImage getImage();
    public void setImage(PImage image);
    public void draw();
}


public class Decoration implements IDecoration {
    private IPosition position;
    private float angle;
    private PImage image;
    private IDecorationRenderer renderer;

    public Decoration(IDecorationRenderer renderer) {
        this.renderer = renderer;
    }

    public IPosition getPosition() {
        return position;
    }

    public void setPosition(IPosition position) {
        this.position = position;
    }

    public float getX() {
        return position.getX();
    }

    public float getY() {
        return position.getY();
    }

    public float getAngle() {
        return this.angle;
    }

    public void setAngle(float angle) {
        this.angle = angle;
    }

    public PImage getImage() {
        return image;
    }

    public void setImage(PImage image) {
        this.image = image;
    }

    public void draw() {
        if (renderer instanceof DecorationCallingRenderer
         || renderer instanceof DecorationTranslationRenderer)
            renderer.draw(this);
        else if (renderer instanceof DecorationParameterRenderer)
            renderer.draw(image, position.getX(), position.getY());
        else
            throw new IllegalStateException(
                String.format("Decoration doesn't have a valid renderer declared (instanceof %s)", this.renderer.getClass().getName())
            );
    }
}

public interface IDecorationRenderer {
    public void draw(IDecoration d);
    public void draw(PImage image, float x, float y);
}

public class DecorationCallingRenderer implements IDecorationRenderer {
    public void draw(IDecoration d) {
        image(d.getImage(), d.getX(), d.getY());
    }

    public void draw(PImage image, float x, float y) {
        // N/A
    }
}

public class DecorationTranslationRenderer implements IDecorationRenderer {
    public void draw(IDecoration d) {
        pushMatrix();
        translate(d.getX(), d.getY());
        rotate(d.getAngle());
        image(d.getImage(), 0, 0);
        popMatrix();
    }

    public void draw(PImage image, float x, float y) {
        // N/A
    }
}

public class DecorationParameterRenderer implements IDecorationRenderer {
    public void draw(IDecoration d) {
        // N/A
    }

    public void draw(PImage image, float x, float y) {
        image(image, x, y);
    }
}