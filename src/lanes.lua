lane = {
 width=8,
 height=8,
 x={},
 y=0,
 color={ red, yellow, green, blue },
 count=3,
 padding=15,
 start=0,
 draw=function()
  for i=0,(#lane.x - 1) do
  rect(
   lane.x[i + 1],
   lane.y,
   lane.x[i + 1] + lane.width,
   lane.y + lane.height,
   lane.color[i + 1]
  )
  end
 end,
 init=function()
  lane.y = 121 - lane.height
  lane.start = 127 - (((lane.count + 1) * lane.width) + (lane.padding * (lane.count)))
  for i=0,lane.count do
   lane.x[i + 1] = lane.start + ((lane.width + lane.padding) * i)
  end
 end
}
