class DrawingGray extends Drawing {
    DrawingGray(int numWalker, String saveName) {
        super(numWalker, saveName);
        colorMode(RGB, num);
        background(num/2, num/2, num/2);
    }
    
    protected color colorFunc(int i) {
        return color(i);
    }
}