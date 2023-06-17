package worker

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/hibiken/asynq"
	"github.com/rs/zerolog/log"
)

const TaskSendVerifyEmail = "task:send_verify_email"

type PayloadSendVerifyEmail struct {
	Username string `json:"username"`
}

func (distributor *RedisTaskDistributor) DistributedTaskSendVerifyEmail(
	ctx context.Context,
	payload *PayloadSendVerifyEmail,
	opts ...asynq.Option,
)error {
	jsonPayload, err := json.Marshal(payload)
	if err != nil {
		return fmt.Errorf("could not marshal payload %w",err)
	}
	task := asynq.NewTask(TaskSendVerifyEmail,jsonPayload,opts...)
	info ,err := distributor.client.EnqueueContext(ctx,task)
	if err != nil {
		return fmt.Errorf("could not enqueue task %w",err)

	}

	fmt.Printf("enqueued task: %v\n", info)
	log.Info().Str("type",task.Type()).Bytes("payload", task.Payload()).
		Str("queue",info.Queue).Int("max_retry", info.MaxRetry).Msg("enqueued task")

	return nil
}

func (processor *RedisTaskProcessor) ProcessTaskSendVerifyEmail(ctx context.Context, task *asynq.Task) error {
	var payload PayloadSendVerifyEmail
	
	if err := json.Unmarshal(task.Payload(), &payload) ; err != nil {
		return fmt.Errorf("could not unmarshal payload %w",asynq.SkipRetry)
	}
	user , err := processor.store.GetUser(ctx,payload.Username)
	if err !=nil {
		if err == sql.ErrNoRows {
			return fmt.Errorf("user does not exist %w",asynq.SkipRetry)
		}
		return fmt.Errorf("could not get user %w",err)
	}
	// TODO: send email to user
	log.Info().Str("type",task.Type()).Bytes("payload",task.Payload()).
		Str("email",user.Email).Msg("Processing task")
	return nil
}
