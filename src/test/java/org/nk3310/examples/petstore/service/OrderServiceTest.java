package org.nk3310.examples.petstore.service;

import org.junit.Before;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.nk3310.examples.petstore.repository.OrderDao;
import org.nk3310.examples.petstore.service.OrderService;

/**
 * OrderService�Ĳ�������, ����Service���ҵ���߼�.
 * 
 * @author nk3310
 */
public class OrderServiceTest {

	private OrderService orderService;
	@Mock
	private OrderDao mockTaskDao;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);

		orderService = new OrderService();
		orderService.setOrderDao(mockTaskDao);
	}

}
