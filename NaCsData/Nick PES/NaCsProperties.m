function out = NaCsProperties()

%Reduced mass from Docenko 2006 JPB, see supplemental table 4
% https://iopscience.iop.org/0953-4075/39/19/S08/media/JPhysB_39_S929_Table4.txt
out.mu = (22.9897692807*132.9054519316)/(22.9897692807 + 132.9054519316);

%X state PES
out.X.PES = @NaCsXPES;

%A state PES
out.a.PES = @NaCsaPES;

%Transition dipole moments extracted from Gonzalez-Ferez calculations PDF
in = load('Gonzalez-Ferez-TDM.mat');
out.TDM = in.TDM;

%Energies from Gonzalez-Ferez, July 2014 email, copied from PDF
out.X.E.GF = [-4904.9
    -4806.7
    -4709.1
    -4612.2
    -4515.9
    -4420.4
    -4325.5
    -4231.2
    -4137.7
    -4044.9
    -3952.7
    -3861.3
    -3770.5
    -3680.5
    -3591.2
    -3502.6
    -3414.7
    -3327.6
    -3241.2
    -3155.6
    -3070.8
    -2986.7
    -2903.4
    -2820.9
    -2739.1
    -2658.2
    -2578.1
    -2498.9
    -2420.5
    -2342.9
    -2266.2
    -2190.4
    -2115.5
    -2041.5
    -1968.4
    -1896.2
    -1825
    -1754.8
    -1685.5
    -1617.3
    -1550.1
    -1483.9
    -1418.8
    -1354.8
    -1291.9
    -1230.1
    -1169.4
    -1110
    -1051.7
    -994.68
    -938.91
    -884.42
    -831.25
    -779.42
    -728.97
    -679.92
    -632.32
    -586.19
    -541.57
    -498.51
    -457.02
    -417.16
    -378.97
    -342.47
    -307.72
    -274.74
    -243.59
    -214.29
    -186.88
    -161.4
    -137.87
    -116.32
    -96.766
    -79.223
    -63.687
    -50.137
    -38.531
    -28.794
    -20.822
    -14.483
    -9.6143
    -6.0135
    -3.4732
    -1.7895
    -0.77129
    -0.24189
    -0.036359
    -1.6112e-05];

out.X.E.Docenko2006 = [
    
];
out.a.E.GF = [-207.5
    -188.8
    -170.98
    -154.03
    -137.94
    -122.73
    -108.41
    -94.971
    -82.433
    -70.799
    -60.074
    -50.263
    -41.369
    -33.396
    -26.344
    -20.209
    -14.983
    -10.641
    -7.1654
    -4.5216
    -2.5607
    -1.2658
    -0.49937
    -0.12786
    -0.0096632];
%b part of Omega=0
out.b0.E.GF = [-5470.2
    -5444
    -5388
    -5384.5
    -5333.7
    -5304.7
    -5276
    -5234.4
    -5200.3
    -5159.1
    -5117.4
    -5076
    -5031.9
    -4988
    -4945.1
    -4903.2
    -4896.2
    -4850.5
    -4804.1
    -4771.6
    -4747.2
    -4709.9
    -4665.6
    -4629.6
    -4614.3
    -4564.3
    -4522.6
    -4508
    -4463.6
    -4424.8
    -4394
    -4364.9
    -4324.6
    -4282
    -4268.8
    -4221.6
    -4176.8
    -4169.2
    -4117.9
    -4081.5
    -4060.7
    -4016.9
    -3983.9
    -3953.4
    -3919.9
    -3881.7
    -3850.2
    -3823.2
    -3776.5
    -3754
    -3722.3
    -3670.6
    -3662.5
    -3618.5
    -3574.1
    -3563.6
    -3515.5
    -3483.6
    -3458.8
    -3416.8
    -3389.2
    -3356.3
    -3322.9
    -3289.5
    -3259
    -3228.1
    -3188.2
    -3167.6
    -3128.8
    -3091.7
    -3075.2
    -3027.1
    -3004.6
    -2975.8
    -2925.3
    -2920.9
    -2874.9
    -2838.7
    -2823.5
    -2775.7
    -2755.2
    -2723.4
    -2683.7
    -2665.3
    -2626.2
    -2597.5
    -2569.4
    -2535
    -2508
    -2475.1
    -2447.7
    -2414.2
    -2387.1
    -2357.1
    -2322
    -2301.9
    -2262.8
    -2238.1
    -2211.2
    -2169.4
    -2158.1
    -2116.5
    -2088.5
    -2068.2
    -2021.4
    -2013.9
    -1973.8
    -1941
    -1926.7
    -1880.1
    -1868.3
    -1833.2
    -1798.1
    -1785.4
    -1741.9
    -1725.4
    -1694.2
    -1660.3
    -1644.7
    -1605.8
    -1586.3
    -1556.8
    -1526.2
    -1506.1
    -1472.2
    -1450.9
    -1421.5
    -1395.1
    -1370.5
    -1341.3
    -1318.7
    -1288.8
    -1266.8
    -1238
    -1213.7
    -1189.4
    -1159.8
    -1141.2
    -1108.9
    -1089.9
    -1062.7
    -1035.3
    -1018
    -983.4
    -970.21
    -938.79
    -916.25
    -896.7
    -862.54
    -853.83
    -818.11
    -802.8
    -777.95
    -749.13
    -738.54
    -701.28
    -694.59
    -662.78
    -642.97
    -625.3
    -592.17
    -588.42
    -552.24
    -542.56
    -516.61
    -494.45
    -481.6
    -448.57
    -446.49
    -413.9
    -402.4
    -380.99
    -358.97
    -348.76
    -319.49
    -315
    -288.22
    -275.58
    -258.78
    -237.4
    -230.01
    -205.39
    -197.91
    -179.12
    -163.39
    -154.38
    -134.19
    -127.31
    -112.27
    -97.435
    -91.707
    -76.81
    -65.883
    -60.312
    -48.87
    -39.313
    -34.833
    -29.259
    -22.909
    -17.377
    -12.796
    -9.3691
    -7.1542
    -4.9109
    -2.9886
    -1.6871
    -0.85283
    -0.36828
    -0.11508
    -0.016542];
