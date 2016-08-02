<%@page import="java.util.Arrays"%>
<%@page import="java.awt.image.ImageObserver"%>
<%@ page language="java" contentType="image/jpg"
    pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Image"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="java.awt.Font"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.util.HashMap"%>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
response.setContentType("image/jpeg");
HashMap<String, String[]>  imgs=new HashMap<String, String[]>();
imgs.put("钢琴", new String[]{"imgs/1.jpg","imgs/9.jpg","imgs/10.jpg"});
imgs.put("兔子", new String[]{"imgs/11.jpg","imgs/12.jpg","imgs/3.jpg"});
imgs.put("猫", new String[]{"imgs/5.jpg","imgs/4.jpg","imgs/8.jpg"});
imgs.put("口哨", new String[]{"imgs/7.jpg","imgs/2.jpg","imgs/6.jpg"});
int width=300,height=340;
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
String[]  allImages=imgs.get(key);//随机取一种验证码中要包含的事物的图片数组
List<String>  images=new ArrayList<String>();
for(String s:allImages)
{
	images.add(s);
}
for(int n=0;n<6;n++){
	images.add(("imgs/"+(new Random().nextInt(15)+100)+".jpg"));
}
Collections.shuffle(images);//集合的帮助类提供一个随机打乱的算法
int[]  indexes=new int[allImages.length];//定义一个数组用来存储生成的验证码位置
int Index=0;
for(int n=0;n<images.size();n++)
{
	for(int m=0;m<allImages.length;m++)
	{
		if(allImages[m]==images.get(n))
		{
			indexes[Index++]=n+1;
			break;
		}
	}
}
Arrays.sort(indexes);
request.getSession().setAttribute("codes", indexes);
System.out.println(Arrays.toString(indexes));
int x=10,y=50,index=1;
for(String imgPath:images){
	Image  i=null;
	try {
		i=ImageIO.read(new File(request.getRealPath("/"+imgPath)));
	} catch (IOException e1) {
		e1.printStackTrace();
	}
	gra.drawImage(i,x,y,80,80,new Color(new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)),null);
	if(index%3==0)
	{
		x=10;
		y+=100;
	}else
	{
		x+=100;
	}
	index++;
	
}

//String[] fontNames={"宋体","楷体","隶书","方正姚体","华文中宋","黑体"};
//for(int n=0;n<100;n++)
//{
//	Color c=new Color(new Random().nextInt(255),new Random().nextInt(255),new Random().nextInt(255));
//	gra.setColor(c);
//	gra.fillOval(new Random().nextInt(width), new Random().nextInt(height), 2, 2);
////	gra.drawLine(new Random().nextInt(width), new Random().nextInt(width),new Random().nextInt(width),new Random().nextInt(width));
//}
//for(int n=0;n<5;n++)
//{
//	Color c=new Color(new Random().nextInt(255),new Random().nextInt(255),new Random().nextInt(255));
//	gra.setColor(c);
//	Font f=new Font(fontNames[new Random().nextInt(fontNames.length)],new Random().nextInt(1)%2==0?Font.BOLD:Font.ITALIC, new Random().nextInt(30)+10);
//	gra.setFont(f);
//	
//	gra.drawString((n%2==0)?(((char)(new Random().nextInt(26)+97))+""):new Random().nextInt(9)+"", x, 25);
//	x+=20;
//}
//
//for(int n=0;n<1000;n++)
//{
//	Color c=new Color(new Random().nextInt(255),new Random().nextInt(255),new Random().nextInt(255));
//	gra.setColor(c);
//	gra.drawLine(new Random().nextInt(width), new Random().nextInt(width),new Random().nextInt(width),new Random().nextInt(width));
//}
try {
	ImageIO.write(b, "jpg", response.getOutputStream());//业务bean(不用new，方法几乎都静态)
} catch (IOException e) {
	e.printStackTrace();
}
response.getOutputStream().flush();
response.getOutputStream().close();
response.flushBuffer();
out.clear();
out=pageContext.pushBody();

%>

