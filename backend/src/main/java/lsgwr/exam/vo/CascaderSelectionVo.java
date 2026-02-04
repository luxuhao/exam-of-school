/***********************************************************
 * @Description : 前端创建问题时的下拉列表选择
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-06-03 07:35
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package lsgwr.exam.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lsgwr.exam.entity.*;

import java.util.List;

@Data
public class CascaderSelectionVo<T> {
    @JsonProperty("cascader")
    private List<T> cascaderList;
}
