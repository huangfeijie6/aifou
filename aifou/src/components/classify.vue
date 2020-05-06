<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<div class="top">
			<div>品牌</div>
			<div class="index" @click='speed=!speed' :style="speed?'transform: rotate(180deg);':''"></div>
		</div>
		<div class="bottom" :style="speed?'':'height:35px;'" >
			<div class="bg" v-for="(task,i) of brands" :key='i' @click='hanshu(i)'>
				<div :class="{on:true,active:stats[i].isselect}">{{brands[i]}}</div>
			</div>
		</div>
		<hr>
	</div>
</template>

<script>
	// vue 组件:导出默认对象
	export default {
		data(){
			//当前组件共享数据，模块直接读取
			return{
			//默认返回空对象（没数据）
				speed:false,
				brands:[],
				brand:'',
				stats:[
					{isselect:false},
					{isselect:false},
					{isselect:false},
					{isselect:false},
					{isselect:false},
					{isselect:false},
					{isselect:false},
					{isselect:false},
					{isselect:false},
					{isselect:false}
				]
			}
		},
		props:["lists"],
		methods:{
			// 选择品牌
			hanshu(i){
				let $i=i;
				for(let i=0;i<this.stats.length;i++){
					$i==i?this.stats[i].isselect=true:this.stats[i].isselect=false;
				}
				this.brand=this.brands[i];
				// console.log(this.brands);
				let brand=this.brand;
				this.$emit('brea',brand);
			},
			// 选择数据库有的品牌
			crea(){
				let len=this.lists.length;
				// console.log(this.lists);
				for(let i=0;i<len;i++){
					this.brands.push(this.lists[i].brand)
				}
				this.brands=[...new Set(this.brands)];
			},
			// 导出选择的品牌
			// sucess(){
			// 	let url='select';
			// 	// console.log(this.brands);
			// 	let obj={brand:this.brand};
			// 	this.axios.get(url,{params:obj}).then(res=>{
			// 		console.log(res.data.data,this.lists);
			// 		let list=res.data.data
			// 		this.$emit('brea',list);
			// 	})
			// }
		},
		created(){
			// console.log(this.lists) // ×--> 'lesser',  
			setTimeout(()=>{
				// console.log(this.lists) // √--> 'lesser','..一段长文..'
				this.crea();
			},1000)
		},
		beforeMount() {
			
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	hr{
		border: 1px solid #EEEEEE;
	}
	.top{
		padding: 10px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.index{
		width: 25px;
		height: 25px;
		transition: 0.5s;
		transform-origin:65% 50%;
		background: url('../assets/icon.png') no-repeat -192px -345px;
		background-size: 550px 600px;
	}
	.bottom{
		font-size: 12px;
		display: flex;
		justify-content: flex-start;
		align-items: center;
		flex-flow: row wrap;
		overflow:hidden;
		padding: 5px;
	}
	.bg{
		width: 33.33%;
		padding: 5px;
		box-sizing: border-box;
		border-radius: 2px;
	}
	.on{
		background: #eee;
		line-height: 25px;
	}
	.active{
		color: #FFFFFF;
		background: seagreen;
	}
</style>
