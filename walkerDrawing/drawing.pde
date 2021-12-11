class Drawing{
    protected int num;
    protected Walker[] walkers;
    protected int t = 0;
    protected int maxT = 2000;
    protected String name;

    Drawing(int numWalker, String saveName) {
        num = numWalker;
        name = saveName;
    }
    
    protected color colorFunc(int i) {
        return color(256, 256, 256);
    }

    public void init() {
        walkers = new Walker[num];
        for (int i = 0; i < walkers.length; i++) {
            walkers[i] = new Walker(colorFunc(i));
        }
    }

    public void draw() {
        //background(0,0,0);
        for (int i = 0; i < walkers.length; i++) {
            walkers[i].move();
            walkers[i].draw();
        }
        t++;
        surface.setTitle("draw/"+name+".png | "+str(t)+" / "+str(maxT));
        if (t == maxT) {
            save("draw/"+name+".png");
            noLoop();
        }
    }
}