within AixLib.ThermalZones.ReducedOrder.ThermalZone;
model ThermalZoneMoistAirEquipped
  "Thermal zone model considering moisture balance with ventilation, infiltration and internal gains"
  extends ThermalZoneMoistAir(SumQLat_flow(nu=3));

  Controls.VentilationController.VentilationController ventCont(
    final useConstantOutput=zoneParam.useConstantACHrate,
    final baseACH=zoneParam.baseACH,
    final maxUserACH=zoneParam.maxUserACH,
    final maxOverheatingACH=zoneParam.maxOverheatingACH,
    final maxSummerACH=zoneParam.maxSummerACH,
    final winterReduction=zoneParam.winterReduction,
    final Tmean_start=zoneParam.T_start) if ATot > 0 or zoneParam.VAir > 0
    "Calculates natural venitlation and infiltration"
    annotation (Placement(transformation(extent={{-70,-72},{-50,-52}})));
  Utilities.Psychrometrics.MixedTemperature mixedTemp if
    ATot > 0 or zoneParam.VAir > 0
    "Mixes temperature of infiltration flow and mechanical ventilation flow"
    annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
  HighOrder.Components.MoistAir.VarMoistAirExchange airExc(final V=zoneParam.VAir) if
    ATot > 0 or zoneParam.VAir > 0 "Heat flow due to ventilation"
    annotation (Placement(transformation(extent={{-22,-26},{-6,-10}})));

protected
  Modelica.Blocks.Math.Add addInfVen if ATot > 0 or zoneParam.VAir > 0
    "Combines infiltration and ventilation"
    annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-34,-38})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature preTemVen if
    ATot > 0 or zoneParam.VAir > 0
    "Prescribed temperature for ventilation"
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-32,-18})));

