<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<div
		@click="isshow=!isshow"
		class="bg"
		:class="isshow?'bg1':''">
		</div>
		<div class="fullscreen" :style="isshow?'z-index:3':''"></div>
		
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				isshow:false,
				bg1:true
			}
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	.bg{
		width: 45px;
		height: 45px;
		position: fixed;
		z-index: 4;
		top: 83%;
		left: 3%;
		background: url('../assets/icon.png')0px -450px / 550px 600px no-repeat;
	}
	.bg1{
		background: url('../assets/icon.png')-500px -450px / 550px 600px no-repeat;
	}
	.fullscreen{
		position: fixed;
		top: 0;
		width: 100%;
		height: 100%;
		background: rgba(0,0,0,.5);
		z-index: -1;
	}
</style>
