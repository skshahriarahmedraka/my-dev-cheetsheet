package service
import (
    "testing"
    "github.com/stretchr/testify/assert"
)

func TestValidateEmpty(t *testing.T) {
	testService := NewPostService(nil) 

	err := testService.Validate(nil)
	assert.NotNil(t, err)
	assert.Equal(t, "Post is empty", err.Error())
}

func TestValidateEmptyPostTitle(t *testing.T) {
	post:= entity.Post{ID: 1, Title: "", Text: "B"}

	testService := NewPostService(nil)
	err := testService.Validate(&post)

	assert.NotNil(t, err)
	assert.Equal(t, "Post title is empty", err.Error())
}

