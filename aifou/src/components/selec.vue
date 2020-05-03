<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div style="background: #FFFFFF;">
		<div class="heade">
			<div @click="pic" :class="{or_bottom}">当前价格
				<div :class="{icon1,icon1_active1,icon1_active2}"></div>
			</div>
			<div @click="icon2=!icon2">
				筛选
				<div :class="{icon2:true,icon2_active:icon2}"></div>
			</div>
		</div>
		<div class="panel" :style="icon2?'top:0px;':'top: -100%;'">
			<classify :lists='lists' @brea='brea'></classify>
			<div class="button">
				<div class="left">重置</div>
				<div class="right" @click="icon2=!icon2">完成</div>
			</div>
		</div>
	</div>
</template>
<script>
	import classify from './classify.vue'
	export default {
		data(){
			return{
				i:0,
				or_bottom:false,
				icon1:true,
				icon1_active1:false,
				icon1_active2:false,
				icon2:false,
				list:[]
			}
		},
		props:['lists'],
		methods:{
			// 当前价格 按钮（作用就是价格排序）
			pic(){
				// console.log(this.list);
				this.i++;
				this.or_bottom=true;
				this.icon1=false;
				if(this.i%2==0){
					// 从小到大
					this.icon1_active1=false;
					this.icon1_active2=true;
					let url='asc';
					let arr=[];
					// console.log(this.lists);
					// for(let i=0;i<this.lists.length;i++){
					// 	arr.push(this.lists[i].price)
					// 	console.log(this.lists[i].price);
					// }
					// console.log([...new Set(arr)]);
					this.axios.get(url).then(res=>{
						// console.log(this.list,res.data);
						this.list=res.data.data;
						this.$emit('asc',this.list)
						// console.log(res.data.data);
					})
				}else{
					// 从大到小
					this.icon1_active1=true;
					this.icon1_active2=false;
					let url='desc';
					console.log(this.lists);
					
					
					
					this.axios.get(url).then(res=>{
						this.list=res.data.data;
						this.$emit('asc',this.list)
						// console.log(res.data.data,this.list);
					})
				}
			},
			brea(brand){
				console.log(brand);
				let url='select';
				let obj={brand:brand};
				this.axios.get(url,{params:obj}).then(res=>{
					let list=res.data.data
					this.$emit('asc',list);
				})
			}
		},
		components:{
			'classify':classify
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	.heade{
		position: fixed;
		width: 100%;
		background: #fff;
		display: flex;
		justify-content: space-around;
		align-items: center;
		height: 50px;
		top: 0;
		font-size: 14px;
		border-bottom: 1px solid #eee;
		z-index: 2;
	}
	.heade>div{
		display: flex;
		justify-content: center;
		align-items: center;
		width: 50%;
		height: 30px;
	}
	.heade>div:first-child{
		border-right: 1px solid #E0E0E0;
	}
	.or_bottom{
		color: orange;
	}
	.icon1{
		width: 25px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat -141px -391px;
		background-size: 550px 600px;
	}
	.icon1_active1{
		width: 25px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat -41px -391px;
		background-size: 550px 600px;
	}
	.icon1_active2{
		width: 25px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat -91px -391px;
		background-size: 550px 600px;
	}
	.icon2{
		width: 25px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat -292px -341px;
		background-size: 550px 600px;
	}
	.icon2_active{
		background:url('../assets/icon.png') no-repeat -342px -341px;
		background-size: 550px 600px;
	}
	.panel{
		position: fixed;
		width: 100%;
		height: 100vh;
		padding-top: 51px;
		box-sizing: border-box;
		z-index: 0;
		background: #fff;
		transition: 1s;
	}
	.button{
		position: absolute;
		width: 100%;
		bottom: 0;
		display: flex;
		justify-content: space-between;
		align-items: center;
		color: #fff;
		height: 50px;
	}
	.right{
		display: flex;
		justify-content: center;
		align-content: center;
		background: seagreen;
		width: 100%;
		line-height: 50px;
	}
	.left{
		display: flex;
		justify-content: center;
		align-content: center;
		background: orange;
		width: 100%;
		line-height: 50px;
	}
</style>