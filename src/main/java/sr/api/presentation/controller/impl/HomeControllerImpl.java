package sr.api.presentation.controller.impl;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import sr.api.presentation.controller.IHomeController;

@Component
public class HomeControllerImpl implements IHomeController {

	
	@Override
	public ModelAndView home() {
		System.out.println("home bolumune dustu");
		return new ModelAndView("home");
	}
	

}
