eT = 0
reach = {
  x = 1.5,
  y = 1.5
}
speed = {
  x = 2,
  y = 2
}
offset = {
  x = 0,
  y = 0
}


bfreach = {
    x = -1.5,
    y = -1.5
  }

bfspeed = {
  x = 2,
  y = 2
}
bfoffset = {
    x = 3,
    y = 0
  }

function onCreate()

makeLuaSprite('cn', 'cnextra',1070, 600);
scaleObject('cn', 0.2, 0.2)
setObjectCamera('cn', 'camHUD')
addLuaSprite('cn', true)


addCharacterToList('bf-car', 'boyfriend')
	makeLuaSprite('nh', 'neighbourshouse', -1800, -730)
	scaleObject('nh', 1.8,1.8)
	addLuaSprite('nh', false);
	setProperty('nh.visible', false)


	makeLuaSprite('rh', 'robinsonshouse', -1100, -355)
	scaleObject('rh', 1.25,1.25)
	addLuaSprite('rh', false);
	setProperty('rh.visible', false)

	
		makeLuaSprite('marg', 'marg', 2000, 900)
	scaleObject('marg', 0.8,0.8)
	addLuaSprite('marg', true);
	


makeLuaSprite('intro', 'thegaylord', 0, 0)
setObjectCamera('intro', 'camHUD')
addLuaSprite('intro', true);
setProperty('intro.alpha', 0)

	makeLuaSprite('ov', 'gumballoverlay', 0, 0)
setObjectCamera('ov', 'other')
setProperty('ov.alpha',0.5)
	addLuaSprite('ov', true);
	setProperty('ov.alpha', 0)
--[[
	makeLuaSprite('vig', 'vignette', 0, 0)
	setObjectCamera('vig', 'other')
	addLuaSprite('vig', true);
	setProperty('vig.alpha', 0)
	]]
	
	makeLuaSprite('d', 'dust', -800, -100)
	setBlendMode('d', 'screen')
--addLuaSprite('d', true);
	scaleObject('d', 2,3)
    setProperty('d.alpha', 0)
	
		makeLuaSprite('sl', 'speedLines', -600, -300)
	addLuaSprite('sl', true);
	setProperty('sl.visible', false)
	
		makeLuaSprite('ri', 'rock', -920, 900)
		scaleObject('ri', 1.5,1.5)
	addLuaSprite('ri', false);
	setProperty('ri.visible', false)
	
		makeAnimatedLuaSprite('gum', 'gumbaldarwig', 2500,700)
	addAnimationByPrefix('gum', 'idle', 'idle', 24, true)
	scaleObject('gum', 0.9,0.9)
addLuaSprite('gum', false);

makeAnimatedLuaSprite('dar', 'gumbaldarwig', 2500,600)
	addAnimationByPrefix('dar', 'idle', 'drwnidle', 24, true)
	scaleObject('dar', 0.9,0.9)
addLuaSprite('dar', false);


setObjectOrder('dadGroup', 5)
setObjectOrder('gum', 6)
setObjectOrder('boyfriendGroup', 7)
setObjectOrder('marg', 8)
setObjectOrder('r1', 9)
setObjectOrder('r2', 10)

setObjectOrder('d', 4)

	makeLuaSprite('js', 'boom', 0, 0)
setObjectCamera('js', 'camHUD')
addLuaSprite('js', true);
setProperty('js.alpha', 0)


	makeLuaSprite('r1', 'rocks1', -600, 2055)
	setProperty('r1.angle', 80)
	addLuaSprite('r1', true);

	makeLuaSprite('r2', 'rocks2', 1000, 2055)
	setProperty('r2.angle', 60)
	addLuaSprite('r2', true);
end


function onCreatePost()
setProperty('gf.visible', false)

setProperty('camGame.alpha', 0)

initLuaShader("scroll")
setSpriteShader('sl', 'scroll');
setShaderFloat('sl', 'ySpeed', 8)
setShaderFloat('sl', 'xSpeed',0)


end

function onStepHit()

        if curStep % 4 == 0 then
            doTweenY('a', 'marg', 880, stepCrochet*0.002, 'circOut')
        end
        if curStep % 4 == 2 then
            doTweenY('b', 'marg', 900, stepCrochet*0.002, 'sineIn')
        end


    if curStep > 655 and curStep < 914 then
        if curStep % 4 == 0 then
            doTweenY('rrr', 'camHUD', -18, stepCrochet*0.002, 'circOut')
         --   doTweenY('rtr', 'camHUD.scroll', 18, stepCrochet*0.002, 'sineIn')
        end
        if curStep % 4 == 2 then
            doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
         --   doTweenY('ryr', 'camHUD.scroll', 0, stepCrochet*0.002, 'sineIn')
        end
    end
	
	    if curStep > 1055 then
        if curStep % 4 == 0 then
            doTweenY('rrr', 'camHUD', -18, stepCrochet*0.002, 'circOut')
         --   doTweenY('rtr', 'camHUD.scroll', 18, stepCrochet*0.002, 'sineIn')
        end
        if curStep % 4 == 2 then
            doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
         --   doTweenY('ryr', 'camHUD.scroll', 0, stepCrochet*0.002, 'sineIn')
        end
    end
	
	
