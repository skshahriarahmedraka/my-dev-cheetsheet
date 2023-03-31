package main

import (

	"github.com/gin-gonic/gin"
)

func main(){
	gin.SetMode(gin.ReleaseMode)
	r:= gin.New()
	
	r.Use(gin.Logger())
}