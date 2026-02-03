<template>
  <a-card :bordered="false">
    <div id="toolbar">
      <a-button type="primary" icon="plus" @click="$refs.createExamModal.create()">新建</a-button>&nbsp;
      <a-button type="primary" icon="reload" @click="loadAll()">刷新</a-button>
      <!--<a-switch checked-children="开" un-checked-children="关" />-->
    </div>
    <BootstrapTable
      ref="table"
      :columns="columns"
      :data="tableData"
      :options="options"
    />
    <!-- ref是为了方便用this.$refs.modal直接引用，下同 -->
    <step-by-step-exam-modal ref="createExamModal" @ok="handleOk" />
    <!-- 这里的详情需要传进去  -->
    <exam-edit-modal ref="editExamModal" @ok="handleOk" />
    <!--  更新考试封面图片  -->
    <update-avatar-modal ref="updateAvatarModal" @ok="handleOk" />
  </a-card>
</template>

<script>
import '../../plugins/bootstrap-table'
import { getExamAll, examUpdate, getQuestionSelection } from '../../api/exam'
import StepByStepExamModal from './modules/StepByStepExamModal'
import ExamEditModal from './modules/ExamEditModal'
import UpdateAvatarModal from '@views/list/modules/UpdateAvatarModal'
import $ from 'jquery'
export default {
  name: 'ExamTableList',
  components: {
    UpdateAvatarModal,
    ExamEditModal,
    StepByStepExamModal
  },
  data () {
    const that = this // 方便在bootstrap-table中引用methods
    return {
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
          title: '发布状态',
          field: 'state',
          formatter: (value, row) => {
            return '<div class="exam-state">' + value + '</div>'
          },
          events: {
            'click .exam-state': function (e, value, row, index) {
              const $element = $(e.target) // 把元素转换成html对象
              if ($element.children().length > 0) return // 防止重复渲染
              getQuestionSelection().then(res => {
                console.log(res)
                if (res.code === 0) {
                  console.log(res.data)
                  const states = res.data.states
                  let inner = '<select>'
                  for (let i = 0; i < states.length; i++) {
                    if (states[i].name === value) {
                      // 设置默认的选中值为当前的值
                      inner += '<option value ="' + states[i].id + '" selected="selected">' + states[i].name + '</option>'
                    } else {
                      inner += '<option value ="' + states[i].id + '" >' + states[i].name + '</option>'
                    }
                  }
                  inner += '</select>'
                  $element.html(inner)
                } else {
                  that.$notification.error({
                    message: '获取问题下拉选项失败',
                    description: res.msg
                  })
                }
              })
            }
          }
        },
        {
          title: '封面',
          field: 'avatar',
          width: 50,
          formatter: (value, row) => {
            return '<div class="exam-avatar">' + value + '</div>'
          },
          events: {
            'click .exam-avatar': function (e, value, row, index) {
              that.handleAvatarEdit(row)
            }
          }
        },
        {
          title: '名称',
          field: 'name',
          width: 200
        },
        {
          title: '所属学科',
          field: 'examCategoryName'
        },
        {
          title: '教材',
          field: 'gradeVolumeName',
          formatter: (value, row) => {
            return '<div class="exam-grade">' + value + '</div>'
          },
          events: {
            'click .exam-grade': function (e, value, row, index) {
              const $element = $(e.target) // 把元素转换成html对象
              if ($element.children().length > 0) return // 防止重复渲染
              getQuestionSelection().then(res => {
                console.log(res)
                if (res.code === 0) {
                  console.log(res.data)
                  const grades = res.data.grades
                  let inner = '<select>'
                  for (let i = 0; i < grades.length; i++) {
                    if (grades[i].name === value) { // 教材名字
                      // 设置默认的选中值为当前的值
                      inner += '<option value ="' + grades[i].id + '" name="' + grades[i].description + '" selected="selected">' + grades[i].name + '</option>'
                    } else {
                      inner += '<option value ="' + grades[i].id + '" name="' + grades[i].description + '">' + grades[i].name + '</option>'
                    }
                  }
                  inner += '</select>'
                  $element.html(inner)
                } else {
                  that.$notification.error({
                    message: '获取问题下拉选项失败',
                    description: res.msg
                  })
                }
              })
            }
          }
        },
        {
          title: '创建人',
          field: 'creator'
        },
        {
          title: '时长',
          field: 'elapse'
        },
        {
          title: '更新时间',
          field: 'updateTime'
        },
        {
          title: '操作',
          field: 'action',
          width: '150px',
          formatter: (value, row) => {
            return '<button type="button" class="btn btn-success view-exam">详情</button>' +
              '&nbsp;&nbsp;' +
              '<button type="button" class="btn btn-success edit-exam">编辑</button>'
          },
          events: {
            'click .view-exam': function (e, value, row, index) {
              that.handleSub(row)
            },
            'click .edit-exam': function (e, value, row, index) {
              that.handleEdit(row)
            }
          }
        }
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
      }
    }
  },
  mounted () {
    this.loadAll() // 加载所有问题的数据
  },
  methods: {
    handleEdit (record) {
      // Todo:修改考试信息和下面的题目，弹出一个可修改的输入框，实际上复用创建题目的模态框即可，还没做完
      console.log('开始编辑啦')
      console.log(record)
      this.$refs.editExamModal.edit(record)
    },
    handleAvatarEdit (record) {
      // Todo:修改考试信息和下面的题目，弹出一个可修改的输入框，实际上复用创建题目的模态框即可，还没做完
      console.log('开始更新封面啦')
      console.log(record)
      this.$refs.updateAvatarModal.edit(record)
    },
    handleSub (record) {
      // 查看考试，不在模态框里查啦，太麻烦
      // console.log(record)
      // this.$refs.modalView.edit(record)

      // 直接跳到参加考试的页面，查看所有题目的详细情况
      const routeUrl = this.$router.resolve({
        path: `/exam/${record.id}`
      })
      // 和点击考试卡片效果一样，跳转到考试页面，里面有所有题目的情况，相当于就是详情了
      window.open(routeUrl.href, '_blank')
    },
    handleOk () {
      this.loadAll()
    },
    dblClickCell (field, value, row, $element) {
      if (field === 'gradeVolumeName') { // 更新教材范围
        const childrenSelect = $element.children('.exam-grade').children('select') // 获取输入框的值
        if (childrenSelect.length === 0) return
        const optionSelected = $(childrenSelect[0]).find('option:selected')
        row.gradeVolumeId = optionSelected.val()
        console.log(row.gradeVolumeId)
        row.gradeVolumeName = optionSelected.text()
        console.log(row.gradeVolumeName)
        const that = this
        examUpdate(row).then(res => {
          // 成功就跳转到结果页面
          console.log(res)
          if (res.code === 0) {
            $element.children('.exam-grade').text(row.gradeVolumeName)
            that.$notification.success({
              message: '更新成功',
              description: '更新成功'
            })
          }
        })
      }
      if (field === 'state') { // 更新考试状态
        const childrenSelect = $element.children('.exam-state').children('select') // 获取输入框的值
        if (childrenSelect.length === 0) return
        const optionSelected = $(childrenSelect[0]).find('option:selected')
        row.examTypeId = optionSelected.val()
        console.log(row.examTypeId)
        row.state = optionSelected.text()
        console.log(row.state)
        const that = this
        examUpdate(row).then(res => {
          // 成功就跳转到结果页面
          console.log(res)
          if (res.code === 0) {
            $element.children('.exam-state').text(row.state)
            that.$notification.success({
              message: '状态更新成功',
              description: row.state
            })
          }
        })
      }
    },
    loadAll () {
      const that = this
      getExamAll()
        .then(res => {
          if (res.code === 0) {
            that.tableData = res.data
            that.$refs.table._initTable()
          } else {
            that.$notification.error({
              message: '获取全部考试的列表失败',
              description: res.msg
            })
          }
        })
    }
  }
}
</script>