%b part of Omega=1
out.b1.E.GF = [-5330.2
    -5239.5
    -5147
    -5054
    -4961.5
    -4869.6
    -4778.4
    -4687.8
    -4597.7
    -4508.2
    -4419.1
    -4330.5
    -4242.3
    -4154.4
    -4067
    -3979.9
    -3893.2
    -3807
    -3721.2
    -3635.9
    -3551
    -3466.6
    -3382.7
    -3299.4
    -3216.6
    -3134.4
    -3052.8
    -2971.8
    -2891.4
    -2811.6
    -2732.5
    -2654.1
    -2576.2
    -2499.1
    -2422.6
    -2346.7
    -2271.6
    -2197.1
    -2123.3
    -2050.2
    -1977.9
    -1906.3
    -1835.5
    -1765.5
    -1696.3
    -1627.9
    -1560.5
    -1493.9
    -1428.3
    -1363.7
    -1362.1
    -1316.1
    -1300.2
    -1270
    -1237.8
    -1223.8
    -1177.8
    -1176.7
    -1132.2
    -1116.8
    -1086.8
    -1058.3
    -1041.9
    -1001.3
    -997.5
    -953.52
    -945.98
    -909.96
    -892.34
    -866.78
    -840.51
    -823.9
    -790.59
    -781.27
    -742.6
    -738.83
    -696.61
    -696.53
    -654.41
    -652.51
    -612.4
    -610.36
    -570.52
    -570.07
    -535.75
    -531.56
    -528.79
    -494.76
    -492.09
    -487.27
    -459.61
    -449.09
    -446
    -426.05
    -406.66
    -405.04
    -394.07
    -364.92
    -364.43
    -363.63
    -334.68
    -324.27
    -323.89
    -307.18
    -284.64
    -283.6
    -281.06
    -256.33
    -245.56
    -244.06
    -232.83
    -210.67
    -207.14
    -205.28
    -189.68
    -170.15
    -169.39
    -167.28
    -151.64
    -134.59
    -132.64
    -130.1
    -118.81
    -104.28
    -96.619
    -93.805
    -90.92
    -78.647
    -67.376
    -61.507
    -58.491
    -57.047
    -47.694
    -39.332
    -32.019
    -27.395
    -25.725
    -24.264
    -20.426
    -15.866
    -11.994
    -8.7544
    -6.1164
    -4.018
    -2.4146
    -1.3148
    -0.64237
    -0.25122
    -0.063986
    -0.0046775];
