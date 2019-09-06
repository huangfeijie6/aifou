<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div class="button">
		<!-- <div style="width: 375px;height: 667px;"  class="pic">
			<img src="../assets/nullshop.png" alt="">
			<p>空空如也</p>
			<p>赶紧去挑选几张自己喜欢的图片吧</p>
		</div>
		 -->
		 
		<div class="bg" v-for="(task,i) of list" :key='i'>
			<div class="width flex">
				<input type="checkbox">
				<img :src="`http://127.0.0.1:3000/${task.img}`" alt="">
				<div class="messge">
					<div class="title" v-text="task.lname"></div>
					<div class="details">
						<div v-text="`色彩:${task.color}`"></div>
						<div v-text="`版本:${task.version}`"></div>
					</div>
					<div class="bottom">
						<div class="left">
							 <el-input-number v-model="task.count" :data-id='task.id' :data-count='task.count' @change="handleChange(task.count,task.id)" :min="1" :max="10" ></el-input-number>
						</div>
						<div class="money" v-text="`￥${task.price*task.count}`"></div>
					</div>
				</div>
				<div class="del" @click="del" :data-id='task.id' >删除</div>
			</div>
		</div>
			<div class="add">总价:￥{{total}}.00</div>
			
			
			
			
			
			<!-- <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
			  <div style="margin: 15px 0;"></div>
			  <el-checkbox-group v-model="checkedCities" @change="handleCheckedCitiesChange">
			    <el-checkbox v-for="city in cities" :label="city" :key="city">{{city}}</el-checkbox>
			  </el-checkbox-group> -->
			
			
			
			
			
						
						
			<!-- <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
			<div style="margin: 15px 0;"></div>
			<el-checkbox-group v-model="list" @change="handleCheckedCitiesChange">
				 <el-checkbox  v-for="(task,i) of list" :label='i' :key='i'>
				 <div class="bg">
					<div class="width flex">
						<img :src="`http://127.0.0.1:3000/${task.img}`" alt="">
						<div class="messge">
							<div class="title" v-text="task.lname"></div>
							<div class="details">
								<div v-text="`色彩:${task.color}`"></div>
								<div v-text="`版本:${task.version}`"></div>
							</div>
							<div class="bottom">
								<div class="left">
									 <el-input-number v-model="task.count" :data-id='task.id' :data-count='task.count' @change="handleChange(task.count,task.id)" :min="1" :max="10" >
										 
									 </el-input-number>
								</div>
								<div class="money" v-text="`￥${task.price*task.count}`"></div>
							</div>
						</div>
						<div class="del" @click="del" :data-id='task.id' >删除</div>
					</div>
				 </div>
			 </el-checkbox>
				<div class="add">总价:￥{{total}}.00</div>
			 </el-checkbox-group> -->
			 
			
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				list:[]
				// value:[],
				// checkAll: false,
			 //  isIndeterminate: true
				
			}
		},
		computed:{
			total(){
				let total=0;
				for(let p of this.list){
					total+=p.count*p.price;
				}
				return total;
			}
		},
		methods:{
			
			// handleCheckAllChange(val) {
			// 	console.log(this.list);
			//   this.value = val ? this.list : [];
			//   console.log(this.value);
			//   this.isIndeterminate = false;
			// },
			// handleCheckedCitiesChange(value) {
			// 	console.log(value);
			//   let checkedCount = value.length;
			//   console.log(checkedCount);
			//   this.checkAll = checkedCount === this.list.length;
			//   console.log(this.checkAll );
			//   this.isIndeterminate = checkedCount > 0 && checkedCount < this.list.length;
			//   console.log(this.isIndeterminate);
			// },
			
			
						
			
			
			
			
			
			handleChange(count,id){
				let url='chang';
				let obj={count:count,id:id};
				this.axios.get(url,{params:obj}).then(res=>{
					console.log(res);
				})
			},
			en(e){
				console.log(e.targe);
			},
			loadmore(){
				let url='cart'
				this.axios.get(url).then(res=>{
					this.list=res.data.data;
					console.log(this.list);
				})
			},
			del(e){
				let id=e.target.dataset.id;
				let url='del';
				let obj={id:id};
				this.axios.get(url,{params:obj}).then(res=>{
					if(res.data.code>0){
						this.$toast('删除成功');
						this.loadmore();
					}
				})
			}
		},
		created() {
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
		width: 116%;
	}
	.add{
		background: #fff;
		font-size: 1.5rem;
	}
	.pic{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.flex{
		display: flex;
		justify-content: space-between;
		align-items: center;
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
		margin-bottom: 70px;
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
