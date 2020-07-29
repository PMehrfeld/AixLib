﻿within AixLib.Fluid.Movers.PumpsPolynomialBased.Examples;
model PumpHeadControlledDpV
  "testing the pump dp-var algorithm with the new \"one record\" pump model."
  extends Modelica.Icons.Example;

  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater;

  PumpHeadControlled pump(
    m_flow_nominal=m_flow_nominal,
    calculatePower=true,
    calculateEfficiency=true,
    redeclare package Medium = Medium,
    pumpParam=DataBase.Pumps.PumpPolynomialBased.Pump_DN25_H1_6_V4(),
    Qnom=1.45) annotation (Placement(transformation(extent={{-10,0},{10,20}})));

  Modelica.Blocks.Sources.BooleanPulse    PumpOn(
    width=500/600*100,
    period=600,
    startTime=0)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  AixLib.Fluid.Actuators.Valves.SimpleValve simpleValve(
    redeclare package Medium = Medium,
    Kvs=6.3,
    m_flow_small=1E-4*m_flow_nominal)
    annotation (Placement(transformation(extent={{-20,-20},{-40,-40}})));

  Modelica.Blocks.Sources.Ramp rampValvePosition(
    offset=0.5,
    height=-0.48,
    duration(displayUnit="s") = 120,
    startTime(displayUnit="min") = 120)
    annotation (Placement(transformation(extent={{0,-70},{-20,-50}})));
  AixLib.Fluid.Sources.Boundary_pT vessle(
    redeclare package Medium = Medium,
    nPorts=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-36,20})));
  Controls.CtrlDpVarH ctrlDpVarH(pumpParam=
        DataBase.Pumps.PumpPolynomialBased.Pump_DN25_H1_6_V4())
    annotation (Placement(transformation(extent={{-10,26},{10,46}})));
  BaseClasses.PumpBus pumpControllerBus1
    annotation (Placement(transformation(extent={{-10,50},{10,70}}),
        iconTransformation(extent={{-34,38},{-14,58}})));
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=1 "Nominal mass flow rate";
equation
  connect(rampValvePosition.y, simpleValve.opening)
    annotation (Line(points={{-21,-60},{-30,-60},{-30,-38}}, color={0,0,127}));
  connect(simpleValve.port_b, vessle.ports[1]) annotation (Line(points={{-40,
          -30},{-52,-30},{-52,10},{-34,10}}, color={0,127,255}));
  connect(vessle.ports[2], pump.port_a)
    annotation (Line(points={{-38,10},{-10,10}}, color={0,127,255}));
  connect(pump.port_b, simpleValve.port_a) annotation (Line(points={{10,10},{48,
          10},{48,-30},{-20,-30}}, color={0,127,255}));
  connect(pump.pumpBus, ctrlDpVarH.pumpBus) annotation (Line(
      points={{0,20},{0,26}},
      color={255,204,51},
      thickness=0.5));
  connect(ctrlDpVarH.pumpControllerBus, pumpControllerBus1) annotation (Line(
      points={{0,46},{0,60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PumpOn.y, pumpControllerBus1.onSet) annotation (Line(points={{-59,50},
          {-38,50},{-38,60.05},{0.05,60.05}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (
      experiment(Tolerance=1e-6,StopTime=600),
    Documentation(revisions="<html><ul>
  <li>2019-09-18 by Alexander Kümpel:<br/>
    Renaming and restructuring.
  </li>
  <li>2018-03-01 by Peter Matthes:<br/>
    Adjusted parameter settings. From pump model removed Nstart (became
    Nnom in pump model) and m_flow_start (should be used as output from
    pump rather than a setting). Changed setting of system.m_flow_start
    to become pump.m_flow_start.
  </li>
  <li>2018-02-01 by Peter Matthes<br/>
    Switches pump off near end of simulation to check for handling of
    power and efficiency calculation. Improves plot script.
  </li>
  <li>2018-01-29 by Peter Matthes:<br/>
    * Removes parameter useABCformula in pump model and changes pump
    record to Stratos_Pico_25_1_6.<br/>
    * The selectable function for efficiency calculation could be
    removed from the parameter dialog.
  </li>
  <li>2018-01-26 by Peter Matthes:<br/>
    Changes parameter name n_start into Nstart in the pump models.
  </li>
  <li>2017-11-22 by Peter Matthes<br/>
    Implemented
  </li>
</ul>
</html>"),
    __Dymola_Commands(file=
        "Resources/Scripts/Dymola/Fluid/Movers/PumpsPolynomialBased/Examples/PumpHeadControlledDpV.mos"
        "Simulate and plot"));
end PumpHeadControlledDpV;
