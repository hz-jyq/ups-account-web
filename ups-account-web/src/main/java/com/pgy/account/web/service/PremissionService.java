package com.pgy.account.web.service;

import java.util.List;
import java.util.Set;

import com.pgy.account.web.model.entity.Menu;
import com.pgy.account.web.model.entity.Role;
import com.pgy.account.web.model.entity.User;

public interface PremissionService {

	Set<Menu> queryUserMenus(User user, int menuLevel);

	List<Role> queryUserRoles(User user);

	List<Menu> queryAvalibleSubMenus(Menu m);

	List<String> getUserBlackNames(User user);


}
