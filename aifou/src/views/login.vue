<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div class="bg">
		<div class="ding">
			<img src="http://127.0.0.1:3000/img/logo.jpg" alt="">
		</div>
		<mt-field label='手机号' v-model='uphone' type='number' placeholder='请输入手机号'></mt-field>
		<mt-field label='密码' type='password' v-model='upwd' placeholder='请输入密码'></mt-field>
		<mt-button type='primary' size='large' @click='login'>登录</mt-button>
		<mt-button type='danger' size='large' @click='reg'>注册</mt-button>
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				uphone:'13060800262',
				upwd:'huangfeijie',
				data:[]
			}
		},
		methods:{
			reg(){
				this.$router.push('/reg');
			},
			login(){
					let p=this.upwd;
					let h=this.uphone;
					let preg=/^[0-9a-zA-Z]{6,12}$/i;
					let hreg=/^1[3456789]\d{9}$/i;
					if(!preg.test(p)){
						this.$toast('密码格式不对')
						return;
					}
					if(!hreg.test(h)){
						this.$toast('手机号码格式不对')
						return;
					}
				
				let url='login';
				let obj={uphone:h,upwd:p};
				// console.log(obj);
				// 7:获取服务器返回结果
				this.axios.get(url,{params:obj}).then(res=>{
					// console.log(res.data);
					if(res.data.code<0){
					// 7.1:登录失败	提示
						this.$toast('用户名或者密码错误')
					}else{
					// 7.2:登录成功	跳转商品首页组件
						this.data=res.data.data;
						// console.log(res.data.data);
						sessionStorage.setItem("uid",this.data);
						this.$toast('登录成功');
						this.$router.push('/')
					}
				})
			}
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	img{
		width: 100%;
	}
	.bg{
		background: #fff;
	}
	.ding{
		font-size: 2rem;
		
	}
</style>
