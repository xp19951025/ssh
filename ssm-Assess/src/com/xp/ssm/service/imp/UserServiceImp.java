package com.xp.ssm.service.imp;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xp.ssm.mapper.UserMapper;
import com.xp.ssm.pojo.Users;
import com.xp.ssm.service.UserService;
import com.xp.ssm.util.PageBean;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	UserMapper userMapper;
	
	//分页查询员工
	public PageBean<Users> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Users> pageBean = new PageBean<Users>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=10;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = userMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Users> list = userMapper.findByPage(map);
        pageBean.setList(list);

        return pageBean;
    }
	
	//多条件查询 根据姓名和部门ID
	public List<Users> selectByName(Users user){
		return userMapper.selectByName(user);
	}

	//添加用户
	@Override
	public int addUser(Users user) {
		// TODO Auto-generated method stub
		return userMapper.addUser(user);
	}

	//员工信息校验
	public boolean vaildate(String parameter) {
		Users vaildate = userMapper.vaildate(parameter);
		if(vaildate == null){
			return true;
		}else{
			return false;
		}
		
	}

	//根据员工id查询
	@Override
	public List<Users> selectByUserid(Integer userid) {
		// TODO Auto-generated method stub
		return userMapper.selectByUserid(userid);
	}

	//修改员工信息
	@Override
	public int updateUser(Users user) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(user);
	}

	//删除员工
	@Override
	public void deleteUser(String deletes) {
		// TODO Auto-generated method stub
		String[] split = deletes.split(",");
		for (String string : split) {
			userMapper.deleteUser(string);
		}
	}

	//根据部门id查询 用部门中的查看员工
	@Override
	public List<Users> depIdUser(Integer depid) {
		// TODO Auto-generated method stub
		return userMapper.depIdUser(depid);
	}

	//校验部门中是否有员工
	@Override
	public boolean checkout(String parameter) {
		// TODO Auto-generated method stub
		int checkout = userMapper.checkout(parameter);
		if(checkout == 0){
			return true;
		}else{
			return false;
		}
	}

}
