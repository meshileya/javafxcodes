package tabbedpanes;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;

/**
* @author Shourien
*/

var dialog1 = Window {
title: "Tabbed-Pane1"
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
title: "Tabbed-Pane2"
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
}

var dialog3:Window = Window {
title: "Tabbed-Pane3"
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
}

var dialog4:Window = Window {
title: "Tabbed-Pane4"
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
}

Stage { 
    title: "JavaFX Window"
    scene: Scene {
        content: [dialog1,
                    dialog2,dialog3,dialog4]
    }
}
