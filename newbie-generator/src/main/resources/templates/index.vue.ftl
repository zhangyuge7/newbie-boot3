<script setup>
import { onMounted, reactive, ref } from 'vue'
import { Minus, Plus, Refresh, Search } from '@element-plus/icons-vue'
import { ElMessageBox } from 'element-plus'
import { deleteBatchApi, getPaging } from './api.js'
import DataForm from './DataForm.vue'
import { useAppStore } from '@/stores/modules/app'
import usePagingParams from '@/hooks/usePagingParams'

defineOptions({ name: '${upModuleName}${entity}Vue' })
const appStore = useAppStore()
const { current, size } = usePagingParams()

/** 定义响应式变量 */
const queryFormRef = ref()
const tableRef = ref()
const state = reactive({
  showDataForm: false,
  currentRow: {},
  queryLoading: false,
  tableData: [],
  total: 0,
  queryForm: {

  },
})

/** 定义方法 */
const methods = {
  // 查询
  async queryData() {
    state.queryLoading = true
    const params = { ...state.queryForm, current: current.value, size: size.value }
    try {
      const { ok, data } = await getPaging(params)
      state.tableData = ok ? data.records : []
      state.total = ok ? data.total : 0
    }
    catch (err) {

    }
    state.queryLoading = false
  },
  // 重置查询
  refreshQuery(formEl) {
    formEl && formEl.resetFields()
    methods.queryData()
  },
  // 删除或批量删除数据
  async batchDel(id) {
    if (id) {
      const { ok } = await deleteBatchApi([id])
      ok && methods.queryData()
    }
    else {
      const ids = tableRef.value.getSelectionRows().map(item => item.${pkValue.name})
      ElMessageBox.confirm('确认删除选中数据吗?',
        '注意',
        {
          confirmButtonText: '确认',
          cancelButtonText: '取消',
          type: 'warning',
        })
        .then(async () => {
          const { ok } = await deleteBatchApi(ids)
          ok && methods.queryData()
        })
    }
  },
  // 打开数据表单
  openDataForm(row) {
    state.currentRow = row || {}
    state.showDataForm = true
  },
  // 保存成功回调
  saveSuccess() {
    state.showDataForm = false
    methods.queryData()
  },
}
onMounted(() => {
  methods.queryData()
})
</script>

<template>
  <el-container>
    <el-main>
      <el-card :shadow="appStore.appConfig.elChardShadow">
        <el-form ref="queryFormRef" inline :model="state.queryForm">
          <el-form-item>
            <el-button type="primary" :icon="Search" :loading="state.queryLoading" @click="methods.queryData">
              查询
            </el-button>
            <el-button type="warning" :icon="Refresh" :loading="state.queryLoading" @click="methods.refreshQuery(queryFormRef)">
              重置
            </el-button>
          </el-form-item>
        </el-form>
      </el-card>
      <el-card class="mt-2" :shadow="appStore.appConfig.elChardShadow">
        <div class="w-full pb-3 flex justify-between">
          <div>
            <el-button v-hasPerm="'${package.ModuleName}.${controllerMappingHyphen}.add'" type="primary" :icon="Plus" @click="methods.openDataForm(null)">
              新增
            </el-button>
            <el-button v-hasPerm="'${package.ModuleName}.${controllerMappingHyphen}.del'" type="danger" :icon="Minus" @click="methods.batchDel(null)">
              删除
            </el-button>
          </div>
          <div>
            <el-button :icon="Refresh" circle @click="methods.queryData" />
          </div>
        </div>
        <el-table ref="tableRef" v-loading="state.queryLoading" :data="state.tableData" border stripe height="calc(100vh - 370px)">
          <el-table-column type="selection" width="50" align="center" fixed="left" />
<#list table.fields as field>
 <#if !field.keyFlag>
          <el-table-column prop="${field.propertyName}" label="${field.comment}" header-align="center" align="<#if "Integer"==field.propertyType || "Long"==field.propertyType || "BigDecimal"==field.propertyType>right<#elseif "LocalDateTime"==field.propertyType || "Date"==field.propertyType>center<#else>left</#if>" />
 </#if>
</#list>
          <el-table-column
            v-hasPerm="['${package.ModuleName}.${controllerMappingHyphen}.update', '${package.ModuleName}.${controllerMappingHyphen}.del']"
            label="操作" align="center" fixed="right" width="220px"
          >
            <template #default="{ row }">
              <el-button v-hasPerm="'${package.ModuleName}.${controllerMappingHyphen}.update'" type="warning" link @click="methods.openDataForm(row)">
                编辑
              </el-button>
              <el-popconfirm
                :hide-after="0"
                title="确认要删除该数据吗？" @confirm="methods.batchDel(row.${pkValue.name})"
              >
                <template #reference>
                  <el-button v-hasPerm="'${package.ModuleName}.${controllerMappingHyphen}.del'" type="danger" link>
                    删除
                  </el-button>
                </template>
              </el-popconfirm>
            </template>
          </el-table-column>
        </el-table>
        <el-pagination
          v-model:current-page="current" v-model:page-size="size" class="mt-5" :default-page-size="size"
          :page-sizes="[10, 20, 30, 40, 50, 100]" background layout="->,total,prev, pager, next, jumper,sizes"
          :total="state.total" @current-change="methods.queryData" @size-change="methods.queryData"
        />
      </el-card>
    </el-main>
    <DataForm v-if="state.showDataForm" v-model="state.showDataForm" :current-row="state.currentRow" @save-success="methods.saveSuccess" />
  </el-container>
</template>
