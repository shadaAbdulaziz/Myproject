function [E,Nods] = RunGraphGen(Net,Range)
if (Net == 0) && (Range == 0)
    [E,Nods,nE] = GraphGenConnected(80,400,400,60);
    save('Net1_60.mat','E')
    [E,Nods,nE] = GraphGenConnected(80,400,400,70);
    save('Net1_70.mat','E')
    [E,Nods,nE] = GraphGenConnected(80,400,400,80);
    save('Net1_80.mat','E')
    [E,Nods,nE] = GraphGenConnected(80,400,400,90);
    save('Net1_90.mat','E')
    [E,Nods,nE] = GraphGenConnected(80,400,400,100);
    save('Net1_100.mat','E')
    [E,Nods,nE] = GraphGenConnected(80,400,400,110);
    save('Net1_110.mat','E')
    [E,Nods,nE] = GraphGenConnected(80,400,400,120);
    save('Net1_120.mat','E')
    [E,Nods,nE] = GraphGenConnected(100,600,600,80);
    save('Net2_80.mat','E')
    [E,Nods,nE] = GraphGenConnected(100,600,600,90);
    save('Net2_90.mat','E')
    [E,Nods,nE] = GraphGenConnected(100,600,600,100);
    save('Net2_100.mat','E')
    [E,Nods,nE] = GraphGenConnected(100,600,600,110);
    save('Net2_110.mat','E')
    [E,Nods,nE] = GraphGenConnected(100,600,600,120);
    save('Net2_120.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,700,700,70);
    save('Net3_70.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,700,700,80);
    save('Net3_80.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,700,700,90);
    save('Net3_90.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,700,700,100);
    save('Net3_100.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,700,700,110);
    save('Net3_110.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,700,700,120);
    save('Net3_120.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,100);
    save('Net4_100.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,110);
    save('Net4_110.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,120);
    save('Net4_120.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,130);
    save('Net4_130.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,140);
    save('Net4_140.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,150);
    save('Net4_150.mat','E')
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,160);
    save('Net4_160.mat','E')
    [E,Nods,nE] = GraphGenConnected(250,1500,1500,130);
    save('Net5_130.mat','E')
    [E,Nods,nE] = GraphGenConnected(250,1500,1500,140);
    save('Net5_140.mat','E')
    [E,Nods,nE] = GraphGenConnected(250,1500,1500,150);
    save('Net5_150.mat','E')
    [E,Nods,nE] = GraphGenConnected(250,1500,1500,160);
    save('Net5_160.mat','E')
    [E,Nods,nE] = GraphGenConnected(300,2000,2000,200);
    save('Net6_200.mat','E')
    [E,Nods,nE] = GraphGenConnected(300,2000,2000,210);
    save('Net6_210.mat','E')
    [E,Nods,nE] = GraphGenConnected(300,2000,2000,220);
    save('Net6_220.mat','E')
    [E,Nods,nE] = GraphGenConnected(300,2000,2000,230);
    save('Net6_230.mat','E')
    [E,Nods,nE] = GraphGenConnected(350,2500,2500,200);
    save('Net7_200.mat','E')
    [E,Nods,nE] = GraphGenConnected(350,2500,2500,210);
    save('Net7_210.mat','E')
    [E,Nods,nE] = GraphGenConnected(350,2500,2500,220);
    save('Net7_220.mat','E')
    [E,Nods,nE] = GraphGenConnected(350,2500,2500,230);
    save('Net7_230.mat','E')
    [E,Nods,nE] = GraphGenConnected(400,30500,3000,210);
    save('Net8_210.mat','E')
    [E,Nods,nE] = GraphGenConnected(400,30500,3000,220);
    save('Net8_220.mat','E')
    [E,Nods,nE] = GraphGenConnected(400,30500,3000,230);
    save('Net8_230.mat','E')
    [E,Nods,nE] = GraphGenConnected(400,30500,3000,240);
    save('Net8_240.mat','E')
elseif(Net == 1) && (Range == 60)
    [E,Nods,nE] = GraphGenConnected(80,400,400,60);
    save('Net1_60.mat','E')
elseif (Net == 1) && (Range == 70)
    [E,Nods,nE] = GraphGenConnected(80,400,400,70);
    save('Net1_70.mat','E')
elseif (Net == 1) && (Range == 80)
    [E,Nods,nE] = GraphGenConnected(80,400,400,80);
    save('Net1_80.mat','E')
elseif (Net == 1) && (Range == 90)
    [E,Nods,nE] = GraphGenConnected(80,400,400,90);
    save('Net1_90.mat','E')
elseif (Net == 1) && (Range == 100)
    [E,Nods,nE] = GraphGenConnected(80,400,400,100);
    save('Net1_100.mat','E')
elseif (Net == 1) && (Range == 110)
    [E,Nods,nE] = GraphGenConnected(80,400,400,110);
    save('Net1_110.mat','E')
elseif (Net == 1) && (Range == 120)
    [E,Nods,nE] = GraphGenConnected(80,400,400,120);
    save('Net1_120.mat','E')
elseif (Net == 2) && (Range == 80)
    [E,Nods,nE] = GraphGenConnected(100,600,600,80);
    save('Net2_80.mat','E')
elseif (Net == 2) && (Range == 90)
    [E,Nods,nE] = GraphGenConnected(100,600,600,90);
    save('Net2_90.mat','E')
elseif (Net == 2) && (Range == 100)
    [E,Nods,nE] = GraphGenConnected(100,600,600,100);
    save('Net2_100.mat','E')
elseif (Net == 2) && (Range == 110)
    [E,Nods,nE] = GraphGenConnected(100,600,600,110);
    save('Net2_110.mat','E')
elseif (Net == 2) && (Range == 120)
    [E,Nods,nE] = GraphGenConnected(100,600,600,120);
    save('Net2_120.mat','E')
elseif (Net == 3) && (Range == 70)
    [E,Nods,nE] = GraphGenConnected(200,700,700,70);
    save('Net3_70.mat','E')
elseif (Net == 3) && (Range == 80)
    [E,Nods,nE] = GraphGenConnected(200,700,700,80);
    save('Net3_80.mat','E')
elseif (Net == 3) && (Range == 90)
    [E,Nods,nE] = GraphGenConnected(200,700,700,90);
    save('Net3_90.mat','E')
elseif (Net == 3) && (Range == 100)
    [E,Nods,nE] = GraphGenConnected(200,700,700,100);
    save('Net3_100.mat','E')
elseif (Net == 3) && (Range == 110)
    [E,Nods,nE] = GraphGenConnected(200,700,700,110);
    save('Net3_110.mat','E')
elseif (Net == 3) && (Range == 120)
    [E,Nods,nE] = GraphGenConnected(200,700,700,120);
    save('Net3_120.mat','E')
elseif (Net == 4) && (Range == 100)
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,100);
    save('Net4_100.mat','E')
elseif (Net == 4) && (Range == 110)
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,110);
    save('Net4_110.mat','E')
elseif (Net == 4) && (Range == 120)
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,120);
    save('Net4_120.mat','E')
elseif (Net == 4) && (Range == 130)
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,130);
    save('Net4_130.mat','E')
elseif (Net == 4) && (Range == 140)
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,140);
    save('Net4_140.mat','E')
elseif (Net == 4) && (Range == 150)
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,150);
    save('Net4_150.mat','E')
elseif (Net == 4) && (Range == 160)
    [E,Nods,nE] = GraphGenConnected(200,1000,1000,160);
    save('Net4_160.mat','E')
elseif (Net == 5) && (Range == 130)
    [E,Nods,nE] = GraphGenConnected(250,1500,1500,130);
    save('Net5_130.mat','E')
elseif (Net == 5) && (Range == 140)
    [E,Nods,nE] = GraphGenConnected(250,1500,1500,140);
    save('Net5_140.mat','E')
elseif (Net == 5) && (Range == 150)
    [E,Nods,nE] = GraphGenConnected(250,1500,1500,150);
    save('Net5_150.mat','E')
elseif (Net == 5) && (Range == 160)
    [E,Nods,nE] = GraphGenConnected(250,1500,1500,160);
    save('Net5_160.mat','E')
elseif (Net == 6) && (Range == 200)
    [E,Nods,nE] = GraphGenConnected(300,2000,2000,200);
    save('Net6_200.mat','E')
elseif (Net == 6) && (Range == 210)
    [E,Nods,nE] = GraphGenConnected(300,2000,2000,210);
    save('Net6_210.mat','E')
elseif (Net == 6) && (Range == 220)
    [E,Nods,nE] = GraphGenConnected(300,2000,2000,220);
    save('Net6_220.mat','E')
elseif (Net == 6) && (Range == 230)
    [E,Nods,nE] = GraphGenConnected(300,2000,2000,230);
    save('Net6_230.mat','E')
elseif (Net == 7) && (Range == 200)
    [E,Nods,nE] = GraphGenConnected(350,2500,2500,200);
    save('Net7_200.mat','E')
elseif (Net == 7) && (Range == 210)
    [E,Nods,nE] = GraphGenConnected(350,2500,2500,210);
    save('Net7_210.mat','E')
elseif (Net == 7) && (Range == 220)
    [E,Nods,nE] = GraphGenConnected(350,2500,2500,220);
    save('Net7_220.mat','E')
elseif (Net == 7) && (Range == 230)
    [E,Nods,nE] = GraphGenConnected(350,2500,2500,230);
    save('Net7_230.mat','E')
elseif (Net == 8) && (Range == 210)
    [E,Nods,nE] = GraphGenConnected(400,3000,3000,210);
    save('Net8_210.mat','E')
elseif (Net == 8) && (Range == 220)
    [E,Nods,nE] = GraphGenConnected(400,3000,3000,220);
    save('Net8_220.mat','E')
elseif (Net == 8) && (Range == 230)
    [E,Nods,nE] = GraphGenConnected(400,3000,3000,230);
    save('Net8_230.mat','E')
elseif (Net == 8) && (Range == 240)
    [E,Nods,nE] = GraphGenConnected(400,3000,3000,240);
    save('Net8_240.mat','E')
end
