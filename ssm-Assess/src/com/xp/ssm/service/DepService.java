package com.xp.ssm.service;

import java.sql.SQLException;
import java.util.List;

import com.xp.ssm.pojo.Department;

public interface DepService {
	
	List<Department> fandAllDep()throws SQLException;//查询所有部门

	List<Department> selectByName(Department dep)throws SQLException;//根据部门名称查询

	List<Department> selectDepId(Integer depid);//根据部门ID查询部门

	int updateDep(Department department);//修改部门

	boolean vaildate(String parameter)throws SQLException;//校验部门是否存在

	void addDep(Department department);//添加部门

	void deleteDep(String deletes);//删除部门
}
