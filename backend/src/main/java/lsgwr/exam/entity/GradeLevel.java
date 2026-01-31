/***********************************************************
 * @Description : 用户角色表
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019/5/14 07:49
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package lsgwr.exam.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class GradeLevel {
    @Id
    @GeneratedValue
    private Integer gradeLevelId;
    private String gradeLevelName;
    private String gradeLevelDescription;
}
