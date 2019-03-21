public interface IDecorationFactory {
    public IDecoration create(IDecorationRenderer dr, PImage image, float x, float y);
}

public class DecorationFactory implements IDecorationFactory {
    public IDecoration create(IDecorationRenderer dr, PImage image, float x, float y) {
        IDecoration d = new Decoration(dr);
        IPosition pos = new Position(x, y);
        d.setPosition(pos);
        d.setImage(image);
        return d;
    }
}