%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************* SECTION 3 **********************
% 3-1: can be perform with an arbitrary method for constract the fuzzy feature vector from images

% 3-2: Calculate the similarity between two FSs 
% mu is the membership value of FS
% n is the lenght of each fuzzy vector

sum = 0;
for i=1:n
    sum= sum + ((mu1(i) - mu2(i))^2)
end

d_FS= sum / n;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************* SECTION 4 **********************
% 4-1: convert FS To T2FS
for i=1:n
    LTmu(i)= mu(i) ^ a;
    UTmu(i)= mu(i) ^ (1/a);
    % 1< a <=2
end
% 4-2: Calculate the similarity between two T2FSs
sum=0;
for i=1:n
    sum= sum + max( abs(LTmu1(i)-LTmu2(i)) , abs(UTmu1(i)-UTmu2(i)));
end
d_T2FS= sum/n;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************* SECTION 5 **********************
% 5-1: convert FS To IFS
 %  Imu and Inu are the membership and the non-membership values of IFSs  
for i=1:n
    Imu(i)=mu(i)
    Inu(i)=(1-Imu(i))/(1+landa*Imu(i));
    % where -1 < landa <0
end


% 5-2: Calculate the similarity between two IFSs
 % Ipi is the intuitive index (margin of doubt)
for i=1:n
    Ipi(i)=1-(Imu(i)+Inu(i));
end
sum = 0;
% Imu1, Inu1 and Ipi1 are for first IFS and Imu2, Inu2 and Ipi2 are for secend IFS
for i=1:n
    sum= sum + (abs(Imu1(i)-Imu2(i))+abs(Inu1(i)-Inu2(i))* (1- 0.5*abs(Ipi1(i)-Ipi2(i))));
end
d_IFS=(1/(2*n))*sum;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************* SECTION 6 **********************
% 6-1: convert FS To IVFS
Lmu=[]  %the lower bound of membership function
Umu=[] % the Uper bound of membership function

for i=1:n
    Lmu(i)=mu(i)*(1-omega*delta);
    Umu(i)=mu(i)*(1-omega*delta)+(omega*delta);
    % where 0<= omega & delta <=1
end

% 6-2: Calculate the similarity between two IVFSs

sum=0;
for i=1:n
    sum=sum+(abs(Lmu1(i)-Lmu2(i))+ abs(Umu1(i)-Umu2(i)));
end
d_IVFS=1-(1/(2*n))*sum;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************* SECTION 7 **********************
% 7-1: convert FS To IVIFS
% Imu, Inu and Ipi are defined in Section 5 

for i = 1:n
    LImu(i)=Imu(i)- a*Ipi(i);  % 0<= a <= (Imu(i)/Ipi(i))
    UImu(i)=Imu(i)+ alpha* Ipi (i);  % 0 <= alpha <=1 
    LInu(i)=Inu(i)- b*Ipi(i);  % 0 <= b <= (Inu(i)/Ipi(i))
    UInu(i)= Inu(i)+ behta*Ipi(i);  % 0 <= betha <= 1
    
    % where 0<= alpha+betha <= 1  & 0<= a+alpha <=1 & 0<= b+betha <=1
end

% 7-2: Calculate the similarity between two IVIFSs
sum=0
for i=1 :n
    sum=sum+ max( abs (LImu1(i)-LImu2(i)), abs (UImu1(i)-UImu2(i)), abs (LInu1(i)-LInu2(i)), abs (UInu1(i)-UInu2(i))) 
end
d_IVIFS= (1- (1/n))* sum

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%