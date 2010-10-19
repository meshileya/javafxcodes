package tabbedpanes;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.input.MouseEvent;

/**  * @author Rakesh Menon  */

var dialog1 = Window {
x: 20
y: 30
title: "Dialog - ONE"
content: [
    Rectangle {
    x: 20
    y: 20
    width: 90
    height: 90
    fill: Color.RED }
    ]
    visible: true;
    temp: 1;
}

var dialog2:Window = Window {
x: 20
y: 30
title: "Dialog - TWO"
content: [
    Rectangle {
    x: 20
    y: 20
    width: 90
    height: 90
    fill: Color.BLACK }
    ]
    visible: true;
    temp: 2;
    onMousePressed: function(e: MouseEvent) {
        println("Done");
    }

}

Stage { title: "JavaFX Window" scene: Scene { content: [dialog1, dialog2] } }
