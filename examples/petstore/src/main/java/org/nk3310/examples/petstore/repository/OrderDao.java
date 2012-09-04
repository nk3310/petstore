package org.nk3310.examples.petstore.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.nk3310.examples.prtstore.entity.Order;

public interface OrderDao extends PagingAndSortingRepository<Order, Long> {
	List<Order> findByOrderId(Long id, Sort sort);
}
