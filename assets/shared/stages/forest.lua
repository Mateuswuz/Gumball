function setCamFilter(cam, shader, shader2)

    if shadersEnabled then
        initLuaShader(shader)
		
    if not luaSpriteExists('shaderImage') then
            makeLuaSprite('shaderImage')
            makeGraphic('shaderImage', screenWidth, screenHeight)
            setSpriteShader('shaderImage', shader)
    end
	
    runHaxeCode('game.'..cam..'.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);')
	
        if luaDebugMode then
            debugPrint('setCamFilter : Shader successfully added to the camera "'..cam..'"')
        end
		
end
end

function removeCamFilter(cam)
    if shadersEnabled then
	
        if luaSpriteExists('shaderImage') then
            removeLuaSprite('shaderImage')
        end
		
        runHaxeCode('game.'..cam..'.setFilters(null);')	
		
        if luaDebugMode then
            debugPrint('removeCamFilter : Shader successfully removed from the camera "'..cam..'"')
        end
		
    end
end
    
	
function onUpdatePost(elapsed)

    setShaderFloat("shaderImage", "iTime", os.clock())
end
    
function onCreate()

makeLuaSprite('cn', 'cnextra',1070, 600);
scaleObject('cn', 0.2, 0.2)
setObjectCamera('cn', 'camHUD')
addLuaSprite('cn', true)

	makeLuaSprite('intro', 'skyintro', -600, -1600)
		makeLuaSprite('f', 'forest', -650, 100)
scaleObject('intro', 2,2)
scaleObject('f', 1.1,1.1)
	addLuaSprite('intro', false);
	addLuaSprite('f', false);
	
	makeLuaSprite('m1', 'pussycatmemories/1', 1720, 550)
	makeLuaSprite('m2', 'pussycatmemories/2', 1810, 700)
	makeLuaSprite('m3', 'pussycatmemories/3', 1675, 200)
	makeLuaSprite('m4', 'pussycatmemories/4', -1750, 500)
	makeLuaSprite('m5', 'pussycatmemories/5', -1640, 600)
	makeLuaSprite('m6', 'pussycatmemories/6', -1855, 550)
	
		addLuaSprite('m1', true);
		addLuaSprite('m2', true);
		addLuaSprite('m3', true);
		addLuaSprite('m4', true);
		addLuaSprite('m5', true);
		addLuaSprite('m6', true);
	
	setProperty('m1.alpha',0.3)
	setProperty('m2.alpha',0.3)
	setProperty('m3.alpha',0.3)
	setProperty('m4.alpha',0.3)
	setProperty('m5.alpha',0.3)
	setProperty('m6.alpha',0.3)
	
			makeLuaSprite('pi', 'pussintro', -10, 0)
	setObjectCamera('pi', 'other')
	addLuaSprite('pi', true);
	setProperty('pi.visible', false)
	
	
makeLuaSprite('ov', 'gumballoverlay', 0, 0)
setObjectCamera('ov', 'other')
setProperty('ov.alpha',0.8)
addLuaSprite('ov', true);

addCharacterToList('pussycat-exe', 'dad')
addCharacterToList('pussycat-exe2', 'dad')
addCharacterToList('pussycat-exe3', 'dad')

	makeLuaSprite('vig', 'vignette', 0, 0)
	setObjectCamera('vig', 'other')
	addLuaSprite('vig', true);
	setProperty('vig.alpha', 0)
	
	
	makeAnimatedLuaSprite('pvl', 'iampussy', -2160,-960)
	addAnimationByPrefix('pvl', 'talk', 'iampussycat', 24, true)
	scaleObject('pvl', 3.3, 3.3)
	setObjectCamera('pvl', 'camHUD')
addLuaSprite('pvl', true);
setProperty('pvl.visible', false)
	
