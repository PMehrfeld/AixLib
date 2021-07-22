within AixLib.Systems.EONERC_MainBuilding.BaseClasses;
model EnergyCounter2Zones "Sums up all consumed energy"
    parameter Modelica.SIunits.Temperature Tset = 273.15+22 "Set Temperature of rooms for ISE calculation";
  MainBus2Zones mainBus annotation (Placement(transformation(extent={{-118,-18},
            {-80,18}}), iconTransformation(extent={{-18,-42},{16,-6}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{-10,90},{0,100}})));
  Modelica.Blocks.Continuous.Integrator integrator1
    annotation (Placement(transformation(extent={{-10,74},{0,84}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-26,74},{-16,84}})));
  Modelica.Blocks.Continuous.Integrator integrator2
    annotation (Placement(transformation(extent={{-10,56},{0,66}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-26,40},{-16,50}})));
  Modelica.Blocks.Continuous.Integrator integrator3
    annotation (Placement(transformation(extent={{-10,40},{0,50}})));
  Modelica.Blocks.Continuous.Integrator integrator4
    annotation (Placement(transformation(extent={{-10,20},{0,30}})));
  Modelica.Blocks.Continuous.Integrator integrator5
    annotation (Placement(transformation(extent={{-10,4},{0,14}})));
  Modelica.Blocks.Continuous.Integrator integrator6
    annotation (Placement(transformation(extent={{-10,-22},{0,-12}})));
  Modelica.Blocks.Continuous.Integrator integrator7
    annotation (Placement(transformation(extent={{-10,-40},{0,-30}})));
  Modelica.Blocks.Continuous.Integrator integrator8
    annotation (Placement(transformation(extent={{-10,-60},{0,-50}})));
  Modelica.Blocks.Continuous.Integrator integrator9
    annotation (Placement(transformation(extent={{-10,-80},{0,-70}})));
  Modelica.Blocks.Continuous.Integrator integrator10
    annotation (Placement(transformation(extent={{-10,-100},{0,-90}})));
  Modelica.Blocks.Math.Sum sum1(nin=3)
    annotation (Placement(transformation(extent={{-30,-22},{-20,-12}})));
  Modelica.Blocks.Math.Sum sumWel(nin=7)
    annotation (Placement(transformation(extent={{60,4},{70,14}})));
  Modelica.Blocks.Math.Sum sumQbr(nin=3)
    annotation (Placement(transformation(extent={{60,-40},{70,-30}})));
  Modelica.Blocks.Continuous.Integrator integrator11
    annotation (Placement(transformation(extent={{112,88},{122,98}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=0, uMin=-100)
    annotation (Placement(transformation(extent={{88,88},{98,98}})));
  Modelica.Blocks.Math.Add add2(k2=-1)
    annotation (Placement(transformation(extent={{74,88},{84,98}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{102,90},{108,96}})));
  Modelica.Blocks.Sources.Constant const(k=273.15 + 59.5)
    annotation (Placement(transformation(extent={{62,86},{68,92}})));
  Modelica.Blocks.Continuous.Integrator integrator13
    annotation (Placement(transformation(extent={{114,40},{124,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=1000, uMin=0)
    annotation (Placement(transformation(extent={{90,40},{100,50}})));
  Modelica.Blocks.Math.Add add4(k2=-1)
    annotation (Placement(transformation(extent={{76,40},{86,50}})));
  Modelica.Blocks.Sources.Constant const2(k=273.15 + 16.5)
    annotation (Placement(transformation(extent={{64,38},{70,44}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{104,42},{110,48}})));
  Modelica.Blocks.Continuous.Integrator integrator12
    annotation (Placement(transformation(extent={{110,56},{120,66}})));
  Modelica.Blocks.Math.Add add3(k2=-1)
    annotation (Placement(transformation(extent={{84,56},{94,66}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{100,58},{106,64}})));
  Modelica.Blocks.Sources.Constant const1(k=Tset)
    annotation (Placement(transformation(extent={{72,54},{78,60}})));
  Modelica.Blocks.Continuous.Integrator integrator14
    annotation (Placement(transformation(extent={{110,74},{120,84}})));
  Modelica.Blocks.Math.Add add6(k2=-1)
    annotation (Placement(transformation(extent={{84,74},{94,84}})));
  Modelica.Blocks.Math.Product product4
    annotation (Placement(transformation(extent={{100,76},{106,82}})));
  Modelica.Blocks.Sources.Constant const4(k=Tset)
    annotation (Placement(transformation(extent={{72,72},{78,78}})));
equation
  connect(integrator.u, mainBus.hpSystemBus.busHP.Pel) annotation (Line(points={
          {-11,95},{-98.905,95},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(add.u2, mainBus.hpSystemBus.busPumpHot.pumpBus.PelMea) annotation (
      Line(points={{-27,76},{-98.905,76},{-98.905,0.09}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(add.u1, mainBus.hpSystemBus.busPumpCold.pumpBus.PelMea) annotation (
      Line(points={{-27,82},{-90,82},{-90,84},{-98.905,84},{-98.905,0.09}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(add.y, integrator1.u)
    annotation (Line(points={{-15.5,79},{-11,79}}, color={0,0,127}));
  connect(integrator.y, mainBus.evaBus.WelHPMea) annotation (Line(points={{0.5,95},
          {32,95},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator1.y, mainBus.evaBus.WelPumpsHPMea) annotation (Line(points={
          {0.5,79},{32,79},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator2.u, mainBus.hpSystemBus.PelAirCoolerMea) annotation (Line(
        points={{-11,61},{-98.905,61},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator2.y, mainBus.evaBus.WelGCMea) annotation (Line(points={{0.5,
          61},{32,61},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(add1.y, integrator3.u) annotation (Line(points={{-15.5,45},{-11,45}},
                                 color={0,0,127}));
  connect(add1.u1, mainBus.hxBus.primBus.pumpBus.PelMea) annotation (Line(
        points={{-27,48},{-98.905,48},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(add1.u2, mainBus.hxBus.secBus.pumpBus.PelMea) annotation (Line(points=
         {{-27,42},{-98.905,42},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator3.y, mainBus.evaBus.WelPumpsHXMea) annotation (Line(points={
          {0.5,45},{32,45},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator4.u, mainBus.swuBus.pumpBus.PelMea) annotation (Line(points=
         {{-11,25},{-98.905,25},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator4.y, mainBus.evaBus.WelPumpSWUMea) annotation (Line(points={
          {0.5,25},{32,25},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator5.u, mainBus.gtfBus.primBus.pumpBus.PelMea) annotation (
      Line(points={{-11,9},{-98.905,9},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator5.y, mainBus.evaBus.WelPumpGTFMea) annotation (Line(points={
          {0.5,9},{32,9},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator6.y, mainBus.evaBus.WelPumpsHTSMea) annotation (Line(points=
         {{0.5,-17},{32,-17},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator7.u, mainBus.htsBus.fuelPowerBoiler1Mea) annotation (Line(
        points={{-11,-35},{-98.905,-35},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator7.y, mainBus.evaBus.QbrBoi1Mea) annotation (Line(points={{0.5,
          -35},{32,-35},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator8.u, mainBus.htsBus.fuelPowerBoiler2Mea) annotation (Line(
        points={{-11,-55},{-98.905,-55},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator8.y, mainBus.evaBus.QbrBoi2Mea) annotation (Line(points={{0.5,
          -55},{32,-55},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator9.u, mainBus.htsBus.fuelPowerChpMea) annotation (Line(
        points={{-11,-75},{-98.905,-75},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator9.y, mainBus.evaBus.QbrCHPMea) annotation (Line(points={{0.5,
          -75},{32,-75},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator10.u, mainBus.htsBus.electricalPowerChpMea) annotation (
      Line(points={{-11,-95},{-98.905,-95},{-98.905,0.09}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator10.y, mainBus.evaBus.WelCPHMea) annotation (Line(points={{0.5,
          -95},{32,-95},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(sum1.u[1], mainBus.htsBus.admixBus1.pumpBus.PelMea) annotation (Line(
        points={{-31,-17.6667},{-98.905,-17.6667},{-98.905,0.09}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(sum1.u[2], mainBus.htsBus.admixBus2.pumpBus.PelMea) annotation (Line(
        points={{-31,-17},{-98.905,-17},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(sum1.u[3], mainBus.htsBus.throttlePumpBus.pumpBus.PelMea) annotation (
     Line(points={{-31,-16.3333},{-98.905,-16.3333},{-98.905,0.09}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(sum1.y, integrator6.u) annotation (Line(points={{-19.5,-17},{-14.75,
          -17},{-14.75,-17},{-11,-17}}, color={0,0,127}));
  connect(integrator.y, sumWel.u[1])
    annotation (Line(points={{0.5,95},{59,95},{59,8.14286}}, color={0,0,127}));
  connect(integrator1.y, sumWel.u[2])
    annotation (Line(points={{0.5,79},{59,79},{59,8.42857}}, color={0,0,127}));
  connect(integrator2.y, sumWel.u[3]) annotation (Line(points={{0.5,61},{32,61},
          {32,10},{59,10},{59,8.71429}}, color={0,0,127}));
  connect(integrator3.y, sumWel.u[4]) annotation (Line(points={{0.5,45},{16,45},
          {16,46},{32,46},{32,9},{59,9}}, color={0,0,127}));
  connect(integrator4.y, sumWel.u[5]) annotation (Line(points={{0.5,25},{32.25,
          25},{32.25,9.28571},{59,9.28571}}, color={0,0,127}));
  connect(integrator5.y, sumWel.u[6])
    annotation (Line(points={{0.5,9},{59,9},{59,9.57143}}, color={0,0,127}));
  connect(integrator6.y, sumWel.u[7]) annotation (Line(points={{0.5,-17},{59,
          -17},{59,9.85714}}, color={0,0,127}));
  connect(sumWel.y, mainBus.evaBus.WelTotalMea) annotation (Line(points={{70.5,9},
          {80,9},{80,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator7.y, sumQbr.u[1]) annotation (Line(points={{0.5,-35},{21.25,
          -35},{21.25,-35.6667},{59,-35.6667}}, color={0,0,127}));
  connect(integrator8.y, sumQbr.u[2])
    annotation (Line(points={{0.5,-55},{59,-55},{59,-35}}, color={0,0,127}));
  connect(integrator9.y, sumQbr.u[3]) annotation (Line(points={{0.5,-75},{30,
          -75},{30,-76},{58,-76},{58,-34.3333},{59,-34.3333}}, color={0,0,127}));
  connect(sumQbr.y, mainBus.evaBus.QbrTotalMea) annotation (Line(points={{70.5,-35},
          {76,-35},{76,-36},{80,-36},{80,0.09},{-98.905,0.09}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(add2.y, limiter.u)
    annotation (Line(points={{84.5,93},{87,93}}, color={0,0,127}));
  connect(limiter.y, product.u2) annotation (Line(points={{98.5,93},{100.25,93},
          {100.25,91.2},{101.4,91.2}}, color={0,0,127}));
  connect(limiter.y, product.u1) annotation (Line(points={{98.5,93},{98.5,94.5},
          {101.4,94.5},{101.4,94.8}}, color={0,0,127}));
  connect(product.y, integrator11.u) annotation (Line(points={{108.3,93},{
          109.15,93},{109.15,93},{111,93}}, color={0,0,127}));
  connect(const.y, add2.u2) annotation (Line(points={{68.3,89},{70.15,89},{
          70.15,90},{73,90}}, color={0,0,127}));
  connect(add2.u1, mainBus.consHtcBus.TFwrdInMea) annotation (Line(points={{73,96},
          {68,96},{68,112},{-98.905,112},{-98.905,0.09}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator11.y, mainBus.evaBus.IseHTC) annotation (Line(points={{122.5,
          93},{132,93},{132,132},{-98.905,132},{-98.905,0.09}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(const2.y, add4.u2) annotation (Line(points={{70.3,41},{72.15,41},{
          72.15,42},{75,42}}, color={0,0,127}));
  connect(add4.y, limiter2.u)
    annotation (Line(points={{86.5,45},{89,45}}, color={0,0,127}));
  connect(integrator13.u, product2.y)
    annotation (Line(points={{113,45},{110.3,45}}, color={0,0,127}));
  connect(limiter2.y, product2.u2) annotation (Line(points={{100.5,45},{102.25,
          45},{102.25,43.2},{103.4,43.2}}, color={0,0,127}));
  connect(limiter2.y, product2.u1) annotation (Line(points={{100.5,45},{100.5,
          46.8},{103.4,46.8}}, color={0,0,127}));
  connect(add4.u1, mainBus.consCold1Bus.TFwrdInMea) annotation (Line(points={{75,
          48},{62,48},{62,50},{54,50},{54,114},{-98.905,114},{-98.905,0.09}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator13.y, mainBus.evaBus.IseCold1) annotation (Line(points={{124.5,
          45},{150,45},{150,122},{-98.905,122},{-98.905,0.09}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(product1.y, integrator12.u)
    annotation (Line(points={{106.3,61},{109,61}}, color={0,0,127}));
  connect(const1.y, add3.u2) annotation (Line(points={{78.3,57},{80.15,57},{80.15,
          58},{83,58}}, color={0,0,127}));
  connect(product4.y, integrator14.u)
    annotation (Line(points={{106.3,79},{109,79}}, color={0,0,127}));
  connect(const4.y,add6. u2) annotation (Line(points={{78.3,75},{80.15,75},{
          80.15,76},{83,76}},
                          color={0,0,127}));
  connect(add6.y,product4. u2) annotation (Line(points={{94.5,79},{97.25,79},{
          97.25,77.2},{99.4,77.2}},     color={0,0,127}));
  connect(add6.y,product4. u1) annotation (Line(points={{94.5,79},{97.25,79},{
          97.25,80.8},{99.4,80.8}},     color={0,0,127}));
  connect(add3.y, product1.u1) annotation (Line(points={{94.5,61},{97.25,61},{97.25,
          62.8},{99.4,62.8}}, color={0,0,127}));
  connect(add3.y, product1.u2) annotation (Line(points={{94.5,61},{97.25,61},{97.25,
          59.2},{99.4,59.2}}, color={0,0,127}));
  connect(add6.u1, mainBus.TZone1Mea) annotation (Line(points={{83,82},{-16,82},
          {-16,84},{-98.905,84},{-98.905,0.09}},
                                      color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(add3.u1, mainBus.TZone2Mea) annotation (Line(points={{83,64},{72,64},
          {72,100},{-100,100},{-100,0.09},{-98.905,0.09}},
                                                color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(integrator14.y, mainBus.evaBus.IseZone1) annotation (Line(points={{120.5,
          79},{128,79},{128,98},{-98.905,98},{-98.905,0.09}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integrator12.y, mainBus.evaBus.IseZone2) annotation (Line(points={{120.5,
          61},{134,61},{134,100},{-98.905,100},{-98.905,0.09}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-86,80},{94,-20}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{30,36}}, color={0,0,0}),
        Polygon(
          points={{44,48},{-8,2},{2,-6},{44,48}},
          lineColor={0,0,0},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-74,64},{-56,42}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{-26,70},{-22,46}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{28,70},{22,46}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{86,60},{66,38}},
          color={0,0,0},
          thickness=1)}),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end EnergyCounter2Zones;
