import java.util.Arrays;
import java.util.Comparator;

public Shape shapePoly(int num, PVector pos, PVector[] vertices) {
    assert vertices.length <= num;
    PVector[] points = new PVector[num];
    int multiple = num / vertices.length;
    int rest = num % vertices.length;

    float[][] indexLengthNum = new float[vertices.length][3];
    for (int i = 0; i < vertices.length; ++i) {
        indexLengthNum[i][0] = i;
        PVector p0 = vertices[i];
        PVector p1 = i+1 < vertices.length ? vertices[i+1] : vertices[0];
        indexLengthNum[i][1] = PVector.dist(p0, p1);
    }
    
    java.util.Arrays.sort(indexLengthNum, Comparator.comparingDouble(o -> -o[2]));
    for (int i = 0; i < rest; ++i) { indexLengthNum[i][2] = multiple + 1; }
    for (int i = rest; i < vertices.length; ++i) { indexLengthNum[i][2] = multiple; }
    java.util.Arrays.sort(indexLengthNum, Comparator.comparingDouble(o -> o[0]));

    int index = 0;
    for (int i = 0; i < vertices.length; ++i) {
        PVector p0 = vertices[i];
        PVector p1 = i+1 < vertices.length ? vertices[i+1] : vertices[0];
        for (int j = 0; j < indexLengthNum[i][2]; ++j) {
            points[index++] = PVector.lerp(p0, p1, (float)j / indexLengthNum[i][2]);
        }
    }
    for (PVector p : points) { p.add(pos); }
    assert index == num;
    return new Shape(points);
}

public Shape shapeRect(int num, PVector pos, float w, float h) {
    PVector[] vertices = {
        new PVector(-w/2, -h/2), new PVector(w/2, -h/2),
        new PVector(w/2, h/2), new PVector(-w/2, h/2)
    };
    return shapePoly(num, pos, vertices);
}

public Shape shapeCircle(int num, PVector pos, float rad) {
    PVector[] points = new PVector[num];
    for (int i = 0; i < num; ++i) {
        float angle = (float)i / num * TWO_PI;
        points[i] = PVector.add(pos, PVector.fromAngle(angle).setMag(rad));
    }
    return new Shape(points);
}