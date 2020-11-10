tunes = {
 get_sfx=function(index) -- returns #32{}
  local offset = index * 68
  local effect = {}
  local has_volume
  for i=0,31 do
   has_volume = tunes.sfx_has_volume( @(0x3201 + offset + (i * 2)) )
   add(effect, (has_volume and 1) or 0)
  end
  return effect
 end,
 get_sfx_speed=function(index) -- returns integer
  local offset = ((index + 1) * 68) - 3
  return @(0x3200 + offset)
 end,
 set_sfx_speed=function(index, speed) -- returns integer
  local offset = ((index + 1) * 68) - 3
  return poke(0x3200 + offset, speed)
 end,
 set_music_speed=function(index, speed) -- returns integer
  local channels = tunes.get_channels_for_song(index)
  for i=0,#channels do
   if (channels[i] != nil) then
    tunes.set_sfx_speed(channels[i], speed)
   end
  end
 end,
 -- build bits table from decimal value located in the volume/effect bytes' position
 sfx_has_volume=function(number)
  local bits = bits_from_bytes(number)
  -- bits = { c, e, e, e, v, v, v, w } where v=volume
  return bits[5] + bits[6] + bits[7] > 0
 end,
 draw_sfx=function(number, x, y)
  local note = (number > 0)
  print(note and "X" or "-", (x != nil) and x or 0, (y != nil) and y or 0, note and 11 or 8)
 end,
 get_channels_for_song=function(index) -- returns #4{}
  local offset = index * 4
  local channel = {}
  for i=0,3 do
   add(channel, @(0x3100 + offset + i))
  end
  return channel
 end,
}