%c part of Omega=1
out.c1.E.GF = [-5330.200369613
    -5239.4607785862
    -5146.9610010264
    -5054.0134952214
    -4961.5181071542
    -4869.6482217825
    -4778.4104233452
    -4687.7827643793
    -4597.7323236903
    -4508.2042326207
    -4419.143622513
    -4330.5087931875
    -4242.2799919275
    -4154.43527127
    -4066.974631215
    -3979.9068507477
    -3893.2472930922
    -3807.0135162189
    -3721.2186886056
    -3635.8759787301
    -3551.0029445628
    -3466.6215335667
    -3382.7493037122
    -3299.406007716
    -3216.6135930411
    -3134.3940071505
    -3052.7691975072
    -2971.7567220816
    -2891.3719440978
    -2811.6258372873
    -2732.5184016501
    -2654.0540266788
    -2576.237101866
    -2499.0742114506
    -2422.5697449252
    -2346.7280917824
    -2271.5602257537
    -2197.0771205706
    -2123.29435893183
    -2050.22598721371
    -1977.88978286127
    -1906.30462069269
    -1835.4926676456
    -1765.47609065763
    -1696.27969036197
    -1627.93155951126
    -1560.46374140148
    -1493.91354671973
    -1428.32377301886
    -1363.74336314136
    -1362.13395567957
    -1316.14524170937
    -1300.22872206714
    -1269.96492638718
    -1237.8456921852
    -1223.7927316263
    -1177.82398984743
    -1176.67043119215
    -1132.15088039517
    -1116.79314316092
    -1086.83924565852
    -1058.31346957353
    -1041.94571009202
    -1001.33917247331
    -997.50187804239
    -953.5163090202
    -945.97889180211
    -909.96200764596
    -892.33863380622
    -866.77861839642
    -840.51496732284
    -823.89920150943
    -790.58624479488
    -781.26801042897
    -742.6011895902
    -738.83368809162
    -696.60523295721
    -696.53017263375
    -654.41364956064
    -652.51212136632
    -612.39830429196
    -610.36377447186
    -570.51749697147
    -570.07262189646
    -535.74591186594
    -531.56382279129
    -528.79493085921
    -494.76319473141
    -492.09043268727
    -487.27296455877
    -459.6062121756
    -449.08635421044
    -446.00339408283
    -426.05029704564
    -406.664541927
    -405.03713754555
    -394.06823448741
    -364.91563885914
    -364.43059992684
    -363.62534750937
    -334.68191120349
    -324.26520631443
    -323.88792942546
    -307.18371533616
    -284.63752554552
    -283.60160529192
    -281.05569958392
    -256.32749302182
    -245.5591897755
    -244.06303122279
    -232.83448967736
    -210.672951123258
    -207.139892424444
    -205.284739219443
    -189.683209566189
    -170.148321436464
    -169.388675847108
    -167.282290033146
    -151.638292038987
    -134.586035081433
    -132.63795631809
    -130.09929327288
    -118.808881829253
    -104.281044013422
    -96.6193163649
    -93.804751762317
    -90.919889435745
    -78.64675838883
    -67.376319136533
    -61.507128581073
    -58.491393532632
    -57.047338257084
    -47.694097687689
    -39.3320484423
    -32.019329350404
    -27.394867211526
    -25.72527980619
    -24.264105509502
    -20.4262865342163
    -15.8657222391165
    -11.99363010561
    -8.7544281836493
    -6.1164155576772
    -4.0179966727842
    -2.4145676999154
    -1.31478340163022
    -0.64236800396772
    -0.25122207417876
    -0.063986314001553
    -0.0046775245201731];
%Entire Omega=0 block
out.W0.E.GF = [-5470.2
    -5444
    -5388
    -5384.5
    -5333.7
    -5304.7
    -5276
    -5234.4
    -5200.3
    -5159.1
    -5117.4
    -5076
    -5031.9
    -4988
    -4945.1
    -4903.2
    -4896.2
    -4850.5
    -4804.1
    -4771.6
    -4747.2
    -4709.9
    -4665.6
    -4629.6
    -4614.3
    -4564.3
    -4522.6
    -4508
    -4463.6
    -4424.8
    -4394
    -4364.9
    -4324.6
    -4282
    -4268.8
    -4221.6
    -4176.8
    -4169.2
    -4117.9
    -4081.5
    -4060.7
    -4016.9
    -3983.9
    -3953.4
    -3919.9
    -3881.7
    -3850.2
    -3823.2
    -3776.5
    -3754
    -3722.3
    -3670.6
    -3662.5
    -3618.5
    -3574.1
    -3563.6
    -3515.5
    -3483.6
    -3458.8
    -3416.8
    -3389.2
    -3356.3
    -3322.9
    -3289.5
    -3259
    -3228.1
    -3188.2
    -3167.6
    -3128.8
    -3091.7
    -3075.2
    -3027.1
    -3004.6
    -2975.8
    -2925.3
    -2920.9
    -2874.9
    -2838.7
    -2823.5
    -2775.7
    -2755.2
    -2723.4
    -2683.7
    -2665.3
    -2626.2
    -2597.5
    -2569.4
    -2535
    -2508
    -2475.1
    -2447.7
    -2414.2
    -2387.1
    -2357.1
    -2322
    -2301.9
    -2262.8
    -2238.1
    -2211.2
    -2169.4
    -2158.1
    -2116.5
    -2088.5
    -2068.2
    -2021.4
    -2013.9
    -1973.8
    -1941
    -1926.7
    -1880.1
    -1868.3
    -1833.2
    -1798.1
    -1785.4
    -1741.9
    -1725.4
    -1694.2
    -1660.3
    -1644.7
    -1605.8
    -1586.3
    -1556.8
    -1526.2
    -1506.1
    -1472.2
    -1450.9
    -1421.5
    -1395.1
    -1370.5
    -1341.3
    -1318.7
    -1288.8
    -1266.8
    -1238
    -1213.7
    -1189.4
    -1159.8
    -1141.2
    -1108.9
    -1089.9
    -1062.7
    -1035.3
    -1018
    -983.4
    -970.21
    -938.79
    -916.25
    -896.7
    -862.54
    -853.83
    -818.11
    -802.8
    -777.95
    -749.13
    -738.54
    -701.28
    -694.59
    -662.78
    -642.97
    -625.3
    -592.17
    -588.42
    -552.24
    -542.56
    -516.61
    -494.45
    -481.6
    -448.57
    -446.49
    -413.9
    -402.4
    -380.99
    -358.97
    -348.76
    -319.49
    -315
    -288.22
    -275.58
    -258.78
    -237.4
    -230.01
    -205.39
    -197.91
    -179.12
    -163.39
    -154.38
    -134.19
    -127.31
    -112.27
    -97.435
    -91.707
    -76.81
    -65.883
    -60.312
    -48.87
    -39.313
    -34.833
    -29.259
    -22.909
    -17.377
    -12.796
    -9.3691
    -7.1542
    -4.9109
    -2.9886
    -1.6871
    -0.85283
    -0.36828
    -0.11508
    -0.016542];
