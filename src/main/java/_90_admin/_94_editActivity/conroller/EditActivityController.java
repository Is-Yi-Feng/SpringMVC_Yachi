package _90_admin._94_editActivity.conroller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _02_model.entity.AdminActivityBean;
import _02_model.entity.AdminCouponBean;
import _02_model.entity.AdminCouponTypeBean;
import _02_model.entity.CouponBean;
import _02_model.entity.ProductTypeBean;
import _02_model.entity.ShopBean;
import _10_member.entity.Member;
import _90_admin._94_editActivity.service.editActivityService;

@Controller
@RequestMapping("/admin")
@SessionAttributes({ "LoginOK","adminactivityList"})
public class EditActivityController {
	
	@Autowired
	editActivityService editactivityService;

	@Autowired
	ServletContext context;

//	???????????????????????????
//	@GetMapping("/admin_coupon")
//	public String getAddNewProductFormString(Model model) {
//		AdminCouponBean ac = new AdminCouponBean();
//		ac.setAdmincoupon_name("????????????????????????");
//		ac.setAdmincoupon_rule("?????????????????????????????????");
//		ac.setAdmincoupon_amount(30);
//		Date utilDate = new Date();
//		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//		ac.setAdmincoupon_begin(sqlDate);
//		ac.setAdmincoupon_consumption(400);
//		ac.setAdmincoupon_discount(60);
//		model.addAttribute("AdminCouponBean", ac); 
//		return "_16_admin/admin_coupon";
//	}
	
	//?????????????????????
	
	@RequestMapping("/admin/admin_activity")
	public String admin_activity(Model model) {  
		List<AdminActivityBean> activityList = editactivityService.getAllAdminActivities();
		model.addAttribute("adminactivityList", activityList);	
		return "_16_admin/admin_activity"; 
	}
	
	@GetMapping("modifyAdminActivity/{adminactivity_id}")
	public String showUpdateForm(Model model, @PathVariable Integer adminactivity_id) {
		
		AdminActivityBean adminactivityBean = editactivityService.getAdminActivity(adminactivity_id);
		model.addAttribute("AdminActivityBean", adminactivityBean);
		return "_16_admin/admin_updateactivity";
	}

	@PostMapping("modifyAdminActivity/{adminactivity_id}")
	public String updateForm(@ModelAttribute AdminActivityBean bean, Model model, BindingResult result,
			RedirectAttributes redirectAttributes, @PathVariable Integer adminactivity_id) {
		long sizeInBytes = -1;
		MultipartFile picture = bean.getAdminactivity_image();
		if (picture.getSize() == 0) {
			AdminActivityBean original = editactivityService.getAdminActivity(adminactivity_id);
			bean.setAdminactivity_pic(original.getAdminactivity_pic());
			bean.setAdminfile_name(original.getAdminfile_name());
		} else {
			sizeInBytes = picture.getSize();
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				bean.setAdminfile_name(originalFilename);
			}
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setAdminactivity_pic(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("????????????????????????: " + e.getMessage());
				}
			}
		}
		bean.setAdminactivity_id(adminactivity_id);
		Member ac = (Member) model.getAttribute("LoginOK");
		editactivityService.updateAdminActivity(bean);

		return "redirect:/admin/administrator";
	}

	@GetMapping("deleteAdminActivity/{adminactivity_id}")
	public String deleteAdminActivity(@PathVariable Integer adminactivity_id) {
		editactivityService.deleteAdminActivity(adminactivity_id);
		return "redirect:/admin_activity";
	}

	@GetMapping("/InsertAdminActivity")
	public String sendingEmptyForm(Model model, HttpSession session) {
		Member ac = (Member) model.getAttribute("LoginOK");
		AdminActivityBean aab = new AdminActivityBean();
		model.addAttribute("AdminActivityBean", aab);
		System.out.println("===============111===============");
		List<AdminActivityBean> adminactivities = editactivityService.getAllAdminActivities();
		System.out.println("===============2222===============");
		model.addAttribute("adminActivityList",adminactivities);
		System.out.println("===============3333===============");
		
		return "/_16_admin/admin_activity";
	}

	@PostMapping("/InsertAdminActivity")
	public String processFormData(@ModelAttribute("AdminActivityBean") AdminActivityBean adminactivityBean,
			BindingResult result, Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("===============4444===============");
		Member ac = (Member) model.getAttribute("LoginOK");
		MultipartFile picture = adminactivityBean.getAdminactivity_image();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			adminactivityBean.setAdminfile_name(originalFilename);
		}
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				adminactivityBean.setAdminactivity_pic(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("????????????????????????: " + e.getMessage());
			}
		}

		editactivityService.saveAdminActivity(adminactivityBean);
		
		return "redirect:/admin/administrator";
	}

	@RequestMapping(value = "_94_adminactivity/getPicture/{adminactivity_id}")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp, 
			@PathVariable Integer adminactivity_id){
		String filePath = "/data/images/mediumPic/noImage1.PNG"; //??????????????????
		byte[] pic = null;
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		AdminActivityBean aab = editactivityService.getAdminActivity(adminactivity_id);
		if(aab != null) {
			Blob blob = aab.getAdminactivity_pic();
			filename = aab.getAdminfile_name();
			if(blob != null) {
				try {
					System.out.println("0319");
					len = (int) blob.length();  //??????????????????
					pic = blob.getBytes(1, len); //???   jdbc??????????????????1??????
				} catch (SQLException e) {
					throw new RuntimeException("shopController???getPicture()??????SQLException: " + e.getMessage());
				}
			}else { //??????????????????
				System.out.println("0319-1");
				pic = toByteArray(filePath);
				filename = filePath;
			}
		}else {
			pic = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue()); //????????????????????????????????????
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType); //??????????????? mediaType ???????????????
		System.out.println("mediatype = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responoEntity = new ResponseEntity<>(pic, headers, HttpStatus.OK); 
		return responoEntity;
	}
	
	
	
//	???????????????????????????????????????
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int)size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
}
