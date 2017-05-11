within AixLib.Controls.HVACAgentBasedControl.Examples.BuildingHeatingSystems;
model BuildingHeating
  extends Modelica.Icons.Example;
  parameter AixLib.DataBase.Weather.TRYWeatherBaseDataDefinition weatherDataDay = AixLib.DataBase.Weather.TRYWinterDay();

  AixLib.Building.LowOrder.ThermalZone.ThermalZone
              thermalZone(zoneParam=
        AixLib.DataBase.Buildings.OfficePassiveHouse.OPH_1_Meeting(),
      redeclare
      AixLib.Building.LowOrder.BaseClasses.BuildingPhysics.BuildingPhysicsVDI
      buildingPhysics)                                                                              annotation(Placement(transformation(extent={{-60,58},
            {-34,84}})));
  AixLib.Building.Components.Weather.Weather
                             weather(                                                                                           Air_temp = true, Sky_rad = true, Ter_rad = true, Outopt = 1,
    fileName=
        "modelica://AixLib/Resources/WeatherData/TRY2010_12_Jahr_Modelica-Library.txt",
    WeatherData(tableOnFile=false, table=weatherDataDay.weatherData))                                                                                                     annotation(Placement(transformation(extent={{-118,
            120},{-88,140}})));
  Modelica.Blocks.Sources.Constant infiltrationRate(k=0)   annotation(Placement(transformation(extent={{-138,40},
            {-124,54}})));
  Modelica.Blocks.Sources.Constant infiltrationTemperature(k = 288.15) annotation(Placement(transformation(extent={{-138,62},
            {-124,76}})));
  AixLib.Building.LowOrder.ThermalZone.ThermalZone
              thermalZone1(zoneParam=
        AixLib.DataBase.Buildings.OfficePassiveHouse.OPH_4_Restroom(),
      redeclare
      AixLib.Building.LowOrder.BaseClasses.BuildingPhysics.BuildingPhysicsVDI
      buildingPhysics)                                                                              annotation(Placement(transformation(extent={{22,58},
            {48,84}})));
  AixLib.Fluid.Movers.FlowControlled_m_flow fan(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater, m_flow_nominal=2)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={100,-50})));
  AixLib.Fluid.HeatExchangers.HeaterCooler_u hea(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow_nominal=2,
    dp_nominal(displayUnit="bar") = 5000,
    Q_flow_nominal=1)
    annotation (Placement(transformation(extent={{-60,-90},{-40,-70}})));

  AixLib.Fluid.HeatExchangers.HeaterCooler_u hea1(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow_nominal=2,
    dp_nominal(displayUnit="bar") = 5000,
    Q_flow_nominal=1)
    annotation (Placement(transformation(extent={{20,-90},{40,-70}})));

  AixLib.Fluid.FixedResistances.HydraulicResistance hydraulicResistance(
      redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow_small=0.001,
    zeta=10)
    annotation (Placement(transformation(extent={{-80,-46},{-100,-26}})));
  AixLib.Fluid.Sources.FixedBoundary bou(nPorts=1, redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{142,-80},{122,-60}})));
  Agents.RoomAgent roomAgent(              startTime=60,
    threshold=0.5,
    broker=10003,
    sampleRate=1,
    sampleTriggerTime=120,
    G=10)
    annotation (Placement(transformation(extent={{-60,120},{-40,140}})));
  Agents.RoomAgent roomAgent1(
    name=10002,
    startTime=70,
    threshold=0.5,
    broker=10003,
    sampleRate=1,
    sampleTriggerTime=120,
    G=10)
    annotation (Placement(transformation(extent={{20,120},{40,140}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{-26,102},{-6,122}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor1
    annotation (Placement(transformation(extent={{54,102},{74,122}})));
  Modelica.Blocks.Sources.Constant roomSetPoint(k=273.15 + 20)
    annotation (Placement(transformation(extent={{-138,-6},{-124,8}})));
  inner Agents.MessageNotification messageNotification(n=5)
    annotation (Placement(transformation(extent={{120,120},{140,140}})));
  Agents.HeatProducerAgent heatProducerAgent(                  name=30001,
    maxCapacity=3000,
    sampleRate=1,
    setCapacity(start=1),
    currentCapacityDiscrete(start=1))
    annotation (Placement(transformation(extent={{-100,-138},{-80,-118}})));
  Agents.HeatProducerAgent heatProducerAgent1(name=30002,
    maxCapacity=10000,
    sampleRate=1,
    setCapacity(start=1),
    currentCapacityDiscrete(start=1))
    annotation (Placement(transformation(extent={{-20,-138},{0,-118}})));
  CostFunctions.Economic.ConstantFactor constantFactor(eta=1)
    annotation (Placement(transformation(extent={{-100,-112},{-80,-92}})));
  CostFunctions.Economic.ConstantFactor constantFactor1(p=0.60, eta=1)
    annotation (Placement(transformation(extent={{-20,-112},{0,-92}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=true)
    annotation (Placement(transformation(extent={{-140,-142},{-120,-122}})));
  Modelica.Blocks.Sources.Constant massFlowRate(k=5)
    annotation (Placement(transformation(extent={{124,-28},{138,-14}})));
  Agents.Broker broker(name=10003, sampleRate=1)
    annotation (Placement(transformation(extent={{118,60},{138,80}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    nPorts=2,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_portsData=false,
    use_HeatTransfer=true,
    V=30*1E-3)
    annotation (Placement(transformation(extent={{-80,-6},{-60,14}})));

  Modelica.Fluid.Vessels.ClosedVolume volume1(
    nPorts=2,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_portsData=false,
    use_HeatTransfer=true,
    V=30*1E-3) annotation (Placement(transformation(extent={{12,-6},{32,14}})));

  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=2000)
    annotation (Placement(transformation(extent={{-78,24},{-58,44}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G=
       2000) annotation (Placement(transformation(extent={{12,24},{32,44}})));
  AixLib.Fluid.Actuators.Valves.TwoWayLinear val1(
    m_flow_nominal=1,
    dpValve_nominal(displayUnit="bar") = 10000,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{80,-22},{60,-2}})));
  Modelica.Blocks.Continuous.LimPID PID1(
    yMax=1,
    initType=Modelica.Blocks.Types.InitPID.InitialOutput,
    k=0.1,
    Ti=1,
    Td=0.01,
    y_start=0.3,
    yMin=0.1)
    annotation (Placement(transformation(extent={{98,24},{78,44}})));
  AixLib.Fluid.Actuators.Valves.TwoWayLinear val(
    m_flow_nominal=1,
    dpValve_nominal(displayUnit="bar") = 10000,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-20,-20},{-40,0}})));
  Modelica.Blocks.Continuous.LimPID PID2(
    yMax=1,
    initType=Modelica.Blocks.Types.InitPID.InitialOutput,
    k=0.1,
    Ti=1,
    Td=0.01,
    y_start=0.3,
    yMin=0.1)
    annotation (Placement(transformation(extent={{-6,24},{-26,44}})));
  Modelica.Blocks.Sources.Constant internalGains[3](k={0,0,0})
    annotation (Placement(transformation(extent={{-138,16},{-124,30}})));
  Modelica.Blocks.Interfaces.RealOutput T_room(unit="K") "Temperature in room"
    annotation (Placement(transformation(extent={{140,96},{160,116}})));
  Modelica.Blocks.Interfaces.RealOutput T_room1(unit="K") "Temperature in room"
    annotation (Placement(transformation(extent={{140,78},{160,98}})));
  Modelica.Blocks.Interfaces.RealOutput Cap_device(unit="W")
    "Capacity of heating device"
    annotation (Placement(transformation(extent={{140,-110},{160,-90}})));
  Modelica.Blocks.Interfaces.RealOutput Cap_device1(unit="W")
    "Capacity of heating device"
    annotation (Placement(transformation(extent={{140,-136},{160,-116}})));
  Modelica.Blocks.Sources.CombiTimeTable internalGains1(
                                                       extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, tableName = "UserProfiles", fileName = Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/LowOrder_ExampleData/UserProfiles_18599_SIA_Besprechung_Sitzung_Seminar.txt"), columns = {2, 3, 4},
    tableOnFile=false,
    table=[0,0,0.1,0,0; 3540,0,0.1,0,0; 3600,0,0.1,0,0; 7140,0,0.1,0,0; 7200,0,
        0.1,0,0; 10740,0,0.1,0,0; 10800,0,0.1,0,0; 14340,0,0.1,0,0; 14400,0,0.1,
        0,0; 17940,0,0.1,0,0; 18000,0,0.1,0,0; 21540,0,0.1,0,0; 21600,0,0.1,0,0;
        25140,0,0.1,0,0; 25200,0,0.1,0,0; 28740,0,0.1,0,0; 28800,0,0.1,0,0;
        32340,0,0.1,0,0; 32400,0.6,0.6,1,1; 35940,0.6,0.6,1,1; 36000,1,1,1,1;
        39540,1,1,1,1; 39600,0.4,0.4,1,1; 43140,0.4,0.4,1,1; 43200,0,0.1,0,0;
        46740,0,0.1,0,0; 46800,0,0.1,0,0; 50340,0,0.1,0,0; 50400,0.6,0.6,1,1;
        53940,0.6,0.6,1,1; 54000,1,1,1,1; 57540,1,1,1,1; 57600,0.4,0.4,1,1;
        61140,0.4,0.4,1,1; 61200,0,0.1,0,0; 64740,0,0.1,0,0; 64800,0,0.1,0,0;
        68340,0,0.1,0,0; 68400,0,0.1,0,0; 71940,0,0.1,0,0; 72000,0,0.1,0,0;
        75540,0,0.1,0,0; 75600,0,0.1,0,0; 79140,0,0.1,0,0; 79200,0,0.1,0,0;
        82740,0,0.1,0,0; 82800,0,0.1,0,0; 86340,0,0.1,0,0; 86400,0,0.1,0,0;
        89940,0,0.1,0,0; 90000,0,0.1,0,0; 93540,0,0.1,0,0; 93600,0,0.1,0,0;
        97140,0,0.1,0,0; 97200,0,0.1,0,0; 100740,0,0.1,0,0; 100800,0,0.1,0,0;
        104340,0,0.1,0,0; 104400,0,0.1,0,0; 107940,0,0.1,0,0; 108000,0,0.1,0,0;
        111540,0,0.1,0,0; 111600,0,0.1,0,0; 115140,0,0.1,0,0; 115200,0,0.1,0,0;
        118740,0,0.1,0,0; 118800,0.6,0.6,1,1; 122340,0.6,0.6,1,1; 122400,1,1,1,
        1; 125940,1,1,1,1; 126000,0.4,0.4,1,1; 129540,0.4,0.4,1,1; 129600,0,0.1,
        0,0; 133140,0,0.1,0,0; 133200,0,0.1,0,0; 136740,0,0.1,0,0; 136800,0.6,
        0.6,1,1; 140340,0.6,0.6,1,1; 140400,1,1,1,1; 143940,1,1,1,1; 144000,0.4,
        0.4,1,1; 147540,0.4,0.4,1,1; 147600,0,0.1,0,0; 151140,0,0.1,0,0; 151200,
        0,0.1,0,0; 154740,0,0.1,0,0; 154800,0,0.1,0,0; 158340,0,0.1,0,0; 158400,
        0,0.1,0,0; 161940,0,0.1,0,0; 162000,0,0.1,0,0; 165540,0,0.1,0,0; 165600,
        0,0.1,0,0; 169140,0,0.1,0,0; 169200,0,0.1,0,0; 172740,0,0.1,0,0; 172800,
        0,0.1,0,0; 176340,0,0.1,0,0; 176400,0,0.1,0,0; 179940,0,0.1,0,0; 180000,
        0,0.1,0,0; 183540,0,0.1,0,0; 183600,0,0.1,0,0; 187140,0,0.1,0,0; 187200,
        0,0.1,0,0; 190740,0,0.1,0,0; 190800,0,0.1,0,0; 194340,0,0.1,0,0; 194400,
        0,0.1,0,0; 197940,0,0.1,0,0; 198000,0,0.1,0,0; 201540,0,0.1,0,0; 201600,
        0,0.1,0,0; 205140,0,0.1,0,0; 205200,0.6,0.6,1,1; 208740,0.6,0.6,1,1;
        208800,1,1,1,1; 212340,1,1,1,1; 212400,0.4,0.4,1,1; 215940,0.4,0.4,1,1;
        216000,0,0.1,0,0; 219540,0,0.1,0,0; 219600,0,0.1,0,0; 223140,0,0.1,0,0;
        223200,0.6,0.6,1,1; 226740,0.6,0.6,1,1; 226800,1,1,1,1; 230340,1,1,1,1;
        230400,0.4,0.4,1,1; 233940,0.4,0.4,1,1; 234000,0,0.1,0,0; 237540,0,0.1,
        0,0; 237600,0,0.1,0,0; 241140,0,0.1,0,0; 241200,0,0.1,0,0; 244740,0,0.1,
        0,0; 244800,0,0.1,0,0; 248340,0,0.1,0,0; 248400,0,0.1,0,0; 251940,0,0.1,
        0,0; 252000,0,0.1,0,0; 255540,0,0.1,0,0; 255600,0,0.1,0,0; 259140,0,0.1,
        0,0; 259200,0,0.1,0,0; 262740,0,0.1,0,0; 262800,0,0.1,0,0; 266340,0,0.1,
        0,0; 266400,0,0.1,0,0; 269940,0,0.1,0,0; 270000,0,0.1,0,0; 273540,0,0.1,
        0,0; 273600,0,0.1,0,0; 277140,0,0.1,0,0; 277200,0,0.1,0,0; 280740,0,0.1,
        0,0; 280800,0,0.1,0,0; 284340,0,0.1,0,0; 284400,0,0.1,0,0; 287940,0,0.1,
        0,0; 288000,0,0.1,0,0; 291540,0,0.1,0,0; 291600,0.6,0.6,1,1; 295140,0.6,
        0.6,1,1; 295200,1,1,1,1; 298740,1,1,1,1; 298800,0.4,0.4,1,1; 302340,0.4,
        0.4,1,1; 302400,0,0.1,0,0; 305940,0,0.1,0,0; 306000,0,0.1,0,0; 309540,0,
        0.1,0,0; 309600,0.6,0.6,1,1; 313140,0.6,0.6,1,1; 313200,1,1,1,1; 316740,
        1,1,1,1; 316800,0.4,0.4,1,1; 320340,0.4,0.4,1,1; 320400,0,0.1,0,0;
        323940,0,0.1,0,0; 324000,0,0.1,0,0; 327540,0,0.1,0,0; 327600,0,0.1,0,0;
        331140,0,0.1,0,0; 331200,0,0.1,0,0; 334740,0,0.1,0,0; 334800,0,0.1,0,0;
        338340,0,0.1,0,0; 338400,0,0.1,0,0; 341940,0,0.1,0,0; 342000,0,0.1,0,0;
        345540,0,0.1,0,0; 345600,0,0.1,0,0; 349140,0,0.1,0,0; 349200,0,0.1,0,0;
        352740,0,0.1,0,0; 352800,0,0.1,0,0; 356340,0,0.1,0,0; 356400,0,0.1,0,0;
        359940,0,0.1,0,0; 360000,0,0.1,0,0; 363540,0,0.1,0,0; 363600,0,0.1,0,0;
        367140,0,0.1,0,0; 367200,0,0.1,0,0; 370740,0,0.1,0,0; 370800,0,0.1,0,0;
        374340,0,0.1,0,0; 374400,0,0.1,0,0; 377940,0,0.1,0,0; 378000,0.6,0.6,1,
        1; 381540,0.6,0.6,1,1; 381600,1,1,1,1; 385140,1,1,1,1; 385200,0.4,0.4,1,
        1; 388740,0.4,0.4,1,1; 388800,0,0.1,0,0; 392340,0,0.1,0,0; 392400,0,0.1,
        0,0; 395940,0,0.1,0,0; 396000,0.6,0.6,1,1; 399540,0.6,0.6,1,1; 399600,1,
        1,1,1; 403140,1,1,1,1; 403200,0.4,0.4,1,1; 406740,0.4,0.4,1,1; 406800,0,
        0.1,0,0; 410340,0,0.1,0,0; 410400,0,0.1,0,0; 413940,0,0.1,0,0; 414000,0,
        0.1,0,0; 417540,0,0.1,0,0; 417600,0,0.1,0,0; 421140,0,0.1,0,0; 421200,0,
        0.1,0,0; 424740,0,0.1,0,0; 424800,0,0.1,0,0; 428340,0,0.1,0,0; 428400,0,
        0.1,0,0; 431940,0,0.1,0,0; 432000,0,0,0,0; 435540,0,0,0,0; 435600,0,0,0,
        0; 439140,0,0,0,0; 439200,0,0,0,0; 442740,0,0,0,0; 442800,0,0,0,0;
        446340,0,0,0,0; 446400,0,0,0,0; 449940,0,0,0,0; 450000,0,0,0,0; 453540,
        0,0,0,0; 453600,0,0,0,0; 457140,0,0,0,0; 457200,0,0,0,0; 460740,0,0,0,0;
        460800,0,0,0,0; 464340,0,0,0,0; 464400,0,0,0,0; 467940,0,0,0,0; 468000,
        0,0,0,0; 471540,0,0,0,0; 471600,0,0,0,0; 475140,0,0,0,0; 475200,0,0,0,0;
        478740,0,0,0,0; 478800,0,0,0,0; 482340,0,0,0,0; 482400,0,0,0,0; 485940,
        0,0,0,0; 486000,0,0,0,0; 489540,0,0,0,0; 489600,0,0,0,0; 493140,0,0,0,0;
        493200,0,0,0,0; 496740,0,0,0,0; 496800,0,0,0,0; 500340,0,0,0,0; 500400,
        0,0,0,0; 503940,0,0,0,0; 504000,0,0,0,0; 507540,0,0,0,0; 507600,0,0,0,0;
        511140,0,0,0,0; 511200,0,0,0,0; 514740,0,0,0,0; 514800,0,0,0,0; 518340,
        0,0,0,0; 518400,0,0,0,0; 521940,0,0,0,0; 522000,0,0,0,0; 525540,0,0,0,0;
        525600,0,0,0,0; 529140,0,0,0,0; 529200,0,0,0,0; 532740,0,0,0,0; 532800,
        0,0,0,0; 536340,0,0,0,0; 536400,0,0,0,0; 539940,0,0,0,0; 540000,0,0,0,0;
        543540,0,0,0,0; 543600,0,0,0,0; 547140,0,0,0,0; 547200,0,0,0,0; 550740,
        0,0,0,0; 550800,0,0,0,0; 554340,0,0,0,0; 554400,0,0,0,0; 557940,0,0,0,0;
        558000,0,0,0,0; 561540,0,0,0,0; 561600,0,0,0,0; 565140,0,0,0,0; 565200,
        0,0,0,0; 568740,0,0,0,0; 568800,0,0,0,0; 572340,0,0,0,0; 572400,0,0,0,0;
        575940,0,0,0,0; 576000,0,0,0,0; 579540,0,0,0,0; 579600,0,0,0,0; 583140,
        0,0,0,0; 583200,0,0,0,0; 586740,0,0,0,0; 586800,0,0,0,0; 590340,0,0,0,0;
        590400,0,0,0,0; 593940,0,0,0,0; 594000,0,0,0,0; 597540,0,0,0,0; 597600,
        0,0,0,0; 601140,0,0,0,0; 601200,0,0,0,0; 604740,0,0,0,0])                                                                                                     annotation(Placement(transformation(extent={{-138,
            -31},{-124,-17}})));
  Modelica.Blocks.Math.Gain gain[3](k={0.8,0.8,0.8})
    annotation (Placement(transformation(extent={{-102,52},{-94,60}})));
equation
  connect(weather.SolarRadiation_OrientedSurfaces,thermalZone. solarRad_in) annotation(Line(points={{-110.8,
          119},{-110.8,76.98},{-57.4,76.98}},                                                                                               color = {255, 128, 0}));
  connect(infiltrationRate.y,thermalZone. ventilationRate) annotation(Line(points={{-123.3,
          47},{-52.2,47},{-52.2,63.2}},                                                                                          color = {0, 0, 127}));
  connect(weather.WeatherDataVector,thermalZone. weather) annotation(Line(points={{-103.1,
          119},{-103.1,71},{-56.62,71}},                                                                                  color = {0, 0, 127}));
  connect(infiltrationTemperature.y,thermalZone. ventilationTemperature)
    annotation (Line(points={{-123.3,69},{-89.65,69},{-89.65,65.93},{-56.75,65.93}},
        color={0,0,127}));
  connect(thermalZone1.solarRad_in, weather.SolarRadiation_OrientedSurfaces)
    annotation (Line(points={{24.6,76.98},{-12,76.98},{-12,96},{-108,96},{-110.8,
          96},{-110.8,119}},        color={255,128,0}));
  connect(thermalZone1.ventilationTemperature, thermalZone.ventilationTemperature)
    annotation (Line(points={{25.25,65.93},{4,65.93},{4,58},{-90,58},{-90,65.93},
          {-56.75,65.93}},color={0,0,127}));
  connect(infiltrationRate.y, thermalZone1.ventilationRate) annotation (Line(
        points={{-123.3,47},{29.8,47},{29.8,63.2}}, color={0,0,127}));
  connect(thermalZone1.weather, weather.WeatherDataVector) annotation (Line(
        points={{25.38,71},{-10,71},{-10,94},{-103.1,94},{-103.1,119}}, color={
          0,0,127}));
  connect(hydraulicResistance.port_a, fan.port_b) annotation (Line(points={{-80,
          -36},{100,-36},{100,-40}}, color={0,127,255}));
  connect(hea.port_b, hea1.port_a) annotation (Line(points={{-40,-80},{-10,-80},
          {20,-80}}, color={0,127,255}));
  connect(hea1.port_b, fan.port_a) annotation (Line(points={{40,-80},{66,-80},{
          100,-80},{100,-60}}, color={0,127,255}));
  connect(bou.ports[1], fan.port_a) annotation (Line(points={{122,-70},{100,-70},
          {100,-60}}, color={0,127,255}));
  connect(temperatureSensor.port, thermalZone.internalGainsConv) annotation (
      Line(points={{-26,112},{-26,112},{-26,50},{-47,50},{-47,63.46}}, color={
          191,0,0}));
  connect(temperatureSensor.T, roomAgent.T) annotation (Line(points={{-6,112},{
          0,112},{0,146},{-52,146},{-52,138}}, color={0,0,127}));
  connect(temperatureSensor1.port, thermalZone1.internalGainsConv) annotation (
      Line(points={{54,112},{54,112},{54,50},{35,50},{35,63.46}},
        color={191,0,0}));
  connect(temperatureSensor1.T, roomAgent1.T) annotation (Line(points={{74,112},
          {88,112},{88,146},{28,146},{28,138}}, color={0,0,127}));
  connect(heatProducerAgent.calcCapacity, constantFactor.capacity)
    annotation (Line(points={{-96,-119},{-96,-110}}, color={0,0,127}));
  connect(heatProducerAgent.calcCost, constantFactor.cost) annotation (Line(
        points={{-84,-120},{-84,-118},{-84,-114},{-84,-111}}, color={0,0,127}));
  connect(heatProducerAgent1.calcCapacity, constantFactor1.capacity)
    annotation (Line(points={{-16,-119},{-16,-119},{-16,-110}},   color={0,0,
          127}));
  connect(heatProducerAgent1.calcCost, constantFactor1.cost)
    annotation (Line(points={{-4,-120},{-4,-111}}, color={0,0,127}));
  connect(heatProducerAgent.setCapacityOut, hea.u) annotation (Line(points={{
          -82,-137},{-82,-144},{-68,-144},{-68,-74},{-62,-74}}, color={0,0,127}));
  connect(heatProducerAgent1.setCapacityOut, hea1.u) annotation (Line(points={{-2,-137},
          {-2,-144},{8,-144},{8,-74},{18,-74}},          color={0,0,127}));
  connect(hea1.Q_flow, heatProducerAgent1.currentCapacity) annotation (Line(
        points={{41,-74},{44,-74},{44,-146},{-18,-146},{-18,-136}}, color={0,0,
          127}));
  connect(hea.Q_flow, heatProducerAgent.currentCapacity) annotation (Line(
        points={{-39,-74},{-36,-74},{-36,-144},{-98,-144},{-98,-136}}, color={0,
          0,127}));
  connect(booleanExpression.y, heatProducerAgent.OnOff_external) annotation (
      Line(points={{-119,-132},{-98,-132},{-98,-131.4}}, color={255,0,255}));
  connect(booleanExpression.y, heatProducerAgent1.OnOff_external) annotation (
      Line(points={{-119,-132},{-110,-132},{-110,-148},{-26,-148},{-26,-131.4},{
          -18,-131.4}},  color={255,0,255}));
  connect(massFlowRate.y, fan.m_flow_in) annotation (Line(points={{138.7,-21},{
          148,-21},{148,-50.2},{112,-50.2}}, color={0,0,127}));
  connect(volume.ports[1], hea.port_a) annotation (Line(points={{-72,-6},{-72,-6},
          {-72,-10},{-114,-10},{-114,-80},{-60,-80}}, color={0,127,255}));
  connect(hydraulicResistance.port_b, hea.port_a) annotation (Line(points={{-100,
          -36},{-114,-36},{-114,-80},{-60,-80}}, color={0,127,255}));
  connect(volume1.ports[1], hea.port_a) annotation (Line(points={{20,-6},{20,-6},
          {20,-28},{-114,-28},{-114,-80},{-60,-80}}, color={0,127,255}));
  connect(volume.heatPort, thermalConductor.port_a) annotation (Line(points={{-80,
          4},{-88,4},{-88,34},{-78,34}}, color={191,0,0}));
  connect(thermalConductor.port_b, thermalZone.internalGainsConv)
    annotation (Line(points={{-58,34},{-47,34},{-47,63.46}}, color={191,0,0}));
  connect(thermalConductor1.port_a, volume1.heatPort)
    annotation (Line(points={{12,34},{6,34},{6,4},{12,4}}, color={191,0,0}));
  connect(thermalConductor1.port_b, thermalZone1.internalGainsConv)
    annotation (Line(points={{32,34},{35,34},{35,63.46}}, color={191,0,0}));
  connect(PID1.y, val1.y)
    annotation (Line(points={{77,34},{70,34},{70,0}}, color={0,0,127}));
  connect(val1.port_b, volume1.ports[2])
    annotation (Line(points={{60,-12},{24,-12},{24,-6}}, color={0,127,255}));
  connect(val1.port_a, fan.port_b) annotation (Line(points={{80,-12},{100,-12},{
          100,-40}}, color={0,127,255}));
  connect(PID1.u_m, temperatureSensor1.T) annotation (Line(points={{88,22},{88,22},
          {88,16},{112,16},{112,112},{74,112}}, color={0,0,127}));
  connect(val.port_b, volume.ports[2]) annotation (Line(points={{-40,-10},{-40,-10},
          {-68,-10},{-68,-6}}, color={0,127,255}));
  connect(val.port_a, fan.port_b) annotation (Line(points={{-20,-10},{-6,-10},{-6,
          -20},{100,-20},{100,-40}}, color={0,127,255}));
  connect(PID2.y, val.y)
    annotation (Line(points={{-27,34},{-30,34},{-30,2}}, color={0,0,127}));
  connect(PID2.u_m, temperatureSensor.T) annotation (Line(points={{-16,22},{-16,
          22},{-16,14},{4,14},{4,112},{-6,112}}, color={0,0,127}));
  connect(roomSetPoint.y, PID1.u_s) annotation (Line(points={{-123.3,1},{-106,1},
          {-106,20},{106,20},{106,34},{100,34}}, color={0,0,127}));
  connect(PID2.u_s, PID1.u_s) annotation (Line(points={{-4,34},{0,34},{0,20},{106,
          20},{106,34},{100,34}}, color={0,0,127}));
  connect(thermalZone1.internalGains, internalGains.y) annotation (Line(points={
          {45.4,63.2},{45.4,54},{-36,54},{-36,23},{-123.3,23}}, color={0,0,127}));
  connect(temperatureSensor.T, T_room) annotation (Line(points={{-6,112},{10,112},
          {10,98},{128,98},{128,106},{150,106}}, color={0,0,127}));
  connect(T_room1, temperatureSensor1.T) annotation (Line(points={{150,88},{128,
          88},{102,88},{102,112},{74,112}}, color={0,0,127}));
  connect(hea.Q_flow, Cap_device) annotation (Line(points={{-39,-74},{-32,-74},
          {-32,-62},{82,-62},{82,-100},{150,-100}}, color={0,0,127}));
  connect(hea1.Q_flow, Cap_device1) annotation (Line(points={{41,-74},{74,-74},
          {74,-126},{150,-126}}, color={0,0,127}));
  connect(gain.y, thermalZone.internalGains) annotation (Line(points={{-93.6,56},
          {-68,56},{-36.6,56},{-36.6,63.2}}, color={0,0,127}));
  connect(gain.u, internalGains1.y) annotation (Line(points={{-102.8,56},{-118,
          56},{-118,-24},{-123.3,-24}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-150,-150},{150,150}},
        initialScale=0.1)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<ul>
<li>This model is a an example to show agent-based control with the provided library for a simple heating system</li>
<li>The system consists of two thermal zones and two heat sources</li>
<li>The agents used are two RoomAgents, two HeatProducerAgents, one Broker and one MessageNotification</li>
</ul>
<h4><span style=\"color: #008000\">Concept</span></h4>
<p>The two thermal zones are connected to a weather model, which results in different thermal loads depending on the boundary conditions. Each zone is equipped with a thermostatic valve,
which allows to control the temperature in the zones to a limited degree. When the temperature in the zones goes above 20.5 or below 19.5 degC (and the valves are fully closed or opened) 
the RoomAgents become active and order an increase or decrease in heat supply from the broker. The broker calls for proposals from both heat suplliers. The suppliers use cost functions to 
determine the cost for the adjustments. The cheaper supplier is selcted by the broker and increases or decreases its heat supply.</p>

<h4><span style=\"color: #008000\">Example Results</span></h4>
<p>The results show that the agent-based control system keeps the room temperature between 19.2 and 20.8 degC most of the time.</p>
<p><img src=\"modelica://AixLib/Resources/Images/Controls/HVACAgentBasedControl/ExampleT.PNG\"/></p>
<p>The results for the capacity of the heat suppliers further show that for an increase in heat supply the cheaper supplier is always chosen first and for a decrease the more expensive one. In real-life systems this could be
a heat-pump and a heating rod for example.</p>
<p><img src=\"modelica://AixLib/Resources/Images/Controls/HVACAgentBasedControl/ExampleCap.PNG\"/></p>
<p>The trading procedure can be followed in the command line window of the dymosim.exe or found in the dslog.txt file after simulation. For one negotiation round it looks as follows.</p>

<ul>
<li>RoomAgent 10002 requests 25.1956 W of heat from Broker 10003.</li>
<li>Broker 10003 collected the request of 25.1956 W of heat from Consumer 10002.</li>
<li>Broker 10003 calls for proposal of 25.1956 W of heat from Producer 30001.</li>
<li>HeatProducerAgent 30001 proposes adjustment of 25.1956 W for a price of 7.55868.</li>
<li>Broker 10003 collects proposal of 25.1956 W of heat for the price of 7.55868 from Producer 30001.</li>
<li>Broker 10003 calls for proposal of 25.1956 W of heat from Producer 30002.</li>
<li>HeatProducerAgent 30002 proposes adjustment of 25.1956 W for a price of 15.1174.</li>
<li>Broker 10003 collects proposal of 25.1956 W of heat for the price of 15.1174 from Producer 30002.</li>
<li>Broker 10003 calculates an average price of 0.3 per W of heat.</li>
<li>Broker 10003 asks for a confirmation of 25.1956 W of heat for the total price of 7.55868 from Consumer 10002.</li>
<li>RoomAgent 10002 confirms the request of 25.1956 W of heat for a price of 7.55868.</li>
<li>25.1956 W of heat were confirmed by consumers at broker 10003. Go on to final requests to producers.</li>
<li>Broker 10003 accepts the proposal of 30001 and orders 25.1956 W of heat.</li>
<li>HeatProducerAgent 30001 confirms the adjustment of 25.1956 W of heat. The setpoint is now 2251.37W.</li>
<li>Broker 10003 rejects the proposal of 30002.</li>
</ul>
</html>", revisions="<html>
<p>
<ul>
<li>November 2016, by Felix B�nning: Developed and implemented</li>
</ul>
</p>
</html>"),
    experiment(StartTime=2.6784e+006, StopTime=3.2832e+006),
    __Dymola_experimentSetupOutput(
      states=false,
      derivatives=false,
      inputs=false,
      auxiliaries=false),
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=true,
      OutputFlatModelica=false));
end BuildingHeating;
