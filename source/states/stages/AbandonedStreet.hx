package states.stages;

import states.stages.objects.*;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.group.FlxGroup.FlxTypedGroup;

class AbandonedStreet extends BaseStage
{
	// Base Assets
    var colorsOrSmthElse:FlxSprite;
    var floor:FlxSprite;
    var stageCurtains:FlxSprite;
    var stageFront:FlxSprite;

    var atmosphereParticle:FlxEmitter;
    var ashParticle:FlxEmitter;

    var tumbleWeed:FlxSprite;

    var fireThing:FlxSprite;

    var fireTweenHandler:FlxTween;

    var path:String = 'streetStage/';

	override function create()
	{
	
	colorsOrSmthElse = new FlxSprite(-990, 1600).loadGraphic(Paths.image(path + 'randomColors'));
	colorsOrSmthElse.setGraphicSize(Std.int(colorsOrSmthElse.width * 4));
	colorsOrSmthElse.updateHitbox();
	colorsOrSmthElse.antialiasing = true;
	colorsOrSmthElse.screenCenter();
	colorsOrSmthElse.scale.set(3, 3);
	colorsOrSmthElse.scrollFactor.set(0.9, 0.9);
	colorsOrSmthElse.active = false;
	add(colorsOrSmthElse);

	fireThing = new FlxSprite(0, -80);
	fireThing.scale.set(5.85, 3);
	fireThing.alpha = 0.0001;
	fireThing.frames = Paths.getSparrowAtlas(path + 'delusional-fire');
	fireThing.animation.addByPrefix('burning', 'delusional-fire fire-idle', 16, true);
	fireThing.scrollFactor.set(0.8, 0.8);
	add(fireThing);
	fireThing.animation.play('burning');
	
	floor = new FlxSprite(-20, 200).loadGraphic(Paths.image(path + 'street'));
	floor.antialiasing = true;
	floor.scale.set(2.5, 2.3);
	floor.scrollFactor.set(1, 1);
	floor.active = false;
	add(floor);	
	
			stageCurtains = new FlxSprite(0, 0).loadGraphic(Paths.image(path + 'i_forgor'));
			stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
			stageCurtains.updateHitbox();
			stageCurtains.screenCenter();
			stageCurtains.scale.set(1.3,1.3);
			stageCurtains.antialiasing = true;
			stageCurtains.cameras = [PlayState.instance.camOther];
			stageCurtains.scrollFactor.set(1.3, 1.3);
			add(stageCurtains);	
		}
	
	override function createPost()
	{
        atmosphereParticle = new FlxEmitter(-2080.5, 2000);
			atmosphereParticle.launchMode = SQUARE;
			atmosphereParticle.velocity.set(-50, -200, 50, -600, -90, 0, 90, -600);
			atmosphereParticle.scale.set(4, 4, 4, 4, 0, 0, 0, 0);
			atmosphereParticle.drag.set(0, 0, 0, 0, 5, 5, 10, 10);
			atmosphereParticle.width = 4787.45;
			atmosphereParticle.alpha.set(1, 0.3);
			atmosphereParticle.lifespan.set(1.9, 4.9);
			atmosphereParticle.loadParticles(Paths.image(path + 'dustParticle'), 500, 16, true);
			atmosphereParticle.start(false, FlxG.random.float(.0521, .1060), 1000000);
			add(atmosphereParticle);

		ashParticle = new FlxEmitter(-2080.5, 2150.4);
			for (i in 0 ... 100)
				{
					var blackParticle = new FlxParticle();
					blackParticle.frames = Paths.getSparrowAtlas(path + 'ashParticle');
					blackParticle.animation.addByPrefix('idle', 'ashParticle idle', 5, true);
					blackParticle.animation.play('idle');
					blackParticle.exists = false;
					blackParticle.animation.curAnim.curFrame = FlxG.random.int(0, 9);
					ashParticle.add(blackParticle);
				}
			ashParticle.launchMode = SQUARE;
			ashParticle.velocity.set(-50, -200, 50, -600, -90, 0, 90, -600);
			ashParticle.scale.set(4, 4, 4, 4, 0, 0, 0, 0);
			ashParticle.drag.set(0, 0, 0, 0, 5, 5, 10, 10);
			ashParticle.width = 4787.45;
			ashParticle.alpha.set(1, 1);
			ashParticle.lifespan.set(1.9, 4.9);
			ashParticle.start(false, FlxG.random.float(.0521, .1060), 1000000);
			ashParticle.angle.set(290, 0);
			ashParticle.launchAngle.set(210, 300);
		    add(ashParticle);

			stageFront = new FlxSprite(-3000, 130).loadGraphic(Paths.image(path + 'cables'));
			stageFront.scale.set(9, 2.1);
			stageFront.updateHitbox();
			stageFront.antialiasing = true;
			stageFront.scrollFactor.set(5, 2.6);
			stageFront.active = false;
			add(stageFront);
	}

