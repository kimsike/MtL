package member;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.Session;

public class EmailConfirm{
	
	public String connectEmail(String email){
		
		String to1=email; // �������� ����ڰ� �Է��� �̸����ּ�
		String host="smtp.gmail.com"; // smtp ����
		String subject="OUR TINY LIBRARY �̸��� �����ڵ� "; // ������ ���� ����
		String fromName="���� ������"; // ������ �̸� ����
		String from="kimsike26@gmail.com"; // ������ ���(���۰���)
		String authNum=EmailConfirm.authNum(); // ������ȣ ���� ���� �߻��κ�
		String content="������ȣ ["+authNum+"]"; // �̸��� ���� ����
		
        // SMTP �̿��ϱ� ���� �������ִ� ��������
		try{
		Properties props=new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", host);
		props.setProperty
                       ("mail.smtp.socketFactory.class",
                        "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.port","465");
		props.put("mail.smtp.user",from);
		props.put("mail.smtp.auth","true");
		
		Session mailSession 
           = Session.getInstance(props,new javax.mail.Authenticator(){
			    protected PasswordAuthentication getPasswordAuthentication(){
				    return new PasswordAuthentication
                                        ("kimsike26@gmail.com","shi9426@!"); // gmail����
			}
		});
		
		Message msg = new MimeMessage(mailSession);
		InternetAddress []address1 = {new InternetAddress(to1)};
		msg.setFrom(new InternetAddress
                      (from, MimeUtility.encodeText(fromName,"utf-8","B")));
		msg.setRecipients(Message.RecipientType.TO, address1); // �޴»�� ����
		msg.setSubject(subject); // ������
		msg.setSentDate(new java.util.Date()); // ������ ��¥ ����
		msg.setContent(content,"text/html; charset=utf-8"); // ���뼳��
		
		Transport.send(msg); // ���Ϻ�����
		}catch(MessagingException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return authNum;
	}

    // �����߻� function
	public static String authNum(){
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=4;i++){
			int num=(int)(Math.random()*9+1);
			buffer.append(num);
		}
		return buffer.toString();
	}
}