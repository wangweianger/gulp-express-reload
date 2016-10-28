var glob = require('glob');
var path = require('path');
var fs = require('fs');

//获取所有入口文件
var routes={};
var entries = getEntry('./pages/'); 
entries.forEach(function(val,index){
	var valus=require(val);
	for(var key in valus){
		routes[key]=valus[key];
	}
})
// 合并路由
module.exports = function (app) {
	for(var key in routes){
		app.use(key, routes[key]);
	}
};

//入口函数
function getEntry(globPath) {
	var entries = [];
	var globalPath = path.resolve(__dirname, './pages/');
    readFilesFn(globalPath)
    function readFilesFn(dirpath,dirName){
		var paths=fs.readdirSync(dirpath);
	    if(!paths.length) return;
	    paths.forEach(function(val,index){
	    	if(val.indexOf('.')!=-1){
	    		if(/\.js$/.test(val)&&val=='routes.js'){
	    			entries.push(dirpath+'/'+val)
	    		};
	    	}else{
	    		readFilesFn(dirpath+'/'+val,val);
	    	}
	    })
	}
	return entries;
};

