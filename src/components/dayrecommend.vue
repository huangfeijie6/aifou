<!-- template组件模板：保存标签 -->
<template>
	<div class="bg">
		<div class="flex">
			<div class="left_border">今日推荐</div>
			<div class="flex">查看更多<div class="boult"></div></div>
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
	.flex{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	/* .top{
		display: flex;
		justify-content: space-between;
		align-items: center;
	} */
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
</style>
