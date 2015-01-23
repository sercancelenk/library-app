package sr.api.business.service;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import sr.api.business.service.impl.BookServiceImpl;
import sr.api.persistence.dao.IBookDao;
import sr.api.persistence.domain.Book;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class BookServiceTest {
	
	@Spy
	@Autowired
	private BookServiceImpl iBookService;
	
	@Mock
	@Autowired
	private IBookDao iBookDao;
	
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
	public void testSave(){
		System.out.println("***** Testing : Book Service Save()");
		
		Assert.assertNotNull(iBookService);
		Assert.assertNotNull(bk);
		
		iBookService.saveBook(bk);
		
		Mockito.when(iBookService.saveBook(bk)).thenReturn(true);
		Mockito.when(iBookService.saveBook(null)).thenReturn(true);
	}
	
	@Test
	public void testUpdate(){
		System.out.println("***** Testing : Book Service Update()");
		Assert.assertNotNull(iBookService);
		Assert.assertNotNull(iBookDao);
		Assert.assertNotNull(bk);
		Mockito.when(iBookDao.findOne(bk.getId())).thenReturn(bk);
		
	}
	
	@Test
	public void testDelete(){
		System.out.println("***** Testing : Book Service Delete()");
		Assert.assertNotNull(iBookService);
		Assert.assertNotNull(iBookDao);
		Assert.assertNotNull(bk);
		Mockito.when(iBookService.deleteBook(bk.getId())).thenReturn(Long.valueOf(1)==1L);
	}

}
