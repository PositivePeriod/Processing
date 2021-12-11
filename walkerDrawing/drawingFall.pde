class DrawingFall extends Drawing {
    private int sqrtNum;
    DrawingFall(int numWalker, String saveName) {
        super(numWalker, saveName);
        sqrtNum = ceil(pow(num, 0.5));
        colorMode(RGB, 2*sqrtNum);
        background(sqrtNum, sqrtNum, 0);
    }
    
    protected color colorFunc(int i) {
        return color(sqrtNum+floor(i / sqrtNum), sqrtNum+floor(i % sqrtNum), 0);
    }
}