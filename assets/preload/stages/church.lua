function onCreate()
	-- background shit
	makeLuaSprite('bg', 'bg', -600, -300);
	setScrollFactor('bg', 0.9, 0.9);
	
	makeLuaSprite('floor', 'floor', -650, 600);
	setScrollFactor('floor', 0.9, 0.9);
	scaleObject('floor', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('blank', 'blank', -125, -100);
		setScrollFactor('blank', 0.9, 0.9);
		scaleObject('blank', 1.1, 1.1);
		
		makeLuaSprite('blank', 'blank', 1225, -100);
		setScrollFactor('blank', 0.9, 0.9);
		scaleObject('blank', 1.1, 1.1);
		setProperty('blank.flipX', true); --mirror sprite horizontally

		makeLuaSprite('pillars', 'pillars', -500, -300);
		setScrollFactor('pillars', 1.3, 1.3);
		scaleObject('pillars', 0.9, 0.9);
	end

	addLuaSprite('bg', false);
	addLuaSprite('floor', false);
	addLuaSprite('blank', false);
	addLuaSprite('blank', false);
	addLuaSprite('pillars', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end