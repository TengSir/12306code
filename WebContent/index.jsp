<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var allYourChoide = new Array();
	function show(x) {
			allYourChoide.push(x);
			if(allYourChoide.length>3)
			{
					var  n=allYourChoide.shift();
					document.getElementById("img" + n).style.display = 'none';
			}
// 			alert("长度:"+allYourChoide.length+"\r\n"+"内容:"+allYourChoide.toString());
			document.getElementById("img" + x).style.display = 'block';
			document.getElementById("img" + x).style.left = (event.clientX - 10)+"px";
			document.getElementById("img" + x).style.top = (event.clientY - 10)+"px";
			
	}
	function change(x) {
		x.src = "code.jsp?time=" + new Date();
	}
	var count = 1;
	function hiddenThis(x) {
		document.getElementById("img" + x).style.display = 'none';
		document.getElementById("img" + x).style.left = (0)+"px";
		document.getElementById("img" + x).style.top = (0)+"px";
	}
	function sendMessage(){
		document.getElementById("choice").value=allYourChoide.sort();
		return true;
	}
</script>
</head>
<body>
	<form action="process.jsp" method="post"  onsubmit="sendMessage()">
		<input type="hidden"  id="choice"  name="code"  />
		验证码:
		<table width="300"  height="340"  background="code.jsp">
			<tr height="135">
				<td onclick="javascript:show(1)">
					<img ondblclick="hiddenThis(1)" id="img1" src="imgs/12306.png"  width="20" height="20" style="display: none; position: absolute; left: 0px; top: 0px;" />
				</td>
				<td onclick="javascript:show(2)">
					<img ondblclick="hiddenThis(2)" id="img2" src="imgs/12306.png"  width="20" height="20" style="display: none; position: absolute; left: 0px; top: 0px;" />
				</td>
				<td onclick="javascript:show(3)">
					<img ondblclick="hiddenThis(3)" id="img3" src="imgs/12306.png"  width="20" height="20" style="display: none; position: absolute; left: 0px; top: 0px;" />
				</td>
			</tr>
			<tr>
				<td onclick="javascript:show(4)">
					<img ondblclick="hiddenThis(4)" id="img4" src="imgs/12306.png"  width="20" height="20" style="display: none; position: absolute; left: 0px; top: 0px;" />
				</td>
				<td onclick="javascript:show(5)">
					<img ondblclick="hiddenThis(5)" id="img5" src="imgs/12306.png"  width="20" height="20" style="display: none; position: absolute; left: 0px; top: 0px;" />
				</td>
				<td onclick="javascript:show(6)">
					<img ondblclick="hiddenThis(6)" id="img6" src="imgs/12306.png"  width="20" height="20" style="display: none; position: absolute; left: 0px; top: 0px;" />
				</td>
			</tr>
			<tr>
				<td onclick="javascript:show(7)">
					<img ondblclick="hiddenThis(7)" id="img7" src="imgs/12306.png"  width="20" height="20" style="display: none; position: absolute; left: 0px; top: 0px;" />
				</td>
				<td onclick="javascript:show(8)">
					<img ondblclick="hiddenThis(8)" id="img8" src="imgs/12306.png"  width="20" height="20" style="display: none; position: absolute; left: 0px; top: 0px;" />
				</td>
				<td onclick="javascript:show(9)">
					<img ondblclick="hiddenThis(9)" id="img9" src="imgs/12306.png"  width="20" height="20" style="display: none; position: absolute; left: 0px; top: 0px;" />
				</td>
			</tr>
		</table>
		 <input
			type="submit" />
	</form>
</body>
</html>