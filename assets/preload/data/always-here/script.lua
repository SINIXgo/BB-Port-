function onCreate()
	precacheImage('characters/playablebb')
	addCharacterToList('playablebb-dead','boyfriend')
    setPropertyFromClass('GameOverSubstate', 'characterName', 'playablebb-dead'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --Put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end