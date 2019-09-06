<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<selec></selec>
			<div class="pro">
				<div class="item" v-for="(task,i) of list" :key='i'>
					<router-link :to='`/proitem/`+task.pid'>
					<img :src="`http://127.0.0.1:3000/${task.img}`" alt="">
					<div>{{task.brand}}   {{task.title}}</div>
					<div>￥{{task.price}}</div>
					</router-link>
				</div>
			</div>
		<icon-nav></icon-nav>
		<goback/>
	</div>
</template>
<script>
	// vue 组件:导出默认对象
	import selec from '../components/selec.vue'
	import goback from '../components/goback.vue'
	import iconnav from '../components/iconnav.vue'
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				list:[]
			}
		},
		created() {
			var url='products'
			this.axios.get(url).then(res=>{
				this.list=res.data.data;
			})
		},
		components:{
			'selec':selec,
			'goback':goback,
			'iconNav':iconnav
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	a{
		text-decoration: none;
		color: #000000;
	}
	.pro{
		display: flex;
		flex-flow: row wrap;
		background: #fff;
		padding: 0 20px;
		margin-top: 51px;
	}
	.item{
		width: 50%;
		font-size: 12px;
	}
	.item img{
		width: 100%;
	}
	.item div+div{
		color: orange;
	}
</style>
