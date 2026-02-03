/***********************************************************
 * @Description : 
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-05-14 08:28
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package lsgwr.exam.repository;

import lsgwr.exam.entity.ExamType;
import lsgwr.exam.entity.QuestionType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExamTypeRepository extends JpaRepository<ExamType, Integer> {
}
