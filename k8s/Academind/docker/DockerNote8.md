## docker core concept

    image
        created with instruction (layers)
        - blueprient for container 
        - code +environment 
        - read only / doesnot run
        - can be built +share
    container
        read write layer on top of image 
        - isoleted 
        - single-task-forced 
        - stateless (+volumes)
