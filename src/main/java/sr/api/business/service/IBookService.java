package sr.api.business.service;

import sr.api.persistence.domain.Book;
import sr.api.presentation.vo.BooksVO;


/**
 * @author sercan
 *
 */
public interface IBookService {
	public abstract BooksVO getAllBooks(int page, int maxResults);
	public abstract boolean saveBook(Book book);
	public abstract Book updateBook(Book book);
	public abstract boolean deleteBook(Book book);
	public abstract boolean deleteBook(String id);
}
