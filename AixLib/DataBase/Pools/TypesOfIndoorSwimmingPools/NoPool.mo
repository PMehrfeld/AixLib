within AixLib.DataBase.Pools.TypesOfIndoorSwimmingPools;
record NoPool
  "Place holder for zones without pools"
  extends IndoorSwimmingPoolBaseRecord(V_pool=0.001,
  A_pool=0.001,
  d_pool=0.0,
  V_storage=0.01,
  T_pool=273.15,
  beta_inUse=28/3600,
  Q=0.001,
  Q_night=0.001,
  use_partialLoad = false,
  use_waterRecycling=false,
  use_poolCover = false,
  use_wavePool = false,
  h_wave = 0.0,
  w_wave = 0.0,
  x_recycling=0,
  m_flow_out=0.005,
  AExt = 0,
  hConExt= 0.0,
  nExt = 1,
  RExt = {0.00001},
  RExtRem = 0.00001,
  CExt = {0.00001},
  AInt = 0,
  hConInt = 0.0,
  nInt = 1,
  RInt = {0.00001},
  CInt = {0.00001},
  AFloor = 0.0,
  hConFloor = 0.0,
  nFloor = 1,
  RFloor = {0.00001},
  RFloorRem =  0.00001,
  CFloor = {0.00001});
  annotation (Documentation(info="<html><p>
  This record is a place holder for zones without swimming pools to
  avoid error messages.
</p>
</html>"));
end NoPool;
