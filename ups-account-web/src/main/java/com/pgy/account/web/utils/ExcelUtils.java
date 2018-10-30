package com.pgy.account.web.utils;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.util.IOUtils;

public class ExcelUtils {

	private static Logger logger = LoggerFactory.getLogger(ExcelUtils.class);

	public static <T> void outputExcel(String fileName, String[] titles, String[] properties, List<T> list,
			HttpServletResponse response) {
		// 默认文件名为unknown
		fileName = StringUtils.isEmpty(fileName) ? "unknown" : fileName;
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet(fileName);
		// 创建表头
		if (ArrayUtils.isNotEmpty(titles)) {
			Row row0 = sheet.createRow(0);
			for (int i = 0; i < titles.length; i++) {
				Cell cell = row0.createCell(i, Cell.CELL_TYPE_STRING);
				cell.setCellValue(titles[i]);
				sheet.autoSizeColumn(i);
			}
		}

		if (CollectionUtils.isNotEmpty(list) && ArrayUtils.isNotEmpty(properties)) {
			int size = list.size();
			for (int i = 0; i < size; i++) {
				Row row = sheet.createRow(i+1);
				for (int j = 0; j < properties.length; j++) {
					Cell cell = row.createCell(j, Cell.CELL_TYPE_STRING);
					cell.setCellValue(getFieldValueByName(properties[j],list.get(i)));				
				}
				sheet.autoSizeColumn(i);
			}
		}

		OutputStream outputStream = null;
		try {
			fileName = new String(fileName.getBytes(),"ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("文件名编码异常！{}",e);
			fileName="unknown";
		}
		try {
			outputStream = response.getOutputStream();
			//response.setContentType("application/octet-stream;charset=ISO8859-1");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
			response.addHeader("Pargam", "no-cache");
			response.addHeader("Cache-Control", "no-cache");
			workbook.write(outputStream);
			outputStream.flush();
		} catch (IOException e) {
			logger.error("生成excel文件出错{}", ExceptionUtils.getStackTrace(e));
		} finally {
			IOUtils.close(outputStream);
		}

	}
	
	private static <T>  String getFieldValueByName(String fieldName, T t) {  
        try {    
            String firstLetter = fieldName.substring(0, 1).toUpperCase();    
            String getter = "get" + firstLetter + fieldName.substring(1);    
            Method method = t.getClass().getDeclaredMethod(getter);   
            Object value = method.invoke(t);  
            if(Objects.isNull(value)) {
            	return StringUtils.EMPTY;
            }
            return value.toString();    
        } catch (Exception e) {    
        	logger.error("反射获取对象属性值异常{}",ExceptionUtils.getStackTrace(e));
            throw new RuntimeException(e);  
        }    
    }   

}
