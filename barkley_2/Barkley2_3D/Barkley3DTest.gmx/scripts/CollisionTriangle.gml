//read the vertexes
global.px[global.pointCount] = argument[0];
global.py[global.pointCount] = argument[1];
global.pz[global.pointCount] = argument[2];
global.trianglePoint[global.triangleCount, 0] = global.pointCount;
global.pointCount += 1;
global.px[global.pointCount] = argument[3];
global.py[global.pointCount] = argument[4];
global.pz[global.pointCount] = argument[5];
global.trianglePoint[global.triangleCount, 1] = global.pointCount;
global.pointCount += 1;
global.px[global.pointCount] = argument[6];
global.py[global.pointCount] = argument[7];
global.pz[global.pointCount] = argument[8];
global.trianglePoint[global.triangleCount, 2] = global.pointCount;
global.pointCount += 1;


//get the triangles points
a = global.trianglePoint[global.triangleCount, 0];
b = global.trianglePoint[global.triangleCount, 1];
c = global.trianglePoint[global.triangleCount, 2];
                
normal(global.px[a], global.py[a], global.pz[a], global.px[b], global.py[b], global.pz[b], global.px[c], global.py[c], global.pz[c]);
                
global.triangleNormalX[global.triangleCount] = rx;
global.triangleNormalY[global.triangleCount] = ry;
global.triangleNormalZ[global.triangleCount] = rz;
                
global.triangleCount += 1;
