package tabbedpanes;

import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;

/**
* @author Shourien
*/

var dialog1:TabbedWindow = TabbedWindow {
    title: "Tabbed-Pane1"
    content: []
    background: ImageView {
        image: Image {url:"{__DIR__}background.jpg"};
    }
    onMousePressed: function(e: MouseEvent): Void {
        if(not(e.primaryButtonDown or e.secondaryButtonDown))
            delete dialog1 from itemModifyScenes.content;
    }
}

var dialog2:TabbedWindow = TabbedWindow {
    title: "Tabbed-Pane2"
    content: []
    background: ImageView {
        image: Image {url:"{__DIR__}background1.jpg"};
    }
    onMousePressed: function(e: MouseEvent): Void {
        if(not(e.primaryButtonDown or e.secondaryButtonDown))
            delete dialog2 from itemModifyScenes.content;
    }
}

var dialog3:TabbedWindow = TabbedWindow {
    title: "Tabbed-Pane3"
    content: []
    background: ImageView {
        image: Image {url:"{__DIR__}background2.jpg"};
    }
    onMousePressed: function(e: MouseEvent): Void {
        if(not(e.primaryButtonDown or e.secondaryButtonDown))
            delete dialog3 from itemModifyScenes.content;
    }
}

var dialog4:TabbedWindow = TabbedWindow {
    title: "Tabbed-Pane4"
    content: []
    background: ImageView {
        image: Image {url:"{__DIR__}background3.jpg"};
    }
    onMousePressed: function(e: MouseEvent): Void {
        if(not(e.primaryButtonDown or e.secondaryButtonDown))
            delete dialog4 from itemModifyScenes.content;
    }
}

var itemModifyScenes:Scene = Scene {
    width: 450
    height: 480
    content: [
        dialog1,dialog2,dialog3,dialog4
    ]
}

function run (): Void {

    javafx.stage.Stage {
        title: "Image shifting between panels"
        scene: itemModifyScenes;
        resizable: false;
    }
}

