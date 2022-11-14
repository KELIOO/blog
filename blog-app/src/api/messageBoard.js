import request from '@/request'

export function messageBoard(nickname,content) {
  const data = {
    nickname,
    content
  }
  return request({
    url: '/message/add',
    method: 'post',
    data
  })
}

export function messageList() {
  return request({
      url: '/message/lists',
      methods: 'get'
  })
}
export function deleteById(id) {
  return request({
      url: `/message/delete/${id}`,
      method: 'post'
  })
}
