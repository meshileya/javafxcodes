/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package listview;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.animation.transition.TranslateTransition;
import javafx.scene.control.ListView;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.layout.VBox;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.input.MouseEvent;
import javafx.scene.control.Tooltip;
import javafx.scene.Group;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;

/**
 * @author shourien
 */

var BackgroundImage = ImageView {
    image: Image {url:"{__DIR__}background.jpg"};
    opacity: 0.5
}

var textpanel:Text = Text{
    y: 22;
    font:Font.font("Verdana", FontWeight.BOLD, 10)
    content: "*NOTE: Use Mouse wheel for srolling through the list"
    textAlignment: TextAlignment.CENTER;
}

var significantY:Number;
var chartListView:ListView = ListView {
    translateX: 30
    translateY: 30
    layoutInfo: LayoutInfo {
        width: 280;
        height: 230;
    }
    items: ["Cell 1","Cell 2","Cell 3","Cell 4","Cell 5","Cell 6","Cell 7",
            "Cell 8","Cell 9","Cell 10","Cell 11","Cell 12","Cell 13","Cell 14",];
    cellFactory: function() {
        var cell:ListCell = ListCell {
            node: Label { text: bind if (cell.empty) then "" else "{cell.item}" }
            onMouseEntered: function(e: MouseEvent): Void {
                tooltip.deactivate();
                chartListView.select(cell.index);
                tooltip.text = chartListView.selectedItem.toString();
                tooltip.activate();
            }
        }
    }
    onMouseMoved: function(e:MouseEvent): Void {
        if(significantY > -1 and (e.y > significantY + 10
            or e.y < significantY - 10)) {
            tooltip.deactivate();
            significantY = e.y;
            tooltipgroup.translateX = e.x + 45;
            tooltipgroup.translateY = e.y;
            tooltip.activate();
        }
    }
}

var tooltip: Tooltip = Tooltip {}

var tooltipgroup: Group = Group{
    content: [tooltip];
}

var trans:TranslateTransition = TranslateTransition{
   node:chartListView
   fromX:300
   toX:30
   fromY:30
   toY:30
   duration:2s
}

var vbox:VBox = VBox {
    content:[chartListView]
}

function run (): Void {

    Stage {
        title: "List View Customized"
        scene: Scene {
        width: 340
        height: 300
        content: [
            BackgroundImage,
            vbox,
            textpanel,
            tooltipgroup,
        ]
        stylesheets: "{__DIR__}javafx.css";
    }
        resizable: false;
    }
    trans.playFromStart();
}
