<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<img :src="focused?select:normal" alt="">
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
		props:{
			focused:false,
			select:{default:''},
			normal:{default:''}
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	
</style>
