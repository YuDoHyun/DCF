package com.study.springboot;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;


class EchoServerThread implements Runnable{
	Socket child;
	
	InputStream is;
	ObjectInputStream ois;
	
	OutputStream os;
	ObjectOutputStream oos;
	
	String receiveData;
	
	public EchoServerThread(Socket s) {
		child = s;
		try {
			System.out.println(child.getInetAddress()+"연결 됨");
			is = child.getInputStream();
			ois = new ObjectInputStream(is);
			
			os = child.getOutputStream();
			oos = new ObjectOutputStream(os);
			
		}catch( IOException e ) { e.printStackTrace(); }
	}

	@Override
	public void run() {
		try {
			while(true) {
				receiveData = (String)ois.readObject();
				System.out.println("client : " +receiveData);
				oos.writeObject(receiveData);
				oos.flush();
			}
		}catch( Exception e ) { 
			e.printStackTrace();
			System.out.println("클라이언트가 강제 종료"); }
		finally {
			try {
				is.close();
				os.close();
				ois.close();
				oos.close();
				child.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}
}