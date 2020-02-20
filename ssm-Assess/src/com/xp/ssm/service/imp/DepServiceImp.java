package com.xp.ssm.service.imp;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xp.ssm.mapper.DepMapper;
import com.xp.ssm.pojo.Department;
import com.xp.ssm.service.DepService;

@Service
public class DepServiceImp implements DepService {
	@Autowired 
	DepMapper depMapper;

	//查询所有部门
	public List<Department> fandAllDep() {
		// TODO Auto-generated method stub
		List<Department> fandAllDep = depMapper.fandAllDep();
		
		return fandAllDep;
	}

	//根据部门名称查询
	@Override
	public List<Department> selectByName(Department dep) throws SQLException {
		// TODO Auto-generated method stub
		return depMapper.selectByName(dep);
	}

	//根据部门id查询部门
	@Override
	public List<Department> selectDepId(Integer depid) {
		// TODO Auto-generated method stub
		return depMapper.selectDepId(depid);
	}

	//修改部门信息
	@Override
	public int updateDep(Department department) {
		// TODO Auto-generated method stub
		return depMapper.updateDep(department);
	}

	//部门信息校验
	public boolean vaildate(String parameter) {
		Department vaildate = depMapper.vaildate(parameter);
		if(vaildate == null){
			return true;
		}else{
			return false;
		}
		
	}
	
	//添加部门
	@Override
	public void addDep(Department department) {
		// TODO Auto-generated method stub
		depMapper.addDep(department);
	}

	//删除部门
	@Override
	public void deleteDep(String deletes) {
		// TODO Auto-generated method stub
		String[] split = deletes.split(",");
		for (String string : split) {
			depMapper.deleteDep(string);
		}
	}
	
}
