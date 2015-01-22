package sr.api.presentation.controller;

import java.util.Locale;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sr.api.persistence.domain.Book;

/**
 * @author sercan
 *
 */
@Controller
@RequestMapping(value = "/protected/books")
public interface IBookController {
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView books();
	
	
	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale);

	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<?> create(
			@ModelAttribute("book") Book book);

	@RequestMapping(value = "/u/{id}", method = RequestMethod.POST, produces = "application/json", consumes="application/json")
	public ResponseEntity<?> update(
			@PathVariable("id") String bookId,
			@RequestBody Book book);

	@RequestMapping(value = "/{bId}", method = RequestMethod.DELETE, produces = "application/json")
	public ResponseEntity<?> delete(
			@PathVariable("bookId") int bookId);
	
}
