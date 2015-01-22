package sr.api.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sr.api.business.service.IBookService;
import sr.api.persistence.dao.IBookDao;
import sr.api.persistence.domain.Book;
import sr.api.presentation.vo.BooksVO;

@Service("iBookService")
@Transactional
public class BookServiceImpl implements IBookService {

	@Autowired IBookDao iBookDao;
	@Autowired MongoTemplate mongoTemplate;
	
	@Override
	@Transactional(readOnly=true)
	public BooksVO getAllBooks(int page, int maxResults) {
		Page<Book> result = _findAll(page, maxResults);
		
		if(isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result)){
            int lastPage = result.getTotalPages() - 1;
            result = _findAll(lastPage, maxResults);
        }
		return new BooksVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
	}
	protected Page<Book> _findAll(int page, int maxResults){
		final PageRequest pageRequest = new PageRequest(page, maxResults, new Sort(Sort.Direction.ASC, "bookName"));
		return iBookDao.findAll(pageRequest);
	}

	@Override
	public boolean saveBook(Book book) {
		boolean result = false;
		try{
			iBookDao.save(book);
			result = true;
		}catch(Exception ex){
			result = false;
		}
		return result;
	}

	@Override
	public Book updateBook(Book book) {
		Book updatedBook = null;
		try{
			if(book == null || book.getId() == null || "".equals(book.getId()))
				return null;
			
			Query query = new Query();
			query.addCriteria(Criteria.where("id").is(book.getId()));
			
			updatedBook = mongoTemplate.findOne(query, Book.class);
			
			if(updatedBook == null)
				return null;
			updatedBook.setBookAuthor(book.getBookAuthor());
			updatedBook.setBookName(book.getBookName());
			updatedBook.setCost(book.getCost());
			mongoTemplate.save(updatedBook);
			
		}catch(Exception ex){
			updatedBook = null;
		}
		return book;
	}

	@Override
	@Secured("ROLE_ADMIN")
	public boolean deleteBook(Book book) {
		boolean result = false;
		try{
			iBookDao.delete(book);
			result = true;
		}catch(Exception ex){
			result = false;
		}
		return result;
	}
	
	
	private boolean isUserAfterOrOnLastPage(int page, Page<Book> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Book> result) {
        return result.getTotalElements() > 0;
    }
	
    @Override
	@Secured("ROLE_ADMIN")
	public boolean deleteBook(String id) {
		boolean result = false;
		try{
			iBookDao.delete(id);
			result = true;
		}catch(Exception ex){
			result = false;
		}
		return result;
	}

}
