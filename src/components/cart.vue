<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div style="width: 375px;height: 667px;"  class="pic">
		<img src="../assets/nullshop.png" alt="">
		<p>空空如也</p>
		<p>赶紧去挑选几张自己喜欢的图片吧</p>
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
	.pic{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	p{
		color: #999999;
		margin: 5px;
	}
</style>
