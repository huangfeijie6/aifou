<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
	  <div style="width:100%;height: 180px;">
		  <mt-swipe :auto='4000'>
			  <mt-swipe-item><img src="http://127.0.0.1:3000/img/lun1.png" style='width:100%'></mt-swipe-item>
			  <mt-swipe-item><img src="http://127.0.0.1:3000/img/lun2.png" style='width:100%'></mt-swipe-item>
			  <mt-swipe-item><img src="http://127.0.0.1:3000/img/lun3.png" style='width:100%'></mt-swipe-item>
			  <mt-swipe-item><img src="http://127.0.0.1:3000/img/lun4.png" style='width:100%'></mt-swipe-item>
			  <mt-swipe-item><img src="http://127.0.0.1:3000/img/lun5.png" style='width:100%'></mt-swipe-item>
			  <mt-swipe-item><img src="http://127.0.0.1:3000/img/lun6.png" style='width:100%'></mt-swipe-item>
			  <mt-swipe-item><img src="http://127.0.0.1:3000/img/lun7.jpg" style='width:100%'></mt-swipe-item>
			  <mt-swipe-item><img src="http://127.0.0.1:3000/img/lun8.jpg" style='width:100%'></mt-swipe-item>
		  </mt-swipe>
	  </div>
	  <nava :list='list'></nava>
	  <day-recommend></day-recommend>
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	import nava from '../components/nav.vue'
	import dayrecommend from '../components/dayrecommend.vue'
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
			}
		},
		props:['list'],
		components:{
			'nava':nava,
			'dayRecommend':dayrecommend
		},
		created() {}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	
</style>
