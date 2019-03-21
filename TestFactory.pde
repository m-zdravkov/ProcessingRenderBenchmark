public class TestFactory implements ITestFactory {
    private ITestSpecification ts;
    private Map<TestType, String> testClasses;

    public TestFactory(ITestSpecification ts) {
        this.ts = ts;
        this._mapTestClasses();
    }

    private void _mapTestClasses() {
        testClasses = new HashMap<TestType, String>();
        testClasses.put(TestType.MAX, MaxTest.class.getName());
        testClasses.put(TestType.DIRECT, DirectTest.class.getName());
        testClasses.put(TestType.CALLING, CallingTest.class.getName());
        testClasses.put(TestType.PARAMETER, ParameterTest.class.getName());
        testClasses.put(TestType.TRANSLATION, TranslationTest.class.getName());
    }

    public ITest create(TestType type) {
        String testName = this.testClasses.get(type);
        try {
            return
                (ITest) Class.forName(testName)
                    .getConstructor(RendererBenchmark.class, ITestSpecification.class)
                    .newInstance(new Object[] {RendererBenchmark.instance, ts});
        } catch (ClassNotFoundException e) {
            println(e.getMessage());
            throw new IllegalArgumentException(
                String.format(
                    "Test type %s is undefined in %s. Please define an instantiation behavior.",
                    type.toString(),
                    this.getClass().getName()
                )
            );
        }
        // Manage bullshit checked exceptions
        catch (NoSuchMethodException e) {
            throw new IllegalStateException(e.toString());
        } catch (InstantiationException e) {
            throw new IllegalStateException(e.toString());
        } catch (IllegalAccessException e) {
            throw new IllegalStateException(e.toString());
        } catch (java.lang.reflect.InvocationTargetException e) {
            throw new IllegalStateException(e.toString());
        }
    }
}