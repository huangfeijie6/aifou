<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div class="bg">
		<div class="top">
			<div class="left"><div class="icon1"></div>购买订单</div>
			<div class="right">查看全部订单<div class="icon2"></div></div>
		</div>
		<hr style="width: 95%;">
		<div class="bottom">
			<div class="fater" v-for="(task,i) of 4" :key='i'>
				<div class="icon3"></div>
				待付款
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
				
			}
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	.bg{
		background: #fff;
	}
	.top{
		display: flex;
		justify-content: space-between;
		padding: 5px 10px;
		margin-top: 10px;
	}
	.left{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.right{
		display: flex;
		justify-content: space-between;
		align-items: center;
		font-size: 14px;
		color: #aaa;
	}
	.icon1{
		width: 25px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat 4px -197px;
		background-size: 550px 600px;
	}
	.icon2{
		width: 15px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat -50px -346px;
		background-size: 550px 600px;
	}
	.icon3{
		width: 25px;
		height: 25px;
		margin-bottom: 5px;
		background: url('../assets/icon.png') no-repeat 4px -244px;
		background-size: 550px 600px;
	}
	.fater{
		display: flex;
		font-size: 12px;
		color:#666;
		justify-content: space-between;
		flex-flow: column;
		align-items: center;
	}
	.bottom{
		padding-top: 5px;
		padding-bottom: 10px;
		display: flex;
		justify-content: space-around;
	}
</style>
