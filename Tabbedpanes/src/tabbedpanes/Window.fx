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

/**
 * @author Shourien
 */
public class Window extends CustomNode {

    public var content: Node[];
    public-init var fill: Paint = Color.GRAY;
    public var title = "";
    public var x = 0.0;
    public var y = 0.0;
    public var width = 180.0;
    public var height = 180.0;
    public var temp = 1;
    def margin = 5;
    def arcSize = 8;
    def windowVisible = bind visible on replace {
                if (visible) {
                println(title);
                toFront();}
            }

    def titleText: Text = Text {
                content: bind title
                font: Font.font("sansserif", FontWeight.BOLD, 12)
                fill: Color.BLACK
                textOrigin: TextOrigin.TOP
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

                onMousePressed: function(e) {
                    toFront();
                }

                effect: DropShadow {}
            }

     def titleRect: Rectangle = Rectangle {
                fill: fill
                arcWidth: arcSize
                arcHeight: arcSize

                onMousePressed: function(e) {
                    toFront();
                }
                effect: DropShadow {}
            }

    def contentAreaBG = Rectangle {
                fill: Color.WHITE
                blocksMouse: true
                onMousePressed: function(e) {
                    toFront();
                }
            }
    def window = Panel {
                layoutX: bind x
                layoutY: bind y
                onLayout: onLayout
                content: [
                    bgRect, titleRect, contentAreaBG, titleText, contentGroup,
                ]
            }

    override function create(): Node {
        window;
    }

    function onLayout(): Void {
        contentClipRect.width = width - 4;
        contentClipRect.height = height - 12;

        titleRect.width = titleText.layoutBounds.width + margin + 3;
        titleRect.height = titleText.layoutBounds.height + margin + 3;
        titleRect.layoutY = - titleRect.height;

        if(temp == 1){
            titleRect.fill = Color.WHITE;
            titleRect.layoutX = margin + 1;
            titleText.layoutX = margin + 3;
            titleText.layoutY = -margin*4;
            temp++;
        } else {
            titleRect.fill = Color.GREY;
            titleText.layoutX = titleText.layoutBounds.width + margin + 7;
            titleRect.layoutX = titleText.layoutBounds.width + margin + 3;
            titleText.layoutY = -margin*4;
        }

        contentGroup.layoutY = margin;
        contentGroup.layoutX = margin;

        bgRect.width = width;
        bgRect.height = height - margin - 3;

        contentAreaBG.layoutX = margin + 2;
        contentAreaBG.width = width - (margin * 2) - 4;
        contentAreaBG.height = height - (margin * 2) - 4;
    }
}
