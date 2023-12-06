package states;

typedef BitchlessDetector
{
    var bitchCounter:Int = 0;
    var canGetGF:Bool = false;
    var hasALife:Bool = false;
    var personName:String = "JustARandom";
    var isAbleToJoinSocietyToGetALife:Bool = true;
}

class BitchlessBoiDectector extends LifeChoices
{
    // we be doing just a smidget amount of trolling
    var detector:BitchlessDetector;

    if (detector.personName == 'JustARandom')
    {
        bitchCounter = 0;
        if (hasALife)
        {
            canGetGF = true;
            isAbleToJoinSocietyToGetALife = false;
        }
        else
        {
            canGetGF = false;
            isAbleToJoinSocietyToGetALife = true;
        }
    }
}