within AixLib.Systems.Benchmark.BenchmarkModel_reworked_TestModularization;
model ReducedOrderModel_OneRoom
  "Single instance of reduced order room with input paramaters"
   extends Modelica.Icons.Example;


  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    calTSky=AixLib.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    computeWetBulbTemperature=false,
    filNam=Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos"))
    "Weather data reader"
    annotation (Placement(transformation(extent={{-96,52},{-76,72}})));

  BoundaryConditions.SolarIrradiation.DiffusePerez HDifTil[2](
    each outSkyCon=true,
    each outGroCon=true,
    each til=1.5707963267949,
    each lat=0.87266462599716,
    azi={3.1415926535898,4.7123889803847})
    "Calculates diffuse solar radiation on titled surface for both directions"
    annotation (Placement(transformation(extent={{-68,20},{-48,40}})));
  BoundaryConditions.SolarIrradiation.DirectTiltedSurface HDirTil[2](
    each til=1.5707963267949,
    each lat=0.87266462599716,
    azi={3.1415926535898,4.7123889803847})
    "Calculates direct solar radiation on titled surface for both directions"
    annotation (Placement(transformation(extent={{-68,52},{-48,72}})));
  ThermalZones.ReducedOrder.SolarGain.CorrectionGDoublePane corGDouPan[2](each UWin=2.1,
     each n=2) "Correction factor for solar transmission"
    annotation (Placement(transformation(extent={{6,46},{26,66}})));
  ThermalZones.ReducedOrder.RC.FourElements
                  thermalZoneFourElements(
    VAir=2700,
    hConExt=2.5,
    hConWin=1.3,
    gWin=1,
    ratioWinConRad=0.09,
    nExt=4,
    RExt={0.05,2.857,0.48,0.0294},
    CExt={1000,1030,1000,1000},
    hRad=5,
    AInt=90,
    hConInt=2.5,
    nInt=2,
    RInt={0.175,0.0294},
    CInt={1000,1000},
    RWin=0.01282,
    RExtRem=0.00001,
    AFloor=900,
    hConFloor=2.5,
    nFloor=4,
    RFloor={1.5,0.1087,1.1429,0.0429},
    RFloorRem=0.00001,
    CFloor={8400,575000,4944,120000},
    ARoof=900,
    hConRoof=2.5,
    nRoof=4,
    RRoof={0.44444,0.06957,0.02941,0.00001},
    RRoofRem=0.0001,
    CRoof={2472,368000,18000,0.000001},
    nOrientations=4,
    AWin={60,0,60,60},
    ATransparent={48,0,48,48},
    AExt={30,0,30,30},
    redeclare package Medium = Modelica.Media.Air.SimpleAir,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial);



  ThermalZones.ReducedOrder.EquivalentAirTemperature.VDI6007WithWindow
                                             eqAirTemp(
    wfGro=0,
    withLongwave=true,
    aExt=0.7,
    hConWallOut=20,
    hRad=5,
    hConWinOut=20,
    n=2,
    wfWall={0.3043478260869566,0.6956521739130435},
    wfWin={0.5,0.5},
    TGro=285.15) "Computes equivalent air temperature" annotation (Placement(transformation(extent={{-24,-14},{-4,6}})));
  Modelica.Blocks.Math.Add solRad[2]
    "Sums up solar radiation of both directions"
    annotation (Placement(transformation(extent={{-38,6},{-28,16}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature preTem
    "Prescribed temperature for exterior walls outdoor surface temperature"
    annotation (Placement(transformation(extent={{8,-6},{20,6}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature preTem1
    "Prescribed temperature for windows outdoor surface temperature"
    annotation (Placement(transformation(extent={{8,14},{20,26}})));
  Modelica.Thermal.HeatTransfer.Components.Convection theConWin
    "Outdoor convective heat transfer of windows"
    annotation (Placement(transformation(extent={{38,16},{28,26}})));
  Modelica.Thermal.HeatTransfer.Components.Convection theConWall
    "Outdoor convective heat transfer of walls"
    annotation (Placement(transformation(extent={{36,6},{26,-4}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow perRad
    "Radiative heat flow of persons"
    annotation (Placement(transformation(extent={{48,-42},{68,-22}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow perCon
    "Convective heat flow of persons"
    annotation (Placement(transformation(extent={{48,-62},{68,-42}})));
  Modelica.Blocks.Sources.CombiTimeTable intGai(
    table=[0,0,0,0; 3600,0,0,0; 7200,0,0,0; 10800,0,0,0; 14400,0,0,0; 18000,0,0,
        0; 21600,0,0,0; 25200,0,0,0; 25200,80,80,200; 28800,80,80,200; 32400,80,
        80,200; 36000,80,80,200; 39600,80,80,200; 43200,80,80,200; 46800,80,80,200;
        50400,80,80,200; 54000,80,80,200; 57600,80,80,200; 61200,80,80,200; 61200,
        0,0,0; 64800,0,0,0; 72000,0,0,0; 75600,0,0,0; 79200,0,0,0; 82800,0,0,0;
        86400,0,0,0],
    columns={2,3,4},
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic) "Table with profiles for persons (radiative and convective) and machines
    (convective)"
    annotation (Placement(transformation(extent={{6,-60},{22,-44}})));
  Modelica.Blocks.Sources.Constant const[2](each k=0)
    "Sets sunblind signal to zero (open)"
    annotation (Placement(transformation(extent={{-20,14},{-14,20}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow macConv
    "Convective heat flow of machines"
    annotation (Placement(transformation(extent={{48,-84},{68,-64}})));
  Modelica.Blocks.Sources.Constant hConWall(k=25*11.5) "Outdoor coefficient of heat transfer for walls"
    annotation (Placement(transformation(extent={{-4,-4},{4,4}}, rotation=90)));
  Modelica.Blocks.Sources.Constant hConWin(k=20*14) "Outdoor coefficient of heat transfer for windows"
    annotation (Placement(transformation(extent={{4,-4},{-4,4}}, rotation=90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature preTemFloor
    "Prescribed temperature for floor plate outdoor surface temperature"
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
    rotation=90,origin={67,-12})));
  Modelica.Blocks.Sources.Constant TSoil(k=283.15)
    "Outdoor surface temperature for floor plate"
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
    rotation=180,origin={84,-22})));
  ThermalZones.ReducedOrder.EquivalentAirTemperature.VDI6007
                                   eqAirTempVDI(
    aExt=0.7,
    n=1,
    wfWall={1},
    wfWin={0},
    wfGro=0,
    hConWallOut=20,
    hRad=5,
    TGro=285.15) "Computes equivalent air temperature for roof" annotation (Placement(transformation(extent={{30,74},{50,94}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature preTemRoof
    "Prescribed temperature for roof outdoor surface temperature"
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=-90,
    origin={67,64})));
  Modelica.Thermal.HeatTransfer.Components.Convection theConRoof
    "Outdoor convective heat transfer of roof"
    annotation (Placement(transformation(extent={{5,-5},{-5,5}},rotation=-90,
    origin={67,47})));
  Modelica.Blocks.Sources.Constant hConRoof(k=25*11.5) "Outdoor coefficient of heat transfer for roof"
    annotation (Placement(transformation(extent={{4,-4},{-4,4}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    "Sets sunblind signal to zero (open)"
    annotation (Placement(transformation(extent={{68,90},{62,96}})));
  BoundaryConditions.WeatherData.Bus weaBus "Weather data bus"
    annotation (Placement(transformation(extent={{-100,-10},{-66,22}}),
    iconTransformation(extent={{-70,-12},{-50,8}})));
equation

  connect(eqAirTemp.TEqAirWin,preTem1. T)
    annotation (Line(points={{-3,-0.2},{0,-0.2},{0,20},{6.8,20}},
    color={0,0,127}));
  connect(eqAirTemp.TEqAir,preTem. T)
    annotation (Line(points={{-3,-4},{4,-4},{4,0},{6.8,0}},
    color={0,0,127}));
  connect(weaDat.weaBus,weaBus)
    annotation (Line(points={{-76,62},{-74,62},{-74,18},{-84,18},{-84,12},
    {-83,12},{-83,6}},color={255,204,51},
    thickness=0.5), Text(string="%second",index=1,extent={{6,3},{6,3}}));
  connect(weaBus.TDryBul,eqAirTemp. TDryBul)
    annotation (Line(points={{-83,6},{-83,-2},{-38,-2},{-38,-10},{-26,-10}},
    color={255,204,51},
    thickness=0.5), Text(string="%first",index=-1,extent={{-6,3},{-6,3}}));
  connect(intGai.y[1],perRad. Q_flow)
    annotation (Line(points={{22.8,-52},{28,-52},{28,-32},{48,-32}},
    color={0,0,127}));
  connect(intGai.y[2],perCon. Q_flow)
    annotation (Line(points={{22.8,-52},{36,-52},{48,-52}}, color={0,0,127}));
  connect(intGai.y[3],macConv. Q_flow)
    annotation (Line(points={{22.8,-52},{28,-52},{28,-74},{48,-74}},
    color={0,0,127}));
  connect(const.y,eqAirTemp. sunblind)
    annotation (Line(points={{-13.7,17},{-12,17},{-12,8},{-14,8}},
    color={0,0,127}));
  connect(HDirTil.H,solRad. u1)
    annotation (Line(points={{-47,62},{-42,62},{-42,14},{-39,14}},
    color={0,0,127}));
  connect(HDifTil.H,solRad. u2)
    annotation (Line(points={{-47,30},{-44,30},{-44,8},{-39,8}},
    color={0,0,127}));
  connect(solRad.y,eqAirTemp. HSol)
    annotation (Line(points={{-27.5,11},{-26,11},{-26,2}},
    color={0,0,127}));
  connect(weaDat.weaBus,HDifTil [1].weaBus)
    annotation (Line(points={{-76,62},{-74,62},{-74,30},{-68,30}},
    color={255,204,51},thickness=0.5));
  connect(weaDat.weaBus,HDifTil [2].weaBus)
    annotation (Line(points={{-76,62},{-74,62},{-74,30},{-68,30}},
    color={255,204,51},thickness=0.5));
  connect(weaDat.weaBus,HDirTil [1].weaBus)
    annotation (Line(
    points={{-76,62},{-76,62},{-68,62}},
    color={255,204,51},
    thickness=0.5));
  connect(weaDat.weaBus,HDirTil [2].weaBus)
    annotation (Line(
    points={{-76,62},{-76,62},{-68,62}},
    color={255,204,51},
    thickness=0.5));
  connect(perRad.port,thermalZoneFourElements. intGainsRad)
    annotation (
    Line(points={{68,-32},{84,-32},{100,-32},{100,24},{92,24}},
    color={191,0,0}));
  connect(theConWin.solid,thermalZoneFourElements. window)
    annotation (Line(points={{38,21},{40,21},{40,20},{44,20}},   color=
    {191,0,0}));
  connect(preTem1.port,theConWin. fluid)
    annotation (Line(points={{20,20},{28,20},{28,21}}, color={191,0,0}));
  connect(thermalZoneFourElements.extWall,theConWall. solid)
    annotation (Line(points={{44,12},{40,12},{40,1},{36,1}},
    color={191,0,0}));
  connect(theConWall.fluid,preTem. port)
    annotation (Line(points={{26,1},{24,1},{24,0},{20,0}}, color={191,0,0}));
  connect(hConWall.y,theConWall. Gc) annotation (Line(points={{0,4.4},{0,-4},{31,-4}}, color={0,0,127}));
  connect(hConWin.y,theConWin. Gc) annotation (Line(points={{0,-4.4},{0,26},{33,26}}, color={0,0,127}));
  connect(weaBus.TBlaSky,eqAirTemp. TBlaSky)
    annotation (Line(
    points={{-83,6},{-58,6},{-58,2},{-32,2},{-32,-4},{-26,-4}},
    color={255,204,51},
    thickness=0.5), Text(
    string="%first",
    index=-1,
    extent={{-6,3},{-6,3}}));
  connect(macConv.port,thermalZoneFourElements. intGainsConv)
    annotation (
    Line(points={{68,-74},{82,-74},{96,-74},{96,20},{92,20}}, color={191,
    0,0}));
  connect(perCon.port,thermalZoneFourElements. intGainsConv)
    annotation (
    Line(points={{68,-52},{96,-52},{96,20},{92,20}}, color={191,0,0}));
  connect(preTemFloor.port,thermalZoneFourElements. floor)
    annotation (Line(points={{67,-6},{68,-6},{68,-2}}, color={191,0,0}));
  connect(TSoil.y,preTemFloor. T)
  annotation (Line(points={{79.6,-22},{67,-22},{67,-19.2}}, color={0,0,127}));
  connect(preTemRoof.port,theConRoof. fluid)
    annotation (Line(points={{67,58},{67,58},{67,52}}, color={191,0,0}));
  connect(theConRoof.solid,thermalZoneFourElements. roof)
    annotation (Line(points={{67,42},{66.9,42},{66.9,34}}, color={191,0,0}));
  connect(eqAirTempVDI.TEqAir,preTemRoof. T)
    annotation (Line(
    points={{51,84},{67,84},{67,71.2}}, color={0,0,127}));
  connect(theConRoof.Gc,hConRoof. y) annotation (Line(points={{72,47},{-4.4,47},{-4.4,0}}, color={0,0,127}));
  connect(eqAirTempVDI.TDryBul,eqAirTemp. TDryBul)
    annotation (Line(points={{28,78},{-96,78},{-96,-2},{-38,-2},{-38,-10},{-26,-10}},
    color={0,0,127}));
  connect(eqAirTempVDI.TBlaSky,eqAirTemp. TBlaSky)
    annotation (Line(points={{28,84},{-34,84},{-98,84},{-98,-8},{-58,-8},{-58,2},
          {-32,2},{-32,-4},{-26,-4}},
    color={0,0,127}));
  connect(eqAirTempVDI.HSol[1],weaBus. HGloHor)
    annotation (Line(points={{28,90},{-100,90},{-100,6},{-83,6}},
    color={0,0,127}),Text(
    string="%second",
    index=1,
    extent={{6,3},{6,3}}));
  connect(const1.y,eqAirTempVDI. sunblind[1])
    annotation (Line(points={{61.7,93},{56,93},{56,98},{40,98},{40,96}},
                                      color={0,0,127}));
  connect(HDirTil.H, corGDouPan[1].HDirTil) annotation (Line(points={{-47,62},{-22,
          62},{-22,62},{4,62}},          color={0,0,127}));
  connect(HDirTil.H, corGDouPan[2].HDirTil) annotation (Line(points={{-47,62},{-22,
          62},{-22,62},{4,62}},          color={0,0,127}));
  connect(HDirTil.inc, corGDouPan[1].inc) annotation (Line(points={{-47,58},{-22,
          58},{-22,50},{4,50}},      color={0,0,127}));
  connect(HDirTil.inc, corGDouPan[2].inc) annotation (Line(points={{-47,58},{-22,
          58},{-22,50},{4,50}},      color={0,0,127}));
  connect(HDifTil.HSkyDifTil, corGDouPan[1].HSkyDifTil) annotation (Line(points=
         {{-47,36},{-22,36},{-22,58},{4,58}}, color={0,0,127}));
  connect(HDifTil.HSkyDifTil, corGDouPan[2].HSkyDifTil) annotation (Line(points=
         {{-47,36},{-22,36},{-22,58},{4,58}}, color={0,0,127}));
  connect(HDifTil.HGroDifTil, corGDouPan[1].HGroDifTil) annotation (Line(points=
         {{-47,24},{-22,24},{-22,54},{4,54}}, color={0,0,127}));
  connect(HDifTil.HGroDifTil, corGDouPan[2].HGroDifTil) annotation (Line(points=
         {{-47,24},{-22,24},{-22,54},{4,54}}, color={0,0,127}));
  connect(corGDouPan[1].solarRadWinTrans[1], thermalZoneFourElements.solRad[1])
    annotation (Line(points={{27,55.5},{36,55.5},{36,30.25},{43,30.25}}, color={
          0,0,127}));
  connect(corGDouPan[1].solarRadWinTrans[2], thermalZoneFourElements.solRad[2])
    annotation (Line(points={{27,56.5},{36,56.5},{36,30.75},{43,30.75}}, color={
          0,0,127}));
  connect(corGDouPan[2].solarRadWinTrans[1], thermalZoneFourElements.solRad[3])
    annotation (Line(points={{27,55.5},{36,55.5},{36,31.25},{43,31.25}}, color=
          {0,0,127}));
  connect(corGDouPan[2].solarRadWinTrans[2], thermalZoneFourElements.solRad[4])
    annotation (Line(points={{27,56.5},{36,56.5},{36,31.75},{43,31.75}}, color=
          {0,0,127}));
  annotation (Line(points={{79.6,-22},{65,-22},{65,-25.2}}, color={0,0,127}),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=2592000, Interval=300));
end ReducedOrderModel_OneRoom;
