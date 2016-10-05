/**
 * 
 */
package ie.dit.dillon.ronan;

/**
 * @author User
 *
 */
public class Person {

	private String name; 

	private String gender;
	
	public Person(String name,String gender)
	{
		this.name=name;
		this.gender=gender;
	}
	public void print()
	{
		System.out.println("I am a person. My name is "+name);
	}
	
	public String toString()
	{
		 return "Name of the person.:" + this.name + " "
	                + "Gender of this person.:" + this.gender;
	}
}


