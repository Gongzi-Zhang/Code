import java.util.Date;
import java.text.SimpleDateFormat

Date objDate = new Date();
System.out.println(objDate.toString());

String dateFormat = "hh:mm:ss a dd-MMM-yyyy";
SimpleDateFormat objSDF = new SimpleDateFormat(dateFormat);
System.out.println(objSDF.format(objDate));

Date dt1 = objSDF.parse("20-08-1981");
Date dt2 = objSDF.parse("12-10-2012");
System.out.println("Date1: " + objSDF.format(dt1));

if (dt1.compareTo(dt2) > 0) {
    System.out.println("Date 1 occurs after Date 2");
}

