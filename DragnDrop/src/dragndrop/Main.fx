/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dragndrop;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.Scene;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.layout.VBox;
import javafx.scene.control.Separator;
import javafx.scene.text.Text;
import javafx.scene.image.Image;
import javafx.animation.transition.ScaleTransition;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.TextAlignment;

/**
 * @author spunja
 */

// place your code here
var chars : Node[];
var Yvalue:Number = 0;
var Xvalue:Number = -50;
var textXValue:Number = -35;
var textYValue:Number = 85;
var panel1;
def percentage : Number [] = [ 40, 60, 80, 100, 80, 60, 40 ];

var scaleTransition : ScaleTransition = ScaleTransition {
    duration: 500ms
    fromX: percentage[2]/100.0;
    fromY: percentage[2]/100.0;
    toX: percentage[3]/100.0;
    toY: percentage[3]/100.0;
}

function next(imagenode : Node) {
    scaleTransition.node = imagenode;
    scaleTransition.stop();
    scaleTransition.fromX = percentage[2]/100.0;
    scaleTransition.fromY = percentage[2]/100.0;
    scaleTransition.toX = percentage[3]/100.0;
    scaleTransition.toY = percentage[3]/100.0;
    scaleTransition.play();
}

var charsdone : Node[];
var imagenodetemp: ImageView;
var textnodetemp: Text;
var items:String[] = ["Item1", "Item2" , "Item3", "Item4"];

public function constructImage(){
    var totaldevices = items.size();
    for (i in [1..totaldevices]){
        if(i mod 4 == 0){
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            cloneNodes(Yvalue, Xvalue);
            Yvalue += 100;
            Xvalue = -50;
            textXValue = -35;
            textYValue = textYValue + 100;
        }
        else {
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            cloneNodes(Yvalue, Xvalue);
        }
    }
}

function cloneNodes(yvalue: Number, xvalue: Number){
    var imagezone:ImageView = ImageView {
        x: xvalue;
        y: yvalue;
        image: Image {url:"{__DIR__}drag_me.jpg"};
        onMousePressed: function(e: MouseEvent): Void {
            imagenodetemp = imagezone;
            textnodetemp = textzone;
            panel1 = false;
            if(e.sceneX <= 400){
                panel1 = true;
                delete imagezone from chars;
                delete textzone from chars;
            } else {
                panel1 = false;
                delete imagezone from charsdone;
                delete textzone from charsdone;
            }
            insert imagenodetemp into itemModifyScenes.content;
            insert textnodetemp into itemModifyScenes.content;
            imagenodetemp.x = e.sceneX - 20;
            imagenodetemp.y = e.sceneY - 20;
            textnodetemp.x = e.sceneX;
            textnodetemp.y = e.sceneY + 65;
        }
    }

    var textzone:Text = Text{
        x:textXValue;
        y:textYValue;
        wrappingWidth: 50;
        font: Font.font("Comic Sans MS", FontWeight.BOLD, 12)
    }

    if(items.size() > 0) {
        textzone.content = items[0];
        delete items.get(0) from items;
    }
    insert imagezone into chars;
    insert textzone into chars;
}

var textmsg:Text = Text{
    x:200;
    y:20;
    font: Font.font("Comic Sans MS", FontWeight.BOLD, 16)
    content: "Drag images to shift them between panels";
    textAlignment: TextAlignment.CENTER;
}

var imagegroup:Group =Group{
    layoutInfo: LayoutInfo {width:290}
    content: bind chars
}

var zonevbox:VBox = VBox {
    translateX:50
    translateY:100
    layoutInfo: LayoutInfo {width:290}
    content: [imagegroup]

}

var deviceseperator:Separator =Separator {
    translateX:400;
    translateY:100;
    vertical: true;
    layoutInfo: LayoutInfo {height: 200}
}

var imagegroupdone:Group =Group{
    content: bind charsdone
}

var zonevboxdone:VBox = VBox {
    translateX:480
    translateY:100
    layoutInfo: LayoutInfo {width:290}
    content: [imagegroupdone]

}

