<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<!-- <selec @asc='asc'  ></selec> -->
		<selec @asc='asc' :lists='list' ></selec>
			<div class="pro">
				<div class="item" v-for="(task,i) of list"  :key='i'  >
					<router-link :to='`/proitem/`+task.pid'>
						<img :data-src="`http://127.0.0.1:3000/${task.img}`" src="http://127.0.0.1:3000/img/loading.gif" class="lazy-image" alt="">
						<!-- <img :src="`http://127.0.0.1:3000/${task.img}`" alt=""> -->
						<div>{{task.brand}}   {{task.title}}</div>
						<div @click="divScroll()">￥{{task.price}}</div>
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
	import axios from 'axios';
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				list:[]
			}
		},
		methods:{
			asc(list){
				this.list=list;
				// console.log(this.list);
			},
			throttle(fn, delay, atleast) {//函数绑定在 scroll 事件上，当页面滚动时，避免函数被高频触发，
				var timeout = null,//进行去抖处理
				startTime = new Date();
				return function() {
					var curTime = new Date();
					clearTimeout(timeout);
					if(curTime - startTime >= atleast) {
						fn();
						startTime = curTime;
						}else {
							timeout = setTimeout(fn, delay);
					}
				}
			},
			lazyload() {
				let images = document.getElementsByTagName('img');
				// let len = images.length
				let n= 0;      //存储图片加载到的位置，避免每次都从第一张图片开始遍历
				return function() {
					// console.log(images,images.length,n);
					var seeHeight = document.documentElement.clientHeight;
														// 文档元素		内部高度
					// var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
														// 									文本		顶部
					// console.log(document.documentElement.scrollTop,document.body.scrollTop,scrollTop);
					for(var i = n; i < images.length; i++) {
						if(images[i].offsetTop < seeHeight + document.documentElement.scrollTop) {
							// console.log(images[i].offsetTop < seeHeight + document.documentElement.scrollTop);
				　　　　 if(images[i].getAttribute('src') === 'http://127.0.0.1:3000/img/loading.gif') {
								// console.log(images[i].src,images[i].getAttribute('data-src'));
								images[i].src = images[i].getAttribute('data-src');
								// console.log(images[i].src);
							}
							n = n + 1;
						}
					}
				}
			}
		},
		created() {
			let url='products';
			this.axios.get(url).then(res=>{
				this.list=res.data.data;
				// console.log(this.list);
			});
			this.bus.$on('asc',this.asc.bind(this));
		},
		beforeMount() {
			
		},
		mounted() {
			var fn=this.lazyload();
			this.$nextTick(function(){
				setTimeout(()=>{
					let loImages=fn;
					loImages()
				},20);
			})
			window.addEventListener('scroll', this.throttle(fn, 500, 1000), false);
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
	.lazy-image { 
		/* background: url('../assets/loading.gif') no-repeat center; */
		background-size: 100%;
		height: 50vw;
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
