pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- moonbeats
-- by berg bros

#include ../src/utils.lua
-- exports: p1
#include ../src/player.lua
-- exports: lane
#include ../src/lanes.lua
-- exports: tune
#include ../src/tunes.lua
-- exports: nb
#include ../src/noteboard.lua
-- exports: debug
#include ../src/debug.lua

function _init()
 lane.init()
 p1.init()
end

function _update60()
 p1.update()
end

function _draw()
 cls()
 lane.draw()
	p1.draw()
 nb.draw()
 if debug.enabled then debug.draw() end
end

__gfx__
0000000000aaaa000005600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000a0077a0000770000000000000022222222c000000000000000000066000000000000000000000000000000000000000000000000000000000000000
00700700a000007a0067c600000000000022eeeeeee2c00000000000000000666600000000000000000000000000000000000000000000000000000000000000
00077000a0c0c00a0666656000000000022eeeeeeeee220000000000000006555560000000000000000000000000000000000000000000000000000000000000
00077000a000000a666566660000000002eee77e77eee20000000000000005677650000000000000000000000000000000000000000000000000000000000000
00700700a090900a655665560000000002eee07e07eee200000000000000057c1750000000000000000000000000000000000000000000000000000000000000
000000000a9990aa000550000000000002eeceeeeecee200000000000000657cc756000000000000000000000000000000000000000000000000000000000000
0000000000aaaaa0006666000000000002ecfeeeeefce20000000000000665677656600000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000002eeee888eeee20000000000006665666656660000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000ceee222eeec00000000000066665666656666000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000eeeeeee0000000000000666666566566666600000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000c0000eee0000c0000000000065555655655556000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000888eee888000000000000000005666650000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000e22222288888e88888222222e0000000006666660000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000e22222888888888788822222e0000000055555555000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000888888888887888000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000888888888888788000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000888888888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000888888888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000088888888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000008888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000088888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000008888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000002888200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000292000292000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000222000222000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
01140000040710000000000000002465200600186001a600041431860000000000002465200000000000000004143000000000000000246520000000000000000414300000000000000024652000000000000000
000d0000235502255022750217501f7501d5501b550197501775013550115500f7500e7500b55009750097500b5500d5501075011750135501455016750197501b5501c5501e7501e75020750215502255022750
011400001e0001c0201e00010000270002700011050270001e0001b0500e00018000110001a0500e0001c00010050110000e00010000110001b0001e0000c0500e05010000110001b0001e050000000000000000
011400000414304143000000000000000000000000000000000000000024652000000000000000000000000004143041430000000000000000000000000000000000000000246520000000000000000000000000
011400000905300000000000000009053000000000000000090530000000000000000905300000000000000009053000000000000000090530000000000000000905300000000000000009053000000000000000
011400001660000000166750000000000000001667516600000000000016675000001660000000166750000000000166001667500000000000000016675000000000000000166751660000000000001667500000
__music__
00 04054344
00 40424344
00 40424344

