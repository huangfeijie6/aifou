<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div class="button">
		<div style="width: 375px;height: 667px;"  class="pic" v-if="list.code==-1||list.length<1">
			<img src="../assets/nullshop.png" alt="">
			<p>空空如也</p>
			<p>赶紧去挑选几件自己喜欢的商品吧</p>
		</div>
		
		 <div v-else>
			<div class="bg" v-for="(task,i) of list" :key='i'>
				<div class="width flex">
					<!-- <div class="checkbox" @click="checkbtn(i)"  :class={checkbox1:task.select}></div> -->
					<input type="checkbox" :checked='task.cb' v-model="task.cb" @click="checkbtn(i)">
					<img :src="`http://127.0.0.1:3000/${task.img}`" alt="">
					<div class="messge">
						<div class="title" v-text="task.lname"></div>
						<div class="details">
							<div v-text="`色彩:${task.color}`"></div>
							<div v-text="`版本:${task.version}`"></div>
						</div>
						<div class="bottom">
							<div class="left">
								 <el-input-number v-model="task.count" @change="handleChange(task.count,task.id)" :min="1" :max="10" ></el-input-number>
							</div>
							<div class="money" v-text="`￥${task.price*task.count}`" @click="num1(task.count,task.price,task.cb)"></div>
						</div>
					</div>
					<div class="del" @click="del" :data-id='task.id' >删除</div>
				</div>
			</div>
				<div class="add">
					<div><input type="checkbox" @click="checkall" v-model="checkAll">全选</div>
					总价:￥{{num}}.00
					<mt-button type='primary' @click="jumpmark">去结算</mt-button>
				</div>
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
				list:[],
				checkAll: true,
				num:0
			}
		},
		// computed:{
		// 	total(){
		// 		let total=0;
		// 		for(let p of this.list){
		// 			console.log(p.cb);
		// 			if(p.cb){
		// 				total+=p.count*p.price;
		// 			}else{
		// 				total+=0;
		// 			}
		// 		}
		// 		return total;
		// 	}
		// },
		methods:{
			num1(){
				let list=this.list;
				let num=0;
				for(let i=0;i<this.list.length;i++){
					if(list[i].cb){
						num+=list[i].count*list[i].price;
					}
				}
				this.num=num;
			},
			checkbtn(i){
				if(this.list[i].cb==false){
					this.list[i].cb=true;
				}else{
					this.list[i].cb=false;
				}
				for(let i=0;i<this.list.length;i++){
					if(this.list[i].cb==false){
						this.checkAll=false;
						this.num1();
						return;
					}else{
						this.checkAll=true;
					}
				}
				this.num1();
				
			},
			checkall(){
				if(this.checkAll==false){
					this.checkAll=true;
				}else{
					this.checkAll=false;
				}
				for(let i=0;i<this.list.length;i++){
					this.list[i].cb=this.checkAll;
				}
				this.num1();
			},
			handleChange(count,id){
				let url='chang';
				let obj={count:count,id:id};
				this.axios.get(url,{params:obj}).then(res=>{
					// console.log(res)
				})
				this.num1();
			},
			loadmore(){
				let url='cart';
				this.axios.get(url).then(res=>{
					if(res.data.code==-1){
						this.list=res.data;
						return;
					}else{
						this.list=res.data.data;
						for(let i=0;i<this.list.length;i++){
							this.list[i].cb=true;
						}
						this.num1();							
					}
				})
			},
			del(e){
				let id=e.target.dataset.id;
				let url='del';
				let obj={id:id};
				this.$messagebox.confirm('确定要删除吗?').then(action=>{
					this.axios.get(url,{params:obj}).then(res=>{
						if(res.data.code>0){
							this.$toast('删除成功');
							this.loadmore();
						}})
				}).catch(err=>{})
				this.num1();
			},
			jumpmark(){
				this.$router.push('mark')
			}
		},
		mounted() {
			this.loadmore();
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	p{
		color: #999999;
		margin: 5px;
	}
	img{
		height: 100px;
	}
	.width{
		width: 121%;
	}
	.add{
		background: #fff;
		font-size: 1.5rem;
		position: fixed;
		z-index: 2;
		width: 100%;
		bottom: 52px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.pic{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.flex{
		display: flex;
		/* display: -webkit-box; */
		justify-content: space-between;
		align-items: center;
	}
	.checkbox{
		width: 20px;
		height: 20px;
		border-radius: 50%;
		background: #aaa url('../assets/yes.png') -50px -50px no-repeat;
	}
	.checkbox1{
		background-position: -2px -2px;
	}
	.left{
		display: flex;
		justify-content: flex-start;
	}
	.left >input{
		width: 20%;
		border: 0 solid #000000;
		text-align: center;
	}
	.bg{
		background: #fff;
		/* padding: 1rem; */
		margin-bottom: 5px;
		/* width: 500px; */
		overflow: scroll;
	}
	.bg::-webkit-scrollbar{
		display: none;
	}
	.title{
		text-align: left;
		width: 250px;
		overflow: hidden;
		-ms-text-overflow: ellipsis;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.button{
		margin-bottom: 100px;
	}
	.messge{
		height: 100%;
		display: flex;
		align-items: flex-start;
		justify-content: flex-start;
		flex-flow: column;
	}
	.bottom{
		width: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.money{
		color: orange;
		font-weight: 700;
	}
	.details{
		color: #AAAAAA;
		font-size: 0.75rem;
		padding: 5px 0;
		display: flex;
		flex-flow: column;
		align-items: flex-start;
	}
	.el-input__inner{
		height: 30px;
	}
	
	.del{
		padding: 2rem 1rem;
		height: 100%;
		margin-left: 1.1rem;
		background: orange;
	}
	
</style>
