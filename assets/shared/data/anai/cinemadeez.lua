function onCreate()
    makeLuaSprite('cinemadeez1')
    makeLuaSprite('cinemadeez2')
    makeGraphic('cinemadeez1',  1600, 150, '000000')
    makeGraphic('cinemadeez2', 1600, 150, '000000')
    addLuaSprite('cinemadeez1', true)
    addLuaSprite('cinemadeez2', true)
    setObjectCamera('cinemadeez1', 'hud')
    setObjectCamera('cinemadeez2', 'hud')
    setProperty('cinemadeez1.y', 925)
    setProperty('cinemadeez2.y', -350)
setObjectOrder('cinemadeez1', 1)
setObjectOrder('cinemadeez2', 0)
end

function onUpdate()

if curStep == 128 then
    doTweenY('cinemadeez1Y', 'cinemadeez1', 650, 5, 'circOut')
    doTweenY('cinemadeez2Y', 'cinemadeez2', -75, 5, 'circOut')
	
	end
end

function onSongStart()

end