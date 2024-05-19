Thank you for purchasing this asset!
You'll find some installation and general information here!

IF YOU HAVE AN ISSUE READ THE FAQ FIRST, chances are your issue is probably there!
It's at the bottom of this readme

This Asset uses :

- 50 Parameters
- 457 Particle Systems
- 46265 Max Particles
- 61 Audio Sources
- 23 Mesh Renderers

=======================================

INSTALLATION :

1 : Make sure you have Poiyomi and VRCFury installed in this project : 
- https://github.com/poiyomi/PoiyomiToonShader/releases/tag/V8.1.167
- https://vrcfury.com/download

2 : Drag and drop the "Magic Circle System" prefab UNDER your avatar root (The object which have the VRC Avatar Descriptor)

3 : DO NOT UNPACK THE PREFAB

4 : Resize the "Magic Circle System" object, AND ONLY THAT OBJECT, so that the "Height Reference" object matches your avatar height

5 : Next, you will need to move some objects in order to make the Magic System fit you avatar, if your avatar is in a A-pose you also may have to rotate some objects!
- Under the object "Spells" Right Hand/Left Hand should be located in the palm of your hand
- Under the object "Pens" Right Hand/Left Hand should be located in front of the tip of your index fingers
- Under the object "Hands Magic Effects" Left/Right should be located in the middle of your forearms (the part of the arm between your elbow and writst), you can also move the "Arm" and "Hand" objects inside so that the graphics fits your avatar better

6 : You're done!

=======================================

CONTROLS : 

Summon Circle : 		Rock and Roll gesture on either hands
Summon Drawing Pen :		Point gesture on either hands
Summon Spell Book :		Victory (Peace Sign) gesture on either hand while Circle is active, release to open, use the other hand to switch position
Spray type :			Open hand to activate
Charge Type :			Hold Fist gesture for at least 3 seconds then release to fire
Weapon Type :			Fist gesture to summon weapon
Reset Spell :			Draw a Horizontal line Glyph, Top left > Top right

The Glyphs and spells Logic are documented in the spell book

=======================================

FAQ :

Q : The circle doesn't show when I do the Rock and Roll Gesture, but the sounds still plays...?
A : Make sure that you don't have the particle limiter option ON, and if it was, change world so that the initial circle particles can appear!

Q : Sometimes some sounds don't play at all, can you fix?
A : No, this is due to VRChat limitations, you can't have more than 3 sounds active at once on an avatar, fixing it would mean getting rid of some sounds entirely, which I think is worse than having to deal with some sounds sometimes not playing

Q : Sometimes when drawing on a first dot, a line appear from the center
A : This is a known issue that I wasn't able to fix not matter what, I'll upload a fix if I ever figure out how to fix it

Q : The circle does not appear not matter what I do?
A : Make sure your gestures are working, for that go to your settings > User Interface > HUD > Show Gesture Icons, if you're able to make the Rock and Roll gesture with either hands and the circle still not appear, please make a post on the Discord server : raideus.fyi/discord

Q : The height reference or/and the preview for the magic hands object is still there in-game and very annoying!
A : You can manually delete it then, the Height Reference object is under Magic Circle System, and the preview for the hands are located under "Hand Magic Effects > Left/Right > Arm/Hand > Preview"

Q : The charge spell doesn't show up in mirrors and/or cameras correctly, is this normal?
A : This is a known bug that VRChat is already fixing right now!

Q : When I rescale the Magic System the height reference also goes down, messing up the positions, can I change that?
A : Yes! At the top left of your scene, you have a button that should say "Center", click on it and select "Pivot" instead!


Q : I can make the circle appear but drawing on it doesn't seem to do anything...?
A : Make sure you have interactions ON in VRChat, the system uses contacts to be able to work! If the problem persist please make a post on the Discord server : raideus.fyi/discord

