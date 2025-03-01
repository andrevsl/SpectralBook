% Gerar cenário com mais liberdade para escolher a posição dos elementos

% References
% [1] Massive MIMO Networks: Spectral, Energy, and Hardware Efficiency;
% link: https://github.com/emilbjornson/massivemimobook

% the antena elements in AP and IRS are separated with a distance of half the
% wavelength


frequency = 7360; % in MHz
lambda = physconst('LightSpeed')/(frequency*1e6);
spacing = lambda/4;

% M - number of APs
% K - number of single antenna UEs
% n_irs - number of irs
% ant_IRS - ant_IRS = sqrt(Num of antennas per IRS)

% All UEs and APs are single antenna

% If you add more elements, the code expects these positions to be column matrices
x_irs = 300;%200;
y_irs = 100;

x_aps = 300;
y_aps = 300;

x_ues = 200;
y_ues = 200;

ant_IRS = 20;


M = length(x_aps);
K = length(x_ues);
n_irs = length(x_irs);



% thetas = zeros(K,M,n_irs,ant_IRS,ant_IRS,realizations);
thetas_aps_ues = zeros(K,M);
thetas_aps_irs = zeros(M,n_irs);
thetas_irs_ues = zeros(n_irs,K);

% Choose an angle between a random UE to a given AP and store here 
aps_ues_thetas = zeros(M,1);

irs_ues_elements_thetas = zeros(ant_IRS,ant_IRS,n_irs);


IRS_elements_pos = zeros(ant_IRS,ant_IRS,3);
for v = 1:ant_IRS
    for h = 1:ant_IRS
        % The indices in v column will be ordered decrescent, in order
        % to the reference angle to be placet at the left bottom

        % The IRS has the elements distributed in an ant_IRS x ant_IRS 
        % evenly spaced square. Each IRS_elements_pos(h,v,:) element
        % has the coordinates of an element of the IRS.
%         IRS_elements_pos(h,v,:) = [0,(v-1)*lambda*spacing,(h-1)*lambda*spacing]; % equation 7.14 from [1]
        IRS_elements_pos(h,v,:) = [0,(v-1)*spacing,(h-1)*spacing]; % equation 7.14 from [1]

    end
end


for m = 1:M
    cmplx_ap  = x_aps(m) + 1i*y_aps(m);
    cmplx_ues = x_ues + 1i*y_ues;
    cmplx_irs = x_irs + 1i*y_irs;

    % angles between AP m to all ues for realization r
    thetas_aps_ues(:,m) = angle(cmplx_ues - cmplx_ap);
    thetas_aps_irs(m,:) = angle(cmplx_irs - cmplx_ap);

    % among the calculated angles, choose a random direction for ap m
    aps_ues_thetas(m) = cssm(thetas_aps_ues(:,m));
  

end
kwave = zeros(1,1,3);
for ni = 1:n_irs
    % All angles from a ies to ues. Matrix n_irs x n_ues x
    % realizations
    thetas_irs_ues(ni,:) = angle(cmplx_ues - cmplx_irs(ni));

    % among the calculated angles, choose a random direction for IRS 
    % ni in realization r. This angle is the reference to calculate
    % the other angles of the IRS. This angle is placed at position
    % 1x1 of the angle matrix of irs ni for realization r.

    % irs_ues_thetas is a n_irs x ant_IRS x ant_IRS x realizations
    % matrix

    % kwave = 2*pi/lambda * [cos(t)*cos(p),cos(t)*sin(p),sin(t)]; % wave vector defined in eq 7.12 from [1]
    % consider the t angle equal to 0, because I do not consider
    % height in the current version of the code

    p = cssm(thetas_irs_ues(m,:)); % the code for cssm is bellow

    % OBS: theta in this code is not the same as the theta that
    % appears in equation 7.12 of [1]. The equivalent to the theta
    % from here is the phi angle from the referred equation.

    kwave(1) = cos(0)*cos(p);
    kwave(2) = cos(0)*sin(p);
    kwave(3) = sin(0);
%     kwave(1) = sin(p)*cos(0);
%     kwave(2) = sin(p)*sin(0);
%     kwave(3) = cos(p);
    kwave = 2*pi/lambda*kwave; % wave vector defined in eq 7.12 from [1]

    kwave_mat = repmat(kwave,ant_IRS,ant_IRS);
    
    irs_ues_elements_thetas(:,:,ni) = dot(IRS_elements_pos,kwave_mat,3);

end


function   val = cssm( vec )
    % return a random element of the vector vec
    ix  = randi([1,length(vec)]);
    val = vec(ix);
end
