package db
import (
    "fmt"
	"github.com/jinzhu/gorm"
    _ "github.com/go-sql-driver/mysql"
    //"github.com/jmoiron/sqlx"
	"github.com/penggy/EasyGoLib/utils"
)


var MYSQL *gorm.DB

func Init() (err error){

    userName  := utils.Conf().Section("mysql").Key("user").MustString("root")
    password  := utils.Conf().Section("mysql").Key("password").MustString("root")
    ipAddrees := utils.Conf().Section("mysql").Key("server").MustString("127.0.0.1")
    port      := utils.Conf().Section("mysql").Key("port").MustInt(3306)
    dbName    := utils.Conf().Section("mysql").Key("dbname").MustString("howwant")
    charset   := utils.Conf().Section("mysql").Key("charset").MustString("utf8")
	
	gorm.DefaultTableNameHandler = func(db *gorm.DB, defaultTablename string) string {
		return "hw_live_" + defaultTablename
	}
	
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=%s&parseTime=True&loc=Local", userName, password, ipAddrees, port, dbName, charset)
	
	MYSQL, err = gorm.Open("mysql", dsn)
	
	if err != nil {
	
        fmt.Printf("mysql connect failed, detail is [%v]", err.Error())
    }
	
	return
}


func Close() {

    
    if MYSQL != nil {
		MYSQL.Close()
		MYSQL = nil
	}
}
/*
func MysqlSelect2() {

    type userInfo struct {
        Id int `db:"id"`
        Mid string `db:"mid"`
        Title string `db:"title"`
        LiveType int `db:"live_type"`
        AccessMode int `db:"access_mode"`
        ServerNode string `db:"server_node"`
        ViewPermission int `db:"view_permission"`
        StartTime string `db:"start_time"`
        Cover string `db:"cover"`
        Uid string `db:"uid"`
    }
	
	var Db *sqlx.DB = MysqlConnect()
	
    defer Db.Close()

    //定义结构体切片，用来存放多条查询记录
    var userInfoSlice []userInfo
    err := Db.Select(&userInfoSlice,"select * from hw_live_list")
    if err != nil {
        fmt.Printf("query faied, error:[%v]", err.Error())
        return
    }

    //遍历结构体切片
    for _, userData := range userInfoSlice {
        fmt.Println(userData.Id, userData.Mid, userData.Title, userData.LiveType, userData.AccessMode, userData.ServerNode, userData.ViewPermission, userData.StartTime, userData.Cover, userData.Uid)
    }
	

}


func main() {
	
	
	
	

}
*/
