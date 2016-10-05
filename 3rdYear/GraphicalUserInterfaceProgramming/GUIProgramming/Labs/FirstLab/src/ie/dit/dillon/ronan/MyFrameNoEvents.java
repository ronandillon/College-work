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

import javax.swing.JButton;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.WindowConstants;


public class MyFrameNoEvents extends JFrame 
{
	
	JTextField nameField; 
	
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

		 JButton ok = new JButton("OK");

		// Create a label and a text field with a tool tip
		JLabel name = new JLabel ("Name");
        nameField = new JTextField (10);
	

		// add the text details to the pane
		pane.add(name);
		pane.add(nameField);
		pane.add(ok);
		
		return pane;
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



}
