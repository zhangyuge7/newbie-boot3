<template>
  <#if gc.drawer>
  <el-drawer v-model="state.dataFormVisible"  size="30%" :title="title">
   <#else>
  <el-dialog :title="title" v-model="state.dataFormVisible" width="30%">
  </#if>

    <el-form :model="state.dataForm" ref="formRef" :rules="rules" label-width="100px">
      <#list fields as field>
        <#if !field.pk>
      <el-form-item label="${field.comment!}：" prop="${field.name}">
        <#if field.type=='Date'>
          <el-date-picker
                  :disabled="state.isDetail"
                  v-model="state.dataForm.${field.name}"
                  type="datetime"
                  placeholder="请选择日期和时间"
                  value-format="YYYY-MM-DD HH:mm:ss"
          />
            <#else>
              <el-input :disabled="state.isDetail" v-model="state.dataForm.${field.name}" placeholder="请输入"/>
        </#if>

      </el-form-item>
      </#if>
      </#list>
    </el-form>
    <template #footer v-if="!state.isDetail">
      <el-button @click="state.dataFormVisible = false">取消</el-button>
      <el-button type="primary" @click="onSubmit(formRef)" :loading="state.submitLoading">提交</el-button>
    </template>
    <#if gc.drawer>
    </el-drawer>
    <#else>
    </el-dialog>
      </#if>
</template>

<script setup>
  import { reactive, ref, computed } from 'vue'
  import { saveDataApi } from '@/api/${gc.moduleName}/${entity}'

  defineOptions({ name: '${Entity}DataForm' })
  const emit = defineEmits(['submitSuccess'])

  /**表单校验规则 */
  const rules = {
    // fieldName: [
    //     { required: true, message: '必填项', trigger: 'blur' },
    // ]
  }

  /**定义响应式数据 */
  const formRef = ref()
  const state = reactive({
    submitLoading:false,
    dataFormVisible: false,
    isDetail: false,
    dataForm: {},
  })

  const title = computed(() => state.isDetail ? '数据详情' : state.dataForm.id ? '编辑数据' : '新增数据')

  /**提交事件 */
  async function onSubmit(formEl) {
    if (!formEl) return
    await formEl.validate((valid, fields) => {
      if (valid) {
        state.submitLoading = true
        const data = { ...state.dataForm }
        saveDataApi(data).then(res => {
          emit('submitSuccess')
          state.dataFormVisible = false
        }).finally(()=>{
          state.submitLoading = false
        })
      }
    })
  }

  defineExpose({
    open(row, isDetail) {
      formRef.value && formRef.value.resetFields()
      state.isDetail = !!isDetail
      state.dataForm = row || {}
      state.dataFormVisible = true
    }
  })

</script>

<style scoped>

</style>