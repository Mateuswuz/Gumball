eT = 0
reach = {
  x = 0.1,
  y = 0.1
}
speed = {
  x = 1,
  y = 1
}
offset = {
  x = 0,
  y = 0
}


bfreach = {
    x = -0.1,
    y = -0.1
  }

bfspeed = {
  x = 1,
  y = 1
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
  
  makeLuaSprite("outside","outside",-1130,-650)
  scaleObject('outside', 1.5,1.5)
  addLuaSprite("outside")
  
          makeLuaSprite('bg','darwiBG',-1130,-450)
		  scaleObject('bg', 1.2,1.2)
  addLuaSprite('bg', false)
  
      makeLuaSprite('int', 'thefish', 0, 0)
    setObjectCamera('int', 'other')
	addLuaSprite('int', true);
   setProperty('int.alpha',0)
   
     makeLuaSprite('darklight','darklight',-350,-250)
	 scaleObject('darklight', 0.6,0.8)
  addLuaSprite('darklight', true)
  
       makeLuaSprite('light','light',-350,-250)
	 scaleObject('light', 0.6,0.8)
  addLuaSprite('light', true)
  
  setProperty('light.alpha', 0)
    setProperty('darklight.alpha', 0)
      setProperty('bg.alpha', 0)

addCharacterToList('darwi-kids', 'dad')
addCharacterToList('darwi-old', 'dad')
addCharacterToList('bf-darwi2', 'boyfriend')

          makeLuaSprite('dm','dumbell',-230,200)
		  scaleObject('dm', 0.8,0.8)
  addLuaSprite('dm', false)
  
            makeLuaSprite('dmb','dumbell2',880,320)
		  scaleObject('dmb', 0.8,0.8)
  addLuaSprite('dmb', false)


	makeAnimatedLuaSprite('gl', 'greenline', 300,160)
	addAnimationByPrefix('gl', 'wave', 'greenline', 24, true)
	scaleObject('gl', 0.6, 0.6)
addLuaSprite('gl', false);


            makeLuaSprite('bl','blackline',0,700)
		  scaleObject('bl', 0.9,0.9)
  addLuaSprite('bl', true)
  
  
  setProperty('bl.visible', false)
  setProperty('gl.visible', false)
  setProperty('dmb.visible', false)
  setProperty('dm.visible', false)

end

function onCreatePost()
doTweenAngle('dmspin','dm',360,20,'linear')
doTweenAngle('dmspinB','dmb',360,20,'linear')
doTweenAngle('glspin','gl',360,25,'sineInOut')
doTweenAngle('blspin','bl',-30,6,'sineInOut')
end


function onUpdate(e,elapsed)


	
  eT = eT + e
    setProperty('dm.x', getProperty 'dm.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
  setProperty('dm.y', getProperty 'dm.y' + math.cos((eT * speed.y) + offset.y) * reach.y)

  

  setProperty('dmb.x', getProperty 'dmb.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * bfreach.x)
  setProperty('dmb.y', getProperty 'dmb.y' + math.cos((eT * bfspeed.y) + bfoffset.y) * bfreach.y)

  setProperty('gl.x', getProperty 'gl.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * 0.2)
  setProperty('gl.y', getProperty 'gl.y' + math.cos((eT * bfspeed.y) + bfoffset.y) * 0.2)
  
    setProperty('bl.x', getProperty 'bl.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * 0.1)
  setProperty('bl.y', getProperty 'bl.y' + math.cos((eT * bfspeed.y) + bfoffset.y) * 0.1)

end

function onTweenCompleted(tag)

		if tag == 'dmspin' then
doTweenAngle('dmspin2','dm',0,20,'sineInOut')
	end
	
			if tag == 'dmspin2' then
doTweenAngle('dmspin','dm',360,20,'sineInOut')
	end
	
			if tag == 'dmspinB' then
doTweenAngle('dmspin2B','dmb',0,20,'sineInOut')
	end
	
			if tag == 'dmspin2B' then
doTweenAngle('dmspinB','dmb',-360,20,'sineInOut')
	end
	
			if tag == 'glspin' then
doTweenAngle('glspin2','gl',0,25,'sineInOut')
	end
	
			if tag == 'glspin2' then
doTweenAngle('glspin','gl',360,25,'sineInOut')
	end
	
	
				if tag == 'blspin' then
doTweenAngle('blspin2','bl',0,6,'sineInOut')
	end
	
			if tag == 'blspin2' then
doTweenAngle('blspin','bl',-30,6,'sineInOut')
	end
	
	end
	
	