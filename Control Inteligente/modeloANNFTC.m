function [dxdt] = modeloANNFTC(t,x,tau1,tau2)
% --Ejemplo--
p1 = 0.0398; p2 = 0.0026; p3 = -0.0015; p4 = 0.0081;
m11 = p1 + p2 + 2*p3*cos(x(3)) - 2*p4*sin(x(3));
m12 = p2 + p3*cos(x(3)) - p4*sin(x(3));
m22 = p2;
b = p3*sin(x(3)) + p4*cos(x(3));
fv1 = 0.534684;
fv2 = 0.001;
fc1 = 0.81958;
fc2 = 0.002;
f1 = fv1*x(2) + fc1*sgn(x(2));
f2 = fv2*x(4) + fc2*sgn(x(4));

dxdt(1,1) = x(2);
dxdt(2,1) = (-2*b*x(2)*x(4) - b*(x(4)^2))*(m22/(-m12^2 + m11*m22) - m12/(-m12^2 + m11*m22)) - f1*(x(4)^2)*( m22/(-m12^2 + m11*m22) - m12/(-m12^2 + m11*m22)) + tau1*(x(4)^2))*( m22/(-m12^2 + m11*m22) - m12/(-m12^2 + m11*m22));
dxdt(3,1) = x(4);
dxdt(4,1) = b*(x(2)^2)*(-m12/(-m12^2 + m11*m22) + m11/(-m12^2 + m11*m22)) - f2*(-m12/(-m12^2 + m11*m22) + m11/(-m12^2 + m11*m22)) + tau2*(-m12/(-m12^2 + m11*m22) + m11/(-m12^2 + m11*m22));
end