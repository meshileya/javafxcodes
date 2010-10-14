/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dockeffect;

import javafx.scene.Scene;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.animation.transition.ScaleTransition;
import javafx.scene.Node;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;
import javafx.animation.transition.TranslateTransition;

/**
 * @author shourien
 */
def percentage : Number [] = [20, 25,];

var scaleTransition : ScaleTransition = ScaleTransition {
    duration: .75s
}

var trans:TranslateTransition = TranslateTransition{
   duration:1s
}

function dockappear(dockpanel : Node) {
    trans.stop();
    trans.node = dockpanel;
    trans.fromY = -50;
    trans.toY = -10;
    trans.play();
}

function dockdisappear(dockpanel : Node) {
    trans.stop();
    trans.node = dockpanel;
    trans.fromY = -10;
    trans.toY = -50;
    trans.play();
}

function dockanimate(imagenode : Node) {
    scaleTransition.stop();
    scaleTransition.node = imagenode;
    scaleTransition.fromX = percentage[0]/100.0;
    scaleTransition.fromY = percentage[0]/100.0;
    scaleTransition.toX = percentage[1]/100.0;
    scaleTransition.toY = percentage[1]/100.0;
    scaleTransition.play();
    scaleTransition.fromX = percentage[1]/100.0;
    scaleTransition.fromY = percentage[1]/100.0;
    scaleTransition.toX = percentage[0]/100.0;
    scaleTransition.toY = percentage[0]/100.0;
    scaleTransition.play();
}

def BackgroundImage = ImageView {
    image: Image {url:"{__DIR__}Bliss.bmp"};
}

var Music:ImageView = ImageView {
    image: Image {url:"{__DIR__}Movies.png"};
    translateX:-700;
    translateY:-95;
    scaleX: .18;
    scaleY: .18;
    onMouseEntered: function(e: MouseEvent): Void {
        dockanimate(Music);
    }
    onMouseExited: function(e: MouseEvent): Void {
        scaleTransition.stop();
        Music.image = Image {url:"{__DIR__}Movies.png"};
        Music.scaleX = .18;
        Music.scaleY = .18;
    }

}

var Internet:ImageView = ImageView {
    image: Image {url:"{__DIR__}internet3.png"};
    translateX:-1000;
    translateY:-95;
    scaleX: .18;
    scaleY: .18;
    onMouseEntered: function(e: MouseEvent): Void {
        dockanimate(Internet);
    }
    onMouseExited: function(e: MouseEvent): Void {
        scaleTransition.stop();
        Internet.image = Image {url:"{__DIR__}internet3.png"};
        Internet.scaleX = .18;
        Internet.scaleY = .18;
    }
}

var Office:ImageView = ImageView {
    image: Image {url:"{__DIR__}Office.png"};
    translateX:-850;
    translateY:-95;
    scaleX: .18;
    scaleY: .18;
    onMouseEntered: function(e: MouseEvent): Void {
        dockanimate(Office);
    }
    onMouseExited: function(e: MouseEvent): Void {
        scaleTransition.stop();
        Office.image = Image {url:"{__DIR__}Office.png"};
        Office.scaleX = .18;
        Office.scaleY = .18;
    }
}

var dockbackground:ImageView = ImageView {
    translateX: -135
    scaleX: .5;
    scaleY: .75
    opacity: .4;
    image: Image {url:"{__DIR__}DockBackgroundSolid2.png"}
}


var hbox:HBox = HBox {
    translateY: -50
    content: [dockbackground,Music,Office,Internet];
    onMouseEntered: function(e: MouseEvent): Void {
        if(not trans.running)
            dockappear(hbox);
    }
    onMouseExited: function(e: MouseEvent): Void {
        if(not trans.running)
            dockdisappear(hbox);
    }
}

Stage {
    title: "Dock Effect";
    scene: Scene {
        width: 400
        height: 300
        content: [
            BackgroundImage,
            hbox,
        ]
    }
}