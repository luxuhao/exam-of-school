/***********************************************************
 * @Description : 用户角色表
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019/5/14 07:49
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package lsgwr.exam.entity;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class GradeVolume {
    @Id
    @GeneratedValue
    @JsonProperty("id")
    private Integer gradeVolumeId;
    @JsonProperty("name")
    private String gradeVolumeName;
    private String gradeVolumeDescription;
    private Integer gradeLevelId;

}
