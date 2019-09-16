<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<mt-field label='用户名' v-model='uname' placeholder='请输入用户名'></mt-field>
		<mt-field label='手机号' v-model='uphone'   type='tel' placeholder='请输入手机号码'></mt-field>
		<mt-field label='密码' v-model='upwd' type='password' placeholder='有6-12位英文数字组成'></mt-field>
		<mt-button size='large' type='primary' @click='login'>注册成功</mt-button>
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				uname:'',
				uphone:'',
				upwd:''
			}
		},
		methods:{
			login(){
				let n=this.uname;
				let p=this.upwd;
				let h=this.uphone;
				let nreg=/^.{3,15}$/i;
				let preg=/^[0-9a-zA-Z]{6,12}$/i;
				let hreg=/^1[3456789]\d{9}$/i;
				if(!nreg.test(n)){
					this.$toast('用户名格式不对');
					return;
				}
				if(!preg.test(p)){
					this.$toast('密码格式不对')
					return;
				}
				if(!hreg.test(h)){
					this.$toast('手机号码格式不对')
					return;
				}
				
				let url='reg';
				let obj={uname:n,upwd:p,uphone:h}
				this.axios.get(url,{params:obj}).then(res=>{
					if(res.data.code<0){
						this.$toast('该手机号码已经注册，请登录');
						this.$router.push('/login');
					}else{
						this.$toast('注册成功，请登录')
						this.$router.push('/login');
					}
				})
				
				
				
			}
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	
</style>
