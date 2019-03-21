ITest event;
ITest iterative;
ITest direct;
ITest max;
boolean test;
boolean exitOnTest = false;
ITestSpecification ts = new TestSpecification();
int delayBeforeTest = 60;
ITest[] tests;
ITestFactory tf;

public static RendererBenchmark instance;

void settings() {
    size(640, 480);
    
    instance = this;

    ts = new TestSpecification();
    prepareSpecification(ts);

    tf = new TestFactory(ts);

    tests = new ITest[] {
        tf.create(TestType.MAX),
        tf.create(TestType.DIRECT),
        tf.create(TestType.CALLING),
        tf.create(TestType.PARAMETER),
        tf.create(TestType.TRANSLATION)
    };

    test = true;
}

public void keyPressed() {
    switch (key) {
        case 't':
            test = true;
            println("Testing again.");
        break;
        case 'q':
        case (char)27:
            println("User requested exit.");
            exit();
        break;
    }
}

void draw() {
    if (test) {
        if (delayBeforeTest <= 0) {
            test = false;

            ts.print();

            println("Test results:");
            for (ITest test : tests) {
                test.prepare();
                test.run();
                logTime(test);
            }
            println("No more tests");

            if (exitOnTest) {
                exit();
            }
        } else {
            delayBeforeTest--;
        }
    }
}

void logTime(ITest test) {
    int ms = test.getTime();
    println(String.format("%04d ms | elapsed for %56s => %10f fps %32s", ms, test.getDescription(), 1000. / ms, test.getClass().getName()));
}

void prepareSpecification(ITestSpecification ts) {
    PImage image = loadImage("res/image.png");
    Integer n = new Integer(200000);

    ts.specify("image", image);
    ts.specify("n", n);
}