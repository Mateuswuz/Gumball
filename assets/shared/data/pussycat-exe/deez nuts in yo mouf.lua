---------- DESCRIPTION

--[[
    Script by tposejank#8359

    This script allows you to shake stuff on the HUD

    What you can do:
        - Shake notes
        - Shake icons
]]

---------- SETTINGS

-- STRUMS
local maxMovePx = {2, 3}            -- max x and y movement values
local maxAngleMovePx = 3            -- max angle movement values

-- ICONS
local maxMovePxIcons = {1, 1}            -- max x and y movement values
local maxAngleMovePxIcons = 1            -- max angle movement values
local maxScaleMovePxIcons = {0.1, 0.1}   -- max scale movement values

--GENERAL
local shakeXY = true            -- shake in the X and Y axis?
local shakePlayer = false        -- shake the player's notes/icon
local shakeEnemy = false         -- shake the enemy's notes/icon
local shakeIcons = true         -- shake the icons
local updateEvery = 0.0001      -- time the shake takes to occur (in milliseconds)

--DO NOT MODIFY
local updateTime = 0
local iconXValues = {0, 0}
local defaultIconY = 0

-- by forgettablePyromaniac, use with credit. Deleting credits just ain't cool, bro. https://forgettablepyromaniac.neocities.org/

-- Everything below is fully customizable.
-- Should go lowest -> hightest, could be a bit fucky otherwise.
-- At minimum, should have a 100% and 0% percentage on the table, with at least one that doesn't require FC status.
-- default table entry for refrence: {name = "S", percentage = 0.95, requiresFC = false}

-- When checking the ratings table, it checks for the required FC one first, which allows you to have multiple ratings on the same %
-- Example:
-- (When FCing with the default table, and over 95 percent, it'll say "S+". If not FCing and over 95, it'll show just "S")

local ratingsTable = {
    {name = "Survival Rate", percentage = 0, requiresFC = false},
    {name = "Survival Rate", percentage = 0.6, requiresFC = false},
    {name = "Survival Rate", percentage = 0.69, requiresFC = false},
    {name = "Survival Rate", percentage = 0.7, requiresFC = false},
    {name = "Survival Rate", percentage = 0.8, requiresFC = false},
    {name = "Survival Rate", percentage = 0.9, requiresFC = false},
    {name = "Survival Rate", percentage = 0.95, requiresFC = false},
    {name = "Survival Rate", percentage = 0.95, requiresFC = true},
    {name = "Survival Rate", percentage = 1, requiresFC = true}
}

local scoreName = "Rituals" -- name for score. call it points, call it bingus-credits, idfk. String.
local missesName = "Sacrifices" -- name for misses. amount of times yo bitchass couldn't hit notes, basically. String.

local showFullComboStatus = true -- if you want ([FC]) to show up beside your new rating when hitting a full combo. Boolean.
local fcNames = { -- The Names of the FC statuses. They Should be in this specific order in order to avoid errors. If one is blank, it'll not show anything.
    "Legend", -- SFC
    "Veteran", -- GFC
    "Skillful", -- FC
    "Challenged", -- SDCB
    "Safe.." -- Clear
}

newRatingText = "Survival Rate" -- The inital custom rating before anything hits. Change if you wanna change that thing, I guess. String.
fullWomboCombo = "" -- Keep Blank unless you want something to show up before the FC Status does. String.
newRatingPercentage = "?" -- If you want a custom percentage before the song starts, edit that shit here. String, include % sign.

scoreTxtColour = "FF0000" -- Colour of the TextBar in Hexadecimal: RRGGBB (Red, Green, Blue). String.
newFont = "vcr.ttf" -- name of font file you want to use. Should be stored in the mod's fonts folder. try "comicsans.ttf", it comes included w/ the test mod.
allowBotStuff = true -- Changes BotText to the stuff above if set to true. Not sure why you'd want to, but just in case. Boolean.

possibleBotTexts = { -- chance should equal 100. chance is the percent chance to achive that string upon starting a song. Default: {string = "BOTPLAY", chance = 100}
    {string = "UNFAIR", chance = 100}
}

-- everything below is related to code. Don't touch shit unless you know what ur doing. -- 
-- everything below is related to code. Don't touch shit unless you know what ur doing. -- 
-- everything below is related to code. Don't touch shit unless you know what ur doing. -- 
-- everything below is related to code. Don't touch shit unless you know what ur doing. -- 
-- everything below is related to code. Don't touch shit unless you know what ur doing. -- 

-- im spamming it so that people dont fuck with the code ok

local defaultFCNames = { -- because I couldn't think of a better way to do this. DONT FUCKING EDIT THIS.
    "SFC",
    "GFC",
    "FC",
    "SDCB",
    "Clear"
}

local angleshit = 0.5;
local anglevar = 0.5;

function convertRatingToPercentage(intake)
    local tempIntake = intake * 100
    local output = string.format("%.1f", tempIntake)
    if string.sub(output, -2) == ".0" then
        return string.sub(output, 1, -3) .. "%"
    else
        return output .. "%"
    end
end

function createProperRatingNames(coolness)
    for i = #ratingsTable, 1, -1 do
        local makeItEasy = ratingsTable[i]
        if coolness >= makeItEasy.percentage then
            if misses <= 0 and makeItEasy.requiresFC then
                return makeItEasy.name
            elseif not makeItEasy.requiresFC then
                return makeItEasy.name
            end
        end
    end
end

