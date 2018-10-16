package com.pgy.account.web.exception;


/**
 * 业务验证异常 
 * 运行时异常
 * @author acer
 *
 */
public class BussinessException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4097370868661431919L;
	
	public BussinessException(String message) {
		super(message);
	}

}
