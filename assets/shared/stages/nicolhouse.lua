local xx = 500; 
local yy = 560; 

local xx2 = 500; 
local yy2 = 560; 

local xx3 = 520;
local yy3 = 450;

local ofs = 25;
local followchars = true; 
local del = 0;
local del2 = 0;
--[[
	"boyfriend": [720, 200],
	"girlfriend": [0, 19],
	"opponent": [-290, 300],
]]



function onEvent(n,v1,v2)

	if n == 'NicolEvents' then


if v1 == '1' then

xx = 270; 
yy = 530; 

xx2 = 630; 
yy2 = 600; 



end

if v1 == '2' then
			doTweenY('ytup','furn',-360,0.6,'sineInOut')
	
   doTweenAngle('rightangle','furn',2,2.5,'sineInOut')
				
				
end

if v1 == '3' then

setShaderFloat('furn', 'xSpeed',-0.8)
setProperty('s.visible', true)
setProperty('sve.visible',true)
end


if v1 == '4' then

setShaderFloat('furn', 'xSpeed',0)
setProperty('s.visible', false)
setProperty('sve.visible',false)
end

	end

end

function onCreate()

makeLuaSprite('cn', 'cnlogonew',1070, 600);
scaleObject('cn', 0.2, 0.2)
setObjectCamera('cn', 'camHUD')
addLuaSprite('cn', true)

	makeLuaSprite('sve', 'speedV', -600, -300)
	setProperty('sve.scale.y',0.9)
	addLuaSprite('sve', true);
	setProperty('sve.visible',true)
	
	makeLuaSprite('bg1', 'kitchen', -500, -150)
	scaleObject('bg1', 0.55,0.55)

	makeLuaSprite('bg', 'gumballbgnofurn', -600, -300)
	makeLuaSprite('furn', 'furn', -600, -300)
	
	makeLuaSprite('ov', 'gumballoverlay', 0, 0)
	
	makeLuaSprite('s', 'nicolesoul', -600, -300)
	
makeLuaSprite('i', 'themom', 0, 0)

setObjectCamera('ov', 'other')
setObjectCamera('i', 'other')
setProperty('ov.alpha',0.5)
addLuaSprite('bg1', false);
	addLuaSprite('bg', false);
	addLuaSprite('s', false);
	addLuaSprite('furn', false);
	

	
		addLuaSprite('i', true);
	setProperty('i.alpha',0)
		setProperty('bg1.visible', false)
	setProperty('bg.visible', false)
	setProperty('furn.visible', false)
	setProperty('s.visible', false)
	
	initLuaShader("dropShadow")
	


end



function onCreatePost()
setProperty('gf.scale.x',0.8)
setProperty('gf.scale.y',0.8)
setProperty('gf.alpha',0)

setProperty('camGame.alpha',0)

addCharacterToList('bf-car', 'boyfriend')
addCharacterToList('nicol-mad', 'dad')


initLuaShader("scroll")
setSpriteShader('furn', 'scroll');
setShaderFloat('furn', 'xSpeed',0)
setShaderFloat('furn', 'ySpeed',0)

setSpriteShader('s', 'scroll');
setShaderFloat('s', 'xSpeed',-5)
setShaderFloat('s', 'ySpeed',0)

setSpriteShader('sve', 'scroll');
setShaderFloat('sve', 'xSpeed',6)
setShaderFloat('sve', 'ySpeed',0)






setProperty('s.visible', false)
setProperty('sve.visible',false)
end


function onTweenCompleted(tag)

	
	 if tag == 'rightangle' then
      doTweenAngle('leftangle','furn',-2,2.5,'sineInOut')
   end
   if tag == 'leftangle' then
      doTweenAngle('rightangle','furn',2,2.5,'sineInOut')
   end
   
   	 if tag == 'ytup' then
      doTweenY('ytup2','furn',-400,1.5,'sineInOut')
   end
   if tag == 'ytup2' then
      doTweenY('ytup','furn',-360,1.5,'sineInOut')
   end

end


function onUpdate()
setShaderFloat("furn", "iTime", os.clock())
setShaderFloat("s", "iTime", os.clock())
setShaderFloat("sve", "iTime", os.clock())

if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then -- Code for the camera to follow the poses of your opponent
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if gfSection == true then -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then -- Credits to Serebeat and company for their Slaybells mod,
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)              -- That's where I got the gf code from.
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
				end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            end
        else
                 -- Code for the camera to follow the poses of boyfriend
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- Self explanatory
    end
	
end