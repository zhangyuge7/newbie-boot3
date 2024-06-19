import axios, { msgType } from '@/utils/axios'

const BASE_URL = '/${package.ModuleName}/${controllerMappingHyphen}'

/**
* 获取分页数据
* @param {Object} params 筛选条件参数
* @returns
*/
export function getPaging(params) {
  return axios.get(`${r'${BASE_URL}'}/paging`, { params })
}

/**
* 保存数据，有id则修改，否则新增
* @param {Object} data 数据对象
* @returns {Promise}
*/
export function saveApi(data) {
  if (data.id)
    return axios.post(`${r'${BASE_URL}'}/update`, data, { successMsgType: msgType.msg })
  else
    return axios.post(`${r'${BASE_URL}'}/add`, data, { successMsgType: msgType.msg })
}

/**
* 新增数据
* @param {Object} data 数据对象
* @returns {Promise}
*/
export function addApi(data) {
  return axios.post(`${r'${BASE_URL}'}/add`, data, { successMsgType: msgType.msg })
}

/**
* 修改数据
* @param {Object} data 数据对象
* @returns {Promise}
*/
export function updateApi(data) {
  return axios.post(`${r'${BASE_URL}'}/update`, data, { successMsgType: msgType.msg })
}

/**
* 根据ID列表批量删除数据
* @param {Array} ids ID列表
* @returns {Promise}
*/
export function deleteBatchApi(ids) {
  return axios.post(`${r'${BASE_URL}'}/deleteBatch`, ids, { successMsgType: msgType.msg })
}
