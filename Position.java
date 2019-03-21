public class Position implements IPosition {
    private float x,y;

    public Position(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public float getX() {
        return this.x;
    }

    public float getY() {
        return this.y;
    }

    public void setX(float x) {
        this.x = x;
    }

    public void setY(float y) {
        this.y = y;
    }

    public void add(IPosition p) {
        this.x += p.getX();
        this.y += p.getY();
    }

    public void subtract(IPosition p) {
        this.x -= p.getX();
        this.y -= p.getY();
    }

    public void translate(float x, float y) {
        this.x += x;
        this.y += y;
    }

    public void set(float x, float y) {
        this.x = x;
        this.y = y;
    }
}