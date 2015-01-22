package sr.api.presentation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/protected/home")
public interface IHomeController {
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView home();

}
