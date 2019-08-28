<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div v-show="y>0">
		<div class="bg" @click="goback"></div>
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				y:''
			}
		},
		methods:{
			goback(){
				var i=100;
				console.log(window.scrollY);
				var myVar=setInterval(function(){
					scrollTo(0,window.scrollY-i);
					if(window.scrollY-i<0){
						clearInterval(myVar)
						scrollTo(0,0);
					}
				},20)
			}
		},
		mounted() {
			window.onscroll=()=>{
				var y=window.scrollY;
				this.y=y;
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
		background: url('../assets/icon.png')no-repeat -500px -350px;
		/* background: url(/img/icon.76b74639.png)no-repeat ; */
		z-index: 9999;
		top: 90%;
		right: 3%;
		background-size: 550px 600px;
	}
</style>
