package com.xp.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import com.xp.ssm.pojo.Users;

public interface UserMapper {

	int addUser(Users user);//添加员工信息

    List<Users> findByPage(HashMap<String,Object> map);	// 分页操作，调用findByPage limit分页方法
    
    int selectCount();//查询总记录数
    
    List<Users> selectByName(Users user);//根据姓名和部门ID查询
    
    Users vaildate(String parameter);//员工信息校验
    
    List<Users> selectByUserid(Integer userid);//根据员工id查询
    
    int updateUser(Users user);//修改员工信息
    
    void deleteUser(String deletes);//删除员工信息

	List<Users> depIdUser(Integer depid);//根据部门id查询 用部门中的查看员工

	int checkout(String parameter);//校验部门中是否与员工
	
}
