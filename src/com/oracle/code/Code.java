package com.oracle.code;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;


public class Code {

	public static void main(String[] args) {
		HashMap<String, String[]>  imgs=new HashMap<>();
		imgs.put("����", new String[]{"WebContent/imgs/1.jpg","WebContent/imgs/9.jpg","WebContent/imgs/10.jpg"});
		imgs.put("����", new String[]{"WebContent/imgs/11.jpg","WebContent/imgs/12.jpg","WebContent/imgs/3.jpg"});
		imgs.put("è", new String[]{"WebContent/imgs/5.jpg","WebContent/imgs/4.jpg","WebContent/imgs/8.jpg"});
		imgs.put("����", new String[]{"WebContent/imgs/7.jpg","WebContent/imgs/2.jpg","WebContent/imgs/6.jpg"});
		int width=400,height=400;
		BufferedImage  b=new BufferedImage(width,height,Image.SCALE_DEFAULT);//���ڴ��д���һ��ͼƬ
		Graphics  gra=b.getGraphics();//�Ӹ�ͼ���ϻ�ȡ���ʶ���
		gra.drawLine(0, 0, width, height);
		gra.setColor(Color.white);
		gra.fillRect(0, 0, width, height);
		gra.setColor(Color.black);
		gra.setFont(new Font("����",Font.ITALIC,20));
		String[]  names={"����","����","è","����"};
		String key=names[new Random().nextInt(names.length)];
		gra.drawString("����ͼ�е�:"+key+"....", 50, 30);
		
		
		//1.���������������֤��������������
		String[]  allImages=imgs.get(key);//���ȡһ����֤����Ҫ�����������ͼƬ����
		List<String>  images=new ArrayList<>();
		for(String s:allImages)
		{
			images.add(s);
		}
		for(int n=0;n<6;n++){
			images.add(("WebContent/imgs/"+(new Random().nextInt(15)+100)+".jpg"));
		}
		Collections.shuffle(images);//���ϵİ������ṩһ��������ҵ��㷨
		
		int x=50,y=50,index=1;
		for(String imgPath:images){
			Image  i=null;
			try {
				i=ImageIO.read(new File(imgPath));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			gra.drawImage(i,x,y,80,80,null);
			if(index%3==0)
			{
				x=50;
				y+=100;
			}else
			{
				x+=100;
			}
			index++;
			
		}
		
//		String[] fontNames={"����","����","����","����Ҧ��","��������","����"};
//		for(int n=0;n<100;n++)
//		{
//			Color c=new Color(new Random().nextInt(255),new Random().nextInt(255),new Random().nextInt(255));
//			gra.setColor(c);
//			gra.fillOval(new Random().nextInt(width), new Random().nextInt(height), 2, 2);
////			gra.drawLine(new Random().nextInt(width), new Random().nextInt(width),new Random().nextInt(width),new Random().nextInt(width));
//		}
//		for(int n=0;n<5;n++)
//		{
//			Color c=new Color(new Random().nextInt(255),new Random().nextInt(255),new Random().nextInt(255));
//			gra.setColor(c);
//			Font f=new Font(fontNames[new Random().nextInt(fontNames.length)],new Random().nextInt(1)%2==0?Font.BOLD:Font.ITALIC, new Random().nextInt(30)+10);
//			gra.setFont(f);
//			
//			gra.drawString((n%2==0)?(((char)(new Random().nextInt(26)+97))+""):new Random().nextInt(9)+"", x, 25);
//			x+=20;
//		}
//		
//		for(int n=0;n<1000;n++)
//		{
//			Color c=new Color(new Random().nextInt(255),new Random().nextInt(255),new Random().nextInt(255));
//			gra.setColor(c);
//			gra.drawLine(new Random().nextInt(width), new Random().nextInt(width),new Random().nextInt(width),new Random().nextInt(width));
//		}
		try {
			ImageIO.write(b, "jpeg", new File("D:\\1.jpg"));//ҵ��bean(����new��������������̬)
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
