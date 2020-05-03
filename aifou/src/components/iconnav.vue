<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<div @click="isshow=!isshow"
		class="bg"
		:class="isshow?'bg1':''">
		</div>
		<div class="fullscreen" :style="isshow?'z-index:2':''"></div>
		<router-link :to="`/`">
		<div :style="isshow?'z-index:20':''" :class="isshow?'home1':'home'"	></div>
		</router-link>
		<router-link :to='`/cart`'>
		<div :style="isshow?'z-index:20':''" :class="isshow?'shopping1':'shopping'" ></div>
		</router-link>
		<router-link :to='`/my`'>
		<div :style="isshow?'z-index:20':''" :class="isshow?'person1':'person'"></div>
		</router-link>
		
<!-- 		<div :style="isshow?'z-index:20':''" :class="isshow?'shopping1':'shopping'" @click='changState(1)'></div>
		<div :style="isshow?'z-index:20':''" :class="isshow?'person1':'person'" @click='changState(2)'></div> -->
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	// import Vue from 'vue'
	// import Router from 'vue-router'
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				isshow:false,
				bg1:true
			}
		},
		methods:{
			
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
	.home{
		width: 45px;
		height: 45px;
		position: fixed;
		z-index: -1;
		transition: .1s;
		top: 83%;
		left: 3%;
		background: url('../assets/icon.png')-100px -450px / 550px 600px no-repeat;
	}
	.home1{
		width: 45px;
		height: 45px;
		position: fixed;
		z-index: 20;
		transition: 0.1s;
		top: 60%;
		left: 2%;
		background: url('../assets/icon.png')-100px -450px / 550px 600px no-repeat;
	}
	.shopping{
		width: 45px;
		height: 45px;
		position: fixed;
		z-index: -1;
		transition: .1s;
		top: 83%;
		left: 3%;
		background: url('../assets/icon.png')-300px -450px / 550px 600px no-repeat;
	}
	.shopping1{
		width: 45px;
		height: 45px;
		position: fixed;
		z-index: 20;
		transition: 0.1s;
		top: 67%;
		left: 30%;
		background: url('../assets/icon.png')-300px -450px / 550px 600px no-repeat;
	}
	.person{
		width: 45px;
		height: 45px;
		position: fixed;
		z-index: -1;
		transition: .1s;
		top: 83%;
		left: 3%;
		background: url('../assets/icon.png')-300px -450px / 550px 600px no-repeat;
	}
	.person1{
		width: 45px;
		height: 45px;
		position: fixed;
		z-index: 20;
		transition: 0.1s;
		top: 83%;
		left: 43%;
		background: url('../assets/icon.png')-400px -450px / 550px 600px no-repeat;
	}
</style>
