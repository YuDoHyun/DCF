package com.study.springboot;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;

public class EchoClient{
	Socket client = null;
	
	String ip;
	static final int PORT = 7000;
	
	BufferedReader reader;
	
	InputStream is;
	ObjectInputStream ois;
	
	OutputStream os;
	ObjectOutputStream oos;

	String receiveData;
	
	public EchoClient() {
		try {
			this.client=new Socket("127.0.0.1", PORT);
			
			this.os = client.getOutputStream();
			this.oos= new ObjectOutputStream(os);
			
			this.is = client.getInputStream();
			this.ois = new ObjectInputStream(is);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String send(String sendData) {
		if(sendData.equals("quit")) {
			try {
				if(is!=null) is.close();
				if(ois!=null) ois.close();
				if(os!=null) os.close();
				if(oos!=null) oos.close();
				if(client!=null) client.close();
			}catch(Exception e) { e.printStackTrace(); }
	}
		try {
			(this.oos).writeObject(sendData);
			(this.oos).flush();
			
			this.receiveData = (String)ois.readObject();
			
			return receiveData;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return receiveData;
		
	}
	
}