<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div>
		<div class="top">
			<div>品牌</div>
			<div class="index" @click='speed=!speed' :style="speed?'transform: rotate(180deg);':''"></div>
		</div>
		<div class="bottom" :style="speed?'':'height:35px;'" >
			<div class="bg" v-for="(task,i) of 10" :key='i' @click='hanshu(i)'>
				<div :class="{on:true,active:stats[i].isselect}">Apple</div>
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
		methods:{
			hanshu(i){
				let $i=i;
				for(let i=0;i<this.stats.length;i++){
					if($i==i){
						this.stats[i].isselect=true;
					}else{
						this.stats[i].isselect=false;
					}
				}
			}
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
