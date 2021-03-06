package spring.controller.nhomkinhnhutviet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import spring.constant.GlobalConstant;
import spring.constant.URLConstant;
import spring.constant.ViewNameConstant;
import spring.model.Category_new;
import spring.model.News;
import spring.service.CategoryNewService;
import spring.service.NewsService;
import spring.util.PageUtil;

@Controller
public class NewsController {

	@Autowired
	private CategoryNewService categoryNewService;
	
	@Autowired
	private NewsService newsService;
	
	@ModelAttribute
	public void setModelCat(Model model) {
		List<Category_new> listCatNew = categoryNewService.getAll();
		model.addAttribute("listCatNew", listCatNew);
	}
	
	@GetMapping({URLConstant.URL_NEWS, URLConstant.URL_NEWS_PAGINATION})
	public String news(@PathVariable(required = false) Integer page, Model model) {
		int currentPage = GlobalConstant.DEFAULT_PAGE;
		if (page != null) {
			if (page < GlobalConstant.DEFAULT_PAGE) {
				return "";  //Trang error
			}
			currentPage = page;
		}
		int offset = PageUtil.getOffset(currentPage);
		int totalRow = newsService.totalRow();
		int totalPage = PageUtil.getTotalPage(totalRow);
		List<News> listNews = newsService.getList(offset, GlobalConstant.TOTAL_ROW);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalRow", totalRow);
		model.addAttribute("listNews", listNews);
		return ViewNameConstant.NEWS;
	}

	@GetMapping(URLConstant.URL_NEWS_DETAIL)
	public String detail(@PathVariable("id") Integer id, Model model) {
		if (newsService.findById(id) == null) {
			return ""; //trang error
		}
		
		News news = newsService.findById(id);
		List<News> listNews = newsService.getListByCat(news.getCat().getId(), 1, 6);
		
		model.addAttribute("news", news);
		model.addAttribute("listNews", listNews);
		return ViewNameConstant.NEWS_DETAIL;
	}
	
}
