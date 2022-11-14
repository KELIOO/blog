import request from '@/request'

export function getUserByAccount(account) {
  return request({
    url: `/info/getInfo/${account}`,
    method: 'get'
  })
}
export function pushChangeInfo(form) {
  const data = {
    id: form.id,
    account: form.account,
    avatar: form.avatar,
    email: form.email,
    mobilePhoneNumber: form.mobilePhoneNumber,
    nickname: form.nickname
  }
  return request({
    url: '/info',
    method:'post',
    data
  })
}
