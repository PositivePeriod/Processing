class Drawing{
    protected Particle[] particles;
    protected int t = 0;
    protected int maxT = 1000;
    protected String name;

    Drawing(int numParticle, String saveName) {
        particles = new Particle[numParticle];
        name = saveName;
    }

    public void init() {
        background(255, 255, 255);
        for (int i = 0; i < particles.length; i++) {
            particles[i] = new Particle();
        }
    }

    public void draw() {
        //background(0,0,0);
        for (int i = 0; i < particles.length; i++) {
            PVector force = perlinField(particles[i].pos);
            particles[i].applyForce(force);
            particles[i].move();
            particles[i].draw();
        }
        t++;


        surface.setTitle("draw/"+name+".png | "+str(t)+" / "+str(maxT));
        if (t == maxT) {
            save("draw/"+name+".png");
            noLoop();
        }
    }

    protected float smoothness = 0.1;
    protected float fieldGridSize = 30;

    public PVector perlinField(PVector pos) {
        int x = floor(pos.x / fieldGridSize);
        int y = floor(pos.y / fieldGridSize);
        float angle = noise(x * smoothness, y * smoothness) * TWO_PI;
        return PVector.fromAngle(angle);
    }
}