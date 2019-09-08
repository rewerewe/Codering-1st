package codering.common.resolver;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.codering.dao.AlarmDAO;

import codering.common.common.CommandMap;

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver
{
	@Autowired
	private AlarmDAO alarmDao;

	private static final Log log = LogFactory.getLog(CustomMapArgumentResolver.class);

	@Override
	public boolean supportsParameter(MethodParameter parameter)
	{
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception
	{
		CommandMap commandMap = new CommandMap();
		
		log.debug("===============================  커맨드맵 진입");

		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();

		// 로그인세션이 존재한다면 그것을 commandMap에도 담음

		Map<String, Object> loginInfo = (Map<String, Object>) request.getSession().getAttribute("loginInfo");

		if (loginInfo != null)
		{
			commandMap.put("loginInfo", loginInfo);
			commandMap.put("MEMBER_ID", loginInfo.get("MEMBER_ID"));
			commandMap.put("NICKNAME", loginInfo.get("NICKNAME"));
			commandMap.put("TUTOR_ID", loginInfo.get("TUTOR_ID"));
			commandMap.put("TUTOR_NAME", loginInfo.get("TUTOR_NAME"));

			// 현재 알람이 몇개인지 확인하여 세션에 넣기 request.getSession().setAttribute("alarmCount",
			alarmDao.selectAlarmCount(commandMap.getMap());
		}
			// 파라메터들을 수신하여 commandMap에 담는 과정
			Enumeration<?> enumeration = request.getParameterNames();
			String key = null;
			String[] values = null;
			while (enumeration.hasMoreElements())
			{
				key = (String) enumeration.nextElement();
				values = request.getParameterValues(key);
				if (values != null)
				{
					commandMap.put(key, (values.length > 1) ? values : values[0]);
				}
			}
			// 담아놓은 commandMap 반납
			return commandMap;
	
		
	}
}
