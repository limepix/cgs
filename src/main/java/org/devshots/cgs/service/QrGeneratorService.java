package org.devshots.cgs.service;

import java.util.Map;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * 
 * @author jb
 * 
 * Diese Klasse generiert Textinhalte die in QR Codes verpackt werden können.
 * Der enum QR_TYPE zeigt, welche unterschiedlichen Arten von QR Codes
 * generiert werden können. Für jeden Typ gibt es eine Methode, die den 
 * entsprechend aufbereiteten Text zurück liefert.
 */
@Service
public class QrGeneratorService {
	private static final Logger logger = LoggerFactory.getLogger(QrGeneratorService.class);
	
	//Für die Email Validierung
	private static final Pattern rfc2822 = Pattern.compile(
	        "^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$"
	);
	
	public static enum QR_TYPE {
		TEXT, 
		URL, 
		WIFI,
		SMS,
		PHONE,
		GEOLOCATION,
		MAIL,
		CONTACT
	}
	
	/**
	 * 
	 * @param type - QR_TYPE enum dieser Klasse. Legt fest was erstellt werden soll
	 * @param params - Die Request Map eines HttpServletRequests
	 * 
	 * @return null, wenn Parameter fehlen, oder diese nicht korrekt waren 
	 * (Bsp: Ungültige Mail Adresse)
	 * 
	 * Oder liefert den "kodierten" / formatierten String zurück, der dann an
	 * das Rendering für den QR-Code gegeben werden kann 
	 */
	public String generate(QR_TYPE type, Map<String, String[]> params){
		logger.debug("generating text for type " + type);
		
		if(type == QR_TYPE.TEXT){
			return generateText(params);
		}
		else if(type == QR_TYPE.URL){
			return generateUrl(params);
		}
		else if(type == QR_TYPE.WIFI){
			return generateWifi(params);
		}
		else if(type == QR_TYPE.SMS){
			return generateSMS(params);
		}
		else if(type == QR_TYPE.PHONE){
			return generatePhone(params);
		}
		else if(type == QR_TYPE.GEOLOCATION){
			return generateGeoLocation(params);
		}
		else if(type == QR_TYPE.MAIL){
			return generateMail(params);
		}
		else if(type == QR_TYPE.CONTACT){
			return generateContact(params);
		}
		else{
			logger.warn("requested type of qr image is not supported. type: " + type);
		}
				
		/*Wenn noch nichts zurück gegeben wurde, wurden falsche, oder nicht alle
		Parameter übergeben */
		return null;		
	}
	
	// -------------------------------------------------------------------------
	
	/**
	 * content - text der codiert werden soll
	 */
	private String generateText(Map<String, String[]> params){
		String content = getFirstValue("content", params);
		
		if(!containsText(content)){
			logger.warn("missing parameter 'content'");
			return null;
		}
		
		return params.get("content")[0];
	}
	
	/**
	 * url - url die codiert werden soll
	 */
	private String generateUrl(Map<String, String[]> params){
		String url = getFirstValue("url", params);
		
		if(!containsText(url)){
			logger.warn("missing parameter 'url'");
			return null;
		}
		
		url = params.get("url")[0].toLowerCase();
		
		if(!url.startsWith("http://") && !url.startsWith("https://")){
			url = "http://" + url;
		}
		
		return url;
	}
	
	/**
	 * ssid - name des netzwerks
	 * password (optional) - wifi pass 
	 * wifitype - WPA / WEP / nopass
	 */
	private String generateWifi(Map<String, String[]> params){
		String ssid = getFirstValue("ssid", params);
		
		if(!containsText(ssid)){
			logger.warn("missing parameter 'ssid'");
			return null;
		}
		
		String password = getFirstValue("password", params);
		
		String wifitype = getFirstValue("wifitype", params);
		if(!containsText(wifitype)){
			logger.warn("missing parameter 'wifitype'");
			return null;
		}
		
		if(!wifitype.equals("WPA") && !wifitype.equals("WEP") && !wifitype.equals("nopass")){
			logger.warn("parameter 'wifitype' has an incorrect value: " + wifitype);
			return null;
		}
		
		if(!containsText(password)){
			return "WIFI:S:" + ssid + ";T:" + wifitype +";;";
		}
		else{
			return "WIFI:S:" + ssid + ";T:" + wifitype +";P:" + password + ";;";
		}
	}
	
	/**
	 * number - an wen die sms geschickt werden soll
	 * message (optional) - wenn schon ein text vorgefüllt werden soll 
	 */
	private String generateSMS(Map<String, String[]> params){
		String number = getFirstValue("number", params);
		
		if(!containsText(number)){
			logger.warn("missing parameter 'number'");
			return null;
		}
		
		String message = getFirstValue("message", params);
		
		if(!containsText(message)){
			return "smsto:" + number;
		}
		else{
			return "smsto:" + number + ":" + message;
		}
	}
	
