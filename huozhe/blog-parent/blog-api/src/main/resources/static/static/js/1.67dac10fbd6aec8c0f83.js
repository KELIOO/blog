webpackJsonp([1],{HWSu:function(e,t){},ncpC:function(e,t,s){"use strict";Object.defineProperty(t,"__esModule",{value:!0});s("2hfY");var a=s("OOvn");var n={data:function(){return{nickName:this.$store.state.name,id:this.$store.state.id,message:"",total:0,currentpage:1,pagesize:3,ticket:[],pageTicket:[]}},created:function(){this.doQuery()},methods:{doQuery:function(){var e=this;Object(a.a)({url:"/message/lists",methods:"get"}).then(function(t){e.ticket=t.data,e.total=t.data.length,e.getPageInfo()})},submitMessage:function(){var e,t,s,n=this;{if(""!==this.message&&""!==this.message.replace(/(^\s*)|(\s*$)/g,""))return""===this.$store.state.name?(this.$message({message:"请先登录！",type:"error",showClose:!0}),void(this.message="")):void(e=this.nickName,t=this.message,s={nickname:e,content:t},Object(a.a)({url:"/message/add",method:"post",data:s})).then(function(e){200===e.code?(n.$message({message:"留言成功!",type:"success",showClose:!0}),n.message="",n.doQuery()):n.$message({message:"留言失败！",type:"error",showClose:!0})});this.$message("留言不能为空")}},getPageInfo:function(){this.pageTicket=[];for(var e=(this.currentpage-1)*this.pagesize;e<this.total&&(this.pageTicket.push(this.ticket[e]),this.pageTicket.length!==this.pagesize);e++);},handleSizeChange:function(e){this.pagesize=e,this.getPageInfo()},handleCurrentChange:function(e){this.currentpage=e,this.getPageInfo()},deleted:function(e){var t=this;(function(e){return Object(a.a)({url:"/message/delete/"+e,method:"post"})})(e).then(function(e){200===e.code?(t.$message({message:"删除成功!",type:"success",showClose:!0}),t.doQuery()):t.$message({message:"留言失败!",type:"error",showClose:!0})})}}},i={render:function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",[s("el-card",{staticClass:"el-card-d",attrs:{shadow:"always"}},[s("el-timeline",{attrs:{"infinite-scroll-disabled":"disabled"}},[e.pageTicket.length>0?s("div",e._l(e.pageTicket,function(t,a){return s("el-timeline-item",{key:a,attrs:{timestamp:t.createDate,placement:"top"}},[s("el-card",{staticClass:"el-card-m"},[s("div",{staticClass:"el-card-m-nick-name"},[e._v("\n                作者："+e._s(t.nickname)+"\n                "),"1"===e.id?s("button",{staticClass:"el-icon-delete",staticStyle:{color:"red"},on:{click:function(s){return e.deleted(t.id)}}}):e._e()]),e._v(" "),s("span",{staticClass:"el-card-m-content"},[e._v(e._s(t.content))])])],1)}),1):s("div",[s("el-timeline-item",{attrs:{placement:"top"}},[s("el-card",{staticClass:"el-card-m"},[s("p",{staticClass:"el-card-m-nick-name"},[e._v("  没有任何留言")])])],1)],1)]),e._v(" "),s("el-pagination",{attrs:{"current-page":e.currentpage,"page-size":e.pagesize,layout:"total, prev, pager, next",total:e.total},on:{"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}})],1),e._v(" "),s("div",{staticClass:"el-card-messages"},[s("el-input",{staticClass:"message-text",staticStyle:{"background-color":"#8074c1"},attrs:{slot:"prepend",type:"textarea",rows:2,placeholder:"输入留言",maxlength:"150"},slot:"prepend",model:{value:e.message,callback:function(t){e.message=t},expression:"message"}}),e._v(" "),s("el-button",{staticClass:"submit-message",attrs:{type:"info",round:"",size:"mini"},on:{click:e.submitMessage}},[e._v("留言")])],1)],1)},staticRenderFns:[]};var c=s("VU/8")(n,i,!1,function(e){s("HWSu")},"data-v-2894cb33",null);t.default=c.exports}});
//# sourceMappingURL=1.67dac10fbd6aec8c0f83.js.map