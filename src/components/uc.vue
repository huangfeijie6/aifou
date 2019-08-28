<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<div class="bg">
			
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
		background: url('../../public/img/ucbg.jpg') no-repeat center center;
		background-size: 100%;
		width: 100%;
		height: 130px;
	}
</style>
