function update_EKF(z,R,idf)
% function update(z,R,idf, batch)
%
% Inputs:
%   z, R - range-bearing measurements and covariances
%   idf - feature index for each z
%   batch - switch to specify whether to process measurements together or sequentially
%
% Outputs:
%   XX, PX - updated state and covariance (global variables)
%
% Modified by Ricado Vazquez-Martin (2020/03/30) - EKFLOC version, changes:
%   - map part of the state is only used to store the map, not for estimate
%   - state and covariance only for vehicle localization
%   - parallel update procedure of all observations

global XX PX

lenz= size(z,2);

for i=1:lenz
    [zp,H]= observe_model(XX, idf(i)); % H is for only one feature and loc (modified by Ricardo Vázquez)
    
    v = [z(1,i)-zp(1); pi_to_pi(z(2,i)-zp(2))];
    
    % update in parallel procedure foreach observation (added by Ricardo Vázquez)
    % cholesky factorisation not needed, low dimension matrices.
    S = H*PX*H'+R;
    K = PX*H'/S;
    
    XX(1:3) = XX(1:3) + K*v; % state update (only localization, by Ricardo Vázquez)
    PX = PX-K*S*K';
end
        
