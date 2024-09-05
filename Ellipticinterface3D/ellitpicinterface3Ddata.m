function pde = ellitpicinterface3Ddata
%% STOKESDATA1 data for elliptic 3D
pde = struct('f', @f, 'exactu', @exactu,'g_D',@exactu, 'gradu',@gradu, 'beta',@beta,...
             'g1',@g1,'Eg1',@Eg1,'g2',@g2);
   %coefficient
    function b = beta(example,X,elemsign,r)
        switch example
            case 1
                b = 1*(elemsign>=0)+10000*(elemsign<0);  
            case 2
                b = 1*(elemsign>=0)+100*(elemsign<0);
            case 3
                b = 100*(elemsign>=0)+1*(elemsign<0);  
            case 4
                b = 10000*(elemsign>=0)+1*(elemsign<0);
        
            case 5
                b = 1*(elemsign>=0)+1000*(elemsign<0);
            case 6
                b = 1000*(elemsign>=0)+1*(elemsign<0);
            case 7
                b = 1*(elemsign>=0)+1000*(elemsign<0);
            case 8
                b = 1000*(elemsign>=0)+1*(elemsign<0); 
            case 9
                b = 1*(elemsign>=0)+1000*(elemsign<0); 
            case 10
                b = 1000*(elemsign>=0)+1*(elemsign<0); 
            case 11
                b = 1*(elemsign>=0)+10000*(elemsign<0); 
            case 12
                b = 10000*(elemsign>=0)+1*(elemsign<0); 
            case 13
                b = 10000*(elemsign>=0)+1*(elemsign<0);    
            case 14
                b = 10000*(elemsign>=0)+1*(elemsign<0);      
             case 15
                b = 10000*(elemsign>=0)+1*(elemsign<0);     
        end
    end  
   % exact force
    function f = f(example,X,elemsign,r)       
        x = X(:,1); y = X(:,2);  z = X(:,3);
       switch example
           case 1
                f = -6;
           case 2
                f = -6;
           case 3
                f = -6;
           case 4
                f = -6;            
           case 5
                f = 3.*pi.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500) - 2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z) - (4.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2) - (2.*x.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z))./(x.^2 + y.^2) - (2.*y.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z))./(x.^2 + y.^2) - 4.*z.*pi.*cos(pi.*z).*sin(pi.*x).*sin(pi.*y) + (2.*x.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(3./2) + (2.*y.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(3./2) - (4.*x.*pi.*cos(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2) - (4.*y.*pi.*cos(pi.*y).*sin(pi.*x).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2);
           case 6
                f = 3.*pi.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500) - 2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z) - (4.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2) - (2.*x.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z))./(x.^2 + y.^2) - (2.*y.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z))./(x.^2 + y.^2) - 4.*z.*pi.*cos(pi.*z).*sin(pi.*x).*sin(pi.*y) + (2.*x.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(3./2) + (2.*y.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(3./2) - (4.*x.*pi.*cos(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2) - (4.*y.*pi.*cos(pi.*y).*sin(pi.*x).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2);
           case 7
               f = 3*pi^2*sin(pi*x).*sin(pi*y).*sin(pi*z);
           case 8
               f = 3*pi^2*sin(pi*x).*sin(pi*y).*sin(pi*z);
              % f = -2*((y.*y-4).*(z.*z-4)+(x.*x-4).*(z.*z-4)+(x.*x-4).*(y.*y-4));
           case 9
               f = -2*((y.*y-4).*(z.*z-4)+(x.*x-4).*(z.*z-4)+(x.*x-4).*(y.*y-4));
           case 10
               f = -2*((y.*y-4).*(z.*z-4)+(x.*x-4).*(z.*z-4)+(x.*x-4).*(y.*y-4));
           case 11
               f = -6;
            case 12
               f = -6;   
            case 13
               f = -6;  
             case 14
               f = 2.*cos(x).*(2.*r - 2.*x) - 2.*sin(y) - 2.*sin(z) - 2.*sin(x) + sin(x).*(r - x).^2 + sin(y).*(r - x).^2 + sin(z).*(r - x).^2;
              case 15
               f = -6;  
       end
    end

% exact u
    function u = exactu(example,X,elemsign,r) 
        x = X(:,1); y = X(:,2); z = X(:,3);
         switch example
            case 1
                v = x.^2+y.^2+z.^2-r^2;
                u = v.*(elemsign>=0)/1 + v.*(elemsign<0)/10000;
            case 2
                v = x.^2+y.^2+z.^2-r^2;
                u = v.*(elemsign>=0)/1 + v.*(elemsign<0)/100;
            case 3                
                v = x.^2+y.^2+z.^2-r^2;
                u = v.*(elemsign>=0)/100 + v.*(elemsign<0)/1;
            case 4                
                v = x.^2+y.^2+z.^2-r^2;
                u = v.*(elemsign>=0)/10000 + v.*(elemsign<0)/1;
                
            case 5
                 phi = (0.66 - sqrt(x.^2 + y.^2)).^2 + z.^2 - 0.22^2;
                 v = sin(pi*x).*sin(pi*y).*sin(pi*z).*phi;
                 u = v.*(elemsign>=0)/1 + v.*(elemsign<0)/1000;
            case 6
                 phi = (0.66 - sqrt(x.^2 + y.^2)).^2 + z.^2 - 0.22^2;
                 v = sin(pi*x).*sin(pi*y).*sin(pi*z).*phi;
                 u = v.*(elemsign>=0)/1000 + v.*(elemsign<0)/1;
             case 7
                 v = sin(pi*x).*sin(pi*y).*sin(pi*z);
                 u = v.*(elemsign>=0)/1 + v.*(elemsign<0)/1000;
             case 8
                 v = sin(pi*x).*sin(pi*y).*sin(pi*z);
                 u = v.*(elemsign>=0)/1000 + v.*(elemsign<0)/1;
%                  v = (x.*x-4).*(y.*y-4).*(z.*z-4);
%                  u = v.*(elemsign>=0)/10000 + v.*(elemsign<0)/1;
             case 9
                 v = (x.*x-4).*(y.*y-4).*(z.*z-4);
                 u = v.*(elemsign>=0)/1 + v.*(elemsign<0)/1000;
             case 10
                 v = (x.*x-4).*(y.*y-4).*(z.*z-4);
                 u = v.*(elemsign>=0)/1000 + v.*(elemsign<0)/1;
             case 11
                 v = (x - 2).^2 + y.^2 + z.^2 - 4;
                 u = v.*(elemsign>=0)/1 + v.*(elemsign<0)/10000;
               case 12
                 v = (x - 2).^2 + y.^2 + z.^2 - 4;
                 u = v.*(elemsign>=0)/10000 + v.*(elemsign<0)/1;   
               case 13
                 v = (x - (2+r)).^2 + y.^2 + z.^2 - 4;
                 u = v.*(elemsign>=0)/10000 + v.*(elemsign<0)/1;
               case 14
                 v = (r - x).^2.*(sin(x) + sin(y) + sin(z));
                 u = v.*(elemsign>=0)/10000 + v.*(elemsign<0)/1;
                case 15
                 v = (r(1) - x).^2 + (r(2) - y).^2 + (r(3) - z).^2 - 4;
                 u = v.*(elemsign>=0)/10000 + v.*(elemsign<0)/1;     
         end
    end

   function du = gradu(example,X,elemsign,r)       
        x = X(:,1); y = X(:,2); z = X(:,3);
        switch example
            case 1
                dv = [2*x,2*y,2*z];
                du = dv.*repmat((elemsign>=0),1,3)/1 + dv.*repmat((elemsign<0),1,3)/10000;
            case 2
                dv = [2*x,2*y,2*z];
                du = dv.*repmat((elemsign>=0),1,3)/1 + dv.*repmat((elemsign<0),1,3)/100;
            case 3                
                dv = [2*x,2*y,2*z];
                du = dv.*repmat((elemsign>=0),1,3)/100 + dv.*repmat((elemsign<0),1,3)/1;
            case 4                
                dv = [2*x,2*y,2*z];
                du = dv.*repmat((elemsign>=0),1,3)/10000 + dv.*repmat((elemsign<0),1,3)/1;
                
            case 5
                dv = [ pi.*cos(pi.*x).*sin(pi.*y).*sin(pi.*z).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500) + (2.*x.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2), ...
                       pi.*cos(pi.*y).*sin(pi.*x).*sin(pi.*z).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500) + (2.*y.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2), ...
                       2.*z.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z) + pi.*cos(pi.*z).*sin(pi.*x).*sin(pi.*y).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500)];
                du = dv.*repmat((elemsign>=0),1,3)/1 + dv.*repmat((elemsign<0),1,3)/1000;
             case 6
                dv = [ pi.*cos(pi.*x).*sin(pi.*y).*sin(pi.*z).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500) + (2.*x.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2), ...
                       pi.*cos(pi.*y).*sin(pi.*x).*sin(pi.*z).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500) + (2.*y.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2), ...
                       2.*z.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z) + pi.*cos(pi.*z).*sin(pi.*x).*sin(pi.*y).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500)];
                du = dv.*repmat((elemsign>=0),1,3)/1000 + dv.*repmat((elemsign<0),1,3)/1;
            case 7
                dv = pi*[cos(pi*x).*sin(pi*y).*sin(pi*z),cos(pi*y).*sin(pi*x).*sin(pi*z),cos(pi*z).*sin(pi*x).*sin(pi*y)];
                du = dv.*repmat((elemsign>=0),1,3)/1 + dv.*repmat((elemsign<0),1,3)/1000;
            case 8
                dv = pi*[cos(pi*x).*sin(pi*y).*sin(pi*z),cos(pi*y).*sin(pi*x).*sin(pi*z),cos(pi*z).*sin(pi*x).*sin(pi*y)];
                du = dv.*repmat((elemsign>=0),1,3)/1000 + dv.*repmat((elemsign<0),1,3)/1;
