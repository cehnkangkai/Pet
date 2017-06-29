package cn.pet.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class UtilsFactory {
	

	// 
	public static String getUUid() {
		return UUID.randomUUID().toString().replace("-", "");
	}

	// 日期格式
	private static SimpleDateFormat sdf = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	public static String getDate() {
		return sdf.format(new Date());
	}

	// 获得新文件名
	public static String getDir(String uuid) {
		int dir1 = uuid.hashCode() & 0xf;// 按位运算
		int dir2 = (uuid.hashCode() & 0xf0) >> 4;
		return dir1 + "/" + dir2;
	}

}
