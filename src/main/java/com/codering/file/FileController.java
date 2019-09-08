package com.codering.file;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import codering.common.common.CommandMap;

@Controller
public class FileController
{
	private Logger log = Logger.getLogger(this.getClass());


	@Resource(name = "fileService")
	private FileService fileService;

	@RequestMapping(value = "/downloadFile")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception
	{
		Map<String, Object> map = fileService.selectFileInfo(commandMap.getMap());

		String storedFileName = (String) map.get("PATH_UPDATE");

		String originalFileName = (String) map.get("PATH_ORIGN");

		byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\" + storedFileName));

		response.setContentType("application/octet-stream");

		response.setContentLength(fileByte.length);

		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");

		response.setHeader("Content-Transfer-Encoding", "binary");

		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();

		response.getOutputStream().close();
	}

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjax(MultipartFile file, String str, HttpSession session, HttpServletRequest request,
			Model model) throws Exception
	{
		String path = request.getSession().getServletContext().getRealPath("/");
		
		String uploadPath = path + "\\images";
		
		log.info("originalName: " + file.getOriginalFilename());
		
		log.info("주소 -- " + uploadPath);

		ResponseEntity<String> img_path = new ResponseEntity(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
		String user_imgPath = (String) img_path.getBody();

		log.info(user_imgPath);
		log.info("file name : " + user_imgPath);

		return user_imgPath;
	}


}
