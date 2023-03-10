function R = quatToRotMat(q)
  % Input: quaternion [w x y z]
  % Output: corresponding rotation matrix
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  %R = zeros(3);
  R=[q(1,1)^2+q(2,1)^2-q(3,1)^2-q(4)^2, 2*q(2)*q(3)-2*q(1)*q(4), 2*q(1)*q(3)+2*q(2)*q(4);
      2*q(1)*q(4)+2*q(2)*q(3), q(1)^2-q(2)^2+q(3)^2-q(4)^2, 2*q(4)*q(3)-2*q(1)*q(2);
      2*q(2)*q(4)-2*q(1)*q(3), 2*q(1)*q(2)+2*q(3)*q(4), q(1)^2-q(2)^2-q(3)^2+q(4)^2];
end
