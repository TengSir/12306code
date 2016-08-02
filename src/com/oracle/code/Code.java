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
		imgs.put("钢琴", new String[]{"WebContent/imgs/1.jpg","WebContent/imgs/9.jpg","WebContent/imgs/10.jpg"});
		imgs.put("兔子", new String[]{"WebContent/imgs/11.jpg","WebContent/imgs/12.jpg","WebContent/imgs/3.jpg"});
		imgs.put("猫", new String[]{"WebContent/imgs/5.jpg","WebContent/imgs/4.jpg","WebContent/imgs/8.jpg"});
		imgs.put("口哨", new String[]{"WebContent/imgs/7.jpg","WebContent/imgs/2.jpg","WebContent/imgs/6.jpg"});
		int width=400,height=400;
		BufferedImage  b=new BufferedImage(width,height,Image.SCALE_DEFAULT);//在内存中创建一张图片
		Graphics  gra=b.getGraphics();//从该图像上获取画笔对象
		gra.drawLine(0, 0, width, height);
		gra.setColor(Color.white);
		gra.fillRect(0, 0, width, height);
		gra.setColor(Color.black);
		gra.setFont(new Font("黑体",Font.ITALIC,20));
		String[]  names={"兔子","钢琴","猫","口哨"};
		String key=names[new Random().nextInt(names.length)];
		gra.drawString("请点击图中的:"+key+"....", 50, 30);
		
		
		//1.先随机出来到底验证码生成神马玩意
		String[]  allImages=imgs.get(key);//随机取一种验证码重要包含的事务的图片数组
		List<String>  images=new ArrayList<>();
		for(String s:allImages)
		{
			images.add(s);
		}
		for(int n=0;n<6;n++){
			images.add(("WebContent/imgs/"+(new Random().nextInt(15)+100)+".jpg"));
		}
		Collections.shuffle(images);//集合的帮助类提供一个随机打乱的算法
		
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
		
//		String[] fontNames={"宋体","楷体","隶书","方正姚体","华文中宋","黑体"};
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
			ImageIO.write(b, "jpeg", new File("D:\\1.jpg"));//业务bean(不用new，方法几乎都静态)
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
