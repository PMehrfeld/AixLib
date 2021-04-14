within AixLib.Systems.Benchmark.BaseClasses;
record Ashrae140_900 "Ashrae140 900 Testcase"
  extends AixLib.DataBase.ThermalZones.ZoneBaseRecord(
    T_start=293.15,
    VAir=129.60000000000002,
    AZone=48,
    hRad=5.13,
    lat=0.87266462599716,
    nOrientations=1,
    AWin={12},
    ATransparent={12},
    hConWin=3.16,
    RWin=0.0133333333333,
    gWin=0.789,
    UWin=1.3,
    ratioWinConRad=0.03,
    AExt={21.6},
    hConExt=3.160000000000001,
    nExt=1,
    RExt={0.000985315078012},
    RExtRem=0.0274795299795,
    CExt={8775985.69078},
    AInt=48.0,
    hConInt=4.130000000000001,
    nInt=1,
    RInt={0.000491103488785},
    CInt={5373300.22817},
    AFloor=0,
    hConFloor=0,
    nFloor=1,
    RFloor={0.17413196439},
    RFloorRem=0.348263868943,
    CFloor={0.0902868158636},
    ARoof=48.0,
    hConRoof=1.0,
    nRoof=1,
    RRoof={0.000550791436374},
    RRoofRem=0.061807839516,
    CRoof={381586.716241},
    nOrientationsRoof=1,
    tiltRoof={0},
    aziRoof={0},
    wfRoof={1},
    aRoof=0.7,
    aExt=0.7,
    TSoil=283.15,
    hConWallOut=20.0,
    hRadWall=5,
    hConWinOut=20.0,
    hConRoofOut=20,
    hRadRoof=5,
    tiltExtWalls={1.5707963267949},
    aziExtWalls={0},
    wfWall={0.9},
    wfWin={1},
    wfGro=0.1,
    specificPeople=1/14,
    activityDegree=1.2,
    fixedHeatFlowRatePersons=125/100,
    ratioConvectiveHeatPeople=0.5,
    internalGainsMoistureNoPeople=0.5,
    internalGainsMachinesSpecific=20/100,
    ratioConvectiveHeatMachines=0.6,
    lightingPowerSpecific=420/100,
    ratioConvectiveHeatLighting=0.6,
    useConstantACHrate=false,
    baseACH=0.2,
    maxUserACH=1,
    maxOverheatingACH={3.0,2.0},
    maxSummerACH={1.0,273.15 + 10,273.15 + 17},
    winterReduction={0.2,273.15,273.15 + 10},
    withAHU=false,
    minAHU=0,
    maxAHU=12,
    hHeat=167500,
    lHeat=0,
    KRHeat=1000,
    TNHeat=1,
    HeaterOn=false,
    hCool=0,
    lCool=-1,
    KRCool=1000,
    TNCool=1,
    CoolerOn=false,
    TThresholdHeater=273.15 + 15,
    TThresholdCooler=273.15 + 22,
    withIdealThresholds=false);                     //not area specific: W_per_person/area => input will be number of persons
  annotation (Documentation(revisions="<html>
 <ul>
  <li>
  February 28, 2019, by Niklas Huelsenbeck, dja, mre:<br/>
  Adapting nrPeople and nrPeopleMachines to area specific approach 
  </li>
  <li>
  September 27, 2016, by Moritz Lauster:<br/>
  Reimplementation.
  </li>
  <li>
  June, 2015, by Moritz Lauster:<br/>
  Implemented.
  </li>
 </ul>
 </html>", info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">Zone &quot;Office&quot; of an example building according to an office building with passive house standard. The building is divided in six zones, this is a typical zoning for an office building. </span></p>
</html>"));
end Ashrae140_900;
