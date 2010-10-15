/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package imagepopup;

import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.Scene;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.control.ScrollBar;
import javafx.scene.layout.ClipView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.layout.VBox;
import javafx.scene.control.Separator;
import javafx.animation.transition.ScaleTransition;
import javafx.scene.text.Text;
import javafx.scene.image.Image;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.TextAlignment;

/**
 * @author shourien
 */

// place your code here
var chars : Node[];
var Yvalue:Number = 0;
var Xvalue:Number = -75;
var textXValue:Number = -60;
var textYValue:Number = 85;
var idnumber:Integer = 0;

var charsdone : Node[];
def percentage : Number [] = [ 40, 60, 80, 100, 80, 60, 40 ];
var presensecheck:String[];
var presensecheckdone:String[];
var ItemSet1:String[] = ["Item1", "Item2", "Item3", "Item4"];
var ItemSet2:String[] = ["Item5", "Item6", "Item7", "Item8"];
var assigneditemflag:Boolean = false;
var totaldevices:Number;

function constructImage(){
    delete chars;
    delete charsdone;
    delete presensecheck;
    delete presensecheckdone;
    Xvalue = -75;
    textXValue = -60;
    textYValue = 85;
    Yvalue = 0;
    idnumber = 0;
    assigneditemflag = false;
    totaldevices = ItemSet1.size();
    var assigneddevices = ItemSet2.size();

    for (i in [1..totaldevices]){
        if(i mod 4 == 0){
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            cloneNodes(Yvalue, Xvalue);
            Yvalue += 100;
            Xvalue = -75;
            textXValue = -60;
            textYValue = textYValue + 100;
        }
        else {
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            cloneNodes(Yvalue, Xvalue);
        }
    }
    Yvalue = 0;
    Xvalue = -75;
    textXValue = -60;
    textYValue = 85;
    assigneditemflag = true;
    for (j in [1..assigneddevices]){
         if(j mod 4 == 0){
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            cloneNodes(Yvalue, Xvalue);
            Yvalue += 100;
            Xvalue = -75;
            textXValue = -60;
            textYValue = textYValue + 100;
        }
        else {
            Xvalue = Xvalue + 75;
            textXValue = textXValue + 75;
            cloneNodes(Yvalue, Xvalue);
        }
    }

}

