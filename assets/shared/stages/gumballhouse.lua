



function onCreate()

makeLuaSprite('cn', 'cnlogonew',1070, 600);
scaleObject('cn', 0.2, 0.2)
setObjectCamera('cn', 'camHUD')
addLuaSprite('cn', true)

	makeLuaSprite('bg', 'gumballbg', -600, -300)
	
	makeLuaSprite('ov', 'gumballoverlay', 0, 0)
	
		makeLuaSprite('w', 'woo', -600, -200)
		makeLuaSprite('w2', 'woomem', -600, -200)
		makeLuaSprite('s', 'speedV', -600, -250)
	
makeLuaSprite('i', 'thecat', 0, 0)

setObjectCamera('ov', 'other')
setObjectCamera('i', 'other')
setProperty('ov.alpha',0.5)
setProperty('s.scale.y',0.9)
	addLuaSprite('bg', false);
	addLuaSprite('w', false);
	addLuaSprite('w2', false);
	setProperty('w.visible',false)
	setProperty('w2.visible',false)
	
	addLuaSprite('s', true);
	addLuaSprite('ov', true);
	setProperty('s.visible',false)
	
		addLuaSprite('i', true);
	setProperty('i.alpha',0)
	
		makeLuaSprite('si', 'sign',200, 800);
scaleObject('si', 0.4, 0.4)
setObjectCamera('si', 'other')
addLuaSprite('si', true)
setProperty('si.angle', -90)
	

end

function onCreatePost()
setProperty('gf.scale.x',0.8)
setProperty('gf.scale.y',0.8)
setProperty('gf.alpha',0)

initLuaShader("scroll")
setSpriteShader('w', 'scroll');
setSpriteShader('w2', 'scroll');
setSpriteShader('s', 'scroll');
setShaderFloat('w2', 'xSpeed',70)
setShaderFloat('s', 'xSpeed',20)

setShaderFloat('w', 'xSpeed',0)
setShaderFloat('w', 'ySpeed',0)
setProperty('camHUD.alpha', 0)

addCharacterToList('bf-car', 'boyfriend')

end




function onUpdate()




if curStep == 64 then
doTweenAlpha('iin', 'i', 1, 5, 'expoOut')
doTweenY('siinY', 'si', 350, 1.5, 'expoOut')
doTweenX('siinX', 'si', 800, 1.5, 'expoOut')
doTweenAngle('siinA', 'si', 0, 1.6, 'expoOut')
end

if curStep == 100 then
doTweenAngle('siinA', 'si', -40, 2, 'inOutSine')
doTweenX('siinX', 'si', 1400, 3, 'expoInOut')
doTweenY('siin', 'si', 450, 3, 'expoInOut')
end


if curStep == 128 then
cancelTween('iin')
doTweenAlpha('aadfaGsdf', 'i', 0, 0.001, 'expoOut')
setProperty('camHUD.alpha', 1)
setProperty('si.visible', false)
end


if curStep == 896 then
		setProperty('bg.visible',false)
setProperty('s.visible',true)
	setProperty('w.visible',true)
setShaderFloat('w', 'xSpeed',7.5)
end

if curStep == 1156 then
setProperty('w.visible',false)
	setProperty('w2.visible',true)
setShaderFloat('w2', 'xSpeed',-15)
setShaderFloat('s', 'xSpeed',-20)
end



setShaderFloat("w", "iTime", os.clock())
setShaderFloat("w2", "iTime", os.clock())
setShaderFloat("s", "iTime", os.clock())

setProperty('timeBar.alpha', 1)
setProperty('timeBarBG.alpha', 1)
setProperty('timeTxt.alpha', 1)

if curStep > 896 and curStep < 1152 then
   setProperty('camHUD.angle',0.3 *math.sin(getSongPosition()/550) * math.pi)
  setProperty('camHUD.y',3 *math.sin(getSongPosition()/350))
   setProperty('camHUD.x',3 *math.sin(getSongPosition()/220))
	

  
end

if curStep > 1156 and curStep < 1456 then
   setProperty('camHUD.angle',0.6 *math.sin(getSongPosition()/550) * math.pi)
  setProperty('camHUD.y',5 *math.sin(getSongPosition()/250))
   setProperty('camHUD.x',5 *math.sin(getSongPosition()/120))
	
setProperty('timeBar.angle',2.7 *math.sin(getSongPosition()/450) * math.pi)
setProperty('timeTxt.angle',2.7 *math.sin(getSongPosition()/450) * math.pi)
  
end


end