%Entire Omega=1 block
out.W1.E.GF = [-5330.2
    -5239.5
    -5147
    -5054
    -4961.5
    -4869.6
    -4778.4
    -4687.8
    -4597.7
    -4508.2
    -4419.1
    -4330.5
    -4242.3
    -4154.4
    -4067
    -3979.9
    -3893.2
    -3807
    -3721.2
    -3635.9
    -3551
    -3466.6
    -3382.7
    -3299.4
    -3216.6
    -3134.4
    -3052.8
    -2971.8
    -2891.4
    -2811.6
    -2732.5
    -2654.1
    -2576.2
    -2499.1
    -2422.6
    -2346.7
    -2271.6
    -2197.1
    -2123.3
    -2050.2
    -1977.9
    -1906.3
    -1835.5
    -1765.5
    -1696.3
    -1627.9
    -1560.5
    -1493.9
    -1428.3
    -1363.7
    -1362.1
    -1316.1
    -1300.2
    -1270
    -1237.8
    -1223.8
    -1177.8
    -1176.7
    -1132.2
    -1116.8
    -1086.8
    -1058.3
    -1041.9
    -1001.3
    -997.5
    -953.52
    -945.98
    -909.96
    -892.34
    -866.78
    -840.51
    -823.9
    -790.59
    -781.27
    -742.6
    -738.83
    -696.61
    -696.53
    -654.41
    -652.51
    -612.4
    -610.36
    -570.52
    -570.07
    -535.75
    -531.56
    -528.79
    -494.76
    -492.09
    -487.27
    -459.61
    -449.09
    -446
    -426.05
    -406.66
    -405.04
    -394.07
    -364.92
    -364.43
    -363.63
    -334.68
    -324.27
    -323.89
    -307.18
    -284.64
    -283.6
    -281.06
    -256.33
    -245.56
    -244.06
    -232.83
    -210.67
    -207.14
    -205.28
    -189.68
    -170.15
    -169.39
    -167.28
    -151.64
    -134.59
    -132.64
    -130.1
    -118.81
    -104.28
    -96.619
    -93.805
    -90.92
    -78.647
    -67.376
    -61.507
    -58.491
    -57.047
    -47.694
    -39.332
    -32.019
    -27.395
    -25.725
    -24.264
    -20.426
    -15.866
    -11.994
    -8.7544
    -6.1164
    -4.018
    -2.4146
    -1.3148
    -0.64237
    -0.25122
    -0.063986
    -0.0046775];

%Energies from Grochola2011 (3)\Omega=1.  From SolveTISE1D(@(x)
%NaCs3Omega1PES(x), 19.5995, 2.4, 150, 0.01);
out.ThreeW1.E.Grochola2011 = (1.0e+03*[
    -2.103108153066059
    -2.050666430752464
    -1.996829641314833
    -1.945809521144309
    -1.894934747785809
    -1.844744416584395
    -1.794769627569381
    -1.745734605230169
    -1.697376685504211
    -1.649566576065328
    -1.602159433750245
    -1.555165871264894
    -1.508586905834040
    -1.462450799907087
    -1.416678422576088
    -1.371167422424727
    -1.325963251282150
    -1.281006921569963
    -1.236243697253066
    -1.191683993589929
    -1.147325841143307
    -1.103254973320293
    -1.059535068409590
    -1.016172203457150
    -0.973239109886942
    -0.930811602470806
    -0.888969854829123
    -0.847762113974680
    -0.807240391860313
    -0.767521642491751
    -0.728814661988784
    -0.691275901520425
    -0.654849121276513
    -0.619381437686393
    -0.584927110318121
    -0.551614948323834
    -0.519407569650664
    -0.488306181835336
    -0.458370988882696
    -0.429522338419366
    -0.401735006686394
    -0.374998325667448
    -0.349255958548381
    -0.324383734471627
    -0.300318985964463
    -0.277125017483618
    -0.254894525932415
    -0.233541017597209
    -0.212981790805132
    -0.193074744688441
    -0.173878722234111
    -0.155725525195997
    -0.138645122851885
    -0.122553272876433
    -0.107557562392348
    -0.093718995634276
    -0.080990285287015
    -0.069257838281439
    -0.058401988098928
    -0.048629693132094
    -0.040055263607443
    -0.032558213927231
    -0.025993710571774
    -0.020285717765521
    -0.015429463251319
    -0.011385479460318
    -0.008102967126819
    -0.005473838392853
    -0.003466231114137
    -0.002004466146809
    -0.001011513770002
    -0.000409340299800
    -0.000108704134522
    -0.000009014144243]);

