package com.xp.ssm.mapper;

import java.util.List;

import com.xp.ssm.pojo.Department;

public interface DepMapper {
	
	List<Department> fandAllDep();//查询所有部门信息

	List<Department> selectByName(Department dep);//根据部门名称查询

	List<Department> selectDepId(Integer depid);//根据部门ID查询部门

	int updateDep(Department department);//修改部门
	
	Department vaildate(String parameter);//部门信息校验
	
	void addDep(Department department);//添加部门
	
	void deleteDep(String deletes);//删除部门
	
}
