function onCreate()
	-- background shit
	makeLuaSprite('whittyBack', 'whittyBack', -600, -300);
	setScrollFactor('whittyBack', 0.9, 0.9);
	
	makeLuaSprite('whittyFront', 'whittyFront', -650, 600);
	setScrollFactor('whittyFront', 0.9, 0.9);
	scaleObject('whittyFront', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('blank', 'blank', -125, -100);
		setScrollFactor('blank', 0.9, 0.9);
		scaleObject('blank', 1.1, 1.1);
		
		makeLuaSprite('blank', 'blank', 1225, -100);
		setScrollFactor('blank', 0.9, 0.9);
		scaleObject('blank', 1.1, 1.1);
		setProperty('blank.flipX', true); --mirror sprite horizontally

		makeLuaSprite('blank', 'blank', -500, -300);
		setScrollFactor('blank', 1.3, 1.3);
		scaleObject('blank', 0.9, 0.9);
	end

	addLuaSprite('whittyBack', false);
	addLuaSprite('whittyFront', false);
	addLuaSprite('blank', false);
	addLuaSprite('blank', false);
	addLuaSprite('blank', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end