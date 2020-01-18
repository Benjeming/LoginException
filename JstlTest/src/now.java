import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;

public class now {
    public static void main(String[] args) {
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = simpleDateFormat.format(new Date());
        System.out.println(format);
        System.out.println(new Date());
    }
}