end

function onUpdate(e,elapsed)

if curStep == 1 then
noteTweenAlpha('1N', 0, 0, 1, 'smootherStepOut')
noteTweenAlpha('2N', 1, 0, 1, 'smootherStepOut')
noteTweenAlpha('3N', 2, 0, 1, 'smootherStepOut')
noteTweenAlpha('4N', 3, 0, 1, 'smootherStepOut')
noteTweenAlpha('5N', 4, 0, 1, 'smootherStepOut')
noteTweenAlpha('6N', 5, 0, 1, 'smootherStepOut')
noteTweenAlpha('7N', 6, 0, 1, 'smootherStepOut')
noteTweenAlpha('8N', 7, 0, 1, 'smootherStepOut')


doTweenAlpha('H', 'healthBar', 0, 1, 'sineInOut')
doTweenAlpha('HB', 'healthBarBG', 0, 1, 'sineInOut')

doTweenAlpha('ic', 'iconP1', 0, 1, 'sineInOut')
doTweenAlpha('icp2', 'iconP2', 0, 1, 'sineInOut')
doTweenAlpha('sct', 'scoreTxt', 0, 1, 'sineInOut')
doTweenAlpha('scti', 'timeTxt', 0, 1, 'sineInOut')
doTweenAlpha('sctB', 'timeBar', 0, 1, 'sineInOut')

doTweenAlpha('introG', 'intro', 1, 5, 'sineInOut')
end


-- flying code
if curStep > 1055 then
   setProperty('camHUD.angle',0.3 *math.sin(getSongPosition()/550) * math.pi)
--   setProperty('camHUD.y',3 *math.sin(getSongPosition()/350))
   setProperty('camHUD.x',3 *math.sin(getSongPosition()/220))
	
  eT = eT + e
  setProperty('dadGroup.x', getProperty 'dadGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
  setProperty('dadGroup.y', getProperty 'dadGroup.y' + math.cos((eT * speed.y) + offset.y) * reach.y)
    setProperty('dar.x', getProperty 'dar.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
  setProperty('dar.y', getProperty 'dar.y' + math.cos((eT * speed.y) + offset.y) * reach.y)

  

setProperty('boyfriendGroup.x', getProperty 'boyfriendGroup.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * bfreach.x)
  setProperty('boyfriendGroup.y', getProperty 'boyfriendGroup.y' + math.cos((eT * bfspeed.y) + bfoffset.y) * bfreach.y)
  setProperty('gum.x', getProperty 'gum.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * bfreach.x)
  setProperty('gum.y', getProperty 'gum.y' + math.cos((eT * bfspeed.y) + bfoffset.y) * bfreach.y)

  
end
  -- flying code


setShaderFloat("sl", "iTime", os.clock())
end

function onTweenCompleted(tag)

		if tag == 'bfbro' then
doTweenAngle('bfbro2','boyfriendGroup',0,20,'sineInOut')
	end
	
			if tag == 'bfbro2' then
doTweenAngle('bfbro','boyfriendGroup',360,20,'sineInOut')
	end
	
			if tag == 'glbro' then
doTweenAngle('glbro2','dadGroup',0,20,'sineInOut')
	end
	
			if tag == 'glbro2' then
doTweenAngle('glbro','dadGroup',-360,20,'sineInOut')
	end
	
	
			if tag == 'gumbro' then
doTweenAngle('gumbro2','gum',0,20,'sineInOut')
	end
	
			if tag == 'gumbro2' then
doTweenAngle('gumbro','gum',360,20,'sineInOut')
	end
	
			if tag == 'darbro' then
doTweenAngle('darbro2','dar',0,20,'sineInOut')
	end
	
			if tag == 'darbro2' then
doTweenAngle('darbro','dar',-360,20,'sineInOut')
	end
	
	
	
		if tag == 'scrollrocks' then
	setProperty('r1.y', 2055)
	local luckyRoll = math.random(1, 2)
    local luckyRoll2 = math.random(1, 2)
    
        if (luckyRoll >= 1) then
            setProperty('cs.flipX', true)
			runTimer('rocksstop', 1, 1)
        end
        if (luckyRoll2 >= 2) then
             setProperty('cs.flipX', false)
			 doTweenY('scrollrocks','r1',-1800,1.055,'sineInOut')
			
        end
	end
	
	if tag == 'scrollrocks2' then
	setProperty('r2.y', 2055)
	local luckyRoll = math.random(1, 2)
    local luckyRoll2 = math.random(1, 2)
        if (luckyRoll >= 1) then
            setProperty('cs2.flipX', true)
			runTimer('rocksstop2', 1, 1)
        end
        if (luckyRoll2 >= 2) then
             setProperty('cs2.flipX', false)
		doTweenY('scrollrocks2','r2',-1800,1.055,'sineInOut')	
        end
	end
	
	
end





function onTimerCompleted(tag, loops, loopsLeft)

if tag == 'rocksstop' then
doTweenY('scrollrocks','r1',-1800,1.055,'sineInOut')
end

if tag == 'rocksstop2' then
doTweenY('scrollrocks2','r2',-1800,1.055,'sineInOut')
end
end






