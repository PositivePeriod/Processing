int seed = 0;
int canvasSize = 1000;
int fps = 60;

// DrawingGray drawing;
// DrawingFall drawing;
// DrawingSummer drawing;
// DrawingSpring drawing;
DrawingWinter drawing;

public void settings() {
    noiseSeed(seed);
    size(canvasSize, canvasSize);
}

public void setup() {
    frameRate(fps);
    // drawing = new DrawingGray(2000, "WalkerDrawing - Gray");
    // drawing = new DrawingFall(2000, "WalkerDrawing - Fall");
    // drawing = new DrawingSummer(2000, "WalkerDrawing - Summer");
    // drawing = new DrawingSpring(2000, "WalkerDrawing - Spring");
    drawing = new DrawingWinter(2000, "WalkerDrawing - Winter");
    drawing.init();
}

public void draw() {
    drawing.draw();
}