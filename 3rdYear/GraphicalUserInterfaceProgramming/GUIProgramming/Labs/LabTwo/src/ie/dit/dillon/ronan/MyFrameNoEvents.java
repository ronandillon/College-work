package ie.dit.dillon.ronan;

//***********************************
//*
//
// this class creates a simple frame, with a text field and an input field
//
//
//******************************************

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

import javax.swing.JButton;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.WindowConstants;


public class MyFrameNoEvents extends JFrame implements ActionListener, MouseListener, WindowListener
{
	
	JTextField nameField; 
	JButton ok,well;
	
	// constructor
	public MyFrameNoEvents (String myTitle)
	
	{

		// Set the title of the window
		super (myTitle);

		// Set the default size of the window
		setSize(300,400);
		setLocation(100,100);

		// Say what to do when the window is closed
		setDefaultCloseOperation (WindowConstants.DISPOSE_ON_CLOSE);


		//Create the Pane and put it on the main window
		setContentPane(createPane());

		//Create the Menu and put it on the main window
		setJMenuBar(createMenu());


		// Show the window on the screen
		setVisible(true);
	}


	private Container createPane()
	// This menu creates a content pane which is the "blank" part of
	// the frame that gets filled up with content
      {

		Container pane = new JPanel();

		 ok = new JButton("OK");
		 
		 ok.addActionListener(this);
		 
		 well = new JButton("Well Boi");
		 
		 well.addActionListener(this);
		 
		 
		 
	        pane.addMouseListener(
	            new MouseListener() {
	                public void actionPerformed(ActionEvent e) {
	                    // do something for button b1
	                }

					@Override
					public void mouseClicked(MouseEvent e) {
						// TODO Auto-generated method stub
						JOptionPane.showMessageDialog(null,"Can I get a well boiii?");
					}

					@Override
					public void mouseEntered(MouseEvent e) {
						// TODO Auto-generated method stub
						
					}

					@Override
					public void mouseExited(MouseEvent e) {
						// TODO Auto-generated method stub
						
					}

					@Override
					public void mousePressed(MouseEvent e) {
						// TODO Auto-generated method stub
						
					}

					@Override
					public void mouseReleased(MouseEvent e) {
						// TODO Auto-generated method stub
						
					}
	            }
	        );
		 
		 

		// Create a label and a text field with a tool tip
		JLabel name = new JLabel ("Name");
        nameField = new JTextField (10);
	
        pane.addMouseListener(this);
        addWindowListener(this);
		// add the text details to the pane
		pane.add(name);
		pane.add(nameField);
		pane.add(ok);
		pane.add(well);
		
		
		return pane;
	}
	
	public void actionPerformed (ActionEvent e)
	{
		if(e.getSource() == ok )
		{
		System.exit(0);
		}
		else if(e.getSource()==well)
		{
			JOptionPane.showMessageDialog(null,"Can I get a well boiii?");
		}
	}


	private JMenuBar createMenu()
	// this menu creates and returns a menu bar
	{

		// Create a menu Bar
		JMenuBar menuBar = new JMenuBar();

		// Create a Menu to go on the MenuBar
		JMenu fileMenu = new JMenu("File");

		// Add the Menu to the menu bar
		menuBar.add(fileMenu);

		// Create a menu item (i.e. appears on list when you click on the menu)
		JMenuItem openMenuItem = new JMenuItem ("Open file");

		// Add the menu item to your menu
		fileMenu.add(openMenuItem);

		// Return the menubar that you created
		return menuBar;
	}


	
	public void mouseClicked(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
		
		JOptionPane.showMessageDialog(null,"Can I get a well boiii?");
	}


	
	public void mouseEntered(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}


	
	public void mouseExited(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}


	
	public void mousePressed(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}


	
	
	public void mouseReleased(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void windowActivated(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void windowClosed(WindowEvent arg0) {
		// TODO Auto-generated method stub
		JOptionPane.showMessageDialog(null,"Soz boi cant let you leave...jkjk bye");
	}


	@Override
	public void windowClosing(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void windowDeactivated(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void windowDeiconified(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void windowIconified(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void windowOpened(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}



}

