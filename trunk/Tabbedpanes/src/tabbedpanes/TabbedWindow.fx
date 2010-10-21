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
import javafx.scene.Cursor;

/**
 * @author Shourien
 */
 var titleNode: Node[];
 var textNode: Node[];
 var totaltitlewidth:Number;
 var initialposition:Integer;
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
        cursor: Cursor.HAND;

        onMousePressed: function(e) {
            for(i in [0..titleNode.size()]){
                if(titleRect!=titleNode[i]) {
                    (titleNode[i] as Rectangle).fill = Color.GREY;
                } else {
                    (titleNode[i] as Rectangle).fill = Color.WHITE;
                }
            }
            PointerText.layoutX = 100 * Math.floor((e.sceneX -x)/100);
            initialposition = (PointerText.layoutX/100 as Integer);
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
            } else if(initialposition < PointerText.layoutX/100){
                var nodefinalposition = PointerText.layoutX/100 as Integer;
                var temptitlenode:Number = 0;
                var temptextnode:Number = 0;
                var elsetitlenode:Number = 0;
                var elsetextnode:Number = 0;
                var rectNodes:Node[] = null;
                var textNodes:Node[] = null;
                var preload:Integer = 0;

                while(preload < initialposition){
                    insert titleNode[preload] into rectNodes;
                    insert textNode[preload] into textNodes;
                    preload++;
                }

                for(i in [initialposition..nodefinalposition]) {
                    if(i == initialposition) {
                        temptitlenode = (titleNode[i+1] as Rectangle).layoutX;
                        temptextnode = (textNode[i+1] as Text).layoutX;
                        (titleNode[i+1] as Rectangle).layoutX = noderectinitialXposition;
                        (textNode[i+1] as Text).layoutX = nodetextinitialXposition;
                        insert titleNode[i+1] into rectNodes;
                        insert textNode[i+1] into textNodes;
                    } else if(i == nodefinalposition) {
                        (titleNode[initialposition] as Rectangle).layoutX = temptitlenode;
                        (textNode[initialposition] as Text).layoutX = temptextnode;
                        insert titleNode[initialposition] into rectNodes;
                        insert textNode[initialposition] into textNodes;
                    } else {
                        elsetitlenode = temptitlenode;
                        elsetextnode = temptextnode;
                        temptitlenode = (titleNode[i+1] as Rectangle).layoutX;
                        temptextnode = (textNode[i+1] as Text).layoutX;
                        (titleNode[i+1] as Rectangle).layoutX = elsetitlenode;
                        (textNode[i+1] as Text).layoutX = elsetextnode;
                        insert titleNode[i+1] into rectNodes;
                        insert textNode[i+1] into textNodes;
                    }
                }

                nodefinalposition++;
                preload = titleNode.size() - 1;

                while(nodefinalposition <= preload){
                    insert titleNode[nodefinalposition] into rectNodes;
                    insert textNode[nodefinalposition] into textNodes;
                    nodefinalposition++;
                }
                
                nodefinalposition = 0;
                preload = 0;
                delete titleNode;
                delete textNode;
                titleNode = rectNodes;
                textNode = textNodes;

            } else if(initialposition > PointerText.layoutX/100){
                var nodefinalposition = PointerText.layoutX/100 as Integer;
                var rectNodes:Node[] = null;
                var textNodes:Node[] = null;
                var preload:Integer = 0;

                while(preload < nodefinalposition){
                    insert titleNode[preload] into rectNodes;
                    insert textNode[preload] into textNodes;
                    preload++;
                }

                for(i in [nodefinalposition..initialposition]) {
                    if(i == nodefinalposition) {
			(titleNode[initialposition] as Rectangle).layoutX = (titleNode[nodefinalposition] as Rectangle).layoutX;
			(textNode[initialposition] as Text).layoutX = (textNode[nodefinalposition] as Text).layoutX;
                        insert titleNode[initialposition] into rectNodes;
                        insert textNode[initialposition] into textNodes;
                    } else if(i == initialposition) {
                        (titleNode[i-1] as Rectangle).layoutX = noderectinitialXposition;
                        (textNode[i-1] as Text).layoutX = nodetextinitialXposition;
                        insert titleNode[i-1] into rectNodes;
                        insert textNode[i-1] into textNodes;
                    } else {
			(titleNode[i-1] as Rectangle).layoutX = (titleNode[i] as Rectangle).layoutX;
			(textNode[i-1] as Text).layoutX = (textNode[i] as Text).layoutX;
                        insert titleNode[i-1] into rectNodes;
                        insert textNode[i-1] into textNodes;
                    }
                }
                initialposition++;
                preload = titleNode.size() - 1;
                while(initialposition <= preload){
                    insert titleNode[initialposition] into rectNodes;
                    insert textNode[initialposition] into textNodes;
                    initialposition++;
                }
                nodefinalposition = 0;
                preload = 0;
                delete titleNode;
                delete textNode;
                titleNode = rectNodes;
                textNode = textNodes;
            }

            PointerText.visible = false;
            noderectinitialXposition = 0;
            nodetextinitialXposition= 0;
            initialposition = 0;
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
                    bgRect, titleRect, contentAreaBG, titleText, background, 
                    contentGroup,PointerText]
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
        insert titleText into textNode;
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
