package com.mss.k8s.p1.api.service;

import java.util.List;

import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.mss.k8s.p1.api.dao.Employee;

@Service
public class RedisEmployeeService {
	
    private HashOperations hashOperations;

    private RedisTemplate redisTemplate;
    
    public RedisEmployeeService(RedisTemplate redisTemplate){
        this.redisTemplate = redisTemplate;
        this.hashOperations = this.redisTemplate.opsForHash();
    }    
    public void save(Employee employee){
        hashOperations.put("EMPLOYEE", employee.getEmployeeID(), employee);
    }
    public List findAll(){
        return hashOperations.values("EMPLOYEE");
    }

    public Employee findById(Long id){
        return (Employee) hashOperations.get("EMPLOYEE", id);
    }

    public void update(Employee user){
        save(user);
    }

    public void delete(Long id){
        hashOperations.delete("EMPLOYEE", id);
    }
}
