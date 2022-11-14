import request from '@/request'
export function addzan(){
  return request({
    url: '/Zan/add',
    method: 'get',
  })
}
export function findZan(){
  return request({
    url: '/Zan/find',
    method: 'get',
  })
}
