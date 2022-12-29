local bloodlost = 11
function onCreate()
	runTimer('blood',2,1)

	makeLuaText('subtitles','',500,screenWidth*0.3,screenHeight*0.8)
	addLuaText('subtitles')
	setTextAlignment('subtitles','center')
	setTextSize('subtitles',50)
	setScrollFactor('subtitles',0,0)
	setObjectCamera('subtitles','camOther')
	setTextColor('subtitles','fc0303')

	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bloodloss' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'note assets/bloodNote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'note assets/blood')
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.0475'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'bloodloss' then
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'bloodloss' then
		bloodlost = bloodlost - 1
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'blood' then
		bloodlost = bloodlost + 1
		runTimer('blood',2,1)
	end
end
function onUpdate(elapsed)
	setTextString('subtitles','blood:'.. bloodlost)
	if bloodlost > 11 then
		bloodlost = 11
	end
	if bloodlost < 1 then
		setProperty('health',-1)
	end
end