equation
  connect(ventCont.y, addInfVen.u1) annotation (Line(
      points={{-51,-62},{-37.6,-62},{-37.6,-45.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(intGains[1], ventCont.relOccupation) annotation (Line(points={{80,
          -113.333},{80,-113.333},{80,-78},{0,-78},{-70,-78},{-70,-68}}, color=
          {0,0,127}));
  connect(ventRate, addInfVen.u2) annotation (Line(points={{-40,-100},{-40,-76},
          {-30.4,-76},{-30.4,-45.2}}, color={0,0,127}));
  connect(ventCont.y, mixedTemp.flowRate_flow2) annotation (Line(points={{-51,-62},
          {-49,-62},{-49,-30},{-70,-30},{-70,-25},{-65.6,-25}}, color={0,0,127}));
  connect(ventRate, mixedTemp.flowRate_flow1) annotation (Line(points={{-40,-100},
          {-74,-100},{-74,-15},{-65.6,-15}}, color={0,0,127}));
  connect(ventTemp, mixedTemp.temperature_flow1) annotation (Line(points={{-100,
          -40},{-76,-40},{-76,-10.2},{-65.6,-10.2}}, color={0,0,127}));
  connect(ROM.TAir, ventCont.Tzone) annotation (Line(points={{87,62},{90,62},{
          90,-6},{52,-6},{52,-50},{-70,-50},{-70,-54},{-70,-56}}, color={0,0,
          127}));
  connect(preTemVen.port, airExc.port_a)
    annotation (Line(points={{-26,-18},{-26,-18},{-22,-18}}, color={191,0,0}));
  connect(mixedTemp.mixedTemperatureOut, preTemVen.T)
    annotation (Line(points={{-46,-18},{-39.2,-18}}, color={0,0,127}));
  connect(addInfVen.y, airExc.InPort1) annotation (Line(points={{-34,-31.4},{-34,
          -31.4},{-34,-28},{-24,-28},{-24,-23.12},{-21.2,-23.12}}, color={0,0,
          127}));
  connect(airExc.port_b, ROM.intGainsConv) annotation (Line(points={{-6,-18},{
          44,-18},{44,-2},{92,-2},{92,50},{86,50}},
                                               color={191,0,0}));
  connect(weaBus.TDryBul, mixedTemp.temperature_flow2) annotation (Line(
      points={{-100,34},{-100,34},{-86,34},{-86,-20},{-65.6,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus.TDryBul, ventCont.Tambient) annotation (Line(
      points={{-100,34},{-100,34},{-86,34},{-86,-20},{-78,-20},{-78,-62},{-70,-62}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(ventHum, airExc.HumIn) annotation (Line(points={{-100,-70},{-80,-70},
          {-80,-38},{-46,-38},{-46,-28},{-24,-28},{-24,-22},{-21.2,-22}}, color=
         {0,0,127}));
  connect(airExc.QLat_flow,SumQLat_flow.u[3])  annotation (Line(points={{-5.68,
          -22.96},{4,-22.96},{4,-30},{16,-30}}, color={0,0,127}));
  connect(humVolAirROM.y, airExc.HumOut) annotation (Line(points={{30.5,-14},{
          0.75,-14},{0.75,-13.84},{-6.8,-13.84}}, color={0,0,127}));
  annotation(Documentation(info="<html>
<p>This model enhances the existing thermal zone model considering moisture balance in the zone. Moisture is considered in internal gains. </p>
<p>Comprehensive ready-to-use model for thermal zones, combining caclulation core, handling of solar radiation, internal gains and in addition to <a href=\"AixLib.ThermalZones.ReducedOrder.ThermalZone.ThermalZone\">AixLib.ThermalZones.ReducedOrder.ThermalZone.ThermalZone</a> models for infiltration and natural ventilation. Core model is a <a href=\"AixLib.ThermalZones.ReducedOrder.RC.FourElements\">AixLib.ThermalZones.ReducedOrder.RC.FourElements</a> model. Conditional removements of the core model are passed-through and related models on thermal zone level are as well conditional. All models for solar radiation are part of Annex60 library. Internal gains are part of AixLib.</p>
<h4>Typical use and important parameters</h4>
<p><b>Important!</b>: This model has to be combined with a zoneRecord that sets the parameter <i>internalGainsMode</i> to 3. Otherwise no moisture gain from persons will be considered.</p>
<p>All parameters are collected in one <a href=\"AixLib.DataBase.ThermalZones.ZoneBaseRecord\">AixLib.DataBase.ThermalZones.ZoneBaseRecord</a> record. Further parameters for medium, initialization and dynamics originate from <a href=\"AixLib.Fluid.Interfaces.LumpedVolumeDeclarations\">AixLib.Fluid.Interfaces.LumpedVolumeDeclarations</a>. A typical use case is a single thermal zone including infiltration and vnetilation connected via heat ports and fluid ports to a heating system. The thermal zone model serves as boundary condition for the heating system and calculates the room&apos;s reaction to external and internal heat sources. The model is used as thermal zone core model in <a href=\"AixLib.ThermalZones.ReducedOrder.Multizone.BaseClasses.PartialMultizone\">AixLib.ThermalZones.ReducedOrder.Multizone.BaseClasses.PartialMultizone</a></p>
<h4>References</h4>
<p>For automatic generation of thermal zone and multizone models as well as for datasets, see <a href=\"https://github.com/RWTH-EBC/TEASER\">https://github.com/RWTH-EBC/TEASER</a></p>
<ul>
<li>German Association of Engineers: Guideline VDI 6007-1, March 2012: Calculation of transient thermal response of rooms and buildings - Modelling of rooms. </li>
<li>Lauster, M.; Teichmann, J.; Fuchs, M.; Streblow, R.; Mueller, D. (2014): Low order thermal network models for dynamic simulations of buildings on city district scale. In: Building and Environment 73, p. 223&ndash;231. DOI: <a href=\"http://dx.doi.org/10.1016/j.buildenv.2013.12.016\">10.1016/j.buildenv.2013.12.016</a>. </li>
</ul>
<h4>Examples</h4>
<p>See <a href=\"AixLib.ThermalZones.ReducedOrder.Examples.ThermalZoneEquipped\">AixLib.ThermalZones.ReducedOrder.Examples.ThermalZoneEquipped</a>. </p>
</html>",  revisions="<html>
<ul>
  <li>July, 2019, by Martin Kremer:<br/>Adapting to new internalGains models.  See <a href=\"https://github.com/RWTH-EBC/AixLib/issues/690\">AixLib, issue #690</a>.</li>
  <li>April, 2019, by Martin Kremer:<br/>First implementation.</li>
</ul>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
  Rectangle(
    extent={{-79,-8},{-4,-81}},
    lineColor={0,0,255},
    fillColor={215,215,215},
    fillPattern=FillPattern.Solid),
  Text(
    extent={{-28,-69},{-5,-80}},
    lineColor={0,0,255},
    fillColor={215,215,215},
    fillPattern=FillPattern.Solid,
          textString="Ventilation
Infiltration
")}));
end ThermalZoneMoistAirEquipped;
