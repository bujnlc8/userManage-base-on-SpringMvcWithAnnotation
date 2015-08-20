package com.haihuiling.spring.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.haihuiling.spring.entity.Userinfo;
import com.haihuiling.spring.service.impl.IUserInfoService;

/**
 * 
 * @author haihuiling
 * @date 2015-8-20 上午10:33:01
 */
@Controller
@RequestMapping(value = "/user")
public class UserInfoController {
	@Autowired
	private IUserInfoService userInfoService;
/**获取人员信息列表
 * ModelAndView
 * @param user
 * @return
 *下午9:50:04
 */
	@RequestMapping(value = "/userInfoList.do", method = { RequestMethod.POST,RequestMethod.GET })
	public ModelAndView getUserInfoList(Userinfo user) {
		List<Object> userList = userInfoService.getUserInfoList(
				user.getUsername(), user.getUsersex(), user.getUseraddress(),
				user.getUserage());
		ModelAndView modelAndView = new ModelAndView("userInfoList");
		modelAndView.addObject("userInfo", userList);
		return modelAndView;
	}
/**判断输入的信息是否有效
 * void
 * @param response
 * @param request
 *下午9:49:38
 */
	@RequestMapping(value = "/isuserValid.do", method = { RequestMethod.GET })
	public void isUserValid(HttpServletResponse response,
			HttpServletRequest request) {
		PrintWriter writer = null;
		HttpSession session = request.getSession();
		try {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			writer = response.getWriter();
			System.out.println(name);
			if (name.equals("") || name == null) {
				writer.print("isBlank");
			} else {
				if (name.equals("haihuiling") && password.equals("123456")) {
					session.setAttribute("logined_user", name);
					writer.print("valid");
				} else {
					writer.print("invalid");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			writer.flush();
			writer.close();
		}
	}
	/**登陆
	 * String
	 * @return
	 *下午9:50:22
	 */
	@RequestMapping(value = "login.do", method = { RequestMethod.POST })
	public  String toUserInfoList(){
		return "login.jsp";
	}
	/**跳转到增加人员的页面
	 * String
	 * @return
	 *下午9:50:38
	 */
	@RequestMapping(value="goUserInfoAdd.do")
	public String toAddUserInfo(){
		return "userInfoAdd";
	}
	/**增加人员信息
	 * String
	 * @param username
	 * @param userage
	 * @param userbirthday
	 * @param useraddress
	 * @param usersex
	 * @param userjob
	 * @return
	 *下午9:51:05
	 */
	@RequestMapping(value="userInfoAdd.do")
	public String addUserInfo(String username,String userage,String userbirthday,String useraddress,String usersex,String userjob){
		Date birthdDate = Date.valueOf(userbirthday);
		long mill =System.currentTimeMillis(); 
		userInfoService.addUser(new Userinfo(String.valueOf(mill), username, userage, birthdDate, useraddress, usersex, userjob));
		return "redirect:userInfoList.do";
	}
	/**删除人员信息
	 * String
	 * @param qqIds
	 * @return
	 *下午9:51:27
	 */
	@RequestMapping(value="deleteUserInfo.do")
	public String deleteUserInfo(String[] qqIds){
		userInfoService.deleteUser(qqIds);
		return "redirect:userInfoList.do";
	}
	/**跳转到人员信息编辑页面
	 * String
	 * @param userid
	 * @param modelMap
	 * @return
	 *下午9:51:42
	 */
	@RequestMapping(value="goUserInfoEdit.do")
	public String goUserInfoEdit(@RequestParam("qqId")String userid,ModelMap modelMap){
		modelMap.addAttribute("userObject",userInfoService.getById(userid));
		return "userInfoEdit";
	}
	/**人员信息编辑处理
	 * String
	 * @param qqId
	 * @param username
	 * @param userage
	 * @param userbirthday
	 * @param useraddress
	 * @param usersex
	 * @param userjob
	 * @return
	 *下午9:52:21
	 */
	@RequestMapping(value="userInfoEdit.do")
	public String editUserInfo(String qqId,String username,String userage,String userbirthday,String useraddress,String usersex,String userjob){
		Userinfo userinfo = (Userinfo) userInfoService.getById(qqId);
		if(null!=useraddress||useraddress!=""){
		userinfo.setUseraddress(useraddress);}
		if(null!=userage||userage!=""){
		userinfo.setUserage(userage);}
		if(null!=userbirthday||userbirthday!=""){
		userinfo.setUserbirthday(Date.valueOf(userbirthday));}
		if(null!=userjob||userjob!=""){
		userinfo.setUserjob(userjob);}
		if(null!=username||username!=""){
		userinfo.setUsername(username);}
		if(null!=usersex||usersex!=""){
		userinfo.setUsersex(usersex);}
		userInfoService.modifyUser(userinfo);
		return "redirect:userInfoList.do";
	}
	/**人员详情显示
	 * String
	 * @param userid
	 * @param modelMap
	 * @return
	 *下午10:08:56
	 */
	@RequestMapping(value="userInfoDetail.do")
	public String GetuserInfoDetail(@RequestParam("qqId")String userid,ModelMap modelMap){
		modelMap.addAttribute("userObject",userInfoService.getById(userid));
		return "userInfoDetail";
	}
	
}
