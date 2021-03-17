within AixLib.Systems.EONERC_MainBuilding.Examples;
model GeothermalFieldSimpleFlowControl
  "Test of geothermal field model of E.ON ERC main building"
  extends Modelica.Icons.Example;
    package Medium = AixLib.Media.Water
    annotation (choicesAllMatching=true);

  Fluid.Sources.Boundary_pT          boundary1(
    redeclare package Medium = Medium, nPorts=1)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={22,40})));
  AixLib.Systems.EONERC_MainBuilding.GeothermalFieldSimple gtf(
    redeclare package Medium = Medium,
    m_flow_nominal=10,
    T_amb=293.15)
             annotation (Placement(transformation(extent={{-20,-58},{20,-2}})));
  Controller.CtrGTFSimpleFlowCtrl ctrGTFSimpleFlowCtrl(
    k=500,
    Ti=30,
    Td=0) annotation (Placement(transformation(extent={{-64,-30},{-44,-10}})));
  Fluid.Sources.MassFlowSource_T        boundary5(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1,
    m_flow=1,
    T=300.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-32,48})));
  Fluid.Sensors.TemperatureTwoPort senTem(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    m_flow_nominal=10,
    m_flow_small=1E-4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,16})));
  Modelica.Blocks.Interfaces.RealOutput Tout "Temperature of the passing fluid"
    annotation (Placement(transformation(extent={{98,8},{114,24}}),
        iconTransformation(extent={{98,8},{114,24}})));
  Modelica.Blocks.Interfaces.RealInput mflow_gtf
    "Connector of setpoint input signal" annotation (Placement(transformation(
          extent={{-114,-28},{-96,-10}}), iconTransformation(extent={{-114,-28},
            {-96,-10}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_in "Prescribed mass flow rate"
    annotation (Placement(transformation(extent={{-110,46},{-90,66}}),
        iconTransformation(extent={{-110,46},{-90,66}})));
  Modelica.Blocks.Interfaces.RealInput Tin "Prescribed boundary temperature"
    annotation (Placement(transformation(extent={{-110,18},{-94,34}}),
        iconTransformation(extent={{-110,18},{-94,34}})));
equation
  connect(ctrGTFSimpleFlowCtrl.gtfBus, gtf.twoCircuitBus) annotation (Line(
      points={{-42.7,-20},{-44,-20},{-44,-19.675},{-20.1667,-19.675}},
      color={255,204,51},
      thickness=0.5));
  connect(boundary5.ports[1], gtf.port_a) annotation (Line(points={{-22,48},{
          -18,48},{-18,-2},{-16.6667,-2}}, color={0,127,255}));
  connect(gtf.port_b, senTem.port_a) annotation (Line(points={{16.6667,-2},{18,
          -2},{18,6},{20,6}}, color={0,127,255}));
  connect(senTem.port_b, boundary1.ports[1])
    annotation (Line(points={{20,26},{22,26},{22,30}}, color={0,127,255}));
  connect(senTem.T, Tout)
    annotation (Line(points={{31,16},{106,16}}, color={0,0,127}));
  connect(ctrGTFSimpleFlowCtrl.mflow_gtf, mflow_gtf) annotation (Line(points={{-64.3,
          -19.9},{-82.15,-19.9},{-82.15,-19},{-105,-19}},       color={0,0,127}));
  connect(boundary5.m_flow_in, m_flow_in)
    annotation (Line(points={{-44,56},{-100,56}}, color={0,0,127}));
  connect(boundary5.T_in, Tin) annotation (Line(points={{-44,52},{-64,52},{-64,
          26},{-102,26}}, color={0,0,127}));
  annotation (experiment(StopTime=31536000),
                                         __Dymola_Commands(file(ensureSimulated=
           true)=
        "Resources/Scripts/Dymola/Systems/EONERC_MainBuilding/Validation/Simulate_and_plot_HeatpumpValidation.mos"
        "Simulate and plot"));
end GeothermalFieldSimpleFlowControl;
