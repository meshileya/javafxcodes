/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package splashscreen;

/**
 *
 * @author shourien
 */
public class SplashWindow {
    public SplashWindow() {}

    public void spawnThread() {
        Thread t = new Thread(new ShowWindow(null));
        t.setDaemon(true);
        t.start();
    }
}
