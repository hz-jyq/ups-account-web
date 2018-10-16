package com.pgy.account.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pgy.account.web.dao.RoleDao;
import com.pgy.account.web.model.entity.Role;
import com.pgy.account.web.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Resource
	private RoleDao roleDao;
    
	/**
	 * 通过角色信息查询角色详情
	 */
	@Override
	public Role queryRole(Role role) {
		
		return roleDao.queryRole(role);
		
	}

}
