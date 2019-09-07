<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<div class="bg">
			<!-- <router-link :to='`/login`'> -->
				<div class="zhe" @click="exit">
					<div class="my"></div>
				</div>
			<!-- </router-link> -->
			<div v-if="uid">
				{{uname}}
			</div>
			<div v-else>
				点击登录
			</div>
		</div>
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				uid:null,
				uname:''
			}
		},
		methods:{
			reload(){
				let url='use';
				let obj={uid:this.uid};
				if(this.uid){
					// console.log(this.uid);
					this.axios.get(url,{params:obj}).then(res=>{
						// console.log(res.data.data[0]);
						if(res.data.data[0].uid){
							this.uname=res.data.data[0].uname;
						}else{
							return;
						}
					})
				}
			},
			exit(){
				console.log(sessionStorage.getItem("uid"));
				if(sessionStorage.getItem("uid")){
					this.$messagebox.confirm('确认退出登录？').then(action=>{
						this.$router.push('/login');
					}).catch(err=>{})
				}else{
					this.$router.push('/login');
				}
			}
		},
		created() {
			// console.log(sessionStorage.getItem("uid"));
			this.uid=sessionStorage.getItem("uid");
			console.log(this.uid);
			this.reload()
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	.bg{
		background: url('http://127.0.0.1:3000/img/ucbg.jpg') no-repeat center center;
		background-size: 100%;
		width: 100%;
		height: 130px;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
		color: #FFFFFF;
	}
	.zhe{
		width: 85px;
		height: 85px;
		border-radius: 50%;
		background: rgba(255,255,255,0.5);
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.my{
		width: 75px;
		height: 75px;
		background: #000 url('../assets/user.png') 100%/100%;
		border-radius: 50%;
	}
</style>