makeLuaSprite('end', 'shitdude', 0, 0)
setObjectCamera('end', 'camHUD')
	
	
	addHaxeLibrary('Std')
    runHaxeCode([[
        game.initLuaShader('chromabber');

        chroma = game.createRuntimeShader('chromabber');

        game.camGame.setFilters([new ShaderFilter(chroma)]);

        chroma.setFloat('amount',-0);
        setVar('lastChromAmount',-0);       
    ]])
end


function onBeatHit()

local chromFreq = 0.3
local chromAmount = 0.3
local ogchromFreq = 0.2
local ogchromAmount = 0.2

if curStep > 1056 then
if curBeat % 2 == 0 then
		runHaxeCode([[
			var guhTween:FlxTween;

			if (guhTween != null) guhTween.cancel();
			guhTween = FlxTween.num(getVar('lastChromAmount'), ]]..chromAmount..[[, ]]..chromFreq..[[, {ease: FlxEase.sineOut}, function(num) { chroma.setFloat('amount',num); setVar('lastChromAmount',num); });
		]])
end

if curBeat % 2 == 1 then
		runHaxeCode([[
			var guhTween:FlxTween;

			if (guhTween != null) guhTween.cancel();
			guhTween = FlxTween.num(getVar('lastChromAmount'), ]]..ogchromAmount..[[, ]]..ogchromFreq..[[, {ease: FlxEase.sineOut}, function(num) { chroma.setFloat('amount',num); setVar('lastChromAmount',num); });
		]])
end
end

end

function onCreatePost()
initLuaShader("scroll")
setSpriteShader('end', 'scroll');
setShaderFloat('end', 'ySpeed', 1)
setShaderFloat('end', 'xSpeed',0)

setProperty('camGame.alpha', 0)
setProperty('gf.alpha', 0)
setProperty('camHUD.alpha', 0)
setProperty('healthBar.alpha', 0)
setProperty('iconP1.alpha', 0)
setProperty('iconP2.alpha', 0)

makeAnimatedLuaSprite('cooldad', getProperty('dad.imageFile'), getProperty('dad.x') - 130, getProperty('dad.y') - 380)




setProperty('cooldad.scale.x', getProperty('dad.scale.x') + 0.5)
setProperty('cooldad.scale.y', getProperty('dad.scale.y') + 0.5)
setObjectCamera('cooldad', 'other')
setProperty('cooldad.alpha', 0)
addLuaSprite('cooldad', true)

makeAnimatedLuaSprite('coolbf', getProperty('boyfriend.imageFile'), getProperty('boyfriend.x') + 500, getProperty('boyfriend.y') - 380)



setProperty('coolbf.scale.x', getProperty('boyfriend.scale.x') + 0.5)
setProperty('coolbf.scale.y', getProperty('boyfriend.scale.y') + 0.5)
setObjectCamera('coolbf', 'other')
setProperty('coolbf.alpha', 0)
addLuaSprite('coolbf', true)
end

function onUpdate()
				setShaderFloat("end", "iTime", os.clock())
				
setProperty('gf.visible', false)

setProperty('cooldad.animation.frameName', getProperty('dad.animation.frameName'))
setProperty('coolbf.animation.frameName', getProperty('boyfriend.animation.frameName'))
setProperty('coolbf.offset.x', getProperty('boyfriend.offset.x'))
setProperty('coolbf.offset.y', getProperty('boyfriend.offset.y'))
setProperty('cooldad.offset.x', getProperty('dad.offset.x'))
setProperty('cooldad.offset.y', getProperty('dad.offset.y'))
if curStep == 32 then
doTweenAlpha('bruh', 'camHUD', 1, 5, 'sineInOut')
setProperty('camGame.alpha', 1)

doTweenAlpha('ca', 'cooldad', 0.3, 15, 'sineInOut')

doTweenX('gubma', 'cooldad', 300, 35, 'sineInOut')

setProperty('pi.visible', true)
doTweenAlpha('pii', 'pi', 0, 5, 'sineInOut')
end