%B state from Grochola2010.  From SolveTISE1D(@(x) NaCsBPES(x), 19.5995,
%3.4, 150, 0.01)
out.B.E = (1.0e+03 *[-1.288736948703725
    -1.236350958317525
    -1.184760211227974
    -1.134360114887423
    -1.084408410327547
    -1.035845442896506
    -0.989141398553584
    -0.944042927356843
    -0.900065119351137
    -0.857394143746515
    -0.816040284481632
    -0.775941095748495
    -0.737040364547631
    -0.699293298174702
    -0.662650466125143
    -0.627035509921526
    -0.592418652377944
    -0.558872559754738
    -0.526440841925255
    -0.495075587454190
    -0.464750817926026
    -0.435529480239820
    -0.407463214885003
    -0.380504610172977
    -0.354653610597350
    -0.329953701526543
    -0.306404297073431
    -0.283996239402486
    -0.262868075574152
    -0.243084291955660
    -0.224460896754053
    -0.206756338821774
    -0.189791662779907
    -0.173539743072805
    -0.158075848646589
    -0.143487050633017
    -0.129929594978600
    -0.117395384985897
    -0.105500316918808
    -0.093765090635029
    -0.081953760638700
    -0.070076621022522
    -0.058704654994896
    -0.049781586047841
    -0.043353388344929
    -0.037397811716789
    -0.031409015958887
    -0.025883677279595
    -0.020874309341678
    -0.016553012345656
    -0.012878517452504
    -0.009739626792494
    -0.007118915321529
    -0.004968284087750
    -0.003282649277752
    -0.002012229880587
    -0.001108341189433
    -0.000519132393179
    -0.000184605821471
    -0.000036764859159
    -0.000000054648204]);

%A state energies from Zaharova2009
% [E, V] = SolveTISE1D(@(x) NaCsAPES(x), 19.5995, 2, 100, 0.01);
% E = flip(E(find(E<0))*219474.631)
out.A.E = 1.0e+03 *flip([
    -0.000003836983573
    -0.002449874414625
    -0.008485064193668
    -0.017324579816992
    -0.028503839311524
    -0.041703991674409
    -0.056689175910348
    -0.073276412177862
    -0.091318898970481
    -0.110695855652907
    -0.131305932130682
    -0.153062719860894
    -0.175891575438657
    -0.199727302688633
    -0.224512417595794
    -0.250195821339371
    -0.276731766628819
    -0.304079039596614
    -0.332200303210131
    -0.361061563784552
    -0.390631732736434
    -0.420882263015860
    -0.451786844801805
    -0.483321148739973
    -0.515462607697316
    -0.548190230002005
    -0.581484438633257
    -0.615326931960467
    -0.649700562502273
    -0.684589230851358
    -0.719977792439221
    -0.755851975232153
    -0.792198306781733
    -0.829004049319084
    -0.866257141797131
    -0.903946147959754
    -0.942060209659487
    -0.980589004763062
    -1.019522709081223
    -1.058851961840094
    -1.098567834278927
    -1.138661801015836
    -1.179125713870803
    -1.219951777875922
    -1.261132529237175
    -1.302660815041462
    -1.344529774527830
    -1.386732821763509
    -1.429263629583976
    -1.472116114672596
    -1.515284423669348
    -1.558762920210398
    -1.602546172811053
    -1.646628943513979
    -1.691006177232809
    -1.735672991728633
    -1.780624668163162
    -1.825856642178281
    -1.871364495456598
    -1.917143947722264
    -1.963190849145400
    -2.009501173117039
    -2.056071009364927
    -2.102896557383378
    -2.149974120153122
    -2.197300098129604
    -2.244870983480350
    -2.292683354554122
    -2.340733870566490
    -2.389019266488166
    -2.437536348124124
    -2.486281987372935
    -2.535253117657331
    -2.584446729518192
    -2.633859866365501
    -2.683489620380930
    -2.733333128568014
    -2.783387568946786
    -2.833650156890965
    -2.884118141606760
    -2.934788802753416
    -2.985659447206608
    -3.036727405966929
    -3.087990031216550
    -3.139444693528422
    -3.191088779233302
    -3.242919687951122
    -3.294934830294384
    -3.347131625752513
    -3.399507500767498
    -3.452059887012559
    -3.504786219887241
    -3.557683937243964
    -3.610750478363085
    -3.663983283195562
    -3.717379791894653
    -3.770937444660757
    -3.824653681926352
    -3.878525944911281
    -3.932551676582350
    -3.986728323055279
    -4.041053335481693
    -4.095524172469230
    -4.150138303088512
    -4.204893210527659
    -4.259786396462377
    -4.314815386218235
    -4.369977734811217
    -4.425271033963555
    -4.480692920203659
    -4.536241084172803
    -4.591913281276103
    -4.647707343832312
    -4.703621194895628
    -4.759652863943307
    -4.815800504645497
    -4.872062414958378
    -4.928437059807876
    -4.984923096659601
    -5.041519404299449
    -5.098225115179115
    -5.155039651709442
    -5.211962766911193
    -5.268994589854568
    -5.326135676333085
    -5.383387065219772
    -5.440750340938285
    -5.498227702441797
    -5.555822039018860
    -5.613537013126918
    -5.671377150276808
    -5.729347935740339
    -5.787455917510017
    -5.845708814487426
    -5.904115628298541
    -5.962686756418354]);

