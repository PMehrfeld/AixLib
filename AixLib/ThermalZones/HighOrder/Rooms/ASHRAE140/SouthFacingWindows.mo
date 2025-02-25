within AixLib.ThermalZones.HighOrder.Rooms.ASHRAE140;
model SouthFacingWindows "windows facing south"
  extends AixLib.ThermalZones.HighOrder.Rooms.BaseClasses.PartialRoom(
    redeclare replaceable model WindowModel = AixLib.ThermalZones.HighOrder.Components.WindowsDoors.Window_ASHRAE140,
    redeclare DataBase.WindowsDoors.Simple.WindowSimple_ASHRAE140 Type_Win,
      redeclare DataBase.Walls.Collections.OFD.BaseDataMultiInnerWalls
      wallTypes(
      roof=DataBase.Walls.ASHRAE140.RO_Case600(),
      OW=DataBase.Walls.ASHRAE140.OW_Case600(),
      IW_vert_half_a=DataBase.Walls.ASHRAE140.DummyDefinition(),
      IW_vert_half_b=DataBase.Walls.ASHRAE140.DummyDefinition(),
      IW_hori_upp_half=DataBase.Walls.ASHRAE140.DummyDefinition(),
      IW_hori_low_half=DataBase.Walls.ASHRAE140.DummyDefinition(),
      IW_hori_att_upp_half=DataBase.Walls.ASHRAE140.DummyDefinition(),
      IW_hori_att_low_half=DataBase.Walls.ASHRAE140.DummyDefinition(),
      groundPlate_upp_half=DataBase.Walls.ASHRAE140.FL_Case600(),
      groundPlate_low_half=DataBase.Walls.ASHRAE140.DummyDefinition(),
      IW2_vert_half_a=DataBase.Walls.ASHRAE140.DummyDefinition(),
      IW2_vert_half_b=DataBase.Walls.ASHRAE140.DummyDefinition(),
      roofRoomUpFloor=DataBase.Walls.ASHRAE140.DummyDefinition()), final room_V=
       room_length*room_width*room_height);

  parameter Modelica.SIunits.Length room_length=6 "length"
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Height room_height=2.7 "height"
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Length room_width=8 "width"
    annotation (Dialog(group="Dimensions", descriptionLabel=true));

  parameter Modelica.SIunits.Area Win_Area=12 "Window area " annotation (Dialog(
      group="Windows",
      descriptionLabel=true,
      enable=withWindow1));

  parameter Components.Types.selectorCoefficients absInnerWallSurf=AixLib.ThermalZones.HighOrder.Components.Types.selectorCoefficients.abs06
    "Coefficients for interior solar absorptance of wall surface abs={0.6, 0.9, 0.1}"
    annotation (Dialog(tab = "Short wave radiation"));

  parameter Boolean use_dynamicShortWaveRadMethod = true "True = dynamic as holistic approach, false = static approach to obtain the same values as provided in tables of the ASHREA"
    annotation(Dialog(tab = "Short wave radiation"));

  replaceable parameter AixLib.ThermalZones.HighOrder.Components.Types.CoeffTableSouthWindow coeffTableSolDistrFractions
    constrainedby AixLib.ThermalZones.HighOrder.Components.Types.PartialCoeffTable(final abs=absInnerWallSurf)
    "Tables of solar distribution fractions"
    annotation (Dialog(tab = "Short wave radiation", enable=not use_dynamicShortWaveRadMethod), choicesAllMatching=true, Placement(transformation(extent={{78,78},{98,98}})));


  AixLib.ThermalZones.HighOrder.Components.Walls.Wall outerWall_South(
    final energyDynamics=energyDynamicsWalls,
    use_shortWaveRadIn=true,
    use_shortWaveRadOut=true,
    final radLongCalcMethod=radLongCalcMethod,
    final T_ref=T_ref,
    calcMethodIn=calcMethodIn,
    final WindowType=Type_Win,
    redeclare final model WindowModel = WindowModel,
    redeclare final model CorrSolarGainWin = CorrSolarGainWin,
    withDoor=false,
    wallPar=wallTypes.OW,
    final T0=TWalls_start,
    wall_length=room_width,
    solar_absorptance=solar_absorptance_OW,
    calcMethodOut=calcMethodOut,
    outside=true,
    withWindow=true,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    windowarea=Win_Area,
    wall_height=room_height,
    surfaceType=AixLib.DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster())
      annotation (Placement(transformation(extent={{-5,-30},{5,30}},
        rotation=90,
        origin={21,-70})));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall outerWall_West(
    final energyDynamics=energyDynamicsWalls,
    use_shortWaveRadIn=true,
    final radLongCalcMethod=radLongCalcMethod,
    final T_ref=T_ref,
    calcMethodIn=calcMethodIn,
    wall_length=room_length,
    wall_height=room_height,
    withWindow=false,
    final WindowType=Type_Win,
    redeclare final model WindowModel = WindowModel,
    redeclare final model CorrSolarGainWin = CorrSolarGainWin,
    withDoor=false,
    final T0=TWalls_start,
    outside=true,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    wallPar=wallTypes.OW,
    solar_absorptance=solar_absorptance_OW,
    surfaceType=DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster(),
    calcMethodOut=calcMethodOut)
      annotation (Placement(transformation(extent={{-5,-28},{4.99994,28}},
                                                                     rotation=0,   origin={-82,1})));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall outerWall_East(
    final energyDynamics=energyDynamicsWalls,
    use_shortWaveRadIn=true,
    final radLongCalcMethod=radLongCalcMethod,
    final T_ref=T_ref,
    calcMethodIn=calcMethodIn,
    wall_length=room_length,
    wall_height=room_height,
    withWindow=false,
    final WindowType=Type_Win,
    redeclare final model WindowModel = WindowModel,
    redeclare final model CorrSolarGainWin = CorrSolarGainWin,
    final T0=TWalls_start,
    outside=true,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    wallPar=wallTypes.OW,
    solar_absorptance=solar_absorptance_OW,
    surfaceType=DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster(),
    calcMethodOut=calcMethodOut)
      annotation (Placement(transformation(extent={{-5,-27},{5,27}},             rotation=180,origin={65,-1})));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall outerWall_North(
    final energyDynamics=energyDynamicsWalls,
    use_shortWaveRadIn=true,
    final radLongCalcMethod=radLongCalcMethod,
    final T_ref=T_ref,
    calcMethodIn=calcMethodIn,
    wall_height=room_height,
    withWindow=false,
    final WindowType=Type_Win,
    redeclare final model WindowModel = WindowModel,
    redeclare final model CorrSolarGainWin = CorrSolarGainWin,
    U_door=5.25,
    door_height=1,
    door_width=2,
    withDoor=false,
    final T0=TWalls_start,
    wall_length=room_width,
    outside=true,
    wallPar=wallTypes.OW,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    solar_absorptance=solar_absorptance_OW,
    surfaceType=DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster(),
    calcMethodOut=calcMethodOut)
      annotation (Placement(transformation(extent={{5,-30},{-5,30}},
        rotation=90,
        origin={23,70})));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall ceiling(
    final energyDynamics=energyDynamicsWalls,
    use_shortWaveRadIn=true,
    final radLongCalcMethod=radLongCalcMethod,
    final T_ref=T_ref,
    calcMethodIn=calcMethodIn,
    wall_length=room_length,
    wall_height=room_width,
    withWindow=false,
    final WindowType=Type_Win,
    redeclare final model WindowModel = WindowModel,
    redeclare final model CorrSolarGainWin = CorrSolarGainWin,
    withDoor=false,
    final T0=TWalls_start,
    wallPar=wallTypes.roof,
    outside=true,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    solar_absorptance=solar_absorptance_OW,
    surfaceType=DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster(),
    calcMethodOut=calcMethodOut)
      annotation(Placement(transformation(extent={{-2,-12},{2,12}}, rotation=270, origin={-34,74})));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall floor(
    final energyDynamics=energyDynamicsWalls,
    use_shortWaveRadIn=true,
    final radLongCalcMethod=radLongCalcMethod,
    final T_ref=T_ref,
    calcMethodIn=calcMethodIn,
    wall_length=room_length,
    wall_height=room_width,
    withWindow=false,
    final WindowType=Type_Win,
    redeclare final model WindowModel = WindowModel,
    redeclare final model CorrSolarGainWin = CorrSolarGainWin,
    withDoor=false,
    final T0=TWalls_start,
    wallPar=wallTypes.groundPlate_upp_half,
    solar_absorptance=solar_absorptance_OW,
    outside=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    calcMethodOut=calcMethodOut)
      annotation(Placement(transformation(extent={{-2.00031,-12},{2.00003,12}}, rotation=90, origin={-38,-70})));

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Therm_ground
    annotation (Placement(transformation(extent={{-104,-104},{-96,-96}}), iconTransformation(extent={{-108,-108},{-92,-92}})));
  Modelica.Blocks.Interfaces.RealInput WindSpeedPort annotation (Placement(
        transformation(extent={{-120,20},{-104,36}}), iconTransformation(extent=
           {{-120,20},{-100,40}})));
  Utilities.Interfaces.SolarRad_in SolarRadiationPort[5] "N,E,S,W,Hor"
    annotation (Placement(transformation(extent={{-120,50},{-100,70}})));

  Utilities.HeatTransfer.SolarRadInRoom solarRadInRoom(
    final use_dynamicMethod=use_dynamicShortWaveRadMethod,
    nWin=1,
    nWalls=4,
    nFloors=1,
    nCei=1,
    final staticCoeffTable=coeffTableSolDistrFractions) annotation (Placement(transformation(extent={{-50,36},{-30,56}})));
  Modelica.Blocks.Interfaces.RealOutput transShoWaveRadWin(final quantity="Power", final unit="W") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-110})));
