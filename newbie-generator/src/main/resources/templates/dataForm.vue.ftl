<script setup>
import { computed, onMounted, reactive, ref } from 'vue'
import { saveApi } from './api.js'

defineOptions({ name: '${entity}DataFrom' })
const props = defineProps({
  currentRow: {
    type: Object,
    default: () => {
      return {}
    },
  },
})
const emit = defineEmits(['saveSuccess'])

/** 定义响应式变量 */
const formRef = ref()
const state = reactive({
  saveLoading: false,
  form: {
<#list table.fields as field>
    <#if !field.keyFlag>
        <#if "Integer"==field.propertyType || "Long"==field.propertyType|| "BigDecimal"==field.propertyType>
    ${field.propertyName}: 0,
        <#else>
    ${field.propertyName}: '',
        </#if>
    </#if>
</#list>
  },
})
/** 标题 */
const title = computed(() => {
  if (props.currentRow.${pkValue.name})
    return '修改数据'
  else
    return '新增数据'
})
/** 定义方法 */
const methods = {
  // 提交表单
  async submitForm(formEl) {
    if (!formEl)
      return
    await formEl.validate(async (valid) => {
      if (valid) {
        state.saveLoading = true
        const { ok } = await saveApi(state.form)
        state.saveLoading = false
        ok && emit('saveSuccess')
      }
    })
  },

  // 重置表单
  resetForm(formEl) {
    if (!formEl)
      return
    formEl.resetFields()
  },
}
// TODO 表单校验示例
const rules = {
  demo: [
    { required: true, message: '输入不能为空', trigger: 'blur' },
  ],
}
onMounted(() => {
  if (props.currentRow.${pkValue.name})
    state.form = { ...props.currentRow }
})
</script>

<template>
    <#if enableDrawer>
  <el-drawer
    v-model="state.showDataForm"
    :title="title"
    size="30%"
  >
        <#else>
  <el-dialog
    v-model="state.showDataForm"
    :title="title"
    width="30%"
  >
    </#if>
    <el-form ref="formRef" :model="state.form" :rules="rules" label-width="80px">
<#list table.fields as field>
    <#if !field.keyFlag>
      <el-form-item label="${field.comment}" prop="${field.propertyName}">
         <#if "Integer"==field.propertyType || "Long"==field.propertyType || "BigDecimal"==field.propertyType>
        <el-input-number v-model="state.form.${field.propertyName}" :value-on-clear="1" />
         <#elseif "Date"==field.propertyType || "LocalDateTime"==field.propertyType>
        <el-date-picker
          v-model="state.form.${field.propertyName}"
          type="datetime"
          placeholder="请选择${field.comment}"
          value-format="YYYY-MM-DD HH:mm:ss"
        />
         <#else>
        <el-input v-model="state.form.${field.propertyName}" placeholder="请输入${field.comment}" />
         </#if>
      </el-form-item>
    </#if>
</#list>
    </el-form>
    <template #footer>
      <el-button type="primary" :loading="state.saveLoading" @click="methods.submitForm(formRef)">
        提交
      </el-button>
      <el-button @click="methods.resetForm(formRef)">
        重置
      </el-button>
    </template>
      <#if enableDrawer>
  </el-drawer>
          <#else>
  </el-dialog>
              </#if>
</template>
