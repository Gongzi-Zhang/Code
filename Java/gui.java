import javax.swing.*;	// swing is a lightweight GUI toolkit that includes a rich set of widgets
import java.awt.*;

/* container classes are classes that can have other componets on it. for creating a GUI, we need at least one container object
 * 1. Panel: a pure container and is not a window in itself. The sole purpose of a Panel is to organize the components onto a window
 * 2. Frame: a fully functioning window with its title and icons
 * 3. Dialog: can be thought as a pop-up window that pops out when a message has to be displayed; it is not a fully functioning window like the Frame
 */

class gui {
    public static void main(String args[]) {
	// creating a new frame
	JFrame frame = new JFrame("GUI");
	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	frame.setSize(400, 400);

	// creating the Menubar and adding components
	JMenuBar mb = new JMenuBar();
	JMenu m1 = new JMenu("File");
	JMenu m2 = new JMenu("Help");
	mb.add(m1);
	mb.add(m2);
	JMenuItem mi1 = new JMenuItem("Open");
	JMenuItem mi2 = new JMenuItem("Save As");
	m1.add(mi1);
	m1.add(mi2);

	// add panel at bottom 
	JPanel panel = new JPanel();	// this panel is not visible
	JLabel label = new JLabel("Enter Text");
	JTextField tf = new JTextField(10); // accepts up to 10 chars
	JButton send = new JButton("Send");
	JButton reset = new JButton("Reset");
	panel.add(label);
	panel.add(tf);
	panel.add(send);
	panel.add(reset);

	// Text Area at the Center
	JTextArea ta = new JTextArea();

	// adding components to the frame
	frame.getContentPane().add(BorderLayout.SOUTH, panel);
	frame.getContentPane().add(BorderLayout.NORTH, mb);
	frame.getContentPane().add(BorderLayout.CENTER, ta);
	frame.setVisible(true);
    }
}

// BorderLayout: it is the default layout manager for every java JFrame

// FlowLayout is the default layout manager for every JPannel. It simply lays out components in a single row one after the other

// GridBagLayout will aligns components by placing them with a grid of cells, allowing components to span more than one cell
