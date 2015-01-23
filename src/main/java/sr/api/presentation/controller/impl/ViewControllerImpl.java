package sr.api.presentation.controller.impl;

import org.springframework.stereotype.Component;

import sr.api.presentation.controller.IViewController;


/**
 * @author sercan
 *
 */
@Component
public class ViewControllerImpl implements IViewController{

	@Override
	public String redirectToHome() {
		return "redirect:/protected/home";
	}	

}
