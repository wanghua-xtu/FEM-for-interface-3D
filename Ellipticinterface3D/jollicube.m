function jollicube()
    % 定义高斯函数
    s = 1.5;
    g = @(x,y,z) exp(-(x.^2+y.^2+z.^2)/(2*s^2));

    % 定义球形函数
    r = 2;
    h = @(x,y,z) r - sqrt(x.^2+y.^2+z.^2);

    % 定义stick函数
    D1 = 0.5;
    D2 = 2.5;
    d = @(x,y,z) sqrt((x-1).^2 + y.^2 + z.^2) + sqrt((x+1).^2 + y.^2 + z.^2);
    f1 = @(x,y,z) 1 - max(0, d(x,y,z) - D1) ./ (D2 - D1);

    % 定义ball函数
    f2 = @(x,y,z) g(x,y,z) .* h(x,y,z);

    % 定义外层函数
    T = 0.1;
    f3 = @(x,y,z) max(-f1(-(x+y+z),z,y+x), ...
                      max(-f1(x-y-z,z,y-x), ...
                      max(-f1(x+y-z,-z,y-x), ...
                      f2(x,y,z) - T)));

    % 定义绘制范围
    xrange = linspace(-4, 4, 20);
    yrange = linspace(-4, 4, 20);
    zrange = linspace(-4, 4, 20);
    [X, Y, Z] = meshgrid(xrange, yrange, zrange);

    % 计算水平集函数值
    F = f3(X, Y, Z);

    % 绘制3D模型
    figure;
    isoValue = 4;
    h =  patch(isosurface(X, Y, Z, F, isoValue));
    set(h,'facecolor',[0.5 0.9 0.45],'edgecolor','k')
    camlight('right');
    lighting('phong');
    axis equal;
    title('JolliCube');
end