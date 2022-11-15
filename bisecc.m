% **Raices de ecuaciones**
function [raiz, iter] =bisecc(fun, Xd,Xu ,e)
    syms('x');
    iter=0;
    error=100;
    if subs(fun,x,Xd)==0 %función evaluada en Xd
        raiz=Xd;
        iter=1;
    elseif subs(fun,x,Xu)==0 %funcion evaluada en Xu
        raiz=Xu;
        iter=1;
    elseif subs(fun,x,Xu)*subs(fun,x,Xd)>0
        disp("No se puede realizar el metodo en este intervalo")
    else 
        while(error>e)
            p=(Xd+Xu)/2;
            if subs(fun,x,p)*subs(fun,x,Xd)>0
                Xd=p;
            elseif subs(fun,x,p)*subs(fun,x,Xu)>0
                Xu=p;
            end
            error=abs(Xd-Xu);
            raiz=p;
            iter=iter+1;
        end
    end
end
       
