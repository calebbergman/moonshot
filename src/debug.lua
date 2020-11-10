debug={
 enabled=true,
 stats = {
  { "frmrate", stats.frmrate },
  { "sfx1", stats.sfx1 },
  { "sfx2", stats.sfx2 },
  { "sfx3", stats.sfx3 },
  { "sfx4", stats.sfx4 },
  { "note1", stats.note1 },
  { "note2", stats.note2 },
  { "note3", stats.note3 },
  { "note4", stats.note4 },
  { "pattern", stats.pattern },
  { "pticks", stats.pticks },
 },
 draw=function()
  for i=1,#debug.stats do
   print(debug.stats[i][1]..": "..stat(debug.stats[i][2]),0,7*i,12)
  end
 end,
}
