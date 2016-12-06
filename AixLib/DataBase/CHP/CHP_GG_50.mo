within AixLib.DataBase.CHP;
record CHP_GG_50 "GG 50 : Sokratherm"
  extends CHPBaseDataDefinition(
    Vol={3e-3},
    data_CHP=[0,0,0,0,0; 50,24,54,91,9.1; 75,37,68,118,11.8; 100,50,82,146,14.6],
    MaxTFlow=363.15,
    MaxTReturn=343.15,
    Pipe_D=0.08);

  annotation (Documentation(info="<html>
<p><h4><font color=\"#008000\">Overview</font></h4></p>
<p>Sokratherm BHKW GG 50 </p>
</html>",
        revisions="<html>
<p><ul>
<li><i>August 13, 2013&nbsp;</i> by Ole Odendahl:<br/>Added reference</li>
</ul></p>
</html>"));
end CHP_GG_50;
