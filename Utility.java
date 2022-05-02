package util;

public class Utility {

    /**
     * 引数に指定した文字列がnull、または空文字かを判定します。
     * @param str
     * @return
     */
    public static boolean isNullOrEmpty(String str) {
        if(str == null || str.isEmpty()) {
            return true;
        }else {
            return false;
        }
    }

    /**
     * 石の残数に応じて表示する"●"用のhtmlソースを生成します
     * @return
     */
    // todo:ここにgetStoneDisplayHtmlメソッドを定義
    
    /*
    public static void getStoneDisplayHtml(String [] x, String y) {
    	
    	for (int i = 0; i < x.length; i++) {
    		//String z = Integer.parseInt(y);
    		
            x[i] = y;
        }
    }*/
    
    
    public static String getStoneDisplayHtml(int x) {
    	
    	String kabu = "";
    	
    	for(int i=0; i<x; i++) {
    		    		    		
    		kabu += "●";
    		
    		if(i % 10 == 9) {
    			kabu += "<br>";
    		}
    		
    		
    	}
    	
    	return kabu;
    	
    	
    }

}
