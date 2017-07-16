% initial covarinace is 0.
init_position = [0;0;0];
init_covariance = [0,0,0;0,0,0;0,0,0];
T = [1,1,1,1];
R = [0.05,0;0,0.25];
%Tr = T+sin(randn())*    sqrt(1.5);
head_angle =[pi/4,0,0,0];
%head_angle_r = head_angle + sin(randn())*sqrt(0.25);
Q = [0.15,0;0,0.05];
land_mark = zeros(4,2);
land_mark(1,1) = 1,land_mark(1,2) = 2;
land_mark(2,1) = 2.5,land_mark(2,2) = 2.5;
land_mark(3,1) = 3,land_mark(3,2) = 4;
land_mark(4,1) = 5,land_mark(4,2) = 5;
for i = 1:4
    
next_position = init_position + [T(i)*cos(init_position(3)+head_angle(i));T(i)*sin(init_position(3)+head_angle(i));head_angle(i)]
 F = [1,0,-T(i)*sin(init_position(3)+head_angle(i));0,1,T(i)*cos(init_position(3)+head_angle(i));0,0,1]
 G = [cos(next_position(3)),-T(i)*sin(next_position(3));sin(next_position(3)),T(i)*cos(next_position(3));0,1]
    next_covariance = F*init_covariance*(F')+ G*R*(G')
    draw_ellipse(next_position,next_covariance,'blue');
    hold on
end
    for s = 1:8
     rm  = (land_mark(j,1) - next_position(1))^2 + (land_mark(j,2) - next_position(2))^2;
     phim = atan2(land_mark(j,1)-next_position(2),land_mark(j,2)-next_position(1))-next_position(3);
   % prev_position_r=init_position 
     %draw_ellipse(next_position,next_covariance,'green');
    % hold on;
   %  plot(next_position(1),next_position(2),'*');
   %  hold on;
   q = (sensx(s)-next_position(1))*(sensx(s)-next_position(1))+(sensy(s)-next_position(2))*(sensy(s)-next_position(2));
   d = atan2(sensy(s)-next_position(2),sensx(s)-next_position(1))-next_position(3);
    Z = [sqrt(rm) d];
    H = [-(sensx(s)-next_position(1))/sqrt(q),-(sensy(s)-next_position(2))/sqrt(q),0;(sensy(s)-next_position(2))/(q),-(sensx(s)-next_position(1))/(q),-1];
    S = H*next_covariance*(H')+Q;
    Sinv = inv(S);
    K = next_covariance*(H')*Sinv
   % next_position_r = prev_position_r+ [Tr(i)*cos(prev_position_r(3)+head_angle_r(i));Tr(i)*sin(prev_position_r(3)+head_angle_r(i));head_angle_r(i)];
   % qr = (7-next_position_r(1))*(7-next_position_r(1))+(7-next_position_r(2))*(7-next_position_r(2));
    %dr = atan2(7-next_position_r(2),7-next_position_r(1))-next_position_r(3);
    Zr = mvnrnd(Z,Q)
    corrected_position = next_position + K*(Zr-Z)
    corrected_cov = (eye(3)-K*H)*next_covariance;
    next_position = corrected_position;
    next_covariance = corrected_cov;
   
   % draw_ellipse(corrected_position,corrected_cov,'black');
   % hold on;
   %  plot(corrected_position(1),corrected_position(2),'+'); 
    % hold on;
end
  if i==1
        draw_ellipse(corrected_position,corrected_cov,'red');
    elseif i==2
            draw_ellipse(corrected_position,corrected_cov,'blue');
            
    elseif i==3
            draw_ellipse(corrected_position,corrected_cov,'green');
     elseif i==4
      draw_ellipse(corrected_position,corrected_cov,'black');
  end 
    hold on;
    % circle(corrected_position(1),corrected_position(2));
   % draw_ellipse(next_position_r(1),eye(3),'red');
   % hold on;
   plot(corrected_position(1),corrected_position(2),'+'); 
   corrected_position
    plot(xy(2),xy(3),'x');
   hold on;
    init_position = corrected_position;
    init_covariance = corrected_cov;
    %prev_position_r=next_position_r
    end