	override function update(elapsed:Float)
	{
		// Code here
	}

    override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
        {
            switch(eventName)
            {
                case "Tween Fire Background":
                    if (fireTweenHandler != null)
                        fireTweenHandler.cancel();

                    fireTweenHandler = FlxTween.tween(fireThing, {alpha: flValue1}, flValue2, {ease: FlxEase.sineInOut, onComplete: function(twn:FlxTween)
                    {
                        fireTweenHandler = null;
                    }});

                case "Fast Tween Fire BG":
                    if (fireTweenHandler != null)
                        fireTweenHandler.cancel();

                    fireTweenHandler = FlxTween.tween(fireThing, {alpha: flValue1}, flValue2, {ease: FlxEase.sineOut, onComplete: function(twn:FlxTween)
                    {
                        fireTweenHandler = null;
                    }});
            }
        }

	// Steps, Beats and Sections:
	//    curStep, curDecStep
	//    curBeat, curDecBeat
	//    curSection
	override function stepHit()
	{
		// Code here
	}
	override function beatHit()
	{
            if (FlxG.random.bool(3))
            {
                summonWeedMakerLmfao();
            }
	}
	override function sectionHit()
	{
		// Code here
	}

	// Substates for pausing/resuming tweens and timers
	override function closeSubState()
	{
		if(paused)
		{
			//timer.active = true;
			//tween.active = true;
		}
	}

	override function openSubState(SubState:flixel.FlxSubState)
	{
		if(paused)
		{
			//timer.active = false;
			//tween.active = false;
		}
	}

    function summonWeedMakerLmfao()
        {
            if (FlxG.random.bool(1))
            {
                tumbleWeed = new FlxSprite(1800, 490).loadGraphic(Paths.image(path + 'THELEGENDARYTUMBLEWEED'));
                tumbleWeed.scale.set(0.6, 0.6);
                FlxTween.tween(tumbleWeed, {angle: -360}, 0.5, {type: LOOPING});
                add(tumbleWeed);
        
                FlxTween.tween(tumbleWeed, {y: 825}, 0.1, {ease: FlxEase.sineInOut, type: PINGPONG});
        
                FlxTween.tween(tumbleWeed, {x: -1200}, 2, {onComplete: function(twn:FlxTween)
                {
                    tumbleWeed.kill();
                }});
            }
            else
            {
                tumbleWeed = new FlxSprite(1800, 600).loadGraphic(Paths.image(path + 'Tumble_' + FlxG.random.int(0,1)));
                FlxTween.tween(tumbleWeed, {angle: -360}, 1.7, {type: LOOPING});
                add(tumbleWeed);
        
                FlxTween.tween(tumbleWeed, {y: 735}, 0.75, {ease: FlxEase.sineIn, type: PINGPONG});
        
                FlxTween.tween(tumbleWeed, {x: -1200}, 5.6, {onComplete: function(twn:FlxTween)
                {
                    tumbleWeed.kill();
                }});
            }
        }
}