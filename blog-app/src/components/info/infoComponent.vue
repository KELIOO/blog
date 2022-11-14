<template>
  <!--1.首先，弹窗页面中要有el-dialog组件即弹窗组件，我们把弹窗中的内容放在el-dialog组件中-->
  <!--2.设置:visible.sync属性，动态绑定一个布尔值，通过这个属性来控制弹窗是否弹出-->
  <div v-if="changed">
    <el-dialog
      title="个人信息"
      :visible.sync="detailVisible"
      width="60%"
      :before-close="handleClose"
      append-to-body>
      <el-form :model="form"  ref="form" label-width="150px">
        <div class="updateinfo">
          <div class="left">
            <el-form-item label="头像" prop="avatar">
              <img style="width:150px;height:110px" :src="form.avatar"></img>
            </el-form-item>
            <el-form-item label="用户编号" prop="id">
              <el-input v-model="form.id"  disabled></el-input>
            </el-form-item>
            <el-form-item label="账号" prop="account">
              <el-input v-model="form.account" disabled></el-input>
            </el-form-item>
            <el-form-item label="昵称" prop="nickname">
              <el-input v-model="form.nickname" disabled></el-input>
            </el-form-item>

<!--            <el-form-item label="性别" prop="sex">
              <el-switch
                v-model="form.sex"
                active-color="#13ce66"
                inactive-color="#ff4949"
                active-text="男"
                inactive-text="女"
                :active-value= "1"
                :inactive-value= "0"
              >
              </el-switch>
            </el-form-item>-->
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="form.email" disabled></el-input>
            </el-form-item>
          </div>
          <div class="right">
            <el-form-item label="手机号码" prop="mobilePhoneNumber">
              <el-input v-model="form.mobilePhoneNumber" disabled></el-input>
            </el-form-item>
          </div>
        </div>
      </el-form>
      <span slot="footer" class="dialog-footer">
<!--    <el-button @click="handleClose">取 消</el-button>
    <el-button type="primary" @click="submit">提 交</el-button>-->
        <el-button type="primary" @click="change()" >修改信息</el-button>
  </span>
    </el-dialog>
  </div>
  <div v-else>
    <el-dialog
      title="修改个人信息"
      :visible.sync="detailVisible"
      width="60%"
      :before-close="handleClose"
      append-to-body>
      <el-form :model="form"  ref="form" label-width="150px">
        <div class="updateinfo">
          <div class="left">
            <el-form-item label="头像" prop="avatar">
              <img style="width:150px;height:110px" :src="form.avatar"></img>
            </el-form-item>
            <el-form-item label="用户编号" prop="id">
              <el-input v-model="form.id" disabled ></el-input>
            </el-form-item>
            <el-form-item label="账号" prop="account">
              <el-input v-model="form.account" disabled></el-input>
            </el-form-item>
            <el-form-item label="昵称" prop="nickname">
              <el-input v-model="form.nickname" ></el-input>
            </el-form-item>

            <!--            <el-form-item label="性别" prop="sex">
                          <el-switch
                            v-model="form.sex"
                            active-color="#13ce66"
                            inactive-color="#ff4949"
                            active-text="男"
                            inactive-text="女"
                            :active-value= "1"
                            :inactive-value= "0"
                          >
                          </el-switch>
                        </el-form-item>-->
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="form.email" ></el-input>
            </el-form-item>
          </div>
          <div class="right">
            <el-form-item label="手机号码" prop="mobilePhoneNumber">
              <el-input v-model="form.mobilePhoneNumber" ></el-input>
            </el-form-item>
          </div>
        </div>
      </el-form>
      <span slot="footer" class="dialog-footer">
<!--    <el-button @click="handleClose">取 消</el-button>
    <el-button type="primary" @click="submit">提 交</el-button>-->
        <el-button type="primary" @click="changeInfo()">提交</el-button>
  </span>
    </el-dialog>
  </div>
</template>

<script>
import {getUserByAccount,pushChangeInfo} from '@/api/info'
export default {
  name: "infoComponent",
  data(){
    return{
      detailVisible:false,
      changed:true,
      form: {
        id: '',
        account: "",
        avatar: "",
        email: "",
        mobilePhoneNumber: "",
        nickname: ""
      }/*,
      rules: {
        nickname: [
          { required: true, message: "昵称不能为空", trigger: "blur" },
        ],
        password: [
          { required: true, message: "账号密码不能为空", trigger: "blur" },
        ],
      },*/
    }
  },
  methods: {
    //3.定义一个init函数，通过设置detailVisible值为true来让弹窗弹出，这个函数会在父组件的方法中被调用
    init() {
      this.detailVisible = true;
      this.getInfo();
    },
    created(){
    },
    back(){
      this.changed = true;
    },
    change(){
      this.changed = false;
    },
    handleClose() {
      this.detailVisible = false;
      this.$emit("flesh");
    },
    getInfo(){
      getUserByAccount(this.$store.state.account).then(result =>{
        this.form = result.data;
      })
    },
    changeInfo(){
      pushChangeInfo(this.form).then(result =>{
        if(result.code === 200){
          this.$message({type: 'success', message: '修改成功！', showClose: true})
          this.changed = true;
        }else{
          this.$message({type:'error', message:'修改失败！', showClose: true})
        }
      })
    }
  }
}
</script>
<style>
.updateinfo {
  height: 350px;
  overflow: auto;
}
</style>