function spaceCalculation() {
    var count:Number = 0;
    Yvalue = -100;
    textYValue = -15;
    Xvalue = -75;
    textXValue = -60;
    while(count < chars.size()){
        if((count/2) mod 4 == 0){
            Yvalue += 100;
            textYValue = textYValue + 100;
            Xvalue = -75;
            textXValue = -60;
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            ((chars.get(count)) as ImageView).x = Xvalue;
            ((chars.get(count)) as ImageView).y = Yvalue;
            count++;
            ((chars.get(count)) as Text).x = textXValue;
            ((chars.get(count)) as Text).y = textYValue;
            count++;
        } else {
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            ((chars.get(count)) as ImageView).x = Xvalue;
            ((chars.get(count)) as ImageView).y = Yvalue;
            count++;
            ((chars.get(count)) as Text).x = textXValue;
            ((chars.get(count)) as Text).y = textYValue;
            count++;
        }
    }

    count = 0;
    Yvalue = -100;
    textYValue = -15;
    Xvalue = -75;
    textXValue = -60;
    while(count < charsdone.size()){
        if((count/2) mod 4 == 0){
            Yvalue += 100;
            textYValue = textYValue + 100;
            Xvalue = -75;
            textXValue = -60;
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            ((charsdone.get(count)) as ImageView).x = Xvalue;
            ((charsdone.get(count)) as ImageView).y = Yvalue;
            count++;
            ((charsdone.get(count)) as Text).x = textXValue;
            ((charsdone.get(count)) as Text).y = textYValue;
            count++;
        } else {
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            ((charsdone.get(count)) as ImageView).x = Xvalue;
            ((charsdone.get(count)) as ImageView).y = Yvalue;
            count++;
            ((charsdone.get(count)) as Text).x = textXValue;
            ((charsdone.get(count)) as Text).y = textYValue;
            count++;
        }
    }
}

var background:ImageView = ImageView {
    image: Image {url:"{__DIR__}background.jpg"};
}

var groupitems:Group = Group{
    content: [
        zonevboxdone,
        zonevbox,
        deviceseperator,
        ]
        onMouseDragged: function(e: MouseEvent): Void {
            imagenodetemp.x = e.x - 20;
            imagenodetemp.y = e.y - 20;
            textnodetemp.x = e.x;
            textnodetemp.y = e.y + 65;
        }
        
        onMouseReleased: function(e: MouseEvent): Void {
            if (e.sceneX >= 400 and panel1) {
                delete imagenodetemp from charsdone;
                delete textnodetemp from charsdone;
                insert imagenodetemp into charsdone;
                insert textnodetemp into charsdone;
                delete imagenodetemp from itemModifyScenes.content;
                delete textnodetemp from itemModifyScenes.content;
            }
            else if (e.sceneX < 400 and panel1) {
                delete imagenodetemp from chars;
                delete textnodetemp from chars;
                insert imagenodetemp into chars;
                insert textnodetemp into chars;
                delete imagenodetemp from itemModifyScenes.content;
                delete textnodetemp from itemModifyScenes.content;
            }
            else if(e.sceneX > 400 and not panel1) {
                delete imagenodetemp from charsdone;
                delete textnodetemp from charsdone;
                insert imagenodetemp into charsdone;
                insert textnodetemp into charsdone;
                delete imagenodetemp from itemModifyScenes.content;
                delete textnodetemp from itemModifyScenes.content;
            }
            else if(e.sceneX <= 400 and not panel1) {
                delete imagenodetemp from chars;
                delete textnodetemp from chars;
                insert imagenodetemp into chars;
                insert textnodetemp into chars;
                delete imagenodetemp from itemModifyScenes.content;
                delete textnodetemp from itemModifyScenes.content;
            }
            next(imagenodetemp);
            spaceCalculation();
            textnodetemp = null;
            imagenodetemp = null;
        }
}

var itemModifyScenes:Scene = Scene {
    width: 800
    height: 350
    content: [
        background,
        textmsg,
        groupitems
    ]
}

function run (): Void {
    javafx.stage.Stage {
        title: "Drag images between panels"
        scene: itemModifyScenes;
        resizable: false;
    }
    constructImage();
}
 