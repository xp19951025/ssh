package com.xp.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xp.ssm.pojo.Users;
import com.xp.ssm.service.DepService;
import com.xp.ssm.service.UserService;

import net.sf.json.JSONObject;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	DepService depservice;
	
	//分页查询所有员工信息
	@RequestMapping(value="/list.action")
	public String selectAll(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model) throws SQLException{
		model.addAttribute("pagemsg", userService.findByPage(currentPage));//回显分页数据    
		model.addAttribute("dep", depservice.fandAllDep());//部门下拉框
		
		return "listUsers";
	}
	
	//条件查询
	@RequestMapping(value="/emps.action" )
	public String fandByName(Users user,Model model) throws SQLException{
		//根据姓名和部门ID查询
		List<Users> selectByName = userService.selectByName(user);
		model.addAttribute("user", selectByName);
		
		return "fandByName";
	}
	
	//根据部门 id查询员工
	@RequestMapping(value="/depId.action")
	public String updateUserPage(Integer depid, Model model) throws SQLException{
		List<Users> depIdUser = userService.depIdUser(depid);
		model.addAttribute("user", depIdUser);
		return "fandByName";
	}
	
	//用户添加
	@RequestMapping(value="/addUsers.action")
	public String addUser(Users user) throws SQLException{
		userService.addUser(user);
		return "listUsers";
	}
	
	//用户校验
	@RequestMapping(value="/checkuser.action")
	public void vaildateUser(String username, HttpServletResponse resp) throws IOException, SQLException{
		boolean vaildate = userService.vaildate(username);//数据库中查询是否已存在
		JSONObject jsonObject = new JSONObject();//转换为json数据
		
		if(vaildate){
			jsonObject.put("state", true);
		}else{
			jsonObject.put("state", false);
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(jsonObject);
		writer.close();
	}
	
	//跳转到员工修改页面
	@RequestMapping(value="/update.action")
	public String updateUserPage(Integer userid, Model model, int currentPage) throws SQLException{
		//获取后台传入的员工id值并查询
		model.addAttribute("update", userService.selectByUserid(userid));
		model.addAttribute("dep", depservice.fandAllDep());//部门下拉框
		model.addAttribute("pagemsg", userService.findByPage(currentPage));//用于跳转到当前页面
		return "updateUsers";
	}
	
	//员工修改
	@RequestMapping(value="/updateUser.action")
	public String updateUser(Users user) throws SQLException{
		userService.updateUser(user);
		return "updateUsers";
	}
	
	//员工删除
	@RequestMapping(value="/deleteUser.action")
	public String deleteUser(String deletes, Model model) throws SQLException{
		userService.deleteUser(deletes);
		
		return "redirect:/list.action";
	}
	
	//跳转到主界面
	@RequestMapping(value="/indexUser.action")
	public String index() throws SQLException{
		return "redirect:/";
	}
	
	//部门删除前的判断
	@RequestMapping(value="checkout.action")
	public void checkout(String depid, HttpServletResponse resp) throws IOException, SQLException{
		boolean checkout = userService.checkout(depid);
		JSONObject jsonObject = new JSONObject();
		
		if(checkout){
			jsonObject.put("dep", true);
		}else{
			jsonObject.put("dep", false);
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(jsonObject);
		writer.close();
	}
	
}
