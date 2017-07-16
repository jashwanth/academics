init_position = [0 ;0 ;0]
init_covariance = [0 0 0;0 0 0;0 0 0]
next_position = [0 ;0 ;0]
next_covariance = [0 0 0;0 0 0;0 0 0]
T = [1 1 1 1]
Z = [0 ;0 ;0]
Zr = [0 ;0 ;0];
head_angle = [0 0 0 0];
way_pt = zeros(5,3);
way_pt(1,1) = 0,way_pt(1,2) = 0,way_pt(1,3) = 0;
for i=2:5
way_pt(i,1) = way_pt(i-1,1) + T(i-1)*cos(head_angle(i-1));
way_pt(i,2) = way_pt(i-1,2) + T(i-1)*sin(head_angle(i-1));
way_pt(i,3) = way_pt(i-1,3) + head_angle(i-1);
end
land_mark = zeros(4,2);
land_mark(1,1) = 1,land_mark(1,2) = 2;
land_mark(2,1) = 2.5,land_mark(2,2) = 2.5;
land_mark(3,1) = 3,land_mark(3,2) = 4;
land_mark(4,1) = 5,land_mark(4,2) = 5;

R = [0.05 0;0 0.25] % control noise
Q = [0.15,0;0,0.05]; % measurement noise
figure();
zerr = [0.01;0.01];
for i=1:4
    next_position = init_position + [T(i)*cos(init_position(3)+head_angle(i));T(i)*sin(init_position(3)+head_angle(i));head_angle(i)]
    F = [1,0,-T(i)*sin(init_position(3)+head_angle(i));0,1,T(i)*cos(init_position(3)+head_angle(i));0,0,1]
    G = [cos(next_position(3)),-T(i)*sin(next_position(3));sin(next_position(3)),T(i)*cos(next_position(3));0,1]
    next_covariance = F*init_covariance*(F')+ G*R*(G')
    draw_ellipse(next_position,next_covariance,'red');
    hold on
    fprintf('bel^ \n');
    next_position
     
    for j=1:4
        
     rm  = (land_mark(j,1) - next_position(1))^2 + (land_mark(j,2) - next_position(2))^2;
     phim = atan2(land_mark(j,1)-next_position(2),land_mark(j,2)-next_position(1))-next_position(3);
        Zm = [sqrt(rm) phim]; % 1*2 q=2*2 z=1*2
        Z  =  mvnrnd(Zm,Q);
 H=[-(land_mark(j,1)-next_position(1))/sqrt(rm),-(land_mark(j,2)-next_position(2))/sqrt(rm),0;(land_mark(j,2)-next_position(2))/(rm),-(land_mark(j,1)-next_position(1))/(rm),-1];
    [next_position,next_covariance] = KF_cholesky_update(next_position,next_covariance,zerr,Q,H);
    draw_ellipse(next_position,next_covariance,'yellow');
    end
    fprintf('after correction\n');
    next_position
    if i==1
     draw_ellipse(next_position,next_covariance,'yellow');
    elseif i==2 
      draw_ellipse(next_position,next_covariance,'blue');
    elseif i==3 
      draw_ellipse(next_position,next_covariance,'green');
    elseif i==4
      draw_ellipse(next_position,next_covariance,'black');
    end
     hold on
     init_covariance = next_covariance;
    init_position   = next_position;
 end
