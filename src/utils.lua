left,right,up,down,fire1,fire2=0,1,2,3,4,5
black,dark_blue,dark_purple,dark_green,brown,dark_gray,light_gray,white,red,orange,yellow,green,blue,indigo,pink,peach=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

function now()
	return flr(t() * 1000)
end

function ease_out_quad(x)
	return 1 - pow(1 - x, 2)
end

function pow(value, times)
 local result = 1
	for i=1,times do
		result *= value
	end
	return result
end
