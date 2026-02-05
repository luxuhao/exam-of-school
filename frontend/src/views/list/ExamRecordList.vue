<template>
  <div>
    <!-- <a-card style="margin-top: 24px" :bordered="false" title="考试记录信息"> 
            <div id="toolbar" slot="extra">-->
    <a-card :bordered="false">
      <div id="toolbar">
        <!-- <a-cascader v-model:value="value" :options="cascaderOptions" /> -->
        <a-select
          v-model:value="categoryOptions.value"
          style="width: 120px"
          placeholder="请选择学科"
          :options="categoryOptions"
        >
        </a-select>&nbsp;
        <a-select
          v-model:value="gradeLevelOptions.value"
          style="width: 120px"
          placeholder="请选择教材"
          :options="gradeLevelOptions"
        >
        </a-select>&nbsp;
        <a-select
          v-model:value="userClassOptions.value"
          style="width: 120px"
          placeholder="请选择班级"
          :options="userClassOptions"
        >
        </a-select>&nbsp;
        <a-button type="primary" @click="queryBy()">查询</a-button>&nbsp;
        <a-button type="primary" icon="reload" @click="loadAll()">重置查询</a-button>
        <!-- <a-input-search style="margin-left: 16px; width: 272px;"/> -->
      </div>
      <BootstrapTable
        ref="table"
        :columns="columns"
        :data="tableData"
        :options="options"
      />
      <!--      
      <a-list size="large">
        <a-list-item :key="index" v-for="(item, index) in data">
          <a-list-item-meta :description="item.exam.examDescription">
            <a-avatar slot="avatar" size="large" shape="square" :src="item.exam.examAvatar | imgSrcFilter"/>
            <a slot="title">{{ item.exam.examName }}</a>
          </a-list-item-meta>
          <div slot="actions">
            <a @click="viewExamRecordDetail(item.examRecord)">查看考试详情</a>
            <a>|</a>
            <a @click="">删除记录</a>
          </div>
          <div class="list-content">
            <div class="list-content-item">
              <span>Owner</span>
              <p>{{ item.user.userUsername }}</p>
            </div>
            <div class="list-content-item">
              <span>开始时间</span>
              <p>{{ item.examRecord.examJoinDate }}</p>
            </div>
            <div class="list-content-item">
              <span>分数</span>
              <p>{{ item.examRecord.examJoinScore }}</p>
            </div>
          </div>
        </a-list-item>
      </a-list> 
      -->
    </a-card>
  </div>
</template>

