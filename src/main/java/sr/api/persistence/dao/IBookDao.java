package sr.api.persistence.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import sr.api.persistence.domain.Book;

/**
 * @author sercan
 *
 */
@Repository("iBookDao")
public interface IBookDao extends PagingAndSortingRepository<Book, String> {
	public abstract Page<Book> findByBookNameLike(Pageable pageable, String name);
}
