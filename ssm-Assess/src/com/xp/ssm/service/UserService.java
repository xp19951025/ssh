package com.xp.ssm.service;

import java.sql.SQLException;
import java.util.List;

import com.xp.ssm.pojo.Users;
import com.xp.ssm.util.PageBean;

public interface UserService {

	PageBean<Users> findByPage(int currentPage)throws SQLException;//分页查询
	
	List<Users> selectByName(Users user)throws SQLException;//根据姓名和部门ID查询
	
	int addUser(Users user)throws SQLException;//添加用户
	
	boolean vaildate(String parameter)throws SQLException;//校验员工是否存在
	
	List<Users> selectByUserid(Integer userid)throws SQLException;//根据员工id查询
	
	int updateUser(Users user)throws SQLException;//修改员工信息

	void deleteUser(String deletes)throws SQLException;//删除员工

	List<Users> depIdUser(Integer depid);//根据部门id查询 用部门中的查看员工

	boolean checkout(String parameter);//校验部门中是否有员工

}
