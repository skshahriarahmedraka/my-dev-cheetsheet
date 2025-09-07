# steps 
- identify the data 
- collecting the data
- doing the analysis & visualization 


## telementry signals 
- logs 
- metrics
- traces
- profiles 

## requirement 
- optimized 
- horizontal scaling & multitenant 
- query language


### logs

- grafana loki (stores logs)
- loki is like prometheus but for logs
- logql is the query language for loki (like promql for prometheus)

### metrics
- prometheus (stores metrics)
- prometheus is a time series database
- promql is the query language for prometheus

- mimir (stores metrics)
- open source alternative to prometheus
- supports horizontal scaling and multitenancy 


### traces
- tempo (stores traces)
- tempo is like loki but for traces
- traceql is the query language for tempo (like logql for loki)


### profiles
- pyroscope (stores profiles)
- pyroscope is like prometheus but for profiles
- 1-10% overhead 
- uses flamegraphs for visualization 
- flameql is the query language for pyroscope (like promql for prometheus)


### source instrumentation
- for frontend: 
  - `npm install @grafana/faro-web-sdk`
  - its frontend observability SDK
- for backend:
  - open telemetry 
  - opentelementry collector

- grafana alloy (for instrumentation)


### ebpf instrumentation
- beyla for ebpf instrumentation


### software testing 
- k6 for testing 

### data visualization
- grafana for visualization
