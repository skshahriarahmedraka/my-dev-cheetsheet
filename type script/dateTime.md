
```
const now = new Date();

// Convert to Unix timestamp
const unixTimestamp = Math.floor(now.getTime() / 1000);
```

```
import (
    "time"
)

// Convert Unix timestamp to time.Time value
unixTimestamp := int64(1649049618)
t := time.Unix(unixTimestamp, 0)
```

 //Date.now().valueOf