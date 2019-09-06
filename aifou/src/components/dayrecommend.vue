<!-- template组件模板：保存标签 -->
<template>
	<div class="bg">
		<div class="flex">
			<div class="left_border">今日推荐</div>
			<div class="flex font">查看更多<div class="boult"></div></div>
		</div>
		<div class="flex bortop" v-for="(task,i) of 5" :key="i">
			<div class="rol-3">
				<img src="http://127.0.0.1:3000/img/it1.png" alt="">
			</div>
			<div class="rol-9">
				<div>Apple
				iPhone 6s Plus 128G 移动4G/联通4G</div>
				<span>¥1399</span>
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
		},
		methods:{
			
		}
		
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	.font{
		color: #999;
		font-size: 0.75rem;
	}
	.flex{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.boult{
		width: 15px;
		height: 16px;
		background: url('../assets/icon.png') -50px 250px/550px 600px  repeat;
	}
	.bg{
		background: #fff;
		padding: 10px;
	}
	.left_border{
		border-left: 4px solid #008800;
		padding-left: 5px;
	}
	.rol-3{
		width: 33.33%;
		max-width: 33.33%;
	}
	.rol-9{
		width: 66.67%;
		max-width: 66.67%;
		display: flex;
		flex-flow: column;
		text-align: left;
		justify-content:flex-start;
		align-items: flex-start;
	}
	.rol-9>span{
		color: orange;
	}
	.bortop{
		border-top: 1px solid #e5e5e5;
		margin-top: 5px;
		padding-top: 5px;
	}
	img{
		width: 100px;
	}
</style>
