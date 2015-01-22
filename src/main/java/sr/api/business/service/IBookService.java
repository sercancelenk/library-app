package sr.api.business.service;

import java.util.List;

import org.springframework.stereotype.Service;

import sr.api.persistence.domain.Book;
import sr.api.presentation.vo.BooksVO;


public interface IBookService {
	BooksVO getAllBooks(int page, int maxResults);
	boolean saveBook(Book book);
	Book updateBook(Book book);
	boolean deleteBook(Book book);
	boolean deleteBook(String id);
}