var scaleTransition : ScaleTransition = ScaleTransition {
    duration: 250ms
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

function IsInCollection(itemitems : String) : Boolean
{
    for (i in [0..presensecheck.size()]){
        var subItemEqualFlag = true;
        for (j in [0..presensecheck.size()]) {
            var sub1 = itemitems;
            var sub2 = presensecheck[j].toString();
            if (sub1.equals(sub2)) {
                subItemEqualFlag = false;
            }
        }
        if (not subItemEqualFlag)
            return true;
    }
    return false;
}

function IsInDoneCollection(itemitems : String) : Boolean
{
    for (i in [0..presensecheckdone.size()]){
        var subItemEqualFlag = true;
        for (j in [0..presensecheckdone.size()]) {
            var sub1 = itemitems;
            var sub2 = presensecheckdone[j].toString();
            if (sub1.equals(sub2)) {
                subItemEqualFlag = false;
            }
        }
        if (not subItemEqualFlag)
            return true;
    }
    return false;
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


function cloneNodes(yvalue: Number, xvalue: Number){
    idnumber = idnumber + 1;
    var identifier:String = idnumber.toString();

    var imageitem:ImageView = ImageView {
        x: xvalue;
        y: yvalue;
        id: identifier;
        image: Image {url:"{__DIR__}Click-icon.png"};
        onMouseClicked: function(e: MouseEvent): Void {
            next(imageitem);
            if(totaldevices >= java.lang.Integer.parseInt(imageitem.id)){
                if(not IsInCollection(imageitem.id)){
                    insert imageitem.id into presensecheck;
                    delete imageitem from chars;
                    delete textitem from chars;
                    insert imageitem into charsdone;
                    insert textitem into charsdone;
                    spaceCalculation();
                } else {
                    delete imageitem.id from presensecheck;
                    delete imageitem from charsdone;
                    delete textitem from charsdone;
                    insert imageitem into chars;
                    insert textitem into chars;
                    spaceCalculation();
                }
            } else {
                if(not IsInDoneCollection(imageitem.id)){
                    insert imageitem.id into presensecheckdone;
                    delete imageitem from charsdone;
                    delete textitem from charsdone;
                    insert imageitem into chars;
                    insert textitem into chars;
                    spaceCalculation();
                } else {
                    delete imageitem.id from presensecheckdone;
                    delete imageitem from chars;
                    delete textitem from chars;
                    insert imageitem into charsdone;
                    insert textitem into charsdone;
                    spaceCalculation();
                }
            }
        }
    }

    var textitem:Text = Text{
        x:textXValue;
        y:textYValue;
        wrappingWidth: 50;
        font:Font.font("Verdana", FontWeight.BOLD, 10)
    }

    if(ItemSet1.size() > 0) {
        textitem.content = ItemSet1[0];
        delete ItemSet1.get(0) from ItemSet1;
    } else if(ItemSet2.size() > 0) {
        textitem.content = ItemSet2[0];
        delete ItemSet2.get(0) from ItemSet2;
    }

    if (not assigneditemflag){
        insert imageitem into chars;
        insert textitem into chars;
    } else {
        insert imageitem into charsdone;
        insert textitem into charsdone;
    }

}

var textmsg:Text = Text{
    x:200;
    y:20;
    font:Font.font("Verdana", FontWeight.BOLD, 16)
    content: "Click on the images to shift them between panels";
    textAlignment: TextAlignment.CENTER;
}

var textpanel:Text = Text{
    x:170;
    y:80;
    font:Font.font("Verdana", FontWeight.BOLD, 16)
    content: "Panel 1";
    textAlignment: TextAlignment.CENTER;
}

var textpane2:Text = Text{
    x:600;
    y:80;
    font:Font.font("Verdana", FontWeight.BOLD, 16)
    content: "Panel 2";
    textAlignment: TextAlignment.CENTER;
}

var background:ImageView = ImageView {
    image: Image {url:"{__DIR__}background.gif"};
}

var imagegroup:Group =Group{
    content: bind chars
}

var itemvbox:VBox = VBox {
    layoutInfo: LayoutInfo {width:290}
    content: [imagegroup]
}

var itemclipView : ClipView = ClipView {
    node: itemvbox
    clipX: 0
    clipY: bind (itemsb.value * (itemvbox.height - itemsb.height)/100) - 10
    layoutInfo: LayoutInfo {height: 200 width:300}
    pannable: false
}

var itemsb : ScrollBar = ScrollBar {
    vertical: true
    min: 0
    max:100
    layoutInfo: LayoutInfo {height: 200}
    visible: false;
    disable: true;
}

var itemhBox:HBox = HBox {
    translateX:50
    translateY:100
    content: [ itemclipView, itemsb ]
    onMouseWheelMoved: function (evt: MouseEvent): Void
    {
        if(not itemsb.disabled){
            var rotation = evt.wheelRotation * 10;
            var sbvalue = itemsb.value;
            if(sbvalue + rotation > 0){
                itemsb.value += rotation;
            }
            else{
                itemsb.value = 0;
            }
        }
    }
}

var deviceseperator:Separator =Separator {
    translateX:400;
    translateY:100;
    vertical: true;
    width: 10;
    layoutInfo: LayoutInfo {height: 200}
}

var imagegroupdone:Group =Group{
    content: bind charsdone
}

var itemvboxdone:VBox = VBox {
    layoutInfo: LayoutInfo {width:290}
    content: [imagegroupdone]

}

var itemclipViewdone : ClipView = ClipView {
    node: itemvboxdone
    clipX: 0
    clipY: bind (itemsbdone.value * (itemvboxdone.height - itemsbdone.height)/100) - 10
    layoutInfo: LayoutInfo {height: 200 width: 300}
    pannable: false
}

var itemsbdone : ScrollBar = ScrollBar {
    vertical: true
    min: 0
    max:100
    layoutInfo: LayoutInfo {height: 200}
    visible: false;
    disable: true;
}

var itemhBoxdone:HBox = HBox {
    translateX:480
    translateY:100
    content: [ itemclipViewdone, itemsbdone ]
    onMouseWheelMoved: function (evt: MouseEvent): Void
    {
        if(not itemsbdone.disabled) {
            var rotation = evt.wheelRotation * 10;
            var sbvalue = itemsbdone.value;
            if(sbvalue + rotation > 0){
                itemsbdone.value += rotation;
            }
            else{
                itemsbdone.value = 0;
            }
        }
    }
}

var itemModifyScenes:Scene = Scene {
    width: 800
    height: 350
    content: [
        background,
        textmsg,
        textpanel,
        textpane2,
        itemhBox,
        deviceseperator,
        itemhBoxdone,
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
