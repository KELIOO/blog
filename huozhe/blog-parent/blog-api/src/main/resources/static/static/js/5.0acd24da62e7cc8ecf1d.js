webpackJsonp([5],{di2u:function(e,t,s){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i={name:"Space",beforeRouteEnter:function(e,t,s){console.log("准备进入个人信息页"),sessionStorage.getItem("isLogin")||s({path:"/login"}),s()},data:function(){return{user:{userpic:"static/userpic/userpic.jpg",username:"游客"}}}},a={render:function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticStyle:{"background-color":"white"}},[s("el-container",{staticStyle:{height:"800px",border:"1px solid #eee"}},[s("el-aside",{staticStyle:{"margin-top":"1%"},attrs:{width:"200px"}},[s("div",{staticStyle:{width:"190px","background-color":"white",padding:"5px",margin:"auto"}},[s("img",{staticStyle:{"border-radius":"300px","margin-left":"8%"},attrs:{src:e.user.userpic,width:"150px",height:"150px"},model:{value:e.user.userpic,callback:function(t){e.$set(e.user,"userpic",t)},expression:"user.userpic"}}),e._v(" "),s("br"),e._v(" "),s("br"),e._v(" "),s("p",{staticStyle:{margin:"0 auto","text-align":"center"},model:{value:e.user.username,callback:function(t){e.$set(e.user,"username",t)},expression:"user.username"}},[e._v(e._s(e.user.username))])]),e._v(" "),s("br"),e._v(" "),s("br"),e._v(" "),s("el-menu",{attrs:{"default-openeds":["1","2"]}},[s("el-submenu",{attrs:{index:"1"}},[s("template",{slot:"titl"},[s("i",{staticClass:"el-icon-message"}),e._v("用户中心")]),e._v(" "),s("el-menu-item-group",[s("router-link",{staticClass:"alink",attrs:{to:"/space/spaceinfo"}},[s("el-menu-item",{attrs:{index:"1-1"}},[e._v("个人信息")])],1),e._v(" "),s("router-link",{staticClass:"alink",attrs:{to:"/space/changepic"}},[s("el-menu-item",{attrs:{index:"1-2"}},[e._v("修改头像")])],1),e._v(" "),s("router-link",{staticClass:"alink",attrs:{to:"/space/changeinfo"}},[s("el-menu-item",{attrs:{index:"1-3"}},[e._v("修改信息")])],1)],1)],2),e._v(" "),s("el-submenu",{attrs:{index:"2"}},[s("template",{slot:"title"},[s("i",{staticClass:"el-icon-menu"}),e._v("博客管理")]),e._v(" "),s("el-menu-item-group",[s("router-link",{staticClass:"alink",attrs:{to:"/space/bokelist"}},[s("el-menu-item",{attrs:{index:"2-1"}},[e._v("博客列表")])],1),e._v(" "),s("router-link",{staticClass:"alink",attrs:{to:"/space/wirterboke"}},[s("el-menu-item",{attrs:{index:"2-2"}},[e._v("书写文章")])],1)],1)],2)],1)],1),e._v(" "),s("el-container",{staticStyle:{"background-color":"white"}},[s("el-main",[s("router-view")],1)],1)],1)],1)},staticRenderFns:[]};var r=s("VU/8")(i,a,!1,function(e){s("ei1N")},"data-v-ea7867c0",null);t.default=r.exports},ei1N:function(e,t){}});
//# sourceMappingURL=5.0acd24da62e7cc8ecf1d.js.map