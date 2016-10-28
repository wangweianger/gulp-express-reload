var express = require('express');
var router = express.Router();

var demoData = {
  title: '首页商品',  
  time: (new Date).toString(),
  list: [],
}; 
 
// 查询数据列表
require('../../mysql.js')('select * from goods',function(data){
  demoData.list=data
});

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', demoData);
});

module.exports = router;
