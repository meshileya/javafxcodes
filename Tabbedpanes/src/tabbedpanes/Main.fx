package tabbedpanes;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

/**
* @author Shourien
*/

var dialog1 = TabbedWindow {
    title: "Tabbed-Pane1"
    content: []
    background: ImageView {
        image: Image {url:"{__DIR__}background.jpg"};
    }
}

var dialog2:TabbedWindow = TabbedWindow {
    title: "Tabbed-Pane2"
    content: []
    background: ImageView {
        image: Image {url:"{__DIR__}background1.jpg"};
    }
}

var dialog3:TabbedWindow = TabbedWindow {
    title: "Tabbed-Pane3"
    content: []
    background: ImageView {
        image: Image {url:"{__DIR__}background2.jpg"};
    }
}

var dialog4:TabbedWindow = TabbedWindow {
    title: "Tabbed-Pane4"
    content: []
    background: ImageView {
        image: Image {url:"{__DIR__}background3.jpg"};
    }
}

Stage { 
    title: "JavaFX Window"
    scene: Scene {
        content: [dialog1,
                    dialog2,dialog3,dialog4]
    }
}
