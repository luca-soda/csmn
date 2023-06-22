fun = @(x) sin(3.*x) - x.^2 + 2.*x + 3;
fund = @(x) 3.*cos(3.*x) - 2.*x + 2;
a = 3;
b = 4;
x0 = 4;
tau = 1e-7;
kmax = 100;
m = fund(x0);

[corde_x, corde_k] = corde(fun,m,x0,tau,kmax);
[bisezione_x, bisezione_k] = bisezione(fun,a,b,tau,kmax);
[newton_x, newton_k] = newton(fun,fund,x0,tau,kmax);
fprintf("-------------CORDE---------------\n");
fprintf("Approssimazione  | %g\n",corde_x);
fprintf("K  | %g\n",corde_k);
fprintf("-------------BISEZIONE---------------\n");
fprintf("Approssimazione  | %g\n",bisezione_x);
fprintf("K  | %g\n",bisezione_k);
fprintf("-------------NEWTON---------------\n");
fprintf("Approssimazione  | %g\n",newton_x);
fprintf("K  | %g\n",newton_k);