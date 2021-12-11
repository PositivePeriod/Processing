int seed = 0;
int canvasSize = 800;
int fps = 120;

Drawing drawing;

public void settings() {
    noiseSeed(seed);
    size(canvasSize, canvasSize);
}

public void setup() {
    frameRate(fps);
    drawing = new Drawing(1000, "FlowField");
    drawing.init();
}

public void draw() {
    drawing.draw();
}