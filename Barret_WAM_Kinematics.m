
Base = [750;500;1000];
l1 = [140;220;346];
lrest = [0;0;1030];
pst = [Base(1)+l1(1);Base(2)+l1(2);Base(3)+l1(3)+lrest(3)];
jd = importdata('JointData.txt');

gst_o = [1,0,0,890;
    0,1,0,720;
    0,0,1,2376;
    0,0,0,1]


for i = 1:size(jd,1)
    J1_twist{i} = [cos(jd(i,1)),-sin(jd(i,1)), 0, 890*(1-cos(jd(i,1)))+720*(sin(jd(i,1)));
        sin(jd(i,1)),cos(jd(i,1)), 0, -890*(sin(jd(i,1))) + 720 * (1-cos(jd(i,1)));
        0,0,1,0;
        0,0,0,1];
    J2_twist{i} = [1,0,0,0;
        0,cos(jd(i,2)),-sin(jd(i,2)),720*(1-cos(jd(i,2)))+1346*sin(jd(i,2));
        0,sin(jd(i,2)),cos(jd(i,2)),-720*(sin(jd(i,2))) + 1346 * (1-cos(jd(i,2)))
        0,0,0,1];
    J3_twist{i} = [cos(jd(i,3)),-sin(jd(i,3)), 0, 890*(1-cos(jd(i,3)))+720*(sin(jd(i,3)));
        sin(jd(i,3)),cos(jd(i,3)), 0, -890*(sin(jd(i,3))) + 720 * (1-cos(jd(i,3)));
        0,0,1,0;
        0,0,0,1];
    J4_twist{i} = [1,0,0,0;
        0,cos(jd(i,4)),-sin(jd(i,4)),765*(1-cos(jd(i,4)))+1896*sin(jd(i,4));
        0,sin(jd(i,4)),cos(jd(i,4)),-765*(sin(jd(i,4))) + 1896 * (1-cos(jd(i,4)))
        0,0,0,1];
    J5_twist{i} = [cos(jd(i,5)),-sin(jd(i,5)), 0, 890*(1-cos(jd(i,5)))+720*(sin(jd(i,5)));
        sin(jd(i,5)),cos(jd(i,5)), 0, -890*(sin(jd(i,5))) + 720 * (1-cos(jd(i,5)));
        0,0,1,0;
        0,0,0,1];
    J6_twist{i} = [1,0,0,0;
        0,cos(jd(i,6)),-sin(jd(i,6)),720*(1-cos(jd(i,6)))+2196*sin(jd(i,6));
        0,sin(jd(i,6)),cos(jd(i,6)),-720*(sin(jd(i,6))) + 2196 * (1-cos(jd(i,6)))
        0,0,0,1];
    J7_twist{i} = [cos(jd(i,7)),-sin(jd(i,7)), 0, 890*(1-cos(jd(i,7)))+720*(sin(jd(i,7)));
        sin(jd(i,7)),cos(jd(i,7)), 0, -890*(sin(jd(i,7))) + 720 * (1-cos(jd(i,7)));
        0,0,1,0;
        0,0,0,1];
end

for i = 1:size(jd,1)
    gst{i} = J1_twist{i}*J2_twist{i}*J3_twist{i}*J4_twist{i}*J5_twist{i}*J6_twist{i}*J7_twist{i}*gst_o;
end

for i = 1:size(jd,1)
    X(i,:) = gst{1,i}(1,4);
    Y(i,:) = gst{1,i}(2,4);
    Z(i,:) = gst{1,i}(3,4);
    location_array(i,:) = [X(i,:),Y(i,:),Z(i,:)];
end


P1 = [X(200),Y(200),Z(200)];
P2 = [X(2000),Y(2000),Z(2000)];
point_diff2 = P1-P2;

plot3(X,Y,Z, 'o')
xlabel('x position')
ylabel('y position')
zlabel('z position')
title('It Spells KDC!')