	/**
	 * number - die telefonnummer 
	 */
	private String generatePhone(Map<String, String[]> params){
		String number = getFirstValue("number", params);
		
		if(!containsText(number)){
			logger.warn("missing parameter 'number'");
			return null;
		}
		
		return "tel:" + number;
	}
	
	/**
	 * latitude
	 * longitude
	 * query (optional) - suche die an der stelle ausgeführt werden soll 
	 */
	private String generateGeoLocation(Map<String, String[]> params){
		String latitude  = getFirstValue("latitude", params);
		String longitude = getFirstValue("longitude", params);
		
		if(!containsText(latitude)){
			logger.warn("missing parameter 'latitude'");
			return null;
		}
		
		if(!containsText(longitude)){
			logger.warn("missing parameter 'longitude'");
			return null;
		}
		
		String query = getFirstValue("query", params);
		
		if(!containsText(query)){
			return "geo:" + latitude + "," + longitude;
		}
		else{
			return "geo:" + latitude + "," + longitude + "?q=" + query;
		}
	}
	
	/**
	 * address - an wenn eine mail geschickt werden soll
	 * 
	 * generateMail kann auch dann null zurück liefern, wenn die mail adresse
	 * ungueltig ist.
	 */
	private String generateMail(Map<String, String[]> params){
		String address  = getFirstValue("address", params);
		
		if(!containsText(address)){
			logger.warn("missing parameter 'address'");
			return null;
		}

		if (!rfc2822.matcher(address.toLowerCase()).matches()) {
		    logger.warn("invalid email address: " + address);
		    return null;
		}
		
		return "mailto:" + address;
	}
	
	/**
	 * name
	 * company (optional)
	 * title (optional)
	 * phone (optional)
	 * mail (optional)
	 * address (optional)
	 * address2 (optional)
	 * web (optional)
	 * note (optional)
	 * 
	 * ist die email adresse ungültig, wird sie einfach weg gelassen. 
	 */
	private String generateContact(Map<String, String[]> params){
		String name  = getFirstValue("name", params);
		
		if(!containsText(name)){
			logger.warn("missing parameter 'name'");
			return null;
		}
		
		StringBuilder contact = new StringBuilder("BEGIN:VCARD\n");
		
		//Name
		contact.append("N:" + name + "\n");
		
		//Organisation
		String company = getFirstValue("company", params);
		if(containsText(company)){
			contact.append("ORG:" + company + "\n");
		}
		
		//Titel
		String title = getFirstValue("title", params);
		if(containsText(title)){
			contact.append("TITLE:" + title + "\n");
		}
		
		//Telefonnummer
		String phone = getFirstValue("phone", params);
		if(containsText(phone)){
			contact.append("TEL:" + phone + "\n");
		}
		
		//Homepage
		String web = getFirstValue("web", params);
		if(containsText(web)){
			contact.append("URL:" + web + "\n");
		}
		
		//Email Adresse
		String mail = getFirstValue("mail", params);
		if(containsText(mail)){
			if (rfc2822.matcher(mail).matches()) {
				contact.append("EMAIL:" + mail + "\n");
			}
		}
		
		//Adresse
		String address = getFirstValue("address", params);
		String address2 = getFirstValue("address2", params);
		if(containsText(address)){
			contact.append("ADR:" + address);
			
			if(containsText(address2)){
				contact.append(" " + address2 + "\n");
			}
			else{
				contact.append("\n");
			}
		}
		else{
			if(containsText(address2)){
				contact.append("ADR:" + address2 + "\n");
			}
		}
		
		//Anmerkung
		String note = getFirstValue("note", params);
		if(containsText(note)){
			contact.append("NOTE:" + note + "\n");
		}
		
		contact.append("END:VCARD");
		
		return contact.toString();
	}
	
	// HELPER
	
	/**
	 * Liefert den ersten Wert aus der Map params an der Stelle key zurück.
	 * 
	 * @param key
	 * @param params
	 * @return
	 */
	private String getFirstValue(String key, Map<String, String[]> params){
		try{
			String[] val = params.get(key);
			return val[0];
		}
		catch(Exception ex){
			return null;
		}
	}
	
	/**
	 * @return true - wenn der String nicht null und nicht leer ist, sonst false
	 */
	private boolean containsText(String val){
		if(val == null || val.isEmpty()){
			return false;
		}
		return true;
	}
}
