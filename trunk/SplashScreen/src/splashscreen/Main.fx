/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package splashscreen;

import javafx.stage.Stage;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import splashscreen.DummySceneLoad.DummyScene;
import java.lang.Thread;
import java.lang.InterruptedException;

/**
 * @author shourien
 */

function run (): Void {
    Stage {
        title: "Splash Screen Demo"
        scene: DummyScene;
        resizable: false;
    }
    new ShowWindow().setValues("Stage Set", 10);
    timelineexp.play();
    new SplashWindow().spawnThread();
}

function background() : Void {
    try{Thread.sleep(2000);} catch (ie : InterruptedException) {}
    new ShowWindow().setValues("Reading Database", 20);
    try{Thread.sleep(2000);} catch (ie : InterruptedException) {}
    new ShowWindow().setValues("Constructing Scene", 50);
    DummySceneLoad.constructDock();
    try{Thread.sleep(2000);} catch (ie : InterruptedException) {}
    new ShowWindow().setValues("Scene Loaded", 100);
    try{Thread.sleep(2000);} catch (ie : InterruptedException) {}
    ShowWindow.mutex = false;
    timelineexp.stop();
}

var timelineexp:Timeline = Timeline
{
    repeatCount: Timeline.INDEFINITE
    keyFrames: KeyFrame {
        time: 1s
        action: function(){
            background();
        }
    }
}