if curStep == 160 then
doTweenAlpha('ca2', 'coolbf', 0.5, 15, 'sineInOut')
doTweenX('bfbf', 'coolbf', 300, 25, 'sineInOut')
removeLuaSprite('pi', true)
end

if curStep == 288 then
cancelTween('bfbf')
cancelTween('gubma')
cancelTween('ca2')
cancelTween('ca')
doTweenAlpha('cagc', 'coolbf', 0, 0.6, 'sineInOut')
doTweenAlpha('cag', 'cooldad', 0, 0.6, 'sineInOut')






end

if curStep == 544 then
        setSpriteShader('iconP2', 'glitch');
    --adds notes shaders 
        setSpriteShader('opponentStrums.members[0]', 'glitch')
        setSpriteShader('opponentStrums.members[1]', 'glitch')
        setSpriteShader('opponentStrums.members[2]', 'glitch')
        setSpriteShader('opponentStrums.members[3]', 'glitch')
setProperty('healthBar.alpha', 1)
setProperty('iconP1.alpha', 1)
setProperty('iconP2.alpha', 1)

doTweenAlpha('vigneteAlpga', 'vig', 0.4, 1, 'sineInOut')
end

if curStep == 800 then


doTweenAlpha('fr', 'f', 0.1, 5, 'sineInOut')
end

if curStep == 1056 then


doTweenAlpha('fr', 'f', 1, 3, 'sineInOut')
doTweenAlpha('vigneteAlpga2', 'vig', 0.7, 3, 'sineInOut')
end

if curStep == 1316 then


doTweenAlpha('fr', 'f', 0.4, 0.7, 'sineInOut')
doTweenAlpha('vigneteAlpga2', 'vig', 1, 0.7, 'sineInOut')
end

if curStep == 1344 then
doTweenX('a', 'm1', -1720, 15, 'sineInOut')
end

if curStep == 1376 then
doTweenX('e', 'm5', 1640, 10, 'sineInOut')
end

if curStep == 1404 then
doTweenX('c', 'm3', -1675, 15, 'sineInOut')
end

if curStep == 1411 then
doTweenX('d', 'm4', 1750, 20, 'sineInOut')
end

if curStep == 1459 then
doTweenX('b', 'm2', -1810, 15, 'sineInOut')
end

if curStep == 1500 then
doTweenX('f', 'm6', 1855, 10, 'sineInOut')
end

if curStep == 1792 then
setProperty('m1.visible', false)
setProperty('m2.visible', false)
setProperty('m3.visible', false)
setProperty('m4.visible', false)
setProperty('m5.visible', false)
setProperty('m6.visible', false)
end

if curStep == 1824 then


noteTweenAlpha('1N', 0, 0, 3, 'smootherStepOut')
noteTweenAlpha('2N', 1, 0, 3, 'smootherStepOut')
noteTweenAlpha('3N', 2, 0, 3, 'smootherStepOut')
noteTweenAlpha('4N', 3, 0, 3, 'smootherStepOut')
noteTweenAlpha('5N', 4, 0, 3, 'smootherStepOut')
noteTweenAlpha('6N', 5, 0, 3, 'smootherStepOut')
noteTweenAlpha('7N', 6, 0, 3, 'smootherStepOut')
noteTweenAlpha('8N', 7, 0, 3, 'smootherStepOut')


doTweenAlpha('H', 'healthBar', 0, 3, 'sineInOut')
doTweenAlpha('HB', 'healthBarBG', 0, 3, 'sineInOut')

doTweenAlpha('ic', 'iconP1', 0, 3, 'sineInOut')
doTweenAlpha('icp2', 'iconP2', 0, 3, 'sineInOut')
doTweenAlpha('sct', 'scoreTxt', 0, 3, 'sineInOut')
doTweenAlpha('scti', 'timeTxt', 0, 3, 'sineInOut')
doTweenAlpha('sctB', 'timeBar', 0, 3, 'sineInOut')

