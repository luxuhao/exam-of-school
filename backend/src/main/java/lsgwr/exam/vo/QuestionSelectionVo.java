/***********************************************************
 * @Description : 前端创建问题时的下拉列表选择
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-06-03 07:35
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package lsgwr.exam.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lsgwr.exam.entity.*;
import lombok.Data;

import java.util.List;

@Data
public class QuestionSelectionVo {
    @JsonProperty("types")
    private List<QuestionType> questionTypeList;

    @JsonProperty("categories")
    private List<QuestionCategory> questionCategoryList;

    @JsonProperty("levels")
    private List<QuestionLevel> questionLevelList;

    @JsonProperty("grades")
    private List<GradeVolume> gradeVolumeList;

    @JsonProperty("states")
    private List<ExamType> statesTypeList;

    @JsonProperty("userClass")
    private List<UserClass> userClassList;

    @JsonProperty("gradeLevel")
    private List<GradeLevel> gradeLevelList;

}
