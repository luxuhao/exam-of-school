/***********************************************************
 * @Description : 用户表的操作类
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-05-14 08:30
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package lsgwr.exam.repository;

import lsgwr.exam.entity.GradeLevel;
import lsgwr.exam.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GradeLevelRepository extends JpaRepository<GradeLevel, Integer> {
    /**
     * 根据用户名查找到合适的用户
     *
     * @param username 用户名
     * @return 唯一符合的用户(实际用户名字段已经在数据库设置unique了 ， 肯定只会返回1条)
     */
    //User findByGradeLevelName(String username);
}
