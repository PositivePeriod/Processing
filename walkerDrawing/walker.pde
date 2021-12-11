class Walker{
    float size;
    PVector pos;
    color rgb;
    PVector v;
    
    Walker(color rgb_) {
        size = random(0.5, 1);
        pos = new PVector(random(0, width),random(0,height));
        rgb = rgb_;
        float speed = size * random(0.5, 1);
        v = new PVector(speed, 0);
        v.rotate(random(0, TWO_PI));
    }
    
    void draw() {
        pushStyle();
        noStroke();
        fill(rgb);
        ellipse(pos.x, pos.y, 2*size, 2*size);
        popStyle();
    }
    
    void move() {
        float rotateRV = random(0, 1);
        if (rotateRV < 0.1) {
            v.rotate(random( -0.03, 0.03) * PI);
        } else if (0.1 <= rotateRV && rotateRV < 0.12) {
            v.rotate(random( -0.15, 0.15) * PI);
        }
        pos = pos.add(v);
        reflectWall();
    }
    
    void reflectWall() {
        if (!(size <= pos.x && pos.x <= width - size)) {
            v.x *= -1;
            if (pos.x > width - size) {
                pos.x = width - size;
            } else if (pos.x < size) {
                pos.x = size;
            }
        } else if (!(size <= pos.y && pos.y <= height - size)) {
            v.y *= -1;
            if (pos.y > height - size) {
                pos.y = height - size;
            } else if (pos.y < size) {
                pos.y = size;
            }
        }   
    }
}
