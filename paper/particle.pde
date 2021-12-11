class Particle{
    private PVector prevPos, pos, vel;
    private float m = 100;
    private float maxSpeed = 10;
    private float boundary = 10;

    Particle() {
        reset();
    }
    Particle(float mass, float speed) {
        m = mass;
        maxSpeed = speed;
        reset();
    }

    public void draw() {
        pushStyle();
        stroke(0, 0, 0, 10);
        strokeWeight(1);
        line(pos.x, pos.y, prevPos.x, prevPos.y);
        popStyle();
    }

    public void move() {
        prevPos = pos.copy();
        vel.add(acc);
        vel.limit(maxSpeed);
        pos.add(vel);
        acc.mult(0);
        checkBoundary();
    }

    public void applyForce(PVector force) {
        acc.add(force.div(m));
    }

    private void checkBoundary() {
        if (pos.x > width + boundary) {
            pos.x = pos.x % width;
            collideWall();
        }
        if (pos.x < 0 - boundary) {
            pos.x = pos.x % width;
            pos.x = width;
            collideWall();
        }
        if (pos.y > height + boundary) {
            pos.y = pos.y % height;
            collideWall();
        }
        if (pos.y < 0 - boundary) {
            pos.y = pos.y % height;
            collideWall();
        }
    }

    private void collideWall() {
        // prevPos = pos.copy();
        // vel.mult(0);
        // acc.mult(0);
        reset();
    }

    private void reset() {
        switch (int(random(4))) {
            case 0: 
                pos = new PVector(random(width), 0);
                break;
            case 1: 
                pos = new PVector(random(width), height);
                break;
            case 2: 
                pos = new PVector(0, random(height));
                break;
            case 3:
                pos = new PVector(width, random(height));
                break;
        }
        prevPos = pos.copy();
        vel = new PVector(0, 0);
    }
}