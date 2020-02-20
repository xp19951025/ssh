package com.xp.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xp.ssm.pojo.Department;
import com.xp.ssm.service.DepService;

import net.sf.json.JSONObject;

@Controller
public class DepController {
	@Autowired
	DepService depService;
	
	@RequestMapping(value="/dep.action")
	//查询所有部门
	public String selectDep(Model model) throws SQLException{
		
		List<Department> fandAllDep = depService.fandAllDep();
		model.addAttribute("deps", fandAllDep);
		return "listDep";
	}
	
	//部门名称查询
	@RequestMapping(value="selectbyname.action")
	public String selectByName(Department dep, Model model) throws SQLException{
		List<Department> selectByName = depService.selectByName(dep);
		model.addAttribute("deps", selectByName);
		return "listDep";
	}
	
	//跳转到修改部门页面
	@RequestMapping(value="/selectdep.action")
	public String selectDep(Integer depid, Model model){
		//通过部门id查询部门
		List<Department> selectDepId = depService.selectDepId(depid);
		model.addAttribute("dep", selectDepId);
		return "updateDep";
	}
	
	//修改部门
	@RequestMapping(value="/updatedep.action")
	public String updateDep(Department department){
		depService.updateDep(department);
		return "updateDep";
	}
	
	//部门校验
	@RequestMapping(value="/checkDep.action")
	public void vaildateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException{
		String parameter = req.getParameter("depname");
		boolean vaildate = depService.vaildate(parameter);
		JSONObject jsonObject = new JSONObject();
		
		if(vaildate){
			jsonObject.put("state", true);
		}else{
			jsonObject.put("state", false);
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(jsonObject);
		writer.close();
	}

	//添加页面跳转
	@RequestMapping(value="/add.action")
	public String add(){
		return "addDep";
	}
	
	//添加部门
	@RequestMapping(value="/addDep.action")
	public String addDep(Department department){
		depService.addDep(department);
		return "addDep";
	}
	
	//删除部门
	@RequestMapping(value="/deleteDep")
	public String deleteUser(String deletes, Model model) throws SQLException{
		depService.deleteDep(deletes);
		return "redirect:/dep.action";
	}
	
	//跳转到主界面
	@RequestMapping(value="/indexDep.action")
	public String index() throws SQLException{
		return "redirect:/";
	}
	
}
