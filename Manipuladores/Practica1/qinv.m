function q_ = qinv(q)
modulo = norm(q);
q_(1) = q(1) / modulo;
q_(2:4) = -(q(2:4)/modulo);
end