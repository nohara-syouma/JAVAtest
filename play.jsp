<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
	String btn = request.getParameter("num");
        
    // 残数の更新処理(残数の取得、更新、保存など)
     if (session.getAttribute("totalNum") == null) {
        session.setAttribute("totalNum", 25);
    }
    
    int totalNum = (int) session.getAttribute("totalNum");  // 残数用の変数。仮で25をセットしている。必要に応じて変更
    
    
  if(Utility.isNullOrEmpty(btn)){
	  
	  int btnnum = 0;
	  //session.getAttribute("playerNum");
	  
  }else{
	  		  
    int btnnum = Integer.parseInt(btn);
       
    switch (btnnum){
    
    case 1:
    	totalNum -= 1;
    	
    	break;
    	
    case 2:
    	totalNum -= 2;
    	break;
    	
    case 3:
    	totalNum -= 3;
    	break;
    	}
    
  }

    
    session.setAttribute("totalNum", totalNum); //保持
    
    // プレイヤーの切替処理(プレイヤーの取得、切替、保存など)
    
    
    if (session.getAttribute("playerNum") == null) {
        session.setAttribute("playerNum", "A");       
    }
    
    String player = (String) session.getAttribute("playerNum");// プレイヤー用の変数。仮で"A"をセットしている。必要に応じて変更
    
    
    if(player.equals("A")){
    	
    	session.setAttribute("playerNum", "B");
    }else{
    	session.setAttribute("playerNum", "A");
    }    
         
    // 残数が0以下の場合、結果ページへ遷移
    
  //残数が0以下なら、「〇〇.jsp」へ遷移
  // (responseオブジェクトのsendRedirectメソッドを使用する)
  	if( totalNum <= 0){
  		
  	response.sendRedirect("finish.jsp");
  	
  	
  	
	}
    
    
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java基礎課題</title>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
  <h1>石取りゲーム</h1>

  <div class="info">
    <h2>
      残り：<%= totalNum %>個
    </h2>
    <p class="stone">
      <%
      // todo:このprint分は仮の処理。実装が完了したら削除する。
                // 表示する文字列("●●～")をメソッドを使い取得し、取得した文字列を表示する
               // out.println("●●●●●●●●●●<br>●●●●●●●●●●<br>●●●●●");
            
            /*
           	String [] a3 = new String[totalNum];
           	Utility.getStoneDisplayHtml(a3, "●");
           	
           	for(int i=0;i<a3.length;i++){
           		
           		out.print(a3[i]);
           		
           		if(i==9 || i==19){
           			out.print("<br>");
           		}
           	}*/
           	
           	String kabu = Utility.getStoneDisplayHtml(totalNum);
           	
           	
           	out.print(kabu);
           	
			
           	
      %>
    </p>
  </div>
  <div class="info">
    <h2>
      プレイヤー<%= player %>の番
    </h2>

    <form action="play.jsp">
      <p>
        石を
        <input type="number" name="num" min="1" max="3">
        個取る<br> ※1度に3個取れます。
      </p>
      <button class="btn" type="submit">決定</button>
    </form>
  </div>
</body>
</html>