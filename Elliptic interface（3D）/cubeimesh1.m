%function  T = cubeimesh1(cube,h,example,r)
%% CUBEIMESH a uniform mesh of a cube within an interface
%
% T = cubeimesh([x0,x1,y0,y1,z0,z1],h) enerates a hybrid mesh
% of the cube [x0,x1]*[y0,y1]*[z0,z1] within an interface at mesh size h
%
% Example
 cube = [-1 1 -1 1 -1 1]; 
% % cube = [-2 2 -2 2 -2 2];
% % %cube = [-3 3 -3 3 -3 3]; 
  r = 1/5; example = uint8(1); h = 1/2;


x0 = cube(1); x1 = cube(2); 
y0 = cube(3); y1 = cube(4);
z0 = cube(5); z1 = cube(6);

[x,y,z] = ndgrid(x0:h:x1,y0:h:y1,z0:h:z1);
node = [x(:),y(:),z(:)];
N = size(node,1);

%% generate elements
ni = size(x,1); %Number of partition points in the x-axis direction
nj = size(x,2); %Number of partition points in the y-axis direction
nk = size(x,3); %Number of partition points in the z-axis direction

nodeidx = (1:N)';
%Rxyzbdnode =   node(:,1)==x1 | node(:,2)==y1 | node(:,3)==z1; 

i1 = (1:(ni-1))'; i2 = repmat(i1,nj-1,1); i3 = repmat(i2,nk-1,1);
j1 = (1:(nj-1)); j2 = repmat(j1,ni-1,1); j2 = j2(:); j3 = repmat(j2,nk-1,1);
k1 = 1:(nk-1); k3 = repmat(k1,(ni-1)*(nj-1),1); k3 = k3(:);
%cubeijk = [i3,j3,k3];%立方体左下角顶点编号为(i,j,k)
t = (k3-1)*ni*nj+(j3-1)*ni+i3;% 立方体左下角顶点编号
cubeelem = [t t+1 t+ni+1 t+ni t+ni*nj t+ni*nj+1 t+ni*nj+ni+1 t+ni*nj+ni];
elem = [cubeelem(:,[1 2 3 7]);cubeelem(:,[1 2 7 6]);cubeelem(:,[1 6 7 5]);...
        cubeelem(:,[1 3 4 7]);cubeelem(:,[1 7 4 8]);cubeelem(:,[1 7 8 5])];

  
%cubenum = size(cubeelem,1);
%showmesh3(node,elem((1:cubenum)+5*cubenum,:));
elemnum = size(elem,1);
%% generate edge
%elem2edge&edge2elem
%将边按照方向分为7类
Rxbdnode = node(:,1)==x1; kk1 = nodeidx(~Rxbdnode);
edge1 = [kk1 kk1+1];
edge1num = size(edge1,1);
%edge1id = 1:edge1num; 

Rybdnode = node(:,2)==y1; kk2 = nodeidx(~Rybdnode);
edge2 = [kk2 kk2+ni];
edge2num = size(edge2,1);
edge2id = edge1num+(1:edge1num); 

Rzbdnode = node(:,3)==z1; kk3 = nodeidx(~Rzbdnode);
edge3 = [kk3 kk3+ni*nj];
edge3num = size(edge3,1);
edge3id = edge1num+edge2num+(1:edge3num); 

kk4 = nodeidx(~(Rxbdnode | Rybdnode)); 
edge4 = [kk4 kk4+ni+1];
edge4num = size(edge4,1);
edge4id = edge1num+edge2num+edge3num+(1:edge4num); 

kk5 = nodeidx(~(Rxbdnode | Rzbdnode));
edge5 = [kk5 kk5+ni*nj+1];
edge5num = size(edge5,1);
edge5id = edge1num+edge2num+edge3num+edge4num+(1:edge5num); 

