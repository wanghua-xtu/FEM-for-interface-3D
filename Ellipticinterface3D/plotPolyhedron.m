function plotPolyhedron(x,y,z)
shp=alphaShape(x,y,z);
shp.Alpha=20*max([max(x)-min(x),max(y)-min(y),max(z)-min(z)])/2;
[elements,nodes]=boundaryFacets(shp);
normalvec=zeros(size(elements));
for k=1:size(elements,1)
    normalvec(k,:)=cross(nodes(elements(k,2),:)-nodes(elements(k,1),:),nodes(elements(k,3),:)-nodes(elements(k,1),:));
end
faceNear=nchoosek(1:size(elements,1),2);
figure
hold on
trisurf(elements,nodes(:,1),nodes(:,2),nodes(:,3),'FaceColor',[1 1 1]*0.9,'FaceAlpha',0.5,'EdgeColor','none');
for k=1:size(faceNear,1)
    isEdge=ismember(elements(faceNear(k,1),:),elements(faceNear(k,2),:));
    if sum(isEdge)>1 && vecnorm(cross(normalvec(faceNear(k,1),:),normalvec(faceNear(k,2),:)),1)/(vecnorm(normalvec(faceNear(k,1),:),1)*vecnorm(normalvec(faceNear(k,2),:),1))>1e-6
        plot3(nodes(elements(faceNear(k,1),isEdge),1),nodes(elements(faceNear(k,1),isEdge),2),nodes(elements(faceNear(k,1),isEdge),3),'Color','k');
    end
end
axis equal
view(3)
hold off
end