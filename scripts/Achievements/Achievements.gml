global.achievements = [

];
#macro Achievements global.achievements

/**
 * Function Description
 * @param {Real} _id Achievement id
 * @param {String} _internalName Internal name for Lexicon
 * @param {Asset.GMSprite} _thumbnail
 * @param {Asset.GMSprite} _reward Reward sprite
 * @param {Real} _amount Reward amount
 */
function Achievement(_id, _internalName, _thumbnail, _reward, _amount = 0) constructor
{
    id = _id;
    name = _internalName;
    thumbnail = _thumbnail;
	reward = _reward;
	amount = _amount;
	unlocked = false;
}

enum AchievementIds {
	FirstWin,
	FuburaIsComing,
	BBBRRRRRREEEEEEEEE,
	TearsOfHappiness,
	YouHaveBeenCursed,
	ThousandMileStare,
	Length
}
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.FirstWin, "First Win", sAchFirstWin, sHolocoin, 500);
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.FuburaIsComing, "Fubura is coming", sAchFubura, sFanBeamThumb);
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.BBBRRRRRREEEEEEEEE, "BBBRRRRRREEEEEEEEE", sAchFirstBoss, sGorillaPaw);
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.TearsOfHappiness, "Tears of Happiness...?", sAchTears, sCeoTearsThumb);
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.YouHaveBeenCursed, "You have been Cursed", sAchCursed, sENCurseThumb);
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.ThousandMileStare, "Thousand Mile Stare", sAchStare, sHolocoin, 10000);
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.ThousandMileStare, "Thousand Mile Stare", sAchStare, sHolocoin, 10000);
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.ThousandMileStare, "Thousand Mile Stare", sAchStare, sHolocoin, 10000);
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.ThousandMileStare, "Thousand Mile Stare", sAchStare, sHolocoin, 10000);
Achievements[array_length(Achievements)] = new Achievement(AchievementIds.ThousandMileStare, "Thousand Mile Stare", sAchStare, sHolocoin, 10000);

//show_message(achievements[0]);
//achievements[array_length(achievements)] = new Achievement(AchievementIds., "", , );