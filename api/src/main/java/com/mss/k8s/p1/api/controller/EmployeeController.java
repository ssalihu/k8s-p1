package com.mss.k8s.p1.api.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mss.k8s.p1.api.dao.Employee;
import com.mss.k8s.p1.api.dao.EmployeeRepository;
import com.mss.k8s.p1.api.service.RedisEmployeeService;

@RestController
class EmployeeController {

  private final EmployeeRepository repository;
  Logger logger = LoggerFactory.getLogger(EmployeeController.class);
  
  @Autowired
  RedisEmployeeService employeeRedisService;

  EmployeeController(EmployeeRepository repository) {
    this.repository = repository;
  }

  // Aggregate root

  @GetMapping("/employees")
  List<Employee> all() {
    return repository.findAll();
  }

  @PostMapping("/employees")
  Employee newEmployee(@RequestBody Employee newEmployee) {
    return repository.save(newEmployee);
  }

  // Single item

  @GetMapping("/employees/{id}")
  Employee one(@PathVariable Long id) {
	  
	Employee emp = employeeRedisService.findById(id);

	if(emp==null) {
		logger.error(id + " not found in redis.");
		emp = repository.findById(id)
	      .orElseThrow(() -> new EmployeeNotFoundException(id));
		logger.error(id + " is getting persisted on redis.");
		employeeRedisService.save(emp);
		return emp;
	} else {
		logger.error(id + " is getting removed from redis.");
		employeeRedisService.delete(id);
		return emp;
	}
  }

  @PutMapping("/employees/{id}")
  Employee replaceEmployee(@RequestBody Employee newEmployee, @PathVariable Long id) {

    return repository.findById(id)
      .map(employee -> {
        employee.setName(newEmployee.getName());
        employee.setAge(newEmployee.getAge());
        return repository.save(employee);
      })
      .orElseGet(() -> {
        newEmployee.setEmployeeID(id);
        return repository.save(newEmployee);
      });
  }

  @DeleteMapping("/employees/{id}")
  void deleteEmployee(@PathVariable Long id) {
    repository.deleteById(id);
  }
}