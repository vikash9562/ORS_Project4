package com.rays.pro4.Util;

import java.util.ResourceBundle;

/**
 * Read the property values from application properties file using Resource
 * Bundle.
 * 
 * @author Vikash Yadav
 *
 */

public class PropertyReader {

	private static ResourceBundle rb = ResourceBundle.getBundle("com.rays.proj4.resourcesB.System");

	/**
	 * Return value of key
	 *
	 * @param key
	 * @return
	 */

	public static String getValue(String key) {

		String val = null;
		System.out.println(val + "p.r. ki get value ");
		try {
			val = rb.getString(key);
			System.out.println(key + "p.r. ki get value try block");
		} catch (Exception e) {
			System.out.println(val + "p.r. ki get value catch block ");
			val = key;
		}

		return val;

	}

	/**
	 * Gets String after placing param values
	 *
	 * @param key
	 * @param param
	 * @return String
	 */
	public static String getValue(String key, String param) {

		String msg = getValue(key);
		System.out.println("   kye " + msg);

		msg = msg.replace("{0}", param);
		System.out.println(msg.replace("{0}", param) + "  p.r. ki get value ");
		return msg;
	}

	/**
	 * Gets String after placing params values
	 *
	 *
	 * jh
	 * 
	 * @param key
	 * @param params
	 * @return
	 */

	public static String getValue(String key, String[] params) {
		String msg = getValue(key);
		for (int i = 0; i < params.length; i++) {
			msg = msg.replace("{" + i + "}", params[i]);
		}
		return msg;
	}

	/**
	 * Test method
	 *
	 * @param args
	 */

	public static void main(String[] args) {

		String[] params = { "Roll No" };
		System.out.println("p.r. ki get value Roll No");
		System.out.println(PropertyReader.getValue("error.require", params));
	}

}

