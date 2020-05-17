package pl.coderslab.charity.security;

import pl.coderslab.charity.model.User;



public interface UserService {
    User findByUserName(String name);

    void saveUser(User user);
    
}
