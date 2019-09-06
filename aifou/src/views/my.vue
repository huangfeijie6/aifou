<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<uc></uc>
		<order v-for="(task,i) of 4" :key='i'></order>
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	import uc from '../components/uc.vue'
	import order from '../components/order.vue'
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				
			}
		},
		components:{
			'uc':uc,
			'order':order
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	
</style>