kk6 = nodeidx(~(Rybdnode | Rzbdnode));
edge6 = [kk6 kk6+ni*nj+ni];
edge6num = size(edge6,1);
edge6id = edge1num+edge2num+edge3num+edge4num+edge5num+(1:edge6num); 

edge7 = [t  t+ni*nj+ni+1];
edge7num = size(edge7,1);
edge7id = edge1num+edge2num+edge3num+edge4num+edge5num+edge6num+(1:edge7num); 

edge = [edge1;edge2;edge3;edge4;edge5;edge6;edge7];
edgenum = size(edge,1);
%% elem2edge

lfe1 = (ni-1)*nj*(k3-1)+(ni-1)*(j3-1)+i3;  
lfe2 = ni*(nj-1)*(k3-1)+ni*(j3-1)+i3;    
lfe2 = edge2id(lfe2)';
lfe3 = ni*nj*(k3-1)+ni*(j3-1)+i3;     
lfe3 = edge3id(lfe3)';
lfe4 = (ni-1)*(nj-1)*(k3-1)+(ni-1)*(j3-1)+i3;  
lfe4 = edge4id(lfe4)';
lfe5 = (ni-1)*nj*(k3-1)+(ni-1)*(j3-1)+i3; 
lfe5 = edge5id(lfe5)';
lfe6 = ni*(nj-1)*(k3-1)+ni*(j3-1)+i3; 
lfe6 = edge6id(lfe6)';
lfe7 = (ni-1)*(nj-1)*(k3-1)+(ni-1)*(j3-1)+i3;
lfe7 = edge7id(lfe7)';

%%%%elem = [cubeelem(:,[1 2 3 7]);cubeelem(:,[1 2 7 6]);cubeelem(:,[1 6 7 5]);...
%%%%        cubeelem(:,[1 3 4 7]);cubeelem(:,[1 7 4 8]);cubeelem(:,[1 7 8 5])];
%local edge [1 2; 2 3; 1 3; 1 4; 2 4; 3 4;]
elem12edge = [lfe1,lfe2+1,lfe4,lfe7,lfe6+1,lfe3+1+ni];
elem22edge = [lfe1,lfe6+1,lfe7,lfe5,lfe3+1,lfe2+1+ni*(nj-1)];
elem32edge = [lfe5,lfe2+1+ni*(nj-1),lfe7,lfe3,lfe1+(ni-1)*nj,lfe4+(ni-1)*(nj-1)];
elem42edge = [lfe4,lfe1+ni-1,lfe2,lfe7,lfe3+ni+1,lfe5+ni-1];
elem52edge = [lfe7,lfe5+ni-1,lfe2,lfe6,lfe1+(ni-1)*(nj+1),lfe3+ni];
elem62edge = [lfe7,lfe1+(ni-1)*(nj+1),lfe6,lfe3,lfe4+(ni-1)*(nj-1),lfe2+ni*(nj-1)];
elem2edge = [elem12edge;elem22edge;elem32edge;elem42edge;elem52edge;elem62edge];
%% Evaluate sign of vertices and find interface elements
phi=@(X)levelset3D(example,X,r);
% % find the sign function of all vertices
phiValue = phi(node);
%phiValue(abs(phiValue) < h^2) = 0;
vSign = msign(phiValue);
p1 = vSign(edge(:,1),:);
p2 = vSign(edge(:,2),:);
cedge = p1.*p2<0; 
edgeid = (1:edgenum)';
cutedgeid = edgeid(cedge);
cutedge = edge(cedge,:);


%isCutEdge = phi(node(edge(:,1),:)).* levelphi(T.node(T.edge(:,2),:))<-exp(-30); 
%除去顶点落在界面上的情形
A = node(cutedge(:,1),:);
B = node(cutedge(:,2),:);
cutnode = findintersectbisect(phi,A,B); % find intersected nodes by interface

