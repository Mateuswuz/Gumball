eT = 0
reach = {
  x = 0.1,
  y = 0.5
}
speed = {
  x = 4,
  y = 4
}
offset = {
  x = 0,
  y = 50
}
bfreach = {
    x = 0.1,
    y = 0.5
  }

bfspeed = {
  x = 4,
  y = 4
}
bfoffset = {
    x = 0,
    y = 0
  }



function onCreate()

makeLuaSprite('cn', 'cnlogonew',1070, 600);
scaleObject('cn', 0.2, 0.2)
setObjectCamera('cn', 'camHUD')
addLuaSprite('cn', true)

	makeLuaSprite('bg', 'bedroomA', -900, -320)
	
	makeLuaSprite('ov', 'gumballoverlay', 0, 0)
	
makeLuaSprite('s', 'skyanai', -1350, -6020)
	
makeLuaSprite('i', 'therabbit', 0, 0)

setObjectCamera('ov', 'other')
setObjectCamera('i', 'other')
setProperty('ov.alpha',0.5)

scaleObject('s',1.6,1.6)
addLuaSprite('s', false);


scaleObject('bg',0.65,0.65)
	addLuaSprite('bg', false);
	
			makeAnimatedLuaSprite('gey', 'geyseranai', -500,1050)
	addAnimationByPrefix('gey', 'idle', 'idle', 24,true)
addLuaSprite('gey', false);
scaleObject('gey',1.2,1.2)
	
	
	
	addLuaSprite('ov', true);
	
		addLuaSprite('i', true);
	setProperty('i.alpha',0)
	
			makeLuaSprite('sl', 'speedLines', -700, -2700)
	addLuaSprite('sl', true);
	--setProperty('sl.visible', false)
	
	makeLuaSprite('bar', 'transitionbar', -1500, -720)
scaleObject('bar',1.2,3)
	addLuaSprite('bar', true);
	
	setProperty('gey.visible', false)

addCharacterToList('bf-car', 'boyfriend')


end

function onCreatePost()

--setProperty('camHUD.alpha', 0)
	setProperty('gf.alpha',0)
addCharacterToList('bf-car', 'boyfriend')


initLuaShader("scroll")
setSpriteShader('sl', 'scroll');
setShaderFloat('sl', 'ySpeed', -8)
setShaderFloat('sl', 'xSpeed',0)

end

function onUpdate(e,elapsed)

if curStep == 64 then
doTweenAlpha('iin', 'i', 1, 5, 'expoOut')
end

if curStep == 128 then
cancelTween('iin')
doTweenAlpha('aadfaGsdf', 'i', 0, 0.001, 'expoOut')
end

if curStep > 256 then
   setProperty('camHUD.angle',0.3 *math.sin(getSongPosition()/550) * math.pi)
   setProperty('camHUD.y',3 *math.sin(getSongPosition()/350))
   setProperty('camHUD.x',3 *math.sin(getSongPosition()/220))
	

  
end


if curStep > 768 then
	
  eT = eT + e
  setProperty('dadGroup.x', getProperty 'dadGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
  setProperty('dadGroup.y', getProperty 'dadGroup.y' + math.cos((eT * speed.y) + offset.y) * reach.y)


    setProperty('gey.x', getProperty 'gey.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
  setProperty('gey.y', getProperty 'gey.y' + math.cos((eT * speed.y) + offset.y) * reach.y)

setProperty('boyfriendGroup.x', getProperty 'boyfriendGroup.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * bfreach.x)
  setProperty('boyfriendGroup.y', getProperty 'boyfriendGroup.y' + math.cos((eT * bfspeed.y) + bfoffset.y) * bfreach.y)

end


setShaderFloat("sl", "iTime", os.clock())
end

function onEvent(n,v1,v2)


	if n == 'AnaiEvents' then



if v1 == 'faster' then
reach.x = 0.3
reach.y = 0.7

bfreach.x = 0.3
bfreach.y = 0.7
end





end


end
