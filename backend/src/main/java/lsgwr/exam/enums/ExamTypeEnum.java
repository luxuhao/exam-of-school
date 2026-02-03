package lsgwr.exam.enums;

import lombok.Getter;

/**
 * 试卷状态类型的枚举
 * @author liangshanguang
 */
@Getter
public enum ExamTypeEnum {
    /**
     * 试卷状态类型，0为关闭试卷，1代表开启试卷
     */
    State0(false, "未发布"),
    State1(true, "已启用");


    ExamTypeEnum(Boolean type, String name) {
        this.type = type;
        this.name = name;
    }

    private Boolean type;
    private String name;
}
