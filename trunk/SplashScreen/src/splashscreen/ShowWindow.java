/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package splashscreen;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Frame;
import java.awt.Rectangle;
import java.awt.Toolkit;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JProgressBar;
import javax.swing.JWindow;
import javax.swing.UIManager;
import javax.swing.border.Border;

/**
 *
 * @author shourien
 */
public class ShowWindow extends JWindow implements Runnable
{
    JProgressBar pbar;
    Border border = BorderFactory.createTitledBorder(BorderFactory.createLineBorder(Color.BLACK));
    static String statusText;
    static int statusProgress= 10;
    public static boolean mutex = true;
    public ShowWindow() {}

    public void setValues(String statusText, int statusProgress) {
        ShowWindow.statusText = statusText;
        ShowWindow.statusProgress = statusProgress;
    }

    public ShowWindow(Frame f) {
        super(f);
        try{
            JLabel l = new JLabel(new ImageIcon(getClass().getClassLoader().getResource("splashscreen/mozilla_xp.png")));
            l.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));
            Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
            Dimension labelSize = l.getPreferredSize();
            setLocation(screenSize.width / 2 - (labelSize.width / 2), screenSize.height / 2 - (labelSize.height / 2));
            UIManager.put("ProgressBar.background", Color.WHITE); //colour of the background
            UIManager.put("ProgressBar.foreground", Color.GREEN); //colour of progress bar
            UIManager.put("ProgressBar.selectionBackground",Color.BLACK); //colour of percentage counter on black background
            UIManager.put("ProgressBar.selectionForeground",Color.BLACK); //colour of precentage counter on red background
            pbar = new JProgressBar();
            getContentPane().add(pbar, BorderLayout.SOUTH);
            getContentPane().add(l, BorderLayout.CENTER);
            getContentPane().setEnabled(true);
            pack();
        } catch (Exception ie) {}
    }

    public void setLoadingContent(String text, int progress)
    {
        setVisible(true);
        pbar.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEmptyBorder(), text));
        pbar.setFont(new Font("Arial", Font.BOLD, 11));
        pbar.setStringPainted(true);
        pbar.setValue(progress);
        Rectangle progressRect = pbar.getBounds();
        progressRect.x = 0;
        progressRect.y = 0;
        pbar.paintImmediately( progressRect );
    }

    @Override
    public void run() {
        while(mutex) {
            setLoadingContent(statusText,statusProgress);
        }
        setVisible(false);
    }
}
