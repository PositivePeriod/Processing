class DrawingWinter extends Drawing {
    private int sqrtNum;
    DrawingWinter(int numWalker, String saveName) {
        super(numWalker, saveName);
        sqrtNum = ceil(pow(num, 0.5));
        colorMode(RGB, 2*sqrtNum);
        background(sqrtNum, sqrtNum, 2*sqrtNum);
    }

    protected color colorFunc(int i) {
        return color(sqrtNum*0.5+floor(i / sqrtNum), sqrtNum*0.5+floor(i / sqrtNum), sqrtNum+floor(i % sqrtNum));
    }
}