protected
  Utilities.Interfaces.ShortRadSurf shortRadSurf annotation (Placement(transformation(extent={{58,-96},{62,-92}}), iconTransformation(extent={{58,-96},{62,-92}})));
equation
  connect(floor.port_outside, Therm_ground)
    annotation (Line(points={{-38,-72.1003},{-38,-100},{-100,-100}},
                                                        color={191,0,0}));
  connect(outerWall_South.WindSpeedPort, WindSpeedPort) annotation (Line(points={{-1,-75.25},{-2,-75.25},{-2,-84},{-94,-84},{-94,28},{-112,28}},
                                                              color={0,0,127}));
  connect(outerWall_East.WindSpeedPort, WindSpeedPort) annotation (Line(points={{70.25,-20.8},{70.25,-20},{82,-20},{82,-84},{-94,-84},{-94,28},{-112,28}},
                                                               color={0,0,127}));
  connect(ceiling.WindSpeedPort, WindSpeedPort) annotation (Line(points={{-25.2,76.1},{-25.2,88},{-94,88},{-94,28},{-112,28}},
                                                         color={0,0,127}));
  connect(outerWall_North.WindSpeedPort, WindSpeedPort) annotation (Line(points={{1,75.25},{0,75.25},{0,84},{82,84},{82,-84},{-94,-84},{-94,28},{-112,28}},
        color={0,0,127}));

  connect(outerWall_West.WindSpeedPort, WindSpeedPort) annotation (Line(points={{-87.25,21.5333},{-87.25,22},{-94,22},{-94,28},{-112,28}},
                                                              color={0,0,127}));


  connect(SolarRadiationPort[3], outerWall_South.SolarRadiationPort)
    annotation (Line(points={{-110,60},{-98,60},{-98,-88},{-6,-88},{-6,-76.5},{-6.5,-76.5}},
        color={255,128,0}));
  connect(ceiling.SolarRadiationPort, SolarRadiationPort[5]) annotation (Line(
        points={{-23,76.6},{-23,88},{-98,88},{-98,68},{-110,68}}, color={255,128,
          0}));
  connect(outerWall_West.SolarRadiationPort, SolarRadiationPort[4]) annotation (
     Line(points={{-88.5,26.6667},{-88.5,26},{-98,26},{-98,64},{-110,64}},
                                                                  color={255,128,
          0}));
  connect(outerWall_North.SolarRadiationPort, SolarRadiationPort[1])
    annotation (Line(points={{-4.5,76.5},{-6,76.5},{-6,86},{82,86},{82,-88},{-98,-88},{-98,52},{-110,52}},
                          color={255,128,0}));

  connect(outerWall_East.SolarRadiationPort, SolarRadiationPort[2]) annotation (
     Line(points={{71.5,-25.75},{71.5,-26},{82,-26},{82,-88},{-98,-88},{-98,56},{-110,56}},
                                                                   color={255,128,
          0}));
  connect(thermOutside, ceiling.port_outside) annotation (Line(points={{-100,100},{-66,100},{-66,88},{-34,88},{-34,76.1}},
                                                   color={191,0,0}));
  connect(thermOutside, outerWall_West.port_outside) annotation (Line(points={{-100,100},{-68,100},{-68,88},{-96,88},{-96,0},{-87.25,0},{-87.25,1}},
                                                      color={191,0,0}));
  connect(thermOutside, outerWall_North.port_outside) annotation (Line(points={{-100,100},{-68,100},{-68,88},{22,88},{22,75.25},{23,75.25}},
                                                                  color={191,0,0}));
  connect(thermOutside, outerWall_East.port_outside) annotation (Line(points={{-100,100},{-68,100},{-68,88},{80,88},{80,-2},{70.25,-2},{70.25,-1}},
                                                                         color={
          191,0,0}));
  connect(thermOutside, outerWall_South.port_outside) annotation (Line(points={{-100,100},{-66,100},{-66,88},{-96,88},{-96,-86},{22,-86},{22,-75.25},{21,-75.25}},
                                                                     color={191,
          0,0}));
  connect(thermStar_Demux.portConvRadComb, outerWall_East.thermStarComb_inside)
    annotation (Line(points={{-7,-8},{-6,-8},{-6,-56},{60,-56},{60,-1}},  color=
         {191,0,0}));
  connect(thermStar_Demux.portConvRadComb, outerWall_North.thermStarComb_inside)
    annotation (Line(points={{-7,-8},{-6,-8},{-6,-56},{46,-56},{46,65},{23,65}},
        color={191,0,0}));
  connect(thermStar_Demux.portConvRadComb, outerWall_West.thermStarComb_inside)
    annotation (Line(points={{-7,-8},{-6,-8},{-6,-56},{46,-56},{46,60},{-77.0001,60},{-77.0001,1}},
                   color={191,0,0}));
  connect(thermStar_Demux.portConvRadComb, floor.thermStarComb_inside)
    annotation (Line(points={{-7,-8},{-6,-8},{-6,-56},{-38,-56},{-38,-68}},
        color={191,0,0}));
  connect(thermStar_Demux.portConvRadComb, ceiling.thermStarComb_inside)
    annotation (Line(points={{-7,-8},{-6,-8},{-6,-56},{46,-56},{46,60},{-34,60},{-34,72}},
                     color={191,0,0}));
  connect(thermStar_Demux.portConvRadComb, outerWall_South.thermStarComb_inside)
    annotation (Line(points={{-7,-8},{-6,-8},{-6,-56},{20,-56},{20,-65},{21,-65}},
        color={191,0,0}));
    connect(outerWall_South.shortRadWin, solarRadInRoom.win_in[1]) annotation (
      Line(points={{35.75,-65.25},{-60,-65.25},{-60,-16},{-54,-16},{-54,46},{-51,46}},
                                                        color={0,0,0}));
  connect(solarRadInRoom.ceilings[1], ceiling.shortRadWall) annotation (Line(
        points={{-29,44},{-24,44},{-24,68},{-26.1,68},{-26.1,72}},
        color={0,0,0}));
  connect(solarRadInRoom.floors[1], floor.shortRadWall) annotation (Line(points={{-29,48},{40,48},{40,-52},{-40,-52},{-40,-68},{-45.9,-68}},
        color={0,0,0}));
  connect(outerWall_East.shortRadWall, solarRadInRoom.walls[1]) annotation (Line(points={{60,-18.775},{60,-20},{42,-20},{42,50},{-28,50},{-28,51.25},{-29,51.25}},
                                                                            color={0,0,0}));
  connect(outerWall_South.shortRadWall, solarRadInRoom.walls[2]) annotation (Line(points={{1.25,-65},{-56,-65},{-56,66},{-28,66},{-28,51.75},{-29,51.75}},
                                                      color={0,0,0}));
  connect(outerWall_West.shortRadWall, solarRadInRoom.walls[3])
    annotation (Line(points={{-77.0001,19.4333},{42,19.4333},{42,52.25},{-29,52.25}},
                                                                        color={0,0,0}));
  connect(outerWall_North.shortRadWall, solarRadInRoom.walls[4])
    annotation (Line(points={{3.25,65},{40,65},{40,52.75},{-29,52.75}},         color={0,0,0}));
  connect(outerWall_South.shortRadWin, shortRadSurf) annotation (Line(points={{35.75,-65.25},{35.75,-60},{60,-60},{60,-94}}, color={0,0,0}));
  connect(shortRadSurf.Q_flow_ShoRadFroSur, transShoWaveRadWin) annotation (Line(points={{60.01,-93.99},{60.01,-106},{60,-106},{60,-110}}, color={0,0,0}), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={215,215,215},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-85,85},{85,-85}},
          lineColor={135,135,135},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-24,11},{24,-11}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          origin={75,0},
          rotation=90,
          fontSize=47,
          textString="Width"),
        Text(
          extent={{-24,11},{24,-11}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          origin={0,-75},
          rotation=0,
          fontSize=47,
          textString="Length"),
        Rectangle(
          extent={{-7,30},{7,-30}},
          lineColor={170,213,255},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          origin={0,-92.5},
          rotation=-90),
        Text(
          extent={{-30,7},{30,-7}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="Window",
          textStyle={TextStyle.Bold},
          origin={0,-93},
          rotation=180)}),Documentation(revisions="<html><ul>
  <li>
    <i>July 1, 2020</i> by Konstantina Xanhtopoulou:<br/>
    <a href=\"https://github.com/RWTH-EBC/AixLib/issues/896\">#896</a>:
    Mainly added solar distribution fractions, extended from
    PartialRoom.
  </li>
</ul>
<ul>
  <li>
    <i>March 9, 2015</i> by Ana Constantin:<br/>
    Implemented
  </li>
</ul>
</html>


",         info="<html>
</html>"));
end SouthFacingWindows;
