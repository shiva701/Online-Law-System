package onlineLaw;
import javax.crypto.*;
import java.io.*;
class key
{
	public static void main(String a[]) throws Exception
	{
		KeyGenerator k=KeyGenerator.getInstance("AES");
		k.init(128);
		SecretKey s=k.generateKey();
		FileOutputStream f=new FileOutputStream("C:\\Users\\shiva\\Desktop\\project\\finalonlineLaw\\src\\java\\onlineLaw\\key.txt");
		ObjectOutputStream o=new ObjectOutputStream(f);
		o.writeObject(s);
                o.close();
                f.close();
	}
}