function getRandomBotplayTxt() -- I have a headache.
    local totalChance = 0
    for w, erf in ipairs(possibleBotTexts) do
        totalChance = totalChance + erf.chance
    end
    local randomValue = math.random(0, 100)
    if totalChance ~= 100 then
        debugPrint("Total chance is not 100. Defaulting to BOTPLAY.")
        return "BOTPLAY"
    end
    local cumulativeChance = 0
    for w, erf in ipairs(possibleBotTexts) do
        cumulativeChance = cumulativeChance + erf.chance
        if randomValue <= cumulativeChance then
            return erf.string
        end
    end
end

function overwriteFCNames(defaultFCName) -- couldn't think of a better way to do this.
    local customName = nil
    if defaultFCName == "SFC" then
        customName = fcNames[1]
    elseif defaultFCName == "GFC" then
        customName = fcNames[2]
    elseif defaultFCName == "FC" then
        customName = fcNames[3]
    elseif defaultFCName == "SDCB" then
        customName = fcNames[4]
    elseif defaultFCName == "Clear" then
        customName = fcNames[5]
    else
        customName = "" -- how did you even achive this if ur following direction wtf
    end
    if customName ~= "" then
        return "["..customName.."]"
    else
        return customName
    end
    
end

--Script by Lazy Remix Man
function onCreatePost()
    initLuaShader("glitch 2")
    --icons shaders

		
		    setTextColor('scoreTxt', scoreTxtColour)
    setTextFont('scoreTxt', newFont)
    if allowBotStuff then
        setTextColor('botplayTxt', scoreTxtColour)
        setTextFont('botplayTxt', newFont)
    end
    math.randomseed(os.time()) -- for randomeness :3
    if #fcNames ~= 5 then
        debugPrint("Error: The fcNames table should contain exactly five entries.")
        fcNames = defaultFCNames
    end
    setTextString('botplayTxt', getRandomBotplayTxt())
end
--removed example script because it works without it
function onUpdate(elapsed)

if curStep == 544 then
shakeEnemy = true
end


    setShaderFloat("iconP2", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[0]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[1]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[2]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[3]", "iTime", os.clock())
	
	  if rating == 0 and misses == 0 then
        -- debugPrint('bro') -- intentionally left blank.
    else
        newRatingPercentage = convertRatingToPercentage(rating)
        newRatingText = createProperRatingNames(rating)
    end
    if showFullComboStatus then
        if rating > 0 then
            fullWomboCombo = overwriteFCNames(ratingFC)
        end
    end
    setTextString('scoreTxt', scoreName..': '..score..' | '..missesName..': '..misses..' | '..newRatingText..' - '..newRatingPercentage..' '..fullWomboCombo)
end


function onBeatHit()
--[[
    if curBeat > 136 and curBeat < 200 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camGame.angle',angleshit*2)
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.001, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*4, crochet*0.001, 'linear')
    end
	]]
end

function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 1 then
       setProperty('health', health- 0.01);
	end
end

function onUpdatePost(e)

    defaultIconY = getProperty('healthBar.y') - 75
    local iconOffset = 26
    
    iconXValues[1] = getProperty('healthBar.x') + (getProperty('healthBar.width') * (remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01)) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - iconOffset -- enemy position
    iconXValues[2] = getProperty('healthBar.x') + (getProperty('healthBar.width') * (remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01)) - (150 * getProperty('iconP2.scale.x')) / 2 - (iconOffset * 2) -- player position

    updateTime = updateTime + e

    if updateTime > updateEvery then
        updateTime = 0
        for i=0, 3 do
            if shakeEnemy then
                shakeStrum(i, false)
            end
            if shakePlayer then
                shakeStrum(i, true)
            end
        end
        if shakeIcons then
            if shakeEnemy then
                shakeIcon(false)
            end
            if shakePlayer then
                shakeIcon(true)
            end
        end
    end
end

function shakeStrum(strum, player)
    local ogV = {_G['defaultOpponentStrumX'..strum], _G['defaultOpponentStrumY'..strum]}
    if player then
        ogV = {_G['defaultPlayerStrumX'..strum], _G['defaultPlayerStrumY'..strum]}
    end
    local group = 'opponentStrums'
    if player then
        group = 'playerStrums'
    end

    setPropertyFromGroup(group, strum, 'x', ogV[1] + getRandomInt(-maxMovePx[1], maxMovePx[1]))
  --  setPropertyFromGroup(group, strum, 'y', ogV[2] + getRandomInt(-maxMovePx[2], maxMovePx[2]))
    setPropertyFromGroup(group, strum, 'angle', 1 + getRandomInt(-maxAngleMovePx, maxAngleMovePx))
end

function shakeIcon(player)
    local icon = 2
    if player then icon = 1 end

    setProperty('iconP'..icon..'.x', iconXValues[icon] + getRandomInt(-maxMovePxIcons[1], maxMovePxIcons[1]))
    setProperty('iconP'..icon..'.y', defaultIconY + getRandomInt(-maxMovePxIcons[2], maxMovePxIcons[2]))
    setProperty('iconP'..icon..'.angle', 0 + getRandomInt(-maxAngleMovePxIcons, maxAngleMovePxIcons))
    setProperty('iconP'..icon..'.scale.x', 1 + getRandomFloat(-maxScaleMovePxIcons[1], maxScaleMovePxIcons[1]))
    setProperty('iconP'..icon..'.scale.y', 1 + getRandomFloat(-maxScaleMovePxIcons[2], maxScaleMovePxIcons[2]))
end

function remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end