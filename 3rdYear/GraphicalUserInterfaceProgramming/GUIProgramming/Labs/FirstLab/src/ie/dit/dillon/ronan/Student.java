/**
 * 
 */
package ie.dit.dillon.ronan;

/**
 * @author User
 *
 */
public class Student extends Person implements PublishDetails {
	
	
	private String studentID;
	private String courseCode;
	
	public Student(String name, String gender, String studentID, String courseCode) {
		super(name, gender);
		// TODO Auto-generated constructor stub
		
		this.studentID=studentID;
		this.courseCode=courseCode;
		
	}
	
	public void confirmDetails()
	{
		System.out.println(this.toString());
	}
	
	public void getCourseCode()
	{
		System.out.println(this.courseCode);
	}
	
	public String toString()
	{
		 return super.toString()+ "  student ID.:" + this.studentID + " "
	                + "course code.:" + this.courseCode;
	}
}