%    dv = [2*x.*(y.*y-4).*(z.*z-4),2*y.*(x.*x-4).*(z.*z-4),2*z.*(x.*x-4).*(y.*y-4)];
%                 du = dv.*repmat((elemsign>=0),1,3)/10000 + dv.*repmat((elemsign<0),1,3)/1;
            case 9
                dv = [2*x.*(y.*y-4).*(z.*z-4),2*y.*(x.*x-4).*(z.*z-4),2*z.*(x.*x-4).*(y.*y-4)];
                du = dv.*repmat((elemsign>=0),1,3)/1 + dv.*repmat((elemsign<0),1,3)/1000;
            case 10
                dv = [2*x.*(y.*y-4).*(z.*z-4),2*y.*(x.*x-4).*(z.*z-4),2*z.*(x.*x-4).*(y.*y-4)];
                du = dv.*repmat((elemsign>=0),1,3)/1000 + dv.*repmat((elemsign<0),1,3)/1;
            case 11
                dv = [2*(x-2),2*y,2*z];
                du = dv.*repmat((elemsign>=0),1,3)/1 + dv.*repmat((elemsign<0),1,3)/10000;   
            case 12
                dv = [2*(x-2),2*y,2*z];
                du = dv.*repmat((elemsign>=0),1,3)/10000 + dv.*repmat((elemsign<0),1,3)/1;
            case 13
                dv = [2*(x-(2+r)),2*y,2*z];
                du = dv.*repmat((elemsign>=0),1,3)/10000 + dv.*repmat((elemsign<0),1,3)/1; 
            case 14
                dv = [cos(x).*(r - x).^2 - (2.*r - 2.*x).*(sin(x) + sin(y) + sin(z)), cos(y).*(r - x).^2, cos(z).*(r - x).^2];
                du = dv.*repmat((elemsign>=0),1,3)/10000 + dv.*repmat((elemsign<0),1,3)/1; 
             case 15
                dv = [2.*x - 2.*r(1), 2.*y - 2.*r(2), 2.*z - 2.*r(3)];
                du = dv.*repmat((elemsign>=0),1,3)/10000 + dv.*repmat((elemsign<0),1,3)/1;      
         end
   end

  function g1 = g1(example,X,elemsign,r) %[u]=g1
        x = X(:,1); y = X(:,2); z = X(:,3);
         switch example
            case 1
                g1 =zeros(length(x),1);
            case 2                
                g1 = zeros(length(x),1);
            case 3
                g1 =zeros(length(x),1);
            case 4                
                g1 = zeros(length(x),1);
                
             case 5
                g1 = zeros(length(x),1);
             case 6
                g1 = zeros(length(x),1);
             case 7
                gg1 =(1/1000-1)*sin(pi*x).*sin(pi*y).*sin(pi*z);
                g1 = 0.*(elemsign>=0) + gg1.*(elemsign<0);
             case 8
                gg1 =(1-1/1000)*sin(pi*x).*sin(pi*y).*sin(pi*z);
                g1 = 0.*(elemsign>=0) + gg1.*(elemsign<0);
