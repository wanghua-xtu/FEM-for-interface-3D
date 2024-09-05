function pde = ellitpicbd3Ddata
%% STOKESDATA1 data for elliptic 3D
pde = struct('f', @f, 'exactu', @exactu,'g_D',@exactu, 'gradu',@gradu);
   % exact force
    function f = f(example,X,elemsign,r)       
        x = X(:,1); y = X(:,2);  z = X(:,3);
       switch example
            case 1
                f = -6;
            case 2
                f = -6;
           case 3
                f = 3.*pi.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500) - 2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z) - (4.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2) - (2.*x.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z))./(x.^2 + y.^2) - (2.*y.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z))./(x.^2 + y.^2) - 4.*z.*pi.*cos(pi.*z).*sin(pi.*x).*sin(pi.*y) + (2.*x.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(3./2) + (2.*y.^2.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(3./2) - (4.*x.*pi.*cos(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2) - (4.*y.*pi.*cos(pi.*y).*sin(pi.*x).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2);

       end
    end

% exact u
    function u = exactu(example,X,elemsign,r) 
        x = X(:,1); y = X(:,2); z = X(:,3);
         switch example
            case 1
                u = x.^2+y.^2+z.^2-r^2;
            case 2                
                u = x.^2+y.^2+z.^2-r^2;
             case 3
                 phi = (0.66 - sqrt(x.^2 + y.^2)).^2 + z.^2 - 0.22^2;
                 u = sin(pi*x).*sin(pi*y).*sin(pi*z).*phi;
         end
    end

   function du = gradu(example,X,elemsign,r)       
        x = X(:,1); y = X(:,2); z = X(:,3);
        switch example
            case 1
                du = [2*x,2*y,2*z];
            case 2                
                du = [2*x,2*y,2*z];
            case 3
                du = [ pi.*cos(pi.*x).*sin(pi.*y).*sin(pi.*z).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500) + (2.*x.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2), ...
                       pi.*cos(pi.*y).*sin(pi.*x).*sin(pi.*z).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500) + (2.*y.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z).*((x.^2 + y.^2).^(1./2) - 33./50))./(x.^2 + y.^2).^(1./2), ...
                       2.*z.*sin(pi.*x).*sin(pi.*y).*sin(pi.*z) + pi.*cos(pi.*z).*sin(pi.*x).*sin(pi.*y).*(((x.^2 + y.^2).^(1./2) - 33./50).^2 + z.^2 - 121./2500)];
             end
    end
end