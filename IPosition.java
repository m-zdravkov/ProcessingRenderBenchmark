public interface IPosition {
    public float getX();
    public float getY();
    public void setX(float x);
    public void setY(float y);
    public void add(IPosition p);
    public void subtract(IPosition p);
    public void translate(float x, float y);
    public void set(float x, float y);
}