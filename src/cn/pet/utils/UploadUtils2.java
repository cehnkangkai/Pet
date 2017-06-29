package cn.pet.utils;

import java.util.UUID;

public class UploadUtils2 {
	
	public static  String  getUUIDName(String filename[]) {
		int i=0;
		//先查找
		int index= filename[i].indexOf(".");
		//截取
		String lastname = filename[i].substring(index, filename[i].length());
		//生成唯一字符串
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid+lastname;
		
	}
	public static void main(String[] args) {
		String[] filename={"123.jsp","456.jsp"};
		for(int i= 0;i<filename.length;i++){
			
			String uuid = getUUIDName(filename);
			System.out.println(uuid);
		}
	}
}
