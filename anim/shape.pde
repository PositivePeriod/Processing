class Shape {
    public PVector[] points;
    public int num;
    Shape(PVector[] points) {
        this.points = points;
        this.num = points.length;
    }
    
    public Shape extend(int num) {
        assert this.num <= num;
        if (this.num == num) {
            return this;
        }
        PVector[] transPoints = new PVector[num];
        int multiple = num / this.num;
        int index = 0;
        for (int i = 0; i < this.num; ++i) {
            PVector p0 = points[i];
            PVector p1 = i+1 < this.num ? points[i+1] : points[0];
            int maxJ = multiple + (i < num % this.num ? 1 : 0);
            for (int j = 0; j < maxJ; ++j) {
                transPoints[index++] = PVector.lerp(p0, p1, (float)j / maxJ);
            }
        }
        assert index == num;
        return new Shape(transPoints);
    }

    public void render() {
        beginShape();
        for (PVector p : points) {
            vertex(p.x, p.y);
        }
        endShape(CLOSE);
    }

    public Shape interpolate(Shape s, float t) {
        assert num == s.num;
        PVector[] interPoints = new PVector[num];
        for (int i = 0; i < num; ++i) {
            interPoints[i] = PVector.lerp(points[i], s.points[i], t);
        }
        return new Shape(interPoints);
    }
}