<script>
import HeadInfo from '../../components/tools/HeadInfo'
import { getExamRecordList, DeleteExamRecord, getQuestionSelection } from '../../api/exam'
import '../../plugins/bootstrap-table'
import $ from 'jquery'
export default {
  // 考试记录列表，记录考生参加过地所有考试和考试成绩
  name: 'ExamRecordList',
  components: {
    HeadInfo
  },
  data () {
    const that = this // 方便在bootstrap-table中引用methods
    return {
      data: {},
      // 表头
      columns: [
        {
          title: '序号',
          field: 'serial',
          formatter: function (value, row, index) {
            return index + 1 // 这样的话每翻一页都会重新从1开始，
          }
        },
        {
          title: '试卷名称',
          field: 'exam.examName',
          formatter: (value, row) => {
            return '<div class="exam-name">' + value + '</div>'
          }
        },
        {
          title: '所属学科',
          field: 'exam.examQuestionCategoryName',
          formatter: (value, row) => {
            return '<div class="exam-category-name">' + value + '</div>'
          }
        },
        {
          title: '学生姓名',
          field: 'user.userUsername',
          formatter: (value, row) => {
            return '<div class="exam-user-name">' + value + '</div>'
          }
        },
        {
          title: '年段',
          field: 'user.userGradeLevelId',
          formatter: (value, row) => {
            return '<div class="exam-user-grade-level">' + value + '</div>'
          }
        },
        {
          title: '班级',
          field: 'user.userClassId',
          formatter: (value, row) => {
            return '<div class="exam-user-class">' + value + '</div>'
          }
        },
        {
          title: '学号',
          field: 'user.userNum',
          formatter: (value, row) => {
            return '<div class="exam-user-num">' + value + '</div>'
          }
        },
        {
          title: '分数',
          field: 'examRecord.examJoinScore',
          formatter: (value, row) => {
            return '<div class="exam-join-score">' + value + '</div>'
          }
        },
        {
          title: '开考时间',
          field: 'examRecord.examJoinDate',
          formatter: (value, row) => {
            return '<div class="exam-join-date">' + value + '</div>'
          }
        },
        {
          title: '操作',
          field: 'action',
          width: '150px',
          formatter: (value, row) => {
            return '<button type="button" class="btn btn-success delete-exam">重考</button>'
          },
          events: {
            'click .delete-exam': function (e, value, row, index) {
              that.handleDel(row)
            }
          }
        },
        
      ],
      tableData: [], // bootstrap-table的数据
      // custom bootstrap-table
      options: {
        search: true,
        showColumns: true,
        showExport: true,
        pagination: true,
        toolbar: '#toolbar',
        // 下面两行是支持高级搜索，即按照字段搜索
        advancedSearch: true,
        idTable: 'advancedTable',
        // 下面是常用的事件，更多的点击事件可以参考：http://www.itxst.com/bootstrap-table-events/tutorial.html
        // onClickRow: that.clickRow,
        // onClickCell: that.clickCell, // 单元格单击事件
        onDblClickCell: that.dblClickCell// 单元格双击事件
      },
      categoryOptions: [],
      gradeLevelOptions: [],
      userClassOptions: []
    }
  },
  methods: {
    /**
     * 根据考试记录的id拿到本次考试的详情并查看
     * @param record 考试详情的记录
     */
    viewExamRecordDetail (record) {
      // 直接跳到参加考试的页面，查看所有题目的详细情况
      const routeUrl = this.$router.resolve({
        path: `/exam/record/${record.examId}/${record.examRecordId}`
      })
      // 和点击考试卡片效果一样，跳转到考试页面，里面有所有题目的情况，相当于就是详情了
      window.open(routeUrl.href, '_blank')
    },
    handleDel (record) {
      console.log("删除考试")
      DeleteExamRecord(record.examRecord.examRecordId).then(res => {
        this.loadAll()
        if (res.code === 0) {
          console.log("删除成功")
        } else {
          this.$notification.error({
            message: '重考操作失败',
            description: res.msg
          })
        }
      }).catch(err => {
        // 失败就弹出警告消息
        this.$notification.error({
          message: '重考操作失败',
          description: err.message
        })
      })
      
    },
  loadAll () {
    // 从后端数据获取考试列表，适配前端卡片
    getExamRecordList().then(res => {
      if (res.code === 0) {
        this.tableData = res.data
        this.$refs.table._initTable()
      } else {
        this.$notification.error({
          message: '获取考试记录失败',
          description: res.msg
        })
      }
    }).catch(err => {
      // 失败就弹出警告消息
      this.$notification.error({
        message: '获取考试记录失败',
        description: err.message
      })
    })
    // 从后端数据获取各个查询条件的列表
    getQuestionSelection().then(res => {
      this.categoryOptions = []
      this.gradeLevelOptions = []
      this.userClassOptions = []
      if (res.code === 0) {
        // 第一个查询条件 按学科
        res.data.categories.forEach(item => {
          this.categoryOptions.push({
            value: item.id,
            label: item.name
          })
        })
        // 第二个查询条件 按教材
        res.data.grades.forEach(item => {
          this.gradeLevelOptions.push({
            value: item.id,
            label: item.name
          })
        })
        // 第三个查询条件 按班级
        res.data.userClass.forEach(item => {
          this.userClassOptions.push({
            value: item.id,
            label: item.name
          })
        })
      } else {
        this.$notification.error({
          message: '获取查询条件失败',
          description: res.msg
        })
      }
    }).catch(err => {
      // 失败就弹出警告消息
      this.$notification.error({
        message: '获取查询条件失败',
        description: err.message
      })
    })
  },
  },
  mounted () {
    this.loadAll() // 加载所有问题的数据
  }
}
</script>

<style lang="less" scoped>
  .ant-avatar-lg {
    width: 48px;
    height: 48px;
    line-height: 48px;
  }

  .list-content-item {
    color: rgba(0, 0, 0, .45);
    display: inline-block;
    vertical-align: middle;
    font-size: 14px;
    margin-left: 40px;

    span {
      line-height: 20px;
    }

    p {
      margin-top: 4px;
      margin-bottom: 0;
      line-height: 22px;
    }
  }
</style>
