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

/**
 * @author spunja
 */

// place your code here
var chars : Node[];
var Yvalue:Number = 0;
var Xvalue:Number = -50;
var textXValue:Number = -35;
var textYValue:Number = 85;
var identifier:String;
var idnumber:Integer = 0;

var charsdone : Node[];
var imagenodetemp: ImageView;
var textnodetemp: Text;
var items:String[] = ["Item1", "Item2" , "Item3", "Item4"];

public function constructImage(){
    delete chars;
    delete charsdone;
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
    idnumber = idnumber + 1;
    identifier = idnumber.toString();

    var imagezone:ImageView = ImageView {
        x: xvalue;
        y: yvalue;
        id: identifier;
        image: Image {url:"{__DIR__}Click-icon.png"};
        onMousePressed: function(e: MouseEvent): Void {
            if(chars.size() == 2){
                delete chars;
                Xvalue = imagezone.x;
                Yvalue = imagezone.y;
                textXValue = textzone.x;
                textYValue = textzone.y;
                insert imagezone into itemModifyScenes.content;
                insert textzone into itemModifyScenes.content;
                imagenodetemp = imagezone;
                textnodetemp = textzone;
            } else {
                Xvalue = imagezone.x;
                Yvalue = imagezone.y;
                textXValue = textzone.x;
                textYValue = textzone.y;

                println("imagezone");
                imagenodetemp = imagezone;
                textnodetemp = textzone;
                println(imagenodetemp);
            }
        }
    }

    var textzone:Text = Text{
        x:textXValue;
        y:textYValue;
        wrappingWidth: 50;
    }

    if(items.size() > 0) {
        textzone.content = items[0];
        delete items.get(0) from items;
    }
    insert imagezone into chars;
    insert textzone into chars;
}

var imagegroup:Group =Group{
    content: bind chars
}

var zonevbox:VBox = VBox {
    translateX:50
    translateY:150
    layoutInfo: LayoutInfo {width:290}
    content: [imagegroup]

}

var deviceseperator:Separator =Separator {
    translateX:400;
    translateY:170;
    vertical: true;
    layoutInfo: LayoutInfo {height: 530 width:2}
}

var imagegroupdone:Group =Group{
    content: bind charsdone
}

var zonevboxdone:VBox = VBox {
    translateX:480
    translateY:150
    layoutInfo: LayoutInfo {width:290}
    content: [imagegroupdone]

}

var groupitems:Group = Group{
    content: [
        zonevbox,
        deviceseperator,
        zonevboxdone,
        ]
        onMouseDragged: function(e: MouseEvent): Void {
            println("text");
            imagenodetemp.x = e.x;
            textnodetemp.x = e.x;
            imagenodetemp.y = e.y;
            textnodetemp.y = e.y;
        }
        onMouseReleased: function(e: MouseEvent): Void {
                imagenodetemp.x = Xvalue;
                imagenodetemp.y = Yvalue;
                textnodetemp.x = textXValue;
                textnodetemp.y = textYValue;
                insert imagenodetemp into charsdone;
                insert textnodetemp into charsdone;
                delete imagenodetemp from chars;
                delete textnodetemp from chars;
        }


}

var itemModifyScenes:Scene = Scene {
    width: 800
    height: 350
    content: [
        groupitems
    ]
}

function run (): Void {
    javafx.stage.Stage {
        title: "Image shifting between panels"
        scene: itemModifyScenes;
        resizable: false;
    }
    constructImage();
}
