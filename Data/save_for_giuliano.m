[hm1,~,pm1,~] = rtpread('mars_sergio_rtp.ip.rtp');
fid = fopen('/asl/ftp/pub/sergio/Mars/testMarsSim_ip.txt','w');
nlevs = pm1.nlevs;
fprintf(fid,'%% surf temp = %8.6f K  \n',pm1.stemp);
fprintf(fid,'%% surf pres = %8.6e mb \n',pm1.spres);
fprintf(fid,'%% \n');
fprintf(fid,'%% ppmv : N2 = 0.0259, O2 = 0.00160, CO = 0.00060, NO = 0.00010 \n');
fprintf(fid,'%% \n');
fprintf(fid,'%%  plevs(z)       T(z)       WV(z)      CO2(z)    \n');
fprintf(fid,'%%    mb            K         ppm        ppm       \n');
fprintf(fid,'%% ----------------------------------------------- \n');
data = [pm1.plevs(1:nlevs)  pm1.ptemp(1:nlevs)  pm1.gas_1(1:nlevs)  pm1.gas_2(1:nlevs)];
  whos data
fprintf(fid,'%8.6e %8.6f %8.6e %8.6e \n',data');
fclose(fid);

fid = fopen('/asl/ftp/pub/sergio/Mars/testMarsSim_op.txt','w');
nlevs = pm.nlevs;
nlays = pm.nlevs-1;
pN = pm.plevs(1:100)-pm.plevs(2:101);
pD = log(pm.plevs(1:100)./pm.plevs(2:101));
pm.plays = pN./pD;
fprintf(fid,'%% surf temp = %8.6f K  \n',pm.stemp);
fprintf(fid,'%% surf pres = %8.6e mb \n',pm.spres);
fprintf(fid,'%% \n');

fprintf(fid,'%%   plays       palts(z)      T(z)         WV(z)       CO2(z)        N2(z)        O2(z)       CO(z)        NO(z)     \n');
fprintf(fid,'%%    mb           m             K       <--------------------- molecules/cm2 --------------------------------------> \n');
fprintf(fid,'%% -----------------------------------------------------------------------------------------------------------------  \n');
data = [pm.plays(1:nlays) pm.palts(1:nlays) pm.ptemp(1:nlays)  pm.gas_1(1:nlays)  pm.gas_2(1:nlays) pm.gas_3(1:nlays) pm.gas_4(1:nlays) pm.gas_5(1:nlays) pm.gas_6(1:nlays)];
  whos data
fprintf(fid,'%8.6e %8.6f %8.6f %8.6e %8.6e %8.6e %8.6e %8.6e %8.6e \n',data');
fclose(fid);

fid = fopen('/asl/ftp/pub/sergio/Mars/testMarsSim_rad_0p0025.txt','w');
data = [w; dMars']; whos data
fprintf(fid,'%15.6f %16.6e \n',data);
fclose(fid);

fid = fopen('/asl/ftp/pub/sergio/Mars/testMarsSim_rad_0p5.txt','w');
data = [fc; qc(:,2)']; whos data
fprintf(fid,'%15.6f %16.6e \n',data);
fclose(fid);

junk1 = load('/asl/ftp/pub/sergio/Mars/testMarsSim_rad_0p0025.txt'); figure(3); plot(junk1(:,1),junk1(:,2))
junk2 = load('/asl/ftp/pub/sergio/Mars/testMarsSim_rad_0p5.txt'); figure(3); plot(junk1(:,1),junk1(:,2),'b',junk2(:,1),junk2(:,2),'r')
