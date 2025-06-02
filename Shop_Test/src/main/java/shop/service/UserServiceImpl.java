package shop.service;

import java.util.List;

import shop.dao.UserRepository;
import shop.dto.User;


public class UserServiceImpl implements UserService {

	UserRepository userRepository = new UserRepository();
	
	// 로그인
	public User login(String id, String pw) {
		User user = null;
		
		try {
			user = userRepository.login(id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	// ID 로 사용자 조회
	public User getUserById(String id) {
		User user = null;
		
		try {
			user = userRepository.getUserById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	@Override
	public List<User> list() {
		return null;
	}

	@Override
	public User select(int no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insert(User entity) {
		int result = 0;
		
		try {
			result = userRepository.insert(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int update(User entity) {
		int result = 0;
		
		try {
			result = userRepository.update(entity);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int delete(String id) {
		int result = 0;
		
		try {
			result = userRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