%b0 (b3\Pi Omega=0) state energies from Zaharova2009
out.b0.E.Zaharova2009 =  1.0e+03 *flip([ -0.0001
   -0.0008
   -0.0022
   -0.0042
   -0.0071
   -0.0110
   -0.0160
   -0.0223
   -0.0300
   -0.0392
   -0.0500
   -0.0626
   -0.0770
   -0.0932
   -0.1113
   -0.1313
   -0.1531
   -0.1769
   -0.2025
   -0.2300
   -0.2592
   -0.2903
   -0.3231
   -0.3576
   -0.3937
   -0.4315
   -0.4708
   -0.5117
   -0.5540
   -0.5979
   -0.6431
   -0.6897
   -0.7377
   -0.7869
   -0.8375
   -0.8892
   -0.9422
   -0.9963
   -1.0516
   -1.1080
   -1.1654
   -1.2240
   -1.2835
   -1.3440
   -1.4055
   -1.4680
   -1.5314
   -1.5957
   -1.6608
   -1.7269
   -1.7937
   -1.8614
   -1.9299
   -1.9992
   -2.0693
   -2.1401
   -2.2116
   -2.2839
   -2.3568
   -2.4305
   -2.5048
   -2.5798
   -2.6555
   -2.7317
   -2.8087
   -2.8862
   -2.9644
   -3.0431
   -3.1224
   -3.2024
   -3.2828
   -3.3639
   -3.4455
   -3.5277
   -3.6104
   -3.6936
   -3.7774
   -3.8617
   -3.9465
   -4.0319
   -4.1177
   -4.2041
   -4.2909
   -4.3783
   -4.4662
   -4.5545
   -4.6434
   -4.7327
   -4.8225
   -4.9128
   -5.0036
   -5.0948
   -5.1866
   -5.2788
   -5.3715
   -5.4646
   -5.5582
   -5.6523
   -5.7468
   -5.8418
   -5.9372
   -6.0330]);