doTweenAlpha('bruhc', 'camGame', 0, 3, 'sineInOut')
setProperty('dadGroup.visible', false)
end

if curStep == 1856 then
	setProperty('pvl.visible', true)
	objectPlayAnimation('pvl', 'talk', true)
	
	setCamFilter('camHUD', 'vcr')

end



if curStep == 2080 then
noteTweenAlpha('1N', 0, 1, 2, 'smootherStepOut')
noteTweenAlpha('2N', 1, 1, 2, 'smootherStepOut')
noteTweenAlpha('3N', 2, 1, 2, 'smootherStepOut')
noteTweenAlpha('4N', 3, 1, 2, 'smootherStepOut')
noteTweenAlpha('5N', 4, 1, 2, 'smootherStepOut')
noteTweenAlpha('6N', 5, 1, 2, 'smootherStepOut')
noteTweenAlpha('7N', 6, 1, 2, 'smootherStepOut')
noteTweenAlpha('8N', 7, 1, 2, 'smootherStepOut')

doTweenAlpha('peeveedidk', 'pvl', 0.1, 2, 'sineInOut')

end

if curStep == 2096 then

doTweenAlpha('bruhc', 'camGame', 1, 2, 'sineInOut')


doTweenAlpha('H', 'healthBar', 1, 3, 'sineInOut')
doTweenAlpha('HB', 'healthBarBG', 1, 3, 'sineInOut')
doTweenAlpha('ic', 'iconP1', 1, 3, 'sineInOut')
doTweenAlpha('icp2', 'iconP2', 1, 3, 'sineInOut')
doTweenAlpha('scti', 'timeTxt', 1, 3, 'sineInOut')
doTweenAlpha('sctB', 'timeBar', 1, 3, 'sineInOut')
doTweenAlpha('sct', 'scoreTxt', 1, 3, 'sineInOut')
end

if curStep == 2112 then



	removeLuaSprite('pvl', true)

	setProperty('dadGroup.visible', true)
	removeCamFilter('camHUD', 'vcr')

end

if curStep == 2368 then


	setCamFilter('camHUD', 'glitch')
	setCamFilter('camGame', 'glitch')

end

if curStep == 2374 then

setProperty('camGame.visible', false)
removeCamFilter('camHUD', 'glitch')



	
noteTweenAlpha('1N', 0, 0, 0.03, 'smootherStepOut')
noteTweenAlpha('2N', 1, 0, 0.03, 'smootherStepOut')
noteTweenAlpha('3N', 2, 0, 0.03, 'smootherStepOut')
noteTweenAlpha('4N', 3, 0, 0.03, 'smootherStepOut')
noteTweenAlpha('5N', 4, 0, 0.03, 'smootherStepOut')
noteTweenAlpha('6N', 5, 0, 0.03, 'smootherStepOut')
noteTweenAlpha('7N', 6, 0, 0.03, 'smootherStepOut')
noteTweenAlpha('8N', 7, 0, 0.03, 'smootherStepOut')


doTweenAlpha('H', 'healthBar', 0, 0.03, 'sineInOut')
doTweenAlpha('HB', 'healthBarBG', 0, 0.03, 'sineInOut')

doTweenAlpha('ic', 'iconP1', 0, 0.03, 'sineInOut')
doTweenAlpha('icp2', 'iconP2', 0, 0.03, 'sineInOut')
doTweenAlpha('sct', 'scoreTxt', 0, 0.03, 'sineInOut')
doTweenAlpha('scti', 'timeTxt', 0, 0.03, 'sineInOut')
doTweenAlpha('sctB', 'timeBar', 0, 0.03, 'sineInOut')


end

if curStep == 2376 then


setCamFilter('camHUD', 'vcr')
addLuaSprite('end', true);
	



end

end



