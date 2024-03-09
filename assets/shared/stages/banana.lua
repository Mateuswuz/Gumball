eT = 0
reach = {
  x = -1.5,
  y = 0
}
speed = {
  x = 4,
  y = 0
}
offset = {
  x = 0,
  y = 0
}
bfreach = {
    x = -1.5,
    y = -0
  }

bfspeed = {
  x = 4,
  y = 0
}
bfoffset = {
    x = 0,
    y = 0
  }


function onCreate()

makeLuaSprite('cn', 'cnextra',1070, 600);
scaleObject('cn', 0.2, 0.2)
setObjectCamera('cn', 'camHUD')
addLuaSprite('cn', true)

  makeLuaSprite('bg','joehouse',-850,-400)
  scaleObject('bg', 1.2,1.2)
  addLuaSprite('bg')
  
  	makeLuaSprite('ov', 'gumballoverlay', 0, 0)
    setObjectCamera('ov', 'other')
    setProperty('ov.alpha',0.3)
	addLuaSprite('ov', true);
  
--[[	
	  	makeLuaSprite('halftone', 'whitetone', 0, 400)
    setObjectCamera('halftone', 'other')
	setBlendMode('halftone', 'screen')
   setProperty('halftone.alpha',0.2)
	addLuaSprite('halftone', true);
	
	makeLuaSprite('woah', 'radlines', 0, 0)
    setObjectCamera('woah', 'other')
    setProperty('woah.alpha',0)
	addLuaSprite('woah', true);
  ]]
  
    makeLuaSprite('int', 'thejoeking', 0, 0)
    setObjectCamera('int', 'other')
	addLuaSprite('int', true);
   setProperty('int.alpha',0)
  
  	makeAnimatedLuaSprite('s', 'sliding', 0,0)
	addAnimationByPrefix('s', 'move', 'sliding', 24, true)
	setProperty('s.alpha',0)
    addLuaSprite('s', false);
	
    	makeAnimatedLuaSprite('b', 'booming', 0,0)
	addAnimationByPrefix('b', 'boom', 'booming', 24,false)
	scaleObject('b', 1.2, 1.2)
	setProperty('b.alpha',0)
    addLuaSprite('b', true);
	
	
		makeLuaSprite('sl', 'speedLines', -800, -300)
	addLuaSprite('sl', true);
	setProperty('sl.angle', 90)
	setProperty('sl.alpha', 0)
	

end

function onCreatePost()



setProperty('gf.visible',false)
setProperty('camHUD.visible',false)
setProperty('cameraSpeed', 1)
setProperty('camGame.visible',false)

initLuaShader("scroll")
setSpriteShader('bg', 'scroll');
setShaderFloat('bg', 'xSpeed',0)
setShaderFloat('bg', 'ySpeed',0)

initLuaShader("scroll")
setSpriteShader('sl', 'scroll');
setShaderFloat('sl', 'ySpeed', -8)
setShaderFloat('sl', 'xSpeed',0)

end

function onUpdate(e,elapsed)
setShaderFloat("bg", "iTime", os.clock())

setProperty('s.x', getProperty('boyfriend.x')+250)
setProperty('s.y', getProperty('boyfriend.y')+230)
setProperty('b.x', getProperty('boyfriend.x')+200)
setProperty('b.y', getProperty('boyfriend.y')-250)

-- runnin
if getProperty('s.alpha') > 0 then
   setProperty('camHUD.x',20 *math.sin(getSongPosition()/220))
	
	setProperty('sl.alpha', 1)
  eT = eT + e
  setProperty('dadGroup.x', getProperty 'dadGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)

setProperty('boyfriendGroup.x', getProperty 'boyfriendGroup.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * bfreach.x)
end
-- runnin

end