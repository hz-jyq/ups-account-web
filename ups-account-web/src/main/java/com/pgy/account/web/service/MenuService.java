package com.pgy.account.web.service;

import com.pgy.account.web.model.entity.Menu;

public interface MenuService {
    
	/**
	  *  根据菜单信息查询菜单
	 * @param m
	 * @return
	 */
	Menu queryMenu(Menu m);

}
