/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tabbedpanes;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.paint.Paint;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.Group;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.text.TextOrigin;
import javafx.scene.text.FontWeight;
import javafx.scene.effect.DropShadow;
import javafx.scene.layout.Panel;
import javafx.scene.image.ImageView;
import javafx.util.Math;

/**
 * @author Shourien
 */
 var titleNode: Node[];
 var totaltitlewidth:Number;
 var initialposition:Number;
 var nodetextinitialXposition:Number;
 var noderectinitialXposition:Number;
public class TabbedWindow extends CustomNode {

    public var content: Node[];
    public-init var fill: Paint = Color.GRAY;
    public var title = "";
    public var x = 20.0;
    public var y = 50.0;
    public var width = 400.0;
    public var height = 400.0;
    public var background:ImageView;
    def margin = 5;
    def arcSize = 8;

    def titleText: Text = Text {
        content: bind title
        font: Font.font("sansserif", FontWeight.BOLD, 12)
        fill: Color.BLACK
        textOrigin: TextOrigin.TOP
        wrappingWidth: 91;
    }

    def PointerText: Text = Text {
        content: ">";
        layoutY: -margin * 6;
    }

    def contentClipRect = Rectangle {
        x: 2
        y: 2
    }

    def contentGroup = Group {
        content: bind content
        clip: contentClipRect
    }

    def bgRect: Rectangle = Rectangle {
        fill: fill
        arcWidth: arcSize
        arcHeight: arcSize
        effect: DropShadow {}
    }

     def titleRect: Rectangle = Rectangle {
        fill: fill
        arcWidth: arcSize
        arcHeight: arcSize

        onMousePressed: function(e) {
            for(i in [0..titleNode.size()]){
                if(titleRect!=titleNode[i]) {
                    (titleNode[i] as Rectangle).fill = Color.GREY;
                } else {
                    (titleNode[i] as Rectangle).fill = Color.WHITE;
                }
            }
            PointerText.layoutX = 100 * Math.floor((e.sceneX -x)/100);
            initialposition = PointerText.layoutX/100;
            nodetextinitialXposition = titleText.layoutX;
            noderectinitialXposition = titleRect.layoutX;
            toFront();
        }

        onMouseDragged: function(e) {
            PointerText.visible = true;
            if((e.sceneX -x) < width and (e.sceneX -x) > 0)
                PointerText.layoutX = 100 * Math.floor((e.sceneX -x)/100);
            titleRect.layoutX = e.sceneX - 35;
            titleText.layoutX = e.sceneX - 32;
        }

        onMouseReleased: function(e) {
            if(initialposition == PointerText.layoutX/100){
                titleRect.layoutX = noderectinitialXposition;
                titleText.layoutX = nodetextinitialXposition;
            } else {
                //more coding here
            }
            PointerText.visible = false;
            noderectinitialXposition = 0;
            nodetextinitialXposition= 0;
        }

        effect: DropShadow {}
    }

    def contentAreaBG = Rectangle {
        fill: Color.WHITE
        blocksMouse: true
    }
            
    def tabwindow = Panel {
                layoutX: bind x
                layoutY: bind y
                onLayout: onLayout
                content: [
                    bgRect, titleRect, contentAreaBG, titleText, background, contentGroup,PointerText
                ]
            }

    override function create(): Node {
        tabwindow;
    }

    function onLayout(): Void {
        if(titleText.content.length() > 12) {
            titleText.textOrigin = TextOrigin.BASELINE;
        }

        background.fitHeight = height - margin * 3;
        background.fitWidth = width - margin * 3 + 1;
        background.layoutX = margin + 2;
        background.layoutY = margin - 2;
        insert titleRect into titleNode;
        contentClipRect.width = width - 4;
        contentClipRect.height = height - 12;
        titleRect.width = titleText.layoutBounds.width + margin + 3;
        titleRect.height = titleText.layoutBounds.height + margin + 8;
        titleRect.layoutY = - titleRect.height;
        titleText.layoutY = -margin * 4;
        
        titleRect.fill = Color.GREY;
        if(titleNode.size() == 1){
            titleRect.layoutX = margin + 1;
            titleText.layoutX = margin + 3;
        } else {
            totaltitlewidth += titleRect.width;
            titleText.layoutX = totaltitlewidth + 12;
            titleRect.layoutX = totaltitlewidth + 6;
        }
        contentGroup.layoutY = margin;
        contentGroup.layoutX = margin;

        bgRect.width = width;
        bgRect.height = height - margin - 3;

        contentAreaBG.layoutX = margin + 2;
        contentAreaBG.width = width - (margin * 2) - 4;
        contentAreaBG.height = height - (margin * 2) - 4;
        PointerText.visible = false;
    }
}
