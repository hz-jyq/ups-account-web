package com.pgy.account.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pgy.account.web.dao.MenuDao;
import com.pgy.account.web.model.entity.Menu;
import com.pgy.account.web.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{
	
	@Resource
	private MenuDao menuDao;

	@Override
	public Menu queryMenu(Menu m) {
		
		return menuDao.queryMenu(m);
	}

}
