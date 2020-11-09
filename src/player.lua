p1 = {
 width=8,
 height=8,
 prev_x=0,
 x=0,
 dx=1,
 y=0,
 lane=0,
 dest=0,
 moving_started=0,
 moving_time=150,
 is_moving=false,
 start_move=function()
  p1.is_moving = true
  p1.moving_started = now()
  p1.prev_x = p1.x
 end,
 move_left=function()
  p1.start_move()
  p1.lane = (p1.lane == 1) and 1 or (p1.lane - 1)
	 p1.dest = p1.get_dest()
  p1.distance = abs(p1.x - p1.dest)
	 p1.dx = -1
 end,
 move_right=function()
  p1.start_move()
  p1.lane = (p1.lane >= #lane.x) and #lane.x or (p1.lane + 1)
  p1.dest = p1.get_dest()
  p1.distance = abs(p1.x - p1.dest)
	 p1.dx = 1
 end,
 move=function()
  local elapsed = now() - p1.moving_started
  if (elapsed >= p1.moving_time) then
	 	p1.stop_move()
  else
   local perc = (elapsed) / p1.moving_time
   p1.x = p1.prev_x + (p1.dx * p1.distance * ease_out_quad(perc))
  end
 end,
 stop_move=function()
  p1.x = p1.dest
 	p1.is_moving = false
 	p1.moving_started = 0
 end,
 get_dest=function()
  return lane.x[p1.lane] + ceil((lane.width - p1.width) / 2)
 end,
 update=function()
  if (p1.x > lane.x[1] and btnp(⬅️)) then
   p1.move_left()
  elseif (p1.x < (lane.x[#lane.x]) and btnp(➡️)) then
   p1.move_right()
  end
  if p1.is_moving then
   p1.move()
  end
  
  if (btn(❎)) then
   nb.play(0)
  end
 end,
 draw=function()
  spr(2,p1.x,p1.y,1,1)
  -- scaling: sspr(55,-1,16,16,p1.x,p1.y,8,8)
 end,
 init=function()
  p1.lane = 1
  p1.dest = p1.get_dest()
  p1.x = p1.dest
  p1.y = lane.y + ceil((lane.height - p1.height) / 2)
 end
}
