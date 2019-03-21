import java.util.*;

public interface ITestSpecification {
    public Object get(String detail);
    public void specify(String detail, Object obj);
    public void print();
}

public class TestSpecification implements ITestSpecification {
    private Map<String, Object> details;

    public TestSpecification() {
        details = new HashMap<String, Object>();
    }

    public Object get(String detail) {
        return details.get(detail);
    }

    public void specify(String detail, Object obj) {
        details.put(detail, obj);
    }

    public void print() {
        println("Test specification:");
        String str = null;
        for (String key : details.keySet()) {
            println(String.format("Detail '%12s' = '%32s' : %s", key, details.get(key).toString(), details.get(key).getClass().getName()));
        }
    }
}