%      gg1 = (1-1/10000)*(x.*x-4).*(y.*y-4).*(z.*z-4);
%                 g1 = 0.*(elemsign>=0) + gg1.*(elemsign<0);
             case 9
                gg1 = (1/1000-1)*(x.*x-4).*(y.*y-4).*(z.*z-4);
                g1 = 0.*(elemsign>=0) + gg1.*(elemsign<0);
            case 10
                gg1 = (1-1/1000)*(x.*x-4).*(y.*y-4).*(z.*z-4);
                g1 = 0.*(elemsign>=0) + gg1.*(elemsign<0);
             case 11
                g1 =zeros(length(x),1);
             case 12
                g1 =zeros(length(x),1);
             case 13
                g1 =zeros(length(x),1);  
             case 14
                g1 =zeros(length(x),1);
             case 15
                g1 =zeros(length(x),1);   
         end
  end

 function z = Eg1(example,X,elemsign,r) %extension of nabla g1
        x = X(:,1); y = X(:,2); z = X(:,3);
         switch example
            case 1
                z =zeros(length(x),3);
            case 2                
                z = zeros(length(x),3);
            case 3
                z =zeros(length(x),3);
            case 4                
                z = zeros(length(x),3);
                
             case 5
                 z = zeros(length(x),3);
             case 6
                 z = zeros(length(x),3);
             case 7
                 dv = pi*[cos(pi*x).*sin(pi*y).*sin(pi*z),cos(pi*y).*sin(pi*x).*sin(pi*z),cos(pi*z).*sin(pi*x).*sin(pi*y)];
                 gg1 =(1/1000-1)*dv;
                 z = 0.*repmat((elemsign>=0),1,3) + gg1.*repmat((elemsign<0),1,3);
             case 8
                 dv = pi*[cos(pi*x).*sin(pi*y).*sin(pi*z),cos(pi*y).*sin(pi*x).*sin(pi*z),cos(pi*z).*sin(pi*x).*sin(pi*y)];
                 gg1 =(1-1/1000)*dv;
                 z = 0.*repmat((elemsign>=0),1,3) + gg1.*repmat((elemsign<0),1,3);
%  dv = [2*x.*(y.*y-4).*(z.*z-4),2*y.*(x.*x-4).*(z.*z-4),2*z.*(x.*x-4).*(y.*y-4)];
%                  gg1 =(1-1/10000)*dv;
                 z = 0.*repmat((elemsign>=0),1,3) + gg1.*repmat((elemsign<0),1,3);
             case 9
                 dv = [2*x.*(y.*y-4).*(z.*z-4),2*y.*(x.*x-4).*(z.*z-4),2*z.*(x.*x-4).*(y.*y-4)];
                 gg1 =(1/1000-1)*dv;
                 z = 0.*repmat((elemsign>=0),1,3) + gg1.*repmat((elemsign<0),1,3);
             case 10
                 dv = [2*x.*(y.*y-4).*(z.*z-4),2*y.*(x.*x-4).*(z.*z-4),2*z.*(x.*x-4).*(y.*y-4)];
                 gg1 =(1-1/1000)*dv;
                 z = 0.*repmat((elemsign>=0),1,3) + gg1.*repmat((elemsign<0),1,3);
              case 11
                z =zeros(length(x),3);  
               case 12
                z =zeros(length(x),3);    
               case 13
                z =zeros(length(x),3); 
                case 14
                z =zeros(length(x),3); 
                case 15
                z =zeros(length(x),3);  
         end
 end

  function g2 = g2(example,X,elemsign,r) %[\beta\nabla u\cdot n ]=g2
        x = X(:,1); y = X(:,2); z = X(:,3);
         switch example
            case 1
                g2 =zeros(length(x),1);
            case 2                
                g2 =zeros(length(x),1);
            case 3
                g2 =zeros(length(x),1);
            case 4                
                g2 =zeros(length(x),1);
                
             case 5
                 g2 = zeros(length(x),1);
             case 6
                 g2 = zeros(length(x),1);
             case 7
                 g2 = zeros(length(x),1);
             case 8
                 g2 = zeros(length(x),1);
             case 9
                 g2 = zeros(length(x),1);
             case 10
                 g2 = zeros(length(x),1);
             case 11
                g2 =zeros(length(x),1); 
             case 12
                g2 =zeros(length(x),1);    
             case 13
                g2 =zeros(length(x),1);
             case 14
                g2 =zeros(length(x),1); 
             case 15
                g2 =zeros(length(x),1);    
         end
    end
end