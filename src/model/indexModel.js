module.exports = {

	//查询首页的数据列表
	getIndexDatas:function(callback){
		require('../mysql.js')('select * from goods',function(data){
		    callback&&callback(data);
		});
	},

	// 增加点击量
	addClickCount:function(num,goodsId,callback){
		require('../mysql.js')('update goods set click_count='+num+' where goods_id='+goodsId,function(data){
			callback&&callback(true);
		});
	}


	
};
