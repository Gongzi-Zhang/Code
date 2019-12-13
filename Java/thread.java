/* thread life cycle:
 * 1. New
 * 2. Runnable
 * 3. Running
 * 4. Waiting
 * 5. Dead
 */
public class thread implements Runnable {
    Thread thread = new Thread("thread1");
    thread.start();
    thread.Sleep(1000); // unit in ms
    thread.setPriority(int newpriority);
    thread.getPriority();
    thread.yield();	// it causes current thread on halt and other threads to execute
    System.out.println(thread.getName());

    // Synchronization
    int Synchronized(object) {
	...
    }
}

