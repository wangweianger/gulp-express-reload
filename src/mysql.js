
var mysql = require('mysql');

// 处理mysql 
module.exports=function(mysqlselect,fn){
  // 链接数据库
  var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'test'
  });
  // 开始链接
  connection.connect();
  //开始查询 
  connection.query(mysqlselect, function(err, rows, fields) {
    if (err) throw err;
    fn(rows); 
  });

  connection.end();
}; 