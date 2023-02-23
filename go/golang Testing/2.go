package service 

import (
	"testing"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"
	
)

type MockRepository struct {
	mock.Mock
}

func (mock *MockRepository) Save(post *entity.Post) (*entity.Post, error) {
	args := mock.Called()
	result := args.Get(0)
	return result.(*entity.Post), args.Error(1)
}

func (mock *MockRepository)FindAll() ([]entity.Post, error) {
	args := mock.Called()
	result := args.Get(0)
	return result.([]entity.Post), args.Error(1)
}

func TestFindAll(t *testing.T) {
	mockRepo := new(MockRepository)
	var identifier int64 = 1
	post := entity.Post{ID: identifier, Title: "A", Text: "B"}
	// Setup expectations
	mockRepo.On("FindAll").Return([]entity.Post{post}, nil)

	testService := NewPostService(mockRepo)
	result, err := testService.FindAll()
	// Mock assertion : Behavioral
	mockRepo.AssertExpectations(t)

	// Data assertion
	
	assert.Equal(t, identifier, result[0].ID)
	assert.Equal(t, "A", result[0].Title)
	assert.Equal(t, "B", result[0].Title)
}
	
