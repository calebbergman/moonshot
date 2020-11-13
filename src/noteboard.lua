nb = {
 pattern={}, -- { { { show: 1, y: -1 }, { show:0, y:-7 }... (x32 notes) }, ...(x4 channels) }
 song_num=0,
 speed=0,
 bpm=0, -- how long an effect takes to play from start to finish 
 height=1,
 spread=6, -- todo: figure out spread and music rate, and how they relate
 is_playing=false,
 start_music=false,
 play=function(song_num)
  nb.pattern = {} -- clear
  nb.song_num = song_num
  local patterns = tunes.get_channels_for_song(song_num) -- { 1, 2, 3, 4 } sfx ids
  for i=1,#patterns do
   add(nb.pattern, tunes.get_sfx(patterns[i]))
  end

  nb.speed = tunes.get_sfx_speed(patterns[1])
  nb.bpm = (nb.spread) / ((60 * (1/128) * nb.speed)) -- Hmmm... 🤔
  printh("BPM: " .. nb.bpm, "debug.txt")
  nb.is_playing = true
 end,
 stop=function()
  nb.is_playing = false
  nb.start_music = false
 end,
 update=function()
  if not nb.is_playing then return end

  local start_the_music = false
  local note
  for i=1,#nb.pattern do
   for j=1,32 do
    note = nb.pattern[i][j]
    if (i == 1 and j == 1) then
      printh("TICK: " .. time() .. ", Y: " .. note.y, "debug.txt")
    end
    -- note.y += 0.6
    note.y += nb.bpm
    if (not nb.start_music and note.y >= lane.mid) then
     start_the_music = true
    end
   end
  end

  if (stat(stats.pticks) < 0) then
   -- start the music track
   if (start_the_music and not nb.start_music) then
    music(nb.song_num)
    nb.start_music = true
   -- stop the music after all notes are off screen
   elseif (nb.start_music) then
    nb.stop()
   end
  end

 end,
 draw=function()
  if not nb.is_playing then return end

  local note
  for i=1,#nb.pattern do
   for j=1,#nb.pattern[i] do
    note = nb.pattern[i][j]
    if note.show > 0 and note.y > 0 and note.y < 128 then
     rectfill(
      lane.x[i],
      note.y,
      lane.x[i] + lane.width,
      note.y + nb.height,
      lane.color[i]
     )
    end
   end
  end
 end
}