%(2)W=0 state, from Zaharova2009
% [E, V] = SolveTISE1D(@(x) NaCs2W0PES(x), 19.5995, 2, 150, 0.01, 1);
out.TwoW0.E.Zaharova2009 =    1.0e+03 *flip([
  -0.000339823974772
  -0.001511633523965
  -0.004065903819278
  -0.008614896840384
  -0.015464752246300
  -0.024731937915254
  -0.036442737940010
  -0.050554396455134
  -0.066965952628883
  -0.085533598908616
  -0.106088316396946
  -0.128452039229348
  -0.152450085931297
  -0.177919241002777
  -0.204711998171347
  -0.232697973107806
  -0.261763517825544
  -0.291810359717757
  -0.322753826816404
  -0.354520998504651
  -0.387048962990465
  -0.420283262972458
  -0.454176553348177
  -0.488687464627122
  -0.523779651870136
  -0.559421004232771
  -0.595582990147528
  -0.632240115339994
  -0.669369473884383
  -0.706950375640478
  -0.744964036283297
  -0.783393318567609
  -0.822222515482335
  -0.861437167680301
  -0.901023909103489
  -0.940970335993146
  -0.981264895351003
  -1.021896789459797
  -1.062855893574152
  -1.104132684582112
  -1.145718179125668
  -1.187603879931941
  -1.229781728923234
  -1.272244065648484
  -1.314983590186054
  -1.357993330403292
  -1.401266613350585
  -1.444797039729567
  -1.488578460224660
  -1.532604953676990
  -1.576870808012757
  -1.621370503804131
  -1.666098698705691
  -1.711050211753708
  -1.756220009065437
  -1.801603192516370
  -1.847194989631409
  -1.892990741791259
  -1.938985891995597
  -1.985175976149298
  -2.031556617048352
  -2.078123515491996
  -2.124872438355577
  -2.171799210838571
  -2.218899714091849
  -2.266169878726716
  -2.313605671534978
  -2.361203087723891
  -2.408958152818991
  -2.456866917933719
  -2.504925442689973
  -2.553129787555285
  -2.601476022281239
  -2.649960220846203
  -2.698578436524921
  -2.747326697458465
  -2.796201025698148
  -2.845197424821877
  -2.894311842246751
  -2.943540179111746
  -2.992878322288671
  -3.042322106084841
  -3.091867264374206
  -3.141509480483832
  -3.191244415976984
  -3.241067613513245
  -3.290974477184056
  -3.340960391931886
  -3.391020673908684
  -3.441150407103942
  -3.491344568326357
  -3.541598158559053
  -3.591905927348116
  -3.642262318260773
  -3.692661850830322
  -3.743098915715266
  -3.793567329678811
  -3.844060883374795
  -3.894573528442411
  -3.945098396500849
  -3.995628219049216
  -4.046156332484691
  -4.096675149512270
  -4.147175899926774
  -4.197650996968418
  -4.248092121520159
  -4.298488348947934
  -4.348830689980320
  -4.399110138946777
  -4.449312504392143
  -4.499426707358529
  -4.549443297169609
  -4.599342615281398
  -4.649110680958618
  -4.698738373498774
  -4.748195599248732
  -4.797465360241322
  -4.846540690651343
  -4.895368586866513
  -4.943934036768090
  -4.992234137423053
  -5.040159514670943
  -5.087728084643020
  -5.134926467702206
  -5.181499803921851
  -5.227650575051057
  -5.273190451031367
  -5.317534674289790
  -5.361772683745232
  -5.404181582903116
  -5.444371803724321
  -5.487051812514506
  -5.517776783568396
  -5.555834972049035
  -5.592007295716514
  -5.610147163271427
  -5.679283316715268
  -5.771276821990827
  -5.865121094362407]);


%(3)W=0 state, from Zaharova2009
% [E, V] = SolveTISE1D(@(x) NaCs3W0PES(x), 19.5995, 2, 150, 0.01, 1);
out.ThreeW0.E.Zaharova2009 =    1.0e+03 *flip([
  -0.000007775107184
  -0.000536871933405
  -0.002860537150307
  -0.007764349836956
  -0.014916122775053
  -0.023887172110504
  -0.034351091620738
  -0.046064047053097
  -0.058838366183231
  -0.072524764359664
  -0.087000974275854
  -0.102164345115124
  -0.117926890289074
  -0.134211891654709
  -0.150951535208651
  -0.168085266356671
  -0.185558681531864
  -0.203322856360761
  -0.221334070898629
  -0.239553942931509
  -0.257950029601683
  -0.276497011406681
  -0.295178632901152
  -0.313990633476643
  -0.332944926484253
  -0.352075187444661
  -0.371443613476261
  -0.391147677909510
  -0.411324209506677
  -0.432146917127515
  -0.453814488836497
  -0.476530749836884
  -0.500483395996559
  -0.525828665653954
  -0.552685185620465
  -0.581135416590634
  -0.611231138804314
  -0.643000003352511
  -0.676451536223694
  -0.711582030274810
  -0.748378303640896
  -0.786820504565823
  -0.826884177732318
  -0.868541780251118
  -0.911763794318304
  -0.956519545796609
  -1.002777808114595
  -1.050507248661922
  -1.099676758872876
  -1.150255697991929
  -1.202214072670777
  -1.255522668661828
  -1.310153146236993
  -1.366078107927935
  -1.423271145859989
  -1.481706874679535
  -1.541360953451387
  -1.602210098210684
  -1.664232088553971
  -1.727405772436514
  -1.791711068868150
  -1.857128966550480
  -1.923641523375828
  -1.991231871311179
  -2.059884219666162
  -2.129583855794948
  -2.200317157078634
  -2.272071608530089
  -2.344835810770124
  -2.418599501941763
  -2.493353598874290
  -2.569090218327959
  -2.645802713317748
  -2.723485751127863
  -2.802135351629989
  -2.881748949203081
  -2.962325530948441
  -3.043865687576464
  -3.126371735831401
  -3.209847949185372
  -3.294300601186132
  -3.379738258700351
  -3.466172096127947
  -3.553615948737808
  -3.642087031150220
  -3.731606117273711
  -3.822198030226812
  -3.913892883195172
  -4.006725857331031
  -4.100739638288761
  -4.195984642156957
  -4.292521078145524
  -4.390422775216294
  -4.489776394413965
  -4.590693108170065
  -4.693303657010588
  -4.797782739995015
  -4.904342656573904
  -5.013278839204180
  -5.124975091263962
  -5.240001440070704
  -5.359178455474583
  -5.483938572301316
  -5.616677059321716
  -5.765154984966571]);


