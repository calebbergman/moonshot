nb = {
 pattern={}, -- { {1,2,3,4...32}, {5,6,7,8...32}, {9,a,b,c...32}, {d,e,f,0...32} }
 speed=0,
 play=function(song_num)
  nb.pattern = {} -- clear
  local patterns = tunes.get_channels_for_song(song_num) -- { 1, 2, 3, 4 } sfx ids
  for i=1,#patterns do
   add(nb.pattern, tunes.get_sfx(patterns[i]))
  end

  nb.speed = tunes.get_sfx_speed(patterns[1])
  music(song_num)
 end,
 draw=function()
  local playing_pattern = stat(24) -- music id
  if playing_pattern == -1 then return end

  for i=1,#nb.pattern do
   local note_num=stat(i+19)
   for j=1,32 do
    if nb.pattern[i][j] > 0 then
     note_y = (120 - (j - note_num) * 6) + mid(0, (stat(26) % nb.speed) / 6, 5)
     local can_see_note = note_y < 128
     if (can_see_note) then
      rectfill(lane.x[i], note_y, lane.x[i] + lane.width, note_y + 1, lane.color[i])
     end
    end
   end
  end
 end
}
