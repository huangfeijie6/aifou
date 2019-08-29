<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div class="row">
			<div class="down" v-for="(task,i) of list" :key='i'>
				<router-link :to='`/Pro`'>
					<div><img :src='require(`../../public/${task.img}`)'></div>
					<div>{{task.name}}</div>
				</router-link>
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
			list:[
				{img:'img/phone.png',name:'手机'},
				{img:'img/iPad.png',name:'平板'},
				{img:'img/book.png',name:'笔记本'},
				{img:'img/biao.png',name:'智能手表'},
				{img:'img/peijian.png',name:'配置'},
				{img:'img/aifoukaiwu.png',name:'爱否开物'}
				]
			}
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	a{
		color:#000000;
		text-decoration: none;
		font-size: 14px;
		padding: 5px 0;
	}
	a div:last-child{
		padding: 5px 0;
	}
	.row{
		margin-bottom: 10px;
		background: #fff;
		display: flex;
		flex-flow: row wrap;
	}
	.down{
		flex-flow: column wrap;
		display: flex;
		padding: 5px 0;
		width: 25%;
	}
	.down div>img{
		width: 45px;
	}
</style>
