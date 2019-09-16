<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<mt-swipe style='height: 375px;'>
			<mt-swipe-item v-for='(task,i) of list1' :key='i'>
				<img :src="`http://127.0.0.1:3000/${task}`" alt="">
			</mt-swipe-item>
		</mt-swipe>
		<div class="title">
			<div class="flex">
				<div>{{list2.title}}</div>
				<div class="moeny">售价<span>￥{{list2.price}}</span>
				<div v-show="list2.old_price" class="old">
					(原价: 
					<div class="oldpic" v-text="`￥${list2.old_price}`"></div>
					)
				</div>
			</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			</div>
			<mt-button class='btn' size='large' type='primary' @click='addcart'
			:data-pid='list2.pid' :data-lname='list2.title' :data-img='list2.img' 
			:data-color='list2.color' :data-price='list2.price' 
			:data-version='list2.version'
			>加入购物车</mt-button>
		</div>
	<iconnav></iconnav>
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	import iconnav from '../components/iconnav.vue'
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				list1:[],
				list2:[]
			}
		},
		props:['pid'],
		methods:{
			addcart(e){
				var pid=e.target.dataset.pid;
				var lname=e.target.dataset.lname;
				var img=e.target.dataset.img;
				var color=e.target.dataset.color;
				var price=e.target.dataset.price;
				var version=e.target.dataset.version;
				let url='addcart';
				let obj={pid:pid,lname:lname,img:img,color:color,price:price,version:version};
				this.axios.get(url,{params:obj}).then(res=>{
					if(res.data.code>0){
						this.$toast('添加成功')
					}else{
						this.$toast('添加失败')
					}
				})
				
			}
		},
		
		created() {
			let u=this.uname;
			let p=this.upwd;
			let url1='pshow_img';
			let obj={uname:u,upwd:p};
			this.axios.get(url1).then(res=>{
				let list=res.data.data[this.pid-1];
				delete list.pid;
				for(let i in list){
					if(!list[i]){
						delete list[i]
					}
				}
				this.list1=list;
				}
			);
			let url2='products'
			this.axios.get(url2).then(res=>{
				// console.log(res.data.data);
				this.list2=res.data.data[this.pid-1];
			})
		},
		components:{
			'iconnav':iconnav
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	img{
		height: 100%;
		width: 100%;
	}
	.title{
		background: #fff;
		padding: 0.5rem;
	}
	.flex{
		display: flex;
		flex-flow: column;
		align-items: flex-start;
	}
	.flex span{
		color: orange;
		font-size: 1.5rem;
	}
	.moeny{
		color: #aaa;
	}
	.old{
		display: inline;
	}
	.oldpic{
		display: inline;
		text-decoration: line-through;
	}
	.btn{
		position: fixed;
		top: 94%;
		left: 0;
	}
</style>
