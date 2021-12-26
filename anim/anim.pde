float t = 0;
float size = min(width, height) * 0.8;
Shape[] shapes;
Morph morph;

void setup() {
    size(500, 500);
    background(0);

    int num = 9;
    shapes = new Shape[num];
    for (int i = 0; i < num; ++i) {
        shapes[i] = shapeCircle(3+i, new PVector(0, 0), size);
    }
    shapes[5] = shapeRect(9, new PVector(0,0), size, size);

    morph = new Morph(shapes);
}

void draw() {
    fill(0);
    rect(0, 0, width, height);

    stroke(255);
    strokeWeight(4);
    noFill();
    translate(width/2, height/2);
    morph.render(t);
    t += 0.01;
}

class Morph {
    int num;
    Shape[] startShapes, endShapes;

    Morph(Shape[] shapes) {
        num = shapes.length;
        startShapes = new Shape[num];
        endShapes = new Shape[num];
        for (int i = 0; i < num; ++i) {
            Shape s0 = shapes[i];
            Shape s1 = i+1 < num ? shapes[i+1] : shapes[0];
            startShapes[i] = s0.extend(max(s0.num, s1.num));
            endShapes[i] = s1.extend(max(s0.num, s1.num));
        }
    }

    void render(float time) {
        float t = time % num;
        Shape s = startShapes[floor(t)].interpolate(endShapes[floor(t)], t-floor(t));
        s.render();
    }
}