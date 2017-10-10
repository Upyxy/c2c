package com.c2c.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class JsonUtil {

	/**
	 * 写入对象响应流
	 * 
	 * @param o
	 * @param response
	 */
	public static void writeJSON(Object o, HttpServletResponse response) {
		if (null == o) {
			return;
		}
		PrintWriter pt = null;
		try {
			// 获取输出流
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json;charset=utf-8");
			pt = response.getWriter();
			// 序列化对象
			String json = JSON.toJSONStringWithDateFormat(o,
					"yyyy-MM-dd HH:mm:ss",
					SerializerFeature.DisableCircularReferenceDetect);
			// 写入对象
			pt.write(json);
			pt.flush();
			pt.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 关闭
			pt.close();
		}
	}
}
