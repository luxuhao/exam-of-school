/***********************************************************
 * @Description : 用户表的操作类
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-05-14 08:30
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package lsgwr.exam.repository;

import lsgwr.exam.entity.GradeVolume;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GradeVolumeRepository extends JpaRepository<GradeVolume, Integer> {
}
