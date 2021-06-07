function [spin] = fun_update(current)

r = rand()*2-1;

spin = -sign( tanh(current) -r ) ;
end