within AixLib.DataBase.Walls.EnEV2009.Floor;
record FLground_EnEV2009_SML_upHalf "Floor towards ground (upper part) after EnEV 2009, for building of type S (schwer), M (mittel) and L (leicht)"
  extends WallBaseDataDefinition(
    n(min=1) = 2 "Number of wall layers",
    d={0.1,0.06} "Thickness of wall layers",
    rho={2300,140} "Density of wall layers",
    lambda={2.3,0.040} "Thermal conductivity of wall layers",
    c={1000,1000} "Specific heat capacity of wall layers",
    eps=0.95 "Emissivity of inner wall surface");
  annotation (Documentation(revisions="<html><ul>
  <li>
    <i>September 5, 2013&#160;</i> by Ole Odendahl:<br/>
    Added documentation and formatted appropriately
  </li>
  <li>
    <i>Juni 1, 2011</i> by Ana Constantin:<br/>
    implemented
  </li>
</ul>
</html>", info="<html>
<h4>
  <span style=\"color:#008000\">Overview</span>
</h4>
<p>
  Wall definition according to EnEV 2009. For detailed wall type see
  above.
</p>
<h4>
  <span style=\"color:#008000\">Concept</span>
</h4>
<p>
  <b><span style=\"color: #ff0000\">Attention:</span></b> The first
  element in each vector represents the layer connected to
  <code>port_a</code>(outside), the last element represents the layer
  connected to <code>port_b</code>(surface facing the room).
</p>
<h4>
  <span style=\"color:#008000\">References</span>
</h4>
<p>
  Record is used in model <a href=
  \"Building.Components.Walls.BaseClasses.ConvNLayerClearanceStar\">Building.Components.Walls.BaseClasses.ConvNLayerClearanceStar</a>
</p>
<p>
  Norm:
</p>
<ul>
  <li>Bundesregierung (Veranst.): Verordnung über energiesparenden
  Wärmeschutz und energiesparende Anlagentechnik bei Gebäuden. Berlin,
  2009
  </li>
</ul>
</html>"));
end FLground_EnEV2009_SML_upHalf;
