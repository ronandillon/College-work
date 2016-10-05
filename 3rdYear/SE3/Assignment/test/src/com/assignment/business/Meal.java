package com.assignment.business;

import java.awt.List;
import java.util.ArrayList;

/**
 * 
 */
import com.assignment.servlet.Controllor;

/** 
 * <!-- begin-UML-doc -->
 * <!-- end-UML-doc -->
 * @author User
 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Meal {
	
		 private String name;
		 
		 public Meal (String name) {
		 this.name = name;
		 }
		

	private String MealType;

	/** 
	 * @return the MealType
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getMealType() {
		// begin-user-code
		return MealType;
		// end-user-code
	}

	/** 
	 * @param MealType the MealType to set
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setMealType(String MealType) {
		// begin-user-code
		this.MealType = MealType;
		// end-user-code
	}

	/** 
	 * <!-- begin-UML-doc -->
	 * <!-- end-UML-doc -->
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Integer CalorieCount;

	/** 
	 * @return the CalorieCount
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Integer getCalorieCount() {
		// begin-user-code
		return CalorieCount;
		// end-user-code
	}

	/** 
	 * @param CalorieCount the CalorieCount to set
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setCalorieCount(Integer CalorieCount) {
		// begin-user-code
		this.CalorieCount = CalorieCount;
		// end-user-code
	}

	/** 
	 * <!-- begin-UML-doc -->
	 * <!-- end-UML-doc -->
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private String MealName;

	/** 
	 * @return the MealName
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getMealName() {
		// begin-user-code
		return MealName;
		// end-user-code
	}

	/** 
	 * @param MealName the MealName to set
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setMealName(String MealName) {
		// begin-user-code
		this.MealName = MealName;
		// end-user-code
	}

	/** 
	 * <!-- begin-UML-doc -->
	 * <!-- end-UML-doc -->
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private User user;

	/** 
	 * @return the user
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public User getUser() {
		// begin-user-code
		return user;
		// end-user-code
	}

	/** 
	 * @param user the user to set
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setUser(User user) {
		// begin-user-code
		this.user = user;
		// end-user-code
	}



	/** 
	 * <!-- begin-UML-doc -->
	 * <!-- end-UML-doc -->
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Controllor controllor;

	/** 
	 * @return the controllor
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Controllor getControllor() {
		// begin-user-code
		return controllor;
		// end-user-code
	}

	/** 
	 * @param controllor the controllor to set
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setControllor(Controllor controllor) {
		// begin-user-code
		this.controllor = controllor;
		// end-user-code
	}

	/** 
	 * <!-- begin-UML-doc -->
	 * <!-- end-UML-doc -->
	 * @param MealType
	 * @param MealName
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void getMeal(String MealType, String MealName) {
		// begin-user-code
		// TODO Auto-generated method stub

		// end-user-code
	}

	/** 
	 * <!-- begin-UML-doc -->
	 * <!-- end-UML-doc -->
	 * @param MealName
	 * @return
	 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Integer getMealCalories(String MealName) {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}
}