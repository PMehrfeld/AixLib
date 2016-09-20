within AixLib.DataBase.ThermalZones.OfficePassiveHouse;
record OPH_1_Office "Office zone of office building"
  extends ZoneBaseRecord(
    T_start = 293.15,
    VAir = 6700.0,
    AZone = 1675.0,
    alphaRad = 5,
    lat = 0.87266462599716,
    nOrientations = 5,
    AWin = {108.5, 19.0, 108.5, 19.0, 0},
    ATransparent = {108.5, 19.0, 108.5, 19.0, 0},
    alphaWin = 2.7,
    RWin = 0.017727777777,
    gWin = 1,
    UWin= 2.1,
    ratioWinConRad = 0.09,
    AExt = {244.12, 416.33, 244.12, 416.33, 208.16},
    alphaExt = 2.19,
    nExt = 1,
    RExt = {1.4142107968e-05},
    RExtRem = 0.000380773816236,
    CExt = {492976267.489},
    AInt = 5862.5,
    alphaInt = 2.27,
    nInt = 1,
    RInt = {1.13047235829e-05},
    CInt = {1402628013.98},
    AFloor = 0,
    alphaFloor = 0,
    nFloor = 1,
    RFloor = {0},
    RFloorRem = 0,
    CFloor = {0},
    ARoof = 0,
    alphaRoof = 0,
    nRoof = 1,
    RRoof = {0},
    RRoofRem = 0,
    CRoof = {0},
    nOrientationsRoof = 1,
    tiltRoof = {0},
    aziRoof = {0},
    wfRoof = {1},
    aRoof = 0.7,
    aExt = 0.7,
    TSoil = 283.15,
    alphaWallOut = 20.0,
    alphaRadWall = 5,
    alphaWinOut = 20.0,
    alphaRadWin = 5,
    alphaRoofOut = 20,
    alphaRadRoof = 5,
    tiltExtWalls = {1.5707963267949, 1.5707963267949, 1.5707963267949, 1.5707963267949, 0},
    aziExtWalls = {0, 1.5707963267949, 3.1415926535898, 4.7123889803847, 0},
    wfWall = {0.129284891808, 0.0227804851231, 0.129284891808, 0.0227804851231, 0.11864201466},
    wfWin = {0.137403538825, 0.0240614491951, 0.137403538825, 0.0240614491951, 0},
    wfGro = 0.254297255439,
    aowo = 0.7,
    Heater_on = true,
    Cooler_on = false,
    l_cooler = 0,
    RatioConvectiveHeatLighting = 0.5,
    zoneID = "OPH_3_Office",
    usage = "Group Office",
    RoomArea = 1675.0,
    alphaiwi = 2.27142857143,
    alphaowi = 2.19101669837,
    alphaowo = 25.0,
    g = 0.78,
    NrPeople = 83.75,
    NrPeopleMachines = 117.25,
    LightingPower = 12.5,
    h_heater = 167500,
    gsunblind = {1.0, 1.0, 1.0, 1.0, 1},
    Aw = {108.5, 19.0, 108.5, 19.0, 0},
    withWindows = true,
    weightfactorswindow = {0.137403538825, 0.0240614491951, 0.137403538825, 0.0240614491951, 0},
    weightfactorswall = {0.129284891808, 0.0227804851231, 0.129284891808, 0.0227804851231, 0.11864201466},
    weightfactorground = 0.254297255439,
    Ai = 5862.5,
    withInnerwalls = true,
    R1i = 1.13047235829e-05,
    C1i = 1402628013.98,
    Ao = 1892.4,
    withOuterwalls = true,
    R1o = 1.4142107968e-05,
    RRest = 0.000380773816236,
    C1o = 492976267.489,
    orientationswallshorizontal = {90,90,90,90,0});

  annotation (Documentation(revisions="<html>
 <ul>
 <li><i>June, 2015&nbsp;</i> by Moritz Lauster:<br/>Implemented.</li>
 </ul>
 </html>", info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">Zone &quot;Office&quot; of an example building according to an office building with passive house standard. The building is divided in six zones, this is a typical zoning for an office building. </span></p>
</html>"));
end OPH_1_Office;
