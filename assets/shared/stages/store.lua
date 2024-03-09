eT = 0
reach = {
  x = -1,
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
    x = -1,
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

  makeLuaSprite("outside","outsideRicha",-1600,-1100)
  scaleObject('outside', 2,2)
  addLuaSprite("outside")
setProperty('outside.visible', false)

makeLuaSprite('cn', 'cnlogonew',1070, 600);
scaleObject('cn', 0.2, 0.2)
setObjectCamera('cn', 'camHUD')
addLuaSprite('cn', true)

  makeLuaSprite("bg2","move",-3550,-460)
  scaleObject('bg2', 1.1, 1.4)
  addLuaSprite("bg2")
  setProperty('bg2.visible', false)


  makeLuaSprite("bg","Store",-850,-330)
  scaleObject('bg', 1.05,1.05)
  addLuaSprite("bg")
  

    makeLuaSprite("car","carta",-2250,-340)
  scaleObject('car', 3,3)
  addLuaSprite("car",true)
  setProperty('car.visible', false)
  
  
  
  makeLuaSprite("pf","pitchforks",-1000,-360)
  scaleObject('pf', 3,3)
  addLuaSprite("pf",true)
  setProperty('pf.visible', false)
  
      makeLuaSprite('int', 'thedad', 0, 0)
    setObjectCamera('int', 'other')
	addLuaSprite('int', true);
   setProperty('int.alpha',0)
   

	makeLuaSprite('woah', 'radlines', 0, 0)
    setObjectCamera('woah', 'camHUD')
    setProperty('woah.alpha',0)
	addLuaSprite('woah', true);

addCharacterToList('richard2', 'dad')
addCharacterToList('bf-car', 'boyfriend')



    makeLuaSprite("carR","carta",-980,-200)
  scaleObject('carR', 3.7,3.7)
  addLuaSprite("carR",false)
 setProperty('carR.visible', false)

		makeLuaSprite('sl', 'speedLines', -800, -300)
	addLuaSprite('sl', true);
	setProperty('sl.angle', 90)
	setProperty('sl.visible', false)



end

function onStepHit()

        if curStep % 8 == 0 then
            doTweenY('apf', 'pf', -440, stepCrochet*0.002, 'expoOut')
        end
        if curStep % 8 == 2 then
            doTweenY('bpf', 'pf', -400, stepCrochet*0.002, 'sineIn')
        end
end


function opponentNoteHit()
if curStep > 384 and curStep < 640 then
		setProperty('woah.alpha',1)
		doTweenAlpha('loud','woah',0,0.3,'linear')
		cameraShake('camGame', 0.01, 0.02)
		
		end
		

end


function onCreatePost()
setProperty('gf.visible',false)
setProperty('gf.scale.x',0.7)
setProperty('gf.scale.y',0.7)
setProperty('camHUD.visible', false)

initLuaShader("scroll")
setSpriteShader('sl', 'scroll');
setShaderFloat('sl', 'ySpeed', -8)
setShaderFloat('sl', 'xSpeed',0)

setSpriteShader('bg2', 'scroll');
setShaderFloat('bg2', 'xSpeed', 5)
setShaderFloat('bg2', 'ySpeed',0)

end

function onUpdate(e,elapsed)
setShaderFloat("sl", "iTime", os.clock())
setShaderFloat("bg2", "iTime", os.clock())

if  getProperty('carR.visible') == true then
	
  eT = eT + e
  setProperty('dadGroup.x', getProperty 'dadGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
setProperty('carR.x', getProperty 'carR.x' + math.sin((eT * speed.x) + offset.x) * reach.x)

setProperty('boyfriendGroup.x', getProperty 'boyfriendGroup.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * bfreach.x)
end

end

function onTweenCompleted(tag)


	
	end
	
	
	function onEvent(n,v1,v2)


	if n == 'RichaEvents' then



if v1 == '8' then
setShaderFloat('sl', 'ySpeed', -15)
setShaderFloat('bg2', 'xSpeed', 8)


end


	end



end
	
	