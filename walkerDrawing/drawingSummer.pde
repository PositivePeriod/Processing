class DrawingSummer extends Drawing {
    private int sqrtNum;
    DrawingSummer(int numWalker, String saveName) {
        super(numWalker, saveName);
        sqrtNum = ceil(pow(num, 0.5));
        colorMode(RGB, 2*sqrtNum);
        background(0, sqrtNum, sqrtNum);
    }

    protected color colorFunc(int i) {
        return color(0, sqrtNum+floor(i / sqrtNum), sqrtNum+floor(i % sqrtNum));
    }
}