package sr.api.business.service;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import sr.api.business.service.impl.BookServiceImpl;
import sr.api.persistence.domain.Book;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class BookServiceTest {
	
	@Mock
	@Autowired
	private BookServiceImpl iBookService;
	
	Book bk = null;
	
	@Before
	public void setup(){
		MockitoAnnotations.initMocks(this);
		
		bk = new Book();
		bk.setBookAuthor("Demo");
		bk.setBookName("Python Guide");
		bk.setCost(22);
	}
	
	@After
	public void clearSession(){
	}
	
	@Test
	public void testBookService(){
		System.out.println("Test is starting..");
		
		Assert.assertNotNull(iBookService);
		
		Mockito.when(iBookService.saveBook(bk)).thenReturn(true);
		
		Mockito.when(iBookService.saveBook(null)).thenReturn(true);
		
		
		
	}

}
