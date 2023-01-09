package by.htp.ex.controller.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import by.htp.ex.bean.News;
import by.htp.ex.controller.Command;
import by.htp.ex.service.INewsService;
import by.htp.ex.service.ServiceException;
import by.htp.ex.service.ServiceProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteNews implements Command {

	private final INewsService newsService = ServiceProvider.getInstance().getNewsService();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<News> newsList;
		String[] id;
		List<String> idNewsToDelete = new ArrayList <String>();
		id = request.getParameterValues("newsToDelete");
		
		for (String idOfNews: id) {
			idNewsToDelete.add(idOfNews);
		}

			try {
				newsService.delete(idNewsToDelete);
				newsList = newsService.list();
				request.setAttribute("news", newsList);
				request.setAttribute("presentation", "newsList");
				request.getRequestDispatcher("WEB-INF/pages/layouts/baseLayout.jsp").forward(request, response);
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		}

	}


