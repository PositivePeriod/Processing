class DrawingSpring extends Drawing {
    private int sqrtNum;
    DrawingSpring(int numWalker, String saveName) {
        super(numWalker, saveName);
        sqrtNum = ceil(pow(num, 0.5));
        colorMode(RGB, 2*sqrtNum);
        background(sqrtNum, 0, sqrtNum/2);
    }
    
    protected color colorFunc(int i) {
        return color(sqrtNum+floor(i / sqrtNum), floor(i % sqrtNum), sqrtNum/2+floor(i / sqrtNum));
    }
}