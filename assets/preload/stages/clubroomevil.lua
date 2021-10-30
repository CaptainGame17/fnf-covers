function onCreate()
	-- background shit
	makeLuaSprite('epiphanybg', 'epiphanybg', -250, -167);
	setScrollFactor('epiphanybg', 0.4, 0.6);
		scaleObject('epiphanybg', 2.3, 2.3);
	
	makeLuaSprite('epiphanyfg', 'epiphanyfg', -332, -77);
	setScrollFactor('epiphanyfg', 1.5, 1.5);
	scaleObject('epiphanyfg', 1, 1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('epiphany-sky', 'epiphany-sky', 0.1, 0.1);
		setScrollFactor('epiphany-sky', 0.9, 0.9);
		scaleObject('epiphany-sky', 1.65, 1.65);
	end

	addLuaSprite('epiphanybg', false);
	addLuaSprite('epiphanyfg', false);
	addLuaSprite('epiphany-sky', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end