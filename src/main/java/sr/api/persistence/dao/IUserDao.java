package sr.api.persistence.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import sr.api.persistence.domain.User;

/**
 * @author sercan
 *
 */
@Repository("iUserDao")
public interface IUserDao extends CrudRepository<User, String>{
	User findByUserName(String username);
}
