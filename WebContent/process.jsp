<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String[] code=request.getParameter("code").split(",");
int[] codes=(int[])request.getSession().getAttribute("codes");
System.out.println("user:"+Arrays.toString(code));
System.out.println("system:"+Arrays.toString(codes));
int result=0;
for(int n=0;n<code.length;n++)
{
	if(Integer.parseInt(code[n])==codes[n])
	{
		result++;		
	}
}

if(result==3)
{
%>
验证码成功!
<%	
}else
{
%>
验证码错误!
<%	
}
%>