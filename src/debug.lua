debug={
 enabled=true,
 stats = {
  { "frmrate", 7 },
  { "sfx1", 16 },
  { "sfx2", 17 },
  { "sfx3", 18 },
  { "sfx4", 19 },
  { "note1", 20 },
  { "note2", 21 },
  { "note3", 22 },
  { "note4", 23 },
  { "pattern", 24 },
  { "pticks", 26 },
 },
 draw=function()
  for i=1,#debug.stats do
   print(debug.stats[i][1]..": "..stat(debug.stats[i][2]),0,7*i,12)
  end
 end,
}
