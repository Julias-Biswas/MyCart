package com.mycart.helper;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {

	// get 10 words
	public static String getTenWords(String productDescription) {
		String[] str = productDescription.split(" ");

		if (str.length > 10) {

			String res = "";

			for (int i = 0; i < 10; i++) {
				res = res + str[i] + "\n";
			}

			return (res);

		} else {
			return (productDescription);
		}
	}

	// get 5 words
	public static String getFiveWords(String text) {
		String[] str = text.split(" ");

		if (str.length > 5) {

			String res = "";

			for (int i = 0; i < 5; i++) {
				res = res + str[i] + "\n";
			}

			return res;
		} else {
			return text;
		}
	}

	// get product price after discount
	public static double getDiscount(double price, int discount) {
		
		DecimalFormat df = new DecimalFormat("0.00");
		
		double totalDiscount = (discount * price / 100);

		double totalPriceAfterDiscount = Double.parseDouble(df.format(price - totalDiscount));

		return totalPriceAfterDiscount;
	}
	
	public static Map<String, Long> getCounts(SessionFactory factory) {
		
		Session session = factory.openSession();
		
		String q1 = "SELECT COUNT(*) FROM User";
		String q2 = "SELECT COUNT(*) FROM Product";
		
		Query query1 = session.createQuery(q1);
		Query query2 = session.createQuery(q2);
		
		Long userCount = (Long) query1.list().get(0);
		Long productCount = (Long) query2.list().get(0);
		
		Map<String, Long> map = new HashMap();
		
		map.put("userCount", userCount);
		map.put("productCount", productCount);		
		
		session.close();
		
		return map;
		
	}
}
