function onEvent(name, value1, value2)
	if name == 'ghosts' then
		if value1 == 'true' then
			playSound('light')
			runTimer('dark1',0.1,1)
		end
		if value1 == 'false' then
			playSound('light')
			runTimer('light1',0.1,1)
		end
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'dark1' then
		setProperty('apartmentInterior.visible',false)
		setProperty('lights_off.visible',true)
		runTimer('dark2',0.1,1)
	end
	if tag == 'light1' then
		setProperty('apartmentInterior.visible',true)
		setProperty('lights_off.visible',false)
		runTimer('light2',0.1,1)
	end
	if tag == 'dark2' then
		setProperty('apartmentInterior.visible',true)
		setProperty('lights_off.visible',false)
		runTimer('dark3',0.1,1)
	end
	if tag == 'light2' then
		setProperty('apartmentInterior.visible',false)
		setProperty('lights_off.visible',true)
		runTimer('light3',0.1,1)
	end
	if tag == 'dark3' then
		setProperty('apartmentInterior.visible',false)
		setProperty('lights_off.visible',true)
		runTimer('dark4',0.1,1)
	end
	if tag == 'light3' then
		setProperty('apartmentInterior.visible',true)
		setProperty('lights_off.visible',false)
		runTimer('light4',0.1,1)
	end
	if tag == 'dark4' then
		setProperty('apartmentInterior.visible',true)
		setProperty('lights_off.visible',false)
		runTimer('dark5',0.1,1)
	end
	if tag == 'light4' then
		setProperty('apartmentInterior.visible',false)
		setProperty('lights_off.visible',true)
		runTimer('light5',0.1,1)
	end
	if tag == 'dark5' then
		setProperty('apartmentInterior.visible',false)
		setProperty('lights_off.visible',true)
		setProperty('ghosts.visible',true)
		setProperty('dadGroup.visible',true)
		doTweenColor('create shadow','boyfriend','2e1542',0.00000001,'quadInOut')
	end
	if tag == 'light5' then
		setProperty('apartmentInterior.visible',true)
		setProperty('lights_off.visible',false)
		setProperty('ghosts.visible',false)
		setProperty('dadGroup.visible',false)
		doTweenColor('create shadow','boyfriend','ffffff',0.00000001,'quadInOut')
	end
end