function J_R = jointToRotJac(q)
  % Input: vector of generalized coordinates (joint angles)
  % Output: Jacobian of the end-effector orientation which maps joint
  % velocities to end-effector angular velocities in I frame.
  T_I0=getTransformI0();
  T_01=jointToTransform01(q(1));
  T_12=jointToTransform12(q(2));
  T_23=jointToTransform23(q(3));
  T_34=jointToTransform34(q(4));
  T_45=jointToTransform45(q(5));
  T_56=jointToTransform56(q(6));
  T_6E=getTransform6E();
  T_IE=T_I0*T_01*T_12*T_23*T_34*T_45*T_56*T_6E;
  
  % Compute the homogeneous transformation matrices from frame k to the
  % inertial frame I.
  T_I1 = T_I0*T_01;
  T_I2 = T_I1*T_12;
  T_I3 = T_I2*T_23;
  T_I4 = T_I3*T_34;
  T_I5 = T_I4*T_45;
  T_I6 = T_I5*T_56;
  
  % Extract the rotation matrices from each homogeneous transformation
  % matrix.
  R_I1 = T_I1(1:3,1:3);
  R_I2 = T_I2(1:3,1:3);
  R_I3 = T_I3(1:3,1:3);
  R_I4 = T_I4(1:3,1:3);
  R_I5 = T_I5(1:3,1:3);
  R_I6 = T_I6(1:3,1:3);
  
  %e vectors wrt frame I
  I_e_6x=R_I6*[1;0;0];
  I_e_5x=R_I5*[0;1;0];
  I_e_4x=R_I4*[1;0;0];
  I_e_3x=R_I3*[0;1;0];
  I_e_2x=R_I2*[0;1;0];
  I_e_1x=R_I1*[0;0;1];
  
  % Compute the rotational jacobian.
  J_R = [I_e_1x(1:3),I_e_2x(1:3),I_e_3x(1:3),I_e_4x(1:3),I_e_5x(1:3),I_e_6x(1:3)];
end