cutratioA = sqrt(sum((A-cutnode).*(A-cutnode),2))./sqrt(sum((A-B).*(A-B),2));
cutratioB = 1-cutratioA;
cutratio = zeros(length(node),3);

for i = 1:length(node)
    cutratio(cutedge(:,1),:) = 
end
    
%cutratioB = sqrt(sum((cutnode-B).*(cutnode-B),2))./sqrt(sum((A-B).*(A-B),2));

node = [node;cutnode]; %更新node
vSign((N+1):size(node,1)) = zeros(size(cutnode,1),1);
%cutnodenum = size(cutnode,1); %注意界面交于顶点的时候，顶点没有记在cutnode中
cutnodeidx = [(length(node)-length(cutnode)+1):length(node),unique(cutedge)'];
%% boundary nodes
bdnodeidx =  node(:,1)==x0 | node(:,1)==x1 |...
          node(:,2)==y0 | node(:,2)==y1 |...
          node(:,3)==z0 | node(:,3)==z1;  
%% divide interface element
% find cut element
e2vSign = vSign(elem);     % element to vertices sign
%eta = max(e2vSign,[],2).*min(e2vSign,[],2);
elemid = (1:elemnum)';
iscutelem0  = sum(abs(e2vSign),2) == 1; % 四面体的三个点在界面上
cutelem0id = elemid(iscutelem0);
cutelem0 = elem(cutelem0id,:);
cutElem01 = cutelem0(abs(e2vSign(cutelem0id,1))==1,:);
Iface01 = cutElem01(:,[2 3 4]);
cutElem02 = cutelem0(abs(e2vSign(cutelem0id,2))==1,:);
Iface02 = cutElem02(:,[1 3 4]);
cutElem03 = cutelem0(abs(e2vSign(cutelem0id,3))==1,:);
Iface03 = cutElem03(:,[1 2 4]);
cutElem04 = cutelem0(abs(e2vSign(cutelem0id,4))==1,:);
Iface04 = cutElem04(:,[1 2 3]);
Iface0 = [Iface01;Iface02;Iface03;Iface04];

% elemIdx = zeros(elemnum,1,'int8');
% elemIdx((eta >= 0) & (max(e2vSign,[],2) == 1)) = 1;   % 1: exterior element
% elemIdx((eta >= 0) & (min(e2vSign,[],2) == -1)) = -1; % -1: interior element
% elemIdx(isCutElem) = 0; % 0: interface element

[cm,cmedge]=ismember(elem2edge,cutedgeid,'legacy');
celem = sum(cm,2);
cutelem1id = elemid(celem==1); %tet+tet
cutelem2id = elemid(celem==2); %tet+pyr
cutelem3id = elemid(celem==3); %tet+pri
cutelem4id = elemid(celem==4); %pri+pri
%cutelemid = [cutelem1id;cutelem2id;cutelem3id;cutelem4id];
cutelem1num =length(cutelem1id);
cutelem2num =length(cutelem2id);
cutelem3num =length(cutelem3id);
cutelem4num =length(cutelem4id);
cutelemnum = cutelem1num+cutelem2num+cutelem3num+cutelem4num;
% 将四面体六条边被切与否赋值为0,1，并据此采用2进制转换为十进制（这样表示更简洁）
% 作为切割单元不同情形的分类，然后根据分类分割单元并局部编号
%分割后单元局部编号满足：
%四面体局部编号满足：
%1.局部编号顺序满足右手定则
%（面+顶点：面上的点按食指的方向（放在xoy面上为逆时针），顶点在大拇指方向）
%2.第一个点为原单元的顶点，作变换时，可以直接映射到原点（直角点）
%3.切点在前三个点中（变换后落在xoy面上）,也就是最后一个点为原单元中的顶点
 
%金字塔（五面体）局部编号满足：
%1.右手定则
%2.前两个点为原单元中的顶点，第三第四个点为切点，最后一个点也是原单元中的顶点

%三棱柱（五面体）局部编号满足：
%1.右手定则(自下而上)
%2.类型1：上顶面三个点为切点；类型2：第一个点为非切点，可以映射为直角原点
transmatrix = repmat([1 2 4 8 16 32],cutelemnum,1);
%tet+tet
cutcase1 = [1 2 4 8 16 32];
c1tet1 =  [1 5 3 4;
           2 5 1 4;  
           1 2 5 4;
           1 3 5 2;
           2 1 5 3;
           3 5 1 2];
c1tet2 =  [2 3 5 4;
           3 1 5 4;
           3 5 2 4;
           4 5 3 2;
           4 5 1 3;
           4 1 5 2];
interface1 = [3 4 5; 1 4 5; 2 4 5; 2 3 5; 1 3 5; 1 2 5];

cutnode1id = N + nonzeros(cmedge(cutelem1id,:)');
cutelem1 = [elem(cutelem1id,:),cutnode1id];
cutelem1tet = zeros(2*cutelem1num,4);
Iface1 = zeros(cutelem1num,3);
j0 = 1;
jface0 = 1;
if ~isempty(cutelem1id)
for i = 1:length(cutcase1)
    idxi = sum(cm(cutelem1id,:).*repmat(transmatrix(cutelem1num,:),size(cm(cutelem1id,:),1),1),2)==cutcase1(i);
    j = j0+2*sum(idxi)-1;
    jface = jface0+sum(idxi)-1;
    cutelem1tet(j0:j,:) = [cutelem1(idxi,c1tet1(i,:));cutelem1(idxi,c1tet2(i,:))];
    Iface1(jface0:jface,:) = cutelem1(idxi,interface1(i,:));
    j0 = j+1;
    jface0 = jface+1;
end
end
%tet+pyr
cutcase2 = [3 5 9 17, 6 18 34,  12 36,  24 40, 48];
c2tet = [2 6 5 4;   %3
          1 5 6 4;   %5 
          1 6 5 3;   %9
          2 5 6 3;   %17
          3 6 5 4;   %6 
          2 6 5 1;   %18
          3 5 6 1;   %34
          1 5 6 2;   %12
          3 6 5 2;   %36
          4 6 5 3;   %24
          4 5 6 2;   %40
          4 6 5 1];  %48
c2pyr = [3 1 5 6 4;   %3
          2 3 6 5 4;   %5
          4 2 5 6 3;   %9
          1 4 6 5 3;   %17
          1 2 5 6 4;   %6
          4 3 5 6 1;   %18
          2 4 6 5 1;   %34
          3 4 6 5 2;   %12
          4 1 5 6 2;   %36
          2 1 5 6 3;   %24
          1 3 6 5 2;   %40
          3 2 5 6 1];  %48
interface2 = [4 5 6; 4 5 6; 3 5 6; 3 5 6; 4 5 6; 1 5 6; 1 5 6; 2 5 6; 2 5 6;
              3 5 6; 2 5 6; 1 5 6];

cutnode2id = N + reshape(nonzeros(cmedge(cutelem2id,:)'),2,length(cutelem2id))';
cutelem2 = [elem(cutelem2id,:),cutnode2id];

cutelem2tet = zeros(cutelem2num,4);
cutelem2pyr = zeros(cutelem2num,5);
Iface2 = zeros(cutelem2num,3);
j0 = 1;
if ~isempty(cutelem2id)
for i = 1:length(cutcase2)
    idxi = sum(cm(cutelem2id,:).*repmat(transmatrix(cutelem2num,:),size(cm(cutelem2id,:),1),1),2)==cutcase2(i);
    j = j0+sum(idxi)-1;
    cutelem2tet(j0:j,:) = cutelem2(idxi,c2tet(i,:));
    cutelem2pyr(j0:j,:) = cutelem2(idxi,c2pyr(i,:));
    Iface2(j0:j,:) = cutelem2(idxi,interface2(i,:));
    j0 = j+1;
end
end
%tet+pri     
cutcase3 = [13 19 38 56];  
c3tet = [1 5 6 7; %13
         2 6 5 7; %19
         3 6 5 7; %38
         4 6 5 7]; %56
     
c3pri = [2 4 3 5 7 6;
         1 3 4 5 6 7;
         1 4 2 6 7 5;
         1 2 3 5 6 7];    
interface3 = [5 6 7];
cutnode3id = N +  reshape(nonzeros(cmedge(cutelem3id,:)'),3,length(cutelem3id))';
cutelem3 = [elem(cutelem3id,:),cutnode3id];
cutelem3tet = zeros(cutelem3num,4);
cutelem3pri = zeros(cutelem3num,6);
Iface3 = cutelem3(:,interface3);
j0 = 1;
if ~isempty(cutelem3id)
for i = 1:length(cutcase3)
    idxi = sum(cm(cutelem3id,:).*repmat(transmatrix(cutelem3num,:),size(cm(cutelem3id,:),1),1),2)==cutcase3(i);
    j = j0+sum(idxi)-1;
    cutelem3tet(j0:j,:) = cutelem3(idxi,c3tet(i,:));
    cutelem3pri(j0:j,:) = cutelem3(idxi,c3pri(i,:));
    j0 = j+1;
end
end
%pri+pri
cutcase4 = [30 43 53];
c4pri1 = [1 6 7 2 5 8; %30
          1 7 5 3 8 6; %43
          1 5 6 4 7 8]; %53
c4pri2 = [3 6 5 4 7 8;
          2 6 5 4 8 7;
          2 5 7 3 6 8];
interface4 = [5 6 7 8; 5 6 8 7; 5 6 8 7];
cutnode4id = N + reshape(nonzeros(cmedge(cutelem4id,:)'),4,length(cutelem4id))';
cutelem4 = [elem(cutelem4id,:),cutnode4id];
cutelem4pri = zeros(2*cutelem4num,6);
Iface4 = zeros(cutelem4num,4);
j0 = 1;
jface0 = 1;
if ~isempty(cutelem4id)
for i = 1:length(cutcase4)
    idxi = sum(cm(cutelem4id,:).*repmat(transmatrix(cutelem4num,:),size(cm(cutelem4id,:),1),1),2)==cutcase4(i);
    j = j0+2*sum(idxi)-1;
    cutelem4pri(j0:j,:) = [cutelem4(idxi,c4pri1(i,:));cutelem4(idxi,c4pri2(i,:))];
    jface = jface0+sum(idxi)-1;
    Iface4(jface0:jface,:) = cutelem4(idxi,interface4(i,:));
    j0 = j+1;
    jface0 = jface+1;
end
end

%% prepare data for return
cutelemid = [cutelem1id;cutelem2id;cutelem3id;cutelem4id];
noncutelemid = setdiff(elemid,cutelemid);
tetelem = [elem(noncutelemid,:);cutelem1tet;cutelem2tet;cutelem3tet];
pyrelem = cutelem2pyr;
prielem = [cutelem3pri;cutelem4pri];

tetsign = msign(sum(vSign(tetelem),2)); 
pyrsign = msign(sum(vSign(pyrelem),2)); 
prisign = msign(sum(vSign(prielem),2)); 

T = struct('node',node,'bdnodeidx',bdnodeidx,'tetelem',tetelem,'pyrelem',pyrelem, ...
           'prielem',prielem,'tetsign',tetsign,'pyrsign',pyrsign,'prisign',prisign,'vsign',vSign,'cutnodeidx',cutnodeidx);
% interfaceData.elemIdx = elemIdx;
% interfaceData.face = [tface,zeros(size(tface,1),1);sface];
% interfaceData.face2elem = face2elem;
% interfaceData.vSign = vSign;
% interfaceData.interface = interface;
% interfaceData.cutElem = cutElem;