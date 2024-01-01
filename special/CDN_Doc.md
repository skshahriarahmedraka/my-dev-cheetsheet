# 1. Create Certificate

## Add an SSL certificate to deliver content via HTTPS protocol.

Paste all strings of the certificate(s) and the private key in one string parameter. Each certificate in chain and the private key should be divided with the "\n" symbol like in the example.
Also you can add a Let's Encrypt certificate. In this case you don't need to provide certificate and private key, it will be generated automatically after attaching this certificate to your resource. See the request body schema below

--- 

## MY:

## Add an SSL Certificate(proprietary) to deliver content via HTTPS protocol.

---

**Description:**

This API endpoint allows you to add an **SSL certificate**  for delivering content via the HTTPS protocol. You can provide your own certificate and private key or there is a option for a hassle-free experience with [**Let's Encrypt**](https://letsencrypt.org/), which automatically generates the *certificate* and *private key* upon attachment to your resource.

---

**Request Body Schema:**

- To manually provide a certificate and private key, concatenate all strings into a single parameter. Each certificate in the chain and the private key should be separated by the "\n" symbol.

- If you choose to use  Let's Encrypt, checkout `POST /distributions/<distribution_id>/letsencrypts-request` and `POST /distributions/<distribution_id>/letsencrypts-verify`

**Note:** Inside request `JSON`  Ensure that the provided strings follow the specified format and include the necessary line breaks ("\n") for proper processing.

**request json description**

1. **`name`**: 
   
   - This is a user-defined name or identifier for the certificate. I

2. **`type`**: 
   
   - The type of certificate. In this case,for a example it's specified as "gotipath."  

3. **`certificate_type`**: 
   
   - Indicates that if the certificate  is a part of a **wildcard** or **multi-domain certificate** or **single**

4. **`certificate_body`**: 
   
   - Contains the actual certificate body (public key certificate) . This includes information about the entity, the public key, and the digital signature from the Certificate Authority (CA).

5. **`certificate_private_key`**: 
   
   - Contains the private key associated with the certificate. The private key is kept confidential and is used for decrypting data that has been encrypted with the corresponding public key.

6. **`certificate_chain`**: 
   
   - Represents the certificate chain, including one or more intermediate certificates . This chain is used to establish a trust relationship from the server's certificate to the root certificate.

# 2. Get All Certificates of a specific provider

this endpoint provides the list of certificate you are currently using in this CDN 

# 3. Attach Certificate to Distribution

this Endpoint provides a way to replace the existing certificate with a  new one 

here URL is contructed like `/certificates/<certificate_id>/distributions/<distribution_id>`

# 4.Revoke Certificate from Distribution

This API is used to remove  the certificate from the distribution 

📢 **Info message :**  Here URL is contructed like `/distributions/<distribution_id>/certificates`

⚠️ **Warning:**  this action will move all the traffic from **HTTPS** to **HTTP** . All of the previous fetch request have to be moved from **HTTPS** to **HTTP**

# 5. Delete Certificate

This Endpoint is for detete a Certificate using certificate_id.

Here the endpoint is constracted like `/certificates/<certificate_id>`

Warning: this action is not reversable . After Deleting the Certificate , it will be completely wipeout from the server

---

**Delete Certificate Endpoint**

This endpoint allows you to delete a certificate using the `certificate_id`. The endpoint is constructed as `/certificates/<certificate_id>`.

⚠️ **Warning:** This action is irreversible. Once a certificate is deleted, it will be completely wiped out from the server. Please use this endpoint with caution.

---

---

# 1. Get All CDN Distributions

This Endpoint will provide all the CDN distribution information attached with Your Account

  Get information about all CDN Distribution in your account.

---

**Get All CDN Distributions**

This endpoint provides comprehensive information about all CDN distributions associated with your account.

# 2. Get distribution by using DistributionID

This endpoint provides data of a specific ditribution by using **distribution_id**

📢 **Info message :**  Here URL is contructed like  `/distributions/<distribution_id>`

# 3. Create CDN Distribution using necessary data

This Endpoint is for creating a CDN Distribution under your account 

**Description of Request JSON:**

The provided JSON represents a request for creating a CDN distribution. Here's a breakdown of its components:

- **type:** Specifies the CDN type, which can be "multi," "gotipath," "gcore," or "telekom."

- **label:** Describes the label or name assigned to the CDN, For example, "Gotipath CDN."

- **description:** Provides a brief description of the CDN, such as "New Gotipath CDN."

- **origin_type:** Indicates the type of origin, where "custom" is specified.

- **domain_type:** Defines the type of domain used, either "custom" or "subdomain."

- **domain:** Specifies the domain associated with the CDN, for example, "xjmyld229pmcw222232.gpcdn.net."

- **acceleration_type:** Describes the acceleration type, with "static" being specified.

- **is_http2:** Indicates whether HTTP/2 is enabled (false in this case).

- **is_http3:** Indicates whether HTTP/3 is enabled (false in this case).

- **is_livestream:** Specifies if livestream functionality is enabled (false in this case).

- **is_redirect_http_to_https:** Indicates whether HTTP to HTTPS redirection is enabled (false in this case).

- **enable_ssl:** Specifies if SSL is enabled (true in this case).

- **le_issue:** Indicates if Let's Encrypt certificate issuance is enabled (false in this case).

- **certificate_id:** Represents the ID of the SSL certificate associated with the CDN.

- **origin:** Provides details about the origin, including label, URL, type ("custom"), port, and protocol ("http").

# 4. Update CDN Distribution

This Endpoint is used to Update  a existing distribution using

**Description of UpdateDistributionRequest JSON:**

The `UpdateDistributionRequest` JSON structure is used for sending requests to update the configuration of a CDN distribution. Here's a breakdown of its fields:

- **Description:** (Type: String) Represents the new description for the CDN distribution.

- **Label:** (Type: String) Specifies the updated label or name for the CDN distribution.

- **Status:** (Type: models.DistributionStatus) Indicates the new status of the CDN distribution. The status is based on the `DistributionStatus` type.

- **IsHTTP2 (optional):** (Type: *bool) Indicates whether HTTP/2 support should be enabled. This is an optional field, and if included, it should be a boolean value. If omitted, it assumes a default or unchanged value.

- **IsHTTP3 (optional):** (Type: *bool) Indicates whether HTTP/3 support should be enabled. This is an optional field, and if included, it should be a boolean value. If omitted, it assumes a default or unchanged value.

- **IsRedirectHTTPToHTTPS (optional):** (Type: *bool) Specifies whether to enable redirection from HTTP to HTTPS. This is an optional field; if included, it should be a boolean value. If omitted, it assumes a default or unchanged value.

- **HostHeader:** (Type: String) Specifies the host header to be used when accessing the origin.

- **SNI (Server Name Indication):** (Type: String) Represents the server name to send to the origin during SSL handshake. If this field is missing, the host name used in the Origin URL is used by default.

# Delete CDN Distribution

Delete a specific CDN distribution under your account 

📢 **Info message :** Here URL is contructed like `/distributions/<distribution_id>`

⚠️ **Warning:** This action is irreversible. Once a distribution is deleted, it will be completely wiped out from the server. Please use this endpoint with caution.

---

# 1. Origin Batch Update

# 2. Origin Batch Update

This Endpoint updates multiple origin of a distribution . we track the distribution using **distribution_id** and update multiple origin 

📢 **Info message :** Here URL is contructed like `/distributions/<distribution_id>/origins/batch`

⚠️ **Warning:** update of origin could take little time to provition into multiple internal nodes 

# 3. Get all Origin

This Endpoint provides the origin of a specific distribution using **distribution_id**. you have to provide valid **distribution_id**  and in response the **origin_id**

📢 **Info message :** Here URL is contructed like `/distributions/<distribution_id>/origins`

# 4. Create Origin

# 5. Delete Origin of a particular Distribution

This Endpoint deletes  a particular **Origin** of a **Distribution** . In the DELETE request the **distribution_id** and **origin_id** is provided. the origin is deleted according these IDs

📢 **Info message :** Here URL is contructed like `/distributions/<distribution_id>/origins/{origin_id}`  

⚠️ **Warning:**  this DELETE action is not reverseable . this action cann't be undone in future 

---

# 1. Request Let's Encrypt Certificate for Distribution

This Endpoint is used for providing a free SSL Certificate([Let's Encrypt](https://letsencrypt.org/)) for your distribution 

📢 **Info message :** Here URL is contructed like `/distributions/<distribution_id>/letsencrypts-request`  

# 2. Let's Encrypt Certificate Verify

This Endpoint verfiies  the certificate of a distribution . you provide **distribution_id**  through URL  and the Endpoint verifies the certificate 

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/letsencrypts-verify`

---

# 1. Create Cache Control

This Endpoint creates a Cache Control rule for a particular distribution.  **distribution_id** is provided through URL.

The JSON describes a request to store a cache rule. Here's a breakdown of the requests fields:

- `ttl` (Time To Live): An integer representing the time to live for the cached content in seconds.

- `name`: A string representing the name of the cache rule.

- `match_type`: A string representing the type of matching to be applied. It could be a regular expression or a simple string match.

- `match`: A string representing the pattern to match against.

- `never_cache`: A boolean indicating whether the content should never be cached (`true` means never cache).

- `ignore_client_no_cache`: A boolean indicating whether to ignore client-side caching directives (`true` means ignore).

- `ignore_origin_no_cache`: A boolean indicating whether to ignore origin server's caching directives (`true` means ignore).

- `ignore_query_string`: A boolean indicating whether to ignore the query string when determining caching (`true` means ignore).

- `enabled_gzip`: A boolean indicating whether Gzip compression should be enabled for the cached content (`true` means enable).

- `enabled_brotli`: A boolean indicating whether Brotli compression should be enabled for the cached content (`true` means enable).

- `priority`: An integer representing the priority of the cache rule.

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/cache-rules`

📝**Note:** There can be maximum 3 Cache Control rule per distribution . If more cache Control rule is needed please contract the [customer care](https://www.gotipath.com/contact)

# 2. Update Cache Control rule of a distribution

This Endpoint Updates a Cache Control rule for a particular distribution. **distribution_id** is provided through URL.

The JSON describes a request to store a cache rule. Here's a breakdown of the requests fields:

- `ttl` (Time To Live): An integer representing the time to live for the cached content in seconds.

- `match_type`: A string representing the type of matching to be applied. It could be a regular expression or a simple string match.

- `match`: A string representing the pattern to match against.

- `never_cache`: A boolean indicating whether the content should never be cached (`true` means never cache).

- `ignore_client_no_cache`: A boolean indicating whether to ignore client-side caching directives (`true` means ignore).

- `ignore_origin_no_cache`: A boolean indicating whether to ignore origin server's caching directives (`true` means ignore).

- `ignore_query_string`: A boolean indicating whether to ignore the query string when determining caching (`true` means ignore).

- `enabled_gzip`: A boolean indicating whether Gzip compression should be enabled for the cached content (`true` means enable).

- `enabled_brotli`: A boolean indicating whether Brotli compression should be enabled for the cached content (`true` means enable).

- `priority`: An integer representing the priority of the cache rule.

📢 **Info message :** Here URL is contructed like `/distributions/<distribution_id>/cache-rules/<cacheRuleId>`

# 3. Delete Cache Rules of a Distribution

This Endpoint Deletes existing Cache Rule of a distribution . **distribution_id** and **cacheRuleId** is provided through URL  

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/cache-rules/{cacheRuleId}`

⚠️ **Warning:** this DELETE action is not reverseable . this action cann't be undone in future

# 4. Get a Cache rule of a distribution

This endpoint gives the existing cache rule details of a distribution . **distribution_id** and  **CacheRuleId** have to be provided through URL

  📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/cache-rules/{cacheRuleId}`

# 5. Get all Cache rules of a distribution

This Endpoint Provides all the Cache rules of a distribution .In this GET request , the **distribution_id**  is  provided through URL 

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/cache-rules`

---

# 1. Create Access Control for Distribution

This Endpoint creates access control rule of a distribution .

The  JSON structure is used to define parameters for storing access control rules. Below is a description of each field:

- `Enabled`: A boolean indicating whether the access control is enabled or disabled.
- `Name`: A string representing the name of the access control rule.
- `MatchType`: A string specifying the type of match for the rule (e.g., "prefix" or "exact").
- `Match`: A string representing the pattern or value to match based on the specified `MatchType`.
- `Country`: A pointer to a `Rule` structure representing rules related to country-based access control. This field is optional 
- `Referer`: A pointer to a `Rule` structure representing rules related to referer-based access control. This field is optional 
- `IP`: A pointer to a `Rule` structure representing rules related to IP-based access control. This field is optional 
- `Token`: A pointer to a `TokeRule` structure representing rules related to token-based access control. This field is optional 

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/access-rules`

📝**Note:** There can be maximum 3 Cache Control rule per distribution . If more Cache Control Rule is needed please contract the [customer care](https://www.gotipath.com/contact)

# 2. Get All Access Control

This Endpoint gives all the access control  of a distribution . In the GET request , **distribution_id** and the **access_rule_id** is provided

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/access-rules/{access_rule_id}`

# 3. Update Access Control

This Endpoint gives a way to update existing access rule .

The JSON structure is used to define parameters for storing access control rules. Below is a description of each field:

- `Enabled`: A boolean indicating whether the access control is enabled or disabled.
- `Name`: A string representing the name of the access control rule.
- `MatchType`: A string specifying the type of match for the rule (e.g., "prefix" or "exact").
- `Country`: A pointer to a `Rule` structure representing rules related to country-based access control. This field is optional
- `Referer`: A pointer to a `Rule` structure representing rules related to referer-based access control. This field is optional
- `IP`: A pointer to a `Rule` structure representing rules related to IP-based access control. This field is optional
- `Token`: A pointer to a `TokeRule` structure representing rules related to token-based access control. This field is optional

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/access-rules/{access_rule_id}`

# 4. DELETE Access Control

This Endpoint Deletes existing Access rule of a distribution . **distribution_id** and **access_rule_id** is provided through URL

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/access-rules/{access_rule_id}`

⚠️ **Warning:** this DELETE action is not reverseable . this action cann't be undone in future

# 5. Get Access Control Details

This Endpoint gives the access control details of a distribution . In the GET request , **distribution_id** and the **access_rule_id** is provided

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/access-rules/{access_rule_id}`

# 6. Token Reset

This Endpoint resets the access token and provides a new one . In the PATCH requst , the **distribution_id** and the **access_rule_id** have to provided

📢 **Info message :** Here URL is contructed like `/distributions/{distributionId}/access-rules/{accessRuleId}/reset-token`

⚠️ **Warning:** the reset will make the previous token invalid. you have to use new access token or the  extisting URLs will face a Request Forbidden error. 

---

# 1. Create Prefetch

The tool proactively loads files onto a Content Delivery Network (CDN) before a user requests them. This is particularly beneficial for larger files exceeding 200MB. It's important to note that API calls associated with prefetching have limitations on both the rate of calls and the size of the files. For detailed information on these limitations, please refer to the Prefetch Calls Limiting documentation.

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/prefetches`

# 2. Purge

Purge deletes cache from CDN servers. It is necessary for updating CDN content. API calls related to purging are rate and size limited. See Purge Calls Limiting for details.

---

Purging removes cached content from CDN servers, providing a necessary step for updating CDN content. Keep in mind that API calls associated with purging are subject to limitations in both the rate of calls and the size of the content. For detailed information on these limitations, please refer to the Purge Calls Limiting documentation.

📢 **Info message :** Here URL is contructed like `/distributions/{distribution_id}/purges`

# 3. Create CORS Headers of a Distribution

This Endpoint Creates CORS(Cross-Origin Resource Sharing) header of a Distribution. In the POST requst the list of header list have to be provided

The request JSON represents the request to create a CORS (Cross-Origin Resource Sharing) header. Here's a description of its fields:

- `Key`: The header key.
- `Value`: The header value.
- `Type`: Specifies whether the header is for the request, response, or CORS. It can take values like "request," "response," or "cors."
- `Action`: Indicates the action to be performed, such as "add" or "hide."

📢 **Info message :** Here URL is contructed like  

`/distributions/{distribution_id}/headers/cors`

# 4. Distribution Header Update

This Endpoint updates the header of a particular distribution. In the POST request , the `distribution_id` have to be provided in the URL and the list of **Access-Control-Allow-Methods**  have to be provided in the payload 

The request JSON represents the request to Update a CORS (Cross-Origin Resource Sharing) header. Here's a description of its fields:

- `Key`: The header key.
- `Value`: The header value.
- `Type`: Specifies whether the header is for the request, response, or CORS. It can take values like "request," "response," or "cors."
- `Action`: Indicates the action to be performed, such as "add" or "hide."

📢 **Info message :** Here URL is contructed like

`/distributions/{distribution_id}/headers/request`

# Distribution Header list

This Endpoint provides the list of headers of distribution. In the GET request , the **distribution_id** have to be provided .

The response JSON structure corresponds to a `Header` object with the following fields:

- `ID`: A unique identifier for the header.
- `CustomerID`: The identifier of the customer associated with the header.
- `DistributionID`: The identifier of the CDN distribution associated with the header.
- `Key`: The header key.
- `Value`: The header value.
- `Type`: Specifies whether the header is for the request or response.
- `CreatedAt`: The timestamp indicating when the header was created.
- `UpdatedAt`: The timestamp indicating when the header was last updated.

📢 **Info message :** Here URL is contructed like

`/distributions/{distribution_id}/headers`

# 4. Response Headers of a Distribution

This Endpoint updates the **response header**  of  a distribution . In the POST request , **distribution_id**  have to provided through URL and payload will be the list of headers

The HTTP POST requst JSON structure represents a list of `Header` objects, where each object has the following attributes:

- `Key`: The header key . For example "response1"
- `Value`: The header value. For example "GET" , "*"
- `Type`: Specifies whether the header is for the request or response.
- `Action`: Indicates the action to be performed on the header, such as "add," "remove," or "update." 

📢 **Info message :** Here URL is contructed like

`/distributions/{distribution_id}/headers/response`

# 5. Get list of CORS Headers of a distribution

This Endpoint gets all the **CORS** Headers of a distribution . In the <span style="color:GREEN">GET</span> request URL , the **distribution_id** have to be provided

📢 **Info message :** Here <span style="color:GREEN">GET</span> request URL is contructed like `/distributions/{distribution_id}/headers/cors`

# 6. Get Response Headers of a Distribution

This endpoint gives all the response header list of a distribution . In the <span style="color:GREEN">GET</span> reqeust URL , the **distribution_id** have to be provided .

📢 **Info message :** Here  <span style="color:GREEN">GET </span> request URL is contructed like `/distributions/{distribution_id}/headers/response`

# 7. Get all the Request Headers of a Distribution

This Endpoint provides all the request Headers  of a distribution . In the <span style="color:GREEN">GET</span> request , you have to provide the **distribution_id** . 

📢 **Info message :** Here <span style="color:GREEN">GET</span> request URL is contructed like `/distributions/{distribution_id}/headers/request`

---

# 1. Volume Usage of a distribution

This endpoint provides the **Volume** uses of a distribution with the given time frame . In the <span style="color:YELLOW">POST</span> request URL , you have to 

The Request JSON structure represents a request for CDN Volume Uses statistics within a specified time range for a list of distributions. Here's a breakdown of its attributes:

- `Distributions`: An array of strings representing the unique identifiers or names of the CDN distributions for which statistics are requested.
- `StartTime`: A timestamp indicating the start time of the requested statistics period.
- `EndTime`: A timestamp indicating the end time of the requested statistics period.

📢 **Info message :** Here <span style="color:YELLOW">POST</span> request URL is contructed like `/volume-usages`

---

# 1. Volume Usages of a Distribution

This Endpoint provides accurate **Volume Usage** data of a distribution. In the <span style="color:yellow">POST</span> request URL , you have to

The Request JSON structure represents a request for CDN Volume Uses statistics within a specified time range for a list of distributions. Here's a breakdown of its attributes:

- `Distributions`: An array of strings representing the unique identifiers or names of the CDN distributions for which statistics are requested.
- `StartTime`: A timestamp indicating the start time of the requested statistics period.
- `EndTime`: A timestamp indicating the end time of the requested statistics period.

📢 **Info message :** Here POST request URL is contructed like `/reports/volume`

# 2. Request Usages

This Endpoint provides accurate **Requests Usage** data of a distribution. In the <span style="color:yellow">POST</span> request URL , you have to

The Request JSON structure represents a request for CDN Requests Uses statistics within a specified time range for a list of distributions. Here's a breakdown of its attributes:

- `Distributions`: An array of strings representing the unique identifiers or names of the CDN distributions for which statistics are requested.
- `StartTime`: A timestamp indicating the start time of the requested statistics period.
- `EndTime`: A timestamp indicating the end time of the requested statistics period.

📢 **Info message :** Here POST request URL is contructed like `/reports/requests`

# 3. Bandwidth Usages of a distribution

This Endpoint provides accurate **Bandwidth Usage**  of a distribution. In the <span style="color:yellow">POST</span> request URL , you have to

The Request JSON structure represents a request for CDN Bandwidth Uses statistics within a specified time range for a list of distributions. Here's a breakdown of its attributes:

- `Distributions`: An array of strings representing the unique identifiers or names of the CDN distributions for which statistics are requested.
- `StartTime`: A timestamp indicating the start time of the requested statistics period.
- `EndTime`: A timestamp indicating the end time of the requested statistics period.

📢 **Info message :** Here <span style="color:YELLOW">POST</span> request URL is contructed like `/reports/bandwidth`

# 4. Viewer Location Volume Usages of a distribution

This Endpoint provides accurate **Viewer Location Volume Usage**  of a distribution. 

The Request JSON structure represents a request for CDN Bandwidth Uses statistics within a specified time range for a list of distributions. Here's a breakdown of its attributes:

- `Distributions`: An array of strings representing the unique identifiers or names of the CDN distributions for which statistics are requested.
- `StartTime`: A timestamp indicating the start time of the requested statistics period.
- `EndTime`: A timestamp indicating the end time of the requested statistics period.

📢 **Info message :** Here <span style="color:YELLOW">POST</span> request URL is contructed like `/reports/geo-volume`

# 5. Viewer Requests based on Location Usages of a distribution

This Endpoint provides accurate **Viewer Location Requests Usage**  of a distribution. 

The Request JSON structure represents a request for CDN Viewer Location Requests Uses statistics within a specified time range for a list of distributions. Here's a breakdown of its attributes:

- `Distributions`: An array of strings representing the unique identifiers or names of the CDN distributions for which statistics are requested.
- `StartTime`: A timestamp indicating the start time of the requested statistics period.
- `EndTime`: A timestamp indicating the end time of the requested statistics period.

📢 **Info message :** Here <span style="color:YELLOW">POST</span> request URL is contructed like `/reports/geo-request`
<span style="color:GREEN">GET</span>

<span style="color:YELLOW">POST</span>

<span style="color:RED">DELETE</span>

<span style="color:magenta">PATCH</span>

<span style="color:blue">PUT</span>
