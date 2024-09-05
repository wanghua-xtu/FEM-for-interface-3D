function distance = point_triangle_distance(point, triangle)
    normal = cross(triangle(2,:) - triangle(1,:), triangle(3,:) - triangle(1,:));
    normal = normal / norm(normal);
    distance = abs(dot(normal, point - triangle(1,:)));
end