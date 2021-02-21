package models

type List struct {
	ID               int `gorm:"type:int(11);primary_key;unique"`
	Mid        string `gorm:"type:varchar(255)"`
	Title        string `gorm:"type:varchar(255)"`
	Live_type        int `gorm:"type:int(1)"`
	Access_mode        int `gorm:"type:int(1)"`
	Server_node         string `gorm:"type:varchar(255)"`
	View_permission         int `gorm:"type:int(1)"`
	Start_time         string `gorm:"type:time"`
	End_time         string `gorm:"type:time"`
	Cover         string `gorm:"type:varchar(255)"`
	Uid         int `gorm:"type:int(20)"`
	
}
