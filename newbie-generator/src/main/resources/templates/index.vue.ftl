<template>
  <el-container>
    <el-main>
      <el-card shadow="never">
        <el-form :model="state.queryForm" ref="queryFormRef" inline>
          <#list fields as field>
             <#if !field.pk>
          <el-form-item label="${field.comment!}：" prop="${field.name}">
            <#if field.type=='Date'>
          <el-date-picker
                  v-model="state.queryForm.${field.name}"
                  type="datetime"
                  placeholder="请选择日期和时间"
                  value-format="YYYY-MM-DD HH:mm:ss"
          />
              <#else>
                <el-input v-model="state.queryForm.${field.name}" placeholder="请输入"/>
          </#if>
          </el-form-item>
             </#if>
          </#list>
          <el-form-item>
            <el-button type="primary" @click="queryData" :loading="state.queryLoading"
                       :icon="Search">查询</el-button>
            <el-button type="warning" @click="refreshQuery(queryFormRef)" :loading="state.queryLoading"
                       :icon="Refresh">重置</el-button>
            <el-button type="success" @click="handleAddClick" :loading="state.queryLoading"
                       :icon="Plus" <#if gc.apiAuth>v-hasPerm="'${gc.moduleName}.${entity}.add'"</#if>>新增</el-button>
          </el-form-item>
        </el-form>
      </el-card>
      <el-card shadow="never" style="margin-top: 20px;">
        <el-table :data="state.tableData" border stripe v-loading="state.queryLoading">
          <el-table-column type="index" width="50" />
          <#list fields as field>
            <#if !field.pk>
          <el-table-column prop="${field.name}" label="${field.comment!}" width="auto" header-align="center" align="left" />
            </#if>
          </#list>
          <el-table-column label="操作" width="150" align="center" fixed="right">
            <template #default="{ row }">
              <el-button link type="info" @click="handleDetailClick(row)">详情</el-button>
              <el-button link type="warning" @click="handleEditClick(row)" <#if gc.apiAuth>v-hasPerm="'${gc.moduleName}.${entity}.update'"</#if>>编辑</el-button>
              <el-button link type="danger" @click="handleDeleteClick(row)" <#if gc.apiAuth>v-hasPerm="'${gc.moduleName}.${entity}.delete'"</#if>>删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <el-pagination style="margin-top: 20px;" v-model:current-page="state.pageInfo.current"
                       v-model:page-size="state.pageInfo.size" :page-sizes="[10, 20, 30, 50]" background
                       :default-page-size="state.pageInfo.size"
                       layout="->,total, sizes, prev, pager, next, jumper" :total="state.pageInfo.total" @size-change="queryData"
                       @current-change="queryData" />
      </el-card>
    </el-main>
    <${Entity}DataForm ref="dataFormRef" @submit-success="queryData" />
  </el-container>
</template>

<script setup>
  import { onMounted, reactive, ref } from 'vue'
  import { Search, Refresh, Plus } from '@element-plus/icons-vue'
  import ${Entity}DataForm from './${Entity}DataForm.vue'
  import { pageApi, deleteByPkValApi } from '@/api/${gc.moduleName}/${entity}'
  import { ElMessageBox } from 'element-plus'

  defineOptions({ name: '${gc.ModuleName}${entity}Vue' })

  /**定义响应式数据 */
  const queryFormRef = ref()
  const dataFormRef = ref()
  const state = reactive({
    queryLoading: false,
    tableData: [], // 表格数据
    // 分页信息
    pageInfo: {
      current: 1,
      size: 10,
      total: 0,
    },
    queryForm: {
      <#list fields as field>
      <#if !field.pk>
        <#if field.type="String">
      ${field.name}: '', // ${field.comment!}
        <#else>
      ${field.name}: null, // ${field.comment!}
        </#if>
      </#if>
      </#list>
    },
  })
  /**查询数据 */
  function queryData() {
    state.queryLoading = true
    const params = {
      ...state.queryForm,
      current:state.pageInfo.current,
      size:state.pageInfo.size
    }
    pageApi(params).then(res => {
      state.tableData = res.data.records
      state.pageInfo.total = res.data.total
    }).finally(()=>{
      state.queryLoading = false
    })
  }
  /**重置查询条件 */
  function refreshQuery(formEl) {
    if (!formEl) return
    formEl.resetFields()
    queryData()
  }
  /**新增按钮点击事件 */
  function handleAddClick() {
    dataFormRef.value && dataFormRef.value.open()
  }
  /**详情按钮点击事件 */
  function handleDetailClick(currRow){
    dataFormRef.value && dataFormRef.value.open({...currRow},true)
  }
  /**编辑按钮点击事件 */
  function handleEditClick(currRow) {
    dataFormRef.value && dataFormRef.value.open({...currRow})
  }
  /**删除按钮点击事件 */
  function handleDeleteClick(currRow) {
    ElMessageBox.confirm(
            '确定要删除此条数据吗?',
            '警告',
            {
              confirmButtonText: '确定',
              cancelButtonText: '取消',
              type: 'warning',
            }
    )
            .then(() => {
              deleteByPkValApi(currRow.${pkey.name}).then(res => {
                queryData()
              })
            })
  }
  onMounted(() => {
    queryData()
  })
</script>

<style scoped>

</style>