package by.htp.ex.controller.impl;

import java.io.IOException;
import java.util.List;

import by.htp.ex.bean.News;
import by.htp.ex.controller.Command;
import by.htp.ex.service.INewsService;
import by.htp.ex.service.ServiceException;
import by.htp.ex.service.ServiceProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SaveNews implements Command {
	private final INewsService service = ServiceProvider.getInstance().getNewsService();

	private static final String JSP_TITLE_PARAM = "title";
	private static final String JSP_DATE_PARAM = "date";
	private static final String JSP_BRIEF_PARAM = "brief";
	private static final String JSP_CONTENT_PARAM = "content";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title;
		String date;
		String brief;
		String content;
		
		List<News> newsList;
		
		title = request.getParameter(JSP_TITLE_PARAM);
		date = request.getParameter(JSP_DATE_PARAM);
		brief = request.getParameter(JSP_BRIEF_PARAM);
		content = request.getParameter(JSP_CONTENT_PARAM);
		
		try {
			service.save(title, date, brief, content);
			newsList = service.list();
			request.setAttribute("news", newsList);
			request.setAttribute("presentation", "newsList");
			request.getRequestDispatcher("WEB-INF/pages/layouts/baseLayout.jsp").forward(request, response);
			
		} catch (ServiceException e) {
			// logging e
			// go-to error page

		}

	}

}