%b1 (b3\Pi Omega=1) state energies from Zaharova2009
% Eb1 = SolveTISE1D_FG(@(x) NaCs.b1.PES(x) - NaCs.b1.PES(1000), NaCs.mu, 1.0, 200, 0.03,1);
% Eb1 = EHToCmInv*Eb1(find(Eb1<0))
out.b1.PES = @(x) NaCsb1PES(x);
out.b1.E.Zaharova2009 = 1.0e+03 *[
    -6.123334577307269
  -6.027621557981176
  -5.932326428143117
  -5.837454061116458
  -5.743008883531012
  -5.648994934879711
  -5.555415924034864
  -5.462275282902002
  -5.369576217359423
  -5.277321755608432
  -5.185514794041410
  -5.094158140722331
  -5.003254556560881
  -4.912806794292830
  -4.822817635218543
  -4.733289924070417
  -4.644226601645491
  -4.555630735620974
  -4.467505549689228
  -4.379854450462188
  -4.292681054244306
  -4.205989207287938
  -4.119783015264418
  -4.034066855791124
  -3.948845404859162
  -3.864123652132191
  -3.779906918096081
  -3.696200873508405
  -3.613011550008547
  -3.530345357972103
  -3.448209099847520
  -3.366609981541171
  -3.285555626238284
  -3.205054088631020
  -3.125113857968549
  -3.045743880343987
  -2.966953562151902
  -2.888752784182100
  -2.811151909829106
  -2.734161797172714
  -2.657793810789000
  -2.582059830435771
  -2.506972263539219
  -2.432544055812966
  -2.358788703340507
  -2.285720264555057
  -2.213353372760590
  -2.141703249220837
  -2.070785716837989
  -2.000617214446121
  -1.931214811792343
  -1.862596225253858
  -1.794779834305441
  -1.727784698800081
  -1.661630577057400
  -1.596337944793264
  -1.531928014884602
  -1.468422757949501
  -1.405844923728329
  -1.344218063191720
  -1.283566551305738
  -1.223915610330029
  -1.165291333490530
  -1.107720708809030
  -1.051231642806769
  -0.995852983712809
  -0.941614543702736
  -0.888547119558497
  -0.836682510973475
  -0.786053535512824
  -0.736694038968374
  -0.688638899518678
  -0.641924023632968
  -0.596586331140692
  -0.552663726200698
  -0.510195049707909
  -0.469220008135600
  -0.429779071190017
  -0.391913329823934
  -0.355664302467470
  -0.321073674463016
  -0.288182951221921
  -0.257032998871186
  -0.227663440342228
  -0.200111864886896
  -0.174412796904414
  -0.150596362343825
  -0.128686577473626
  -0.108699185866894
  -0.090638985685399
  -0.074496645767060
  -0.060245132953489
  -0.047836095164545
  -0.037196866764655
  -0.028229097827328
  -0.020810123886190
  -0.014797778950867
  -0.010038351591814
  -0.006376316866201
  -0.003664132420889
  -0.001770900279742
  -0.000589646909413
  -0.000045666827081];

%b2 (b3\Pi Omega=2) state energies from Zaharova2009
out.b2.E.Zaharova2009 = flip(1.0e+03 *[
   -0.0002
   -0.0011
   -0.0026
   -0.0049
   -0.0080
   -0.0122
   -0.0175
   -0.0242
   -0.0324
   -0.0422
   -0.0538
   -0.0672
   -0.0824
   -0.0996
   -0.1187
   -0.1397
   -0.1627
   -0.1875
   -0.2141
   -0.2426
   -0.2728
   -0.3048
   -0.3384
   -0.3737
   -0.4105
   -0.4490
   -0.4889
   -0.5303
   -0.5732
   -0.6174
   -0.6630
   -0.7100
   -0.7582
   -0.8077
   -0.8584
   -0.9103
   -0.9633
   -1.0175
   -1.0728
   -1.1291
   -1.1865
   -1.2449
   -1.3043
   -1.3647
   -1.4260
   -1.4883
   -1.5514
   -1.6155
   -1.6804
   -1.7461
   -1.8126
   -1.8800
   -1.9481
   -2.0170
   -2.0867
   -2.1571
   -2.2282
   -2.3000
   -2.3725
   -2.4457
   -2.5196
   -2.5941
   -2.6692
   -2.7450
   -2.8214
   -2.8984
   -2.9760
   -3.0541
   -3.1329
   -3.2122
   -3.2921
   -3.3725
   -3.4535
   -3.5350
   -3.6171
   -3.6996
   -3.7827
   -3.8663
   -3.9504
   -4.0350
   -4.1201
   -4.2057
   -4.2918
   -4.3784
   -4.4654
   -4.5530
   -4.6410
   -4.7294
   -4.8184
   -4.9078
   -4.9977
   -5.0880
   -5.1788
   -5.2701
   -5.3618
   -5.4540
   -5.5466
   -5.6397
   -5.7332
   -5.8272
   -5.9216
   -6.0164
   -6.1117
   -6.2074]);