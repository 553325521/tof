package top.tsep.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConvert {
	public static String dateToString(Date date) {
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateString = formatter.format(date);
		 return dateString;
	}
}
