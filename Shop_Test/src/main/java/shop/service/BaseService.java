package shop.service;

import java.util.List;

public interface BaseService<T> {

	// 기본 CRUD
	List<T> list();
	T select(int no);
	int insert(T entity);
	int update(T entity);
	int delete(String no);
}
