package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = 1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
 
	private static var creditsStuff:Array<Dynamic> = [ //Name - Icon name - Description - Link - BG Color
		['Everyone Sings Team'],
		['Captain',		'captain',		'Cover Creator & Mod Maker',					'https://www.youtube.com/channel/UCStTKMMLms3GBxhJVsSsAWg',	0xFF8AB6D4],
		['Placed2nd',		'mfm',		'Recharts for Mid-Fight Masses',					'https://youtu.be/dR7bdwbgAy4',	0xFFF691C5],
		['SugarRatio',		'zardy',		'Reanimated Zardy',					'https://gamebanana.com/mods/183664',	0xFF2C253B],
		[''],
		['Original Mod Teams'],
		['A.G.O.T.I. Team',		'agoti',		'A.G.O.T.I.',					'https://gamebanana.com/mods/284934',	0xFFBA1E24],
		['Accelerant Kade Engine Port',		'accelerant',		'Ported Accelerant Hank to Kade Engine',					'https://gamebanana.com/mods/328054',	0xFFFF1500],
		['Ace Team',		'ace',		'Ace',					'https://gamebanana.com/mods/311759',	0xFFBAE2FF],
		['Arcade Showdown Team',		'kapi',		'Kapi & Mr. Game and Watch',					'https://gamebanana.com/mods/44683',	0xFF747585],
		['Arch Team',		'arch',		'Arch, BBpanzu',					'https://gamebanana.com/mods/319914',	0xFF009933],
		['Back Alley Blitz Team',		'whitty',		'Whitty & Updike',					'https://c.tenor.com/bDln6hWwCe0AAAAd/fnf-friday-night-funkin.gif',	0xFF1D1E35],
		['Bob and Bosip Team',		'bobandbosip',		'Bob, Bosip, Amor...',					'https://gamebanana.com/mods/297087',	0xFF3A68FF],
		['Carol Team',		'carol',		'Carol',					'https://gamebanana.com/mods/42811',	0xFF666699], // nice 2
		['Cheeky Team',		'cheeky',		'Cheeky',					'https://gamebanana.com/mods/297664',	0xFF3FBFF6],
		['Eteled Team',		'eteled',		'Eteled, Austin',					'https://gamebanana.com/mods/313084',	0xFF7D96C9],
		['FNF: ONLINE VS Team',		'accelerant',		'Hank',					'https://gamebanana.com/mods/286594',	0xFFFF1500], // accelerant is a fucking banger
		['Friday Night Fever Team',		'fridaynightfever',		'CesarFever, Taki, Tea...',					'https://gamebanana.com/mods/310465',	0xFFC353E3],
		['literally every fnf mod team ever',		'bobsonslaught',		'Bob, Ron, & Little Man',					'https://gamebanana.com/mods/285296',	0xFFFFFFFF],
		['Mid-Fight Masses Team',		'mfm',		'Sarvente, Ruv, Selever',					'https://c.tenor.com/3nt7d7VNQ9QAAAAd/sarv-sarvente.gif',	0xFFF691C5],
		['Nonsense Team',		'nonsense',		'Nonsense',					'https://gamebanana.com/mods/292607',	0xFF74E7FF],
		['Pinkie Team',		'pinkie',		'Pinkie Pie',					'https://drive.google.com/file/d/1TjLTgFItJ_-qSIvl0d3f4_wPiZaQBtev/view?usp=sharing',	0xFFFFFF99],
		['RetroSpecter Team',		'retro',		'RetroSpecter, Sakuroma',					'https://gamebanana.com/mods/317366',	0xFF17D8E4],
		['Shaggy Team',		'shaggy',		'Various Shaggys',					'https://gamejolt.com/games/fnf-shaggy/643999',	0xFF33724A],
		['Smoke \'Em Out Struggle Team',		'garcello',		'Garcello',					'https://gamebanana.com/mods/166531',	0xFF00FF90],
		['Sunday Team',		'sunday',		'Sunday',					'https://gamebanana.com/mods/300849',	0xFF669999], // nice
		['The Full-Ass Tricky Mod Team',		'tricky',		'Tricky',					'https://gamebanana.com/mods/44334',	0xFF185F40],
		['Zardy Team',		'zardy',		'Zardy, Cablecrow',					'https://gamebanana.com/mods/44366',	0xFF2C253B], // i tried sorting the credits alphabetically but according to notepad++, z comes before s. maybe i was taught wrong but last time i checked z is dead last in the alphabet
	 	['Sonic.EXE Team',		'sonicexe',		'Sonic.EXE, Majin Sonic, Sunky.MPEG',					'https://gamebanana.com/mods/316022',	0xFF0058B7],
	 	['Tabi Team',		'tabi',		'Tabi',					'https://gamebanana.com/mods/286388',	0xFFFFBB81],
	 	['Tord Team',		'tord',		'Tord',					'https://gamebanana.com/mods/44406',	0xFFCC3333],
	 //	['FNF: DustTale Remastered Team',		'dusttale',		'Murder!Sans, Phantom!Papyrus...',					'https://gamebanana.com/mods/287084',	0xFF999999],
	 //	['Friday Night Funkin\' D-Sides Team',		'dsides',		'Funky Remixes',					'https://gamebanana.com/mods/305122',	0xFFE455D8],
	 //	['HEARTBREAK: Vs Girlfriend Team',		'vsgirlfriend',		'Girlfriend',					'https://gamebanana.com/mods/46716',	0xFFA5004D],
	 //	['Impostor Team',		'impostor',		'A bunch of sussy bakas',					'https://gamebanana.com/mods/55652',	0xFFFF3333],
		[''],
		['Psych Engine Team'],
		['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',					'https://twitter.com/Shadow_Mario_',	0xFFFFDD33],
		['RiverOaken',			'riveroaken',		'Main Artist/Animator of Psych Engine',				'https://twitter.com/river_oaken',		0xFFC30085],
		[''],
		['Engine Contributors'],
		['shubs',				'shubs',			'New Input System Programmer',						'https://twitter.com/yoshubs',			0xFF4494E6],
		['PolybiusProxy',		'polybiusproxy',	'.MP4 Video Loader Extension',						'https://twitter.com/polybiusproxy',	0xFFE01F32],
		['gedehari',			'gedehari',			'Chart Editor\'s Sound Waveform base',				'https://twitter.com/gedehari',			0xFFFF9300],
		['Keoiki',				'keoiki',			'Note Splash Animations',							'https://twitter.com/Keoiki_',			0xFFFFFFFF],
		['SandPlanet',			'sandplanet',		'Mascot\'s Owner\nMain Supporter of the Engine',		'https://twitter.com/SandPlanetNG',		0xFFD10616],
		['bubba',				'bubba',		'Guest Composer for "Hot Dilf"',	'https://www.youtube.com/channel/UCxQTnLmv0OAS63yzk9pVfaw',	0xFF61536A],
		[''],
		["Funkin' Crew"],
		['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",				'https://twitter.com/ninja_muffin99',	0xFFF73838],
		['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",					'https://twitter.com/PhantomArcade3K',	0xFFFFBB1B],
		['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",					'https://twitter.com/evilsk8r',			0xFF53E52C],
		['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",					'https://twitter.com/kawaisprite',		0xFF6475F3]
	]; // they always ask what the game doin but never how the game doin

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = creditsStuff[curSelected][4];
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if(controls.ACCEPT) {
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int = creditsStuff[curSelected][4];
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
