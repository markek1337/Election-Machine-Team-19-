package team19.login;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

/**
 * This class is responsible for making password encoded.
 * @author markpetrov
 * @version 1.0
 */

public class SecurityUtils {
	
	/**
	 * This method encodes (hashes) the password
	 * @param password
	 * @param salt
	 * @return
	 */
	public static String getPasswordHashed (String password, String salt) {
		
		String result = "";
		
		try {
			// message digest makes sure that integrity of a message is transmitted through insecure channel
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			byte [] saltBytes = Base64.getDecoder().decode(salt);
			md.update(saltBytes);
			byte [] bytes = md.digest(password.getBytes());
			
			// encoding byte array to string
			result = Base64.getEncoder().encodeToString(bytes);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static String getSalt() {
		
		String result = "";
		SecureRandom rd = new SecureRandom();
		byte [] salt = new byte [16];
		rd.nextBytes(salt);
		// encode byte array to string
		result = Base64.getEncoder().encodeToString(salt);
		return result;
	}
	
	/**
	 * This method is responsible for checking if password is correct.
	 * @param storedHash
	 * @param password
	 * @param storedSalt
	 * @return
	 */
	public static boolean isPasswordCorrect (String storedHash, String password, String storedSalt) {
		
		// we are taking storedHash and storedSalt from database table
		// password is given in login form
		
		if (storedHash.equals(getPasswordHashed(password, storedSalt))) {
			return true;
		}
		return false;
	}
}
