CREATE TABLE IF NOT EXISTS `distributions` (
  `id` varchar(36) PRIMARY KEY,
  `customer_id` varchar(36) NOT NULL,
  `domain_id` varchar(255) NULL,
  `certificate_id` varchar(36) NULL,
  `cname` varchar(255) UNIQUE NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` text NULL,
  `domain_type` varchar(255) NOT NULL COMMENT 'gotipath|custom',
  `origin_type` varchar(255) NOT NULL,
  `cdn_type` varchar(255) NOT NULL,
  `acceleration_type` varchar(255) NOT NULL,
  `is_streaming` boolean DEFAULT false,
  `enable_ssl` boolean DEFAULT false,
  `is_http2` boolean DEFAULT false,
  `is_cname_valid` boolean DEFAULT false,
  `is_acme_challenge_valid` boolean DEFAULT false,
  `is_http3` boolean DEFAULT false,
  `is_redirect_http_to_https` boolean DEFAULT false,
  `status` varchar(255) DEFAULT 'provisioning',
  `le_issue` boolean DEFAULT false,
  `host_header` varchar(255) NULL,
  `sni` varchar(255) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` timestamp NULL,
  `deleted_at` timestamp NULL,
  `gotipath_deleted_at` timestamp NULL,
  `created_by` varchar(36),
  `updated_by` varchar(36) NULL
);

CREATE TABLE IF NOT EXISTS `domains` (
    `id` varchar(36) PRIMARY KEY NOT NULL,
    `name` varchar(255) UNIQUE NOT NULL,
    `provider_name` varchar(255) NULL COMMENT 'cloudflare|constrilix',
    `provider_id` varchar(255) NULL COMMENT 'Third party services provider',
    `parent_id` varchar(36) NULL,
    `type` varchar(100) COMMENT 'multi,gotipath,gcore,telekom',
    `value` varchar(255) NOT NULL,
    `is_used` boolean DEFAULT false,
    `sync_at` timestamp NULL,
    `created_at` timestamp NOT NULL,
    `updated_at` timestamp,
    `deleted_at` timestamp NULL,
    `gotipath_deleted_at` timestamp NULL
);


CREATE TABLE IF NOT EXISTS `certificates` (
  `id` varchar(36) PRIMARY KEY NOT NULL,
  `customer_id` varchar(36) NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) COMMENT 'gotipath,customer',
  `certificate_type` varchar(100) NOT NULL,
  `certificate_private_key` longtext,
  `certificate_body` longtext,
  `certificate_chain` longtext,
  `issuer` varchar(255) NULL,
  `common_name` varchar(255) NULL,
  `version` varchar(20) NULL,
  `serial_num` varchar(255) NULL,
  `signature_algorithm` varchar(255) NULL,
  `state` varchar(255) NULL,
  `status` varchar(255),
  `not_after` datetime NULL,
  `not_before` datetime NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` timestamp NULL,
  `deleted_at` timestamp NULL,
  `gotipath_deleted_at` timestamp NULL,
  `created_by` varchar(36),
  `updated_by` varchar(36)
);

-- when customer using multi CDN , all the provider (gcore,telecom) certificate information is stored here
-- one to many relationship: one certificate to many certificate_provider
CREATE TABLE IF NOT EXISTS `certificate_providers` (
  `id` varchar(36),
  `certificate_id` varchar(36),
  `provider_name` varchar(100),
  `provider_id` varchar(255),
  `sync_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` timestamp,
  `deleted_at` timestamp NULL,
  `meta`JSON NULl,
  `gotipath_deleted_at` timestamp NULL

);



CREATE TABLE IF NOT EXISTS `distribution_providers` (
  `id` varchar(36) PRIMARY KEY,
  `distribution_id` varchar(36),
  `provider_name` varchar(255) COMMENT 'gotipath|bunny|tm|gc',
  `provider_id` varchar(255),
  `sync_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` timestamp,
  `deleted_at` timestamp NULL,
  `meta`JSON NULl,
  `gotipath_deleted_at` timestamp NULL
);

    CREATE TABLE IF NOT EXISTS `origins` (
    `id` varchar(36) PRIMARY KEY,
    `distribution_id` varchar(36) NOT NULL,
    `customer_id` varchar(36) NOT NULL,
    `label` varchar(255) NOT NULL,
    `url` text NOT NULL,
    `type` varchar(255) DEFAULT 'custom',
    `load_balancer_type` varchar(255) DEFAULT 'failover',
    `port` integer DEFAULT 80,
    `is_primary` boolean DEFAULT false,
    `protocol` varchar(20) DEFAULT 'custom',
    `s3_type` varchar(255) NULL,
    `s3_access_key_id` varchar(255) NULL,
    `s3_secret_key` varchar(255) NULL,
    `s3_region` varchar(255) NULL,
    `s3_bucket_name` varchar(255) NULL,
    `s3_storage_hostname` varchar(255) NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` timestamp NULL,
    `created_by` varchar(36) NULL,
    `updated_by` varchar(36) NULL,
    `gotipath_deleted_at` timestamp NULL
);

    CREATE TABLE IF NOT EXISTS`origin_providers` (
    `id` varchar(36) PRIMARY KEY,
    `origin_id` varchar(36) NULL,
    `provider_name` varchar(255) NULL,
    `provider_id` varchar(255) NULL,
    `sync_at` timestamp NULL,
    `created_at` timestamp NOT NULL,
    `updated_at` timestamp,
    `deleted_at` timestamp NULL,
    `meta`JSON NULl,
    `gotipath_deleted_at` timestamp NULL
    );

CREATE TABLE IF NOT EXISTS`cache_rules` (
  `id` varchar(36) PRIMARY KEY,
  `name` varchar(255),
  `distribution_id` varchar(36) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  `match_type` varchar(255) NOT NULL,
  `match` varchar(255) NOT NULL,
  `priority` integer NOT NULL,
  `ttl` integer NOT NULL,
  `ignore_client_no_cache` boolean NOT NULL,
  `ignore_origin_no_cache` boolean NOT NULL,
  `ignore_query_string` boolean NOT NULL,
  `ignore_set_cookie` boolean NOT NULL,
  `enabled_brotli` boolean NOT NULL,
  `enabled_gzip` boolean NOT NULL,
  `never_cache` boolean NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` timestamp NULL,
  `deleted_at` timestamp NULL,
  `created_by` varchar(36) NULL,
  `updated_by` varchar(36) NULL,
  `gotipath_deleted_at` timestamp NULL
);

CREATE TABLE IF NOT EXISTS `cache_rule_providers` (
  `id` varchar(36) PRIMARY KEY,
  `cache_rule_id` varchar(36),
  `provider_name` varchar(255),
  `provider_id` varchar(255),
  `sync_at` TIMESTAMP,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` timestamp,
  `deleted_at` timestamp,
  `meta`JSON NULl,
  `gotipath_deleted_at` timestamp NULL
);

CREATE TABLE IF NOT EXISTS `access_rules` (
  `id` varchar(36) PRIMARY KEY,
  `customer_id` varchar(36) NOT NULL,
  `distribution_id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `match_type` varchar(255) NOT NULL,
  `match` varchar(255) NOT NULL,
  `enabled` boolean DEFAULT true,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` timestamp NULL,
  `deleted_at` timestamp NULL,
  `created_by` varchar(36) NOT NULL,
  `updated_by` varchar(36) NULL,
  `gotipath_deleted_at` timestamp NULL
);

   CREATE TABLE IF NOT EXISTS `access_rule_providers` (
    `id` varchar(36) PRIMARY KEY,
    `access_rule_id` varchar(36),
    `provider_name` varchar(255),
    `provider_id` varchar(255),
    `sync_at` timestamp NULL,
    `created_at` timestamp NOT NULL,
    `updated_at` timestamp NULL,
    `deleted_at` timestamp NULL,
    `meta`JSON NULl,
    `gotipath_deleted_at` timestamp NULL
    );

   CREATE TABLE IF NOT EXISTS `rules` (
    `id` varchar(255) PRIMARY KEY,
    `access_rule_id` varchar(36),
    `type` varchar(255),
    `action` varchar(255),
    `values` text,
    `enabled` boolean
    );

CREATE TABLE IF NOT EXISTS `headers` (
  `id` varchar(36) PRIMARY KEY,
  `distribution_id` varchar(36) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NULL,
  `is_special` boolean DEFAULT false,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL,
  `deleted_at` timestamp NULL,
  `gotipath_deleted_at` timestamp NULL
);

CREATE TABLE IF NOT EXISTS `header_providers` (
    `id` varchar(36) PRIMARY KEY,
    `header_id` varchar(36),
    `provider_name` varchar(255),
    `provider_id` varchar(255),
    `sync_at` TIMESTAMP,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` timestamp,
    `meta`JSON NULl,
    `deleted_at` timestamp
);

CREATE TABLE IF NOT EXISTS `purges`  (
  `id` varchar(36) PRIMARY KEY,
  `distribution_id` varchar(36) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  `type` varchar(255),
  `paths` json
);

CREATE TABLE IF NOT EXISTS`purge_providers` (
  `id` varchar(36) PRIMARY KEY,
  `purge_id` varchar(36),
  `provider_id` varchar(255),
  `sync_at` timestamp,
  `created_at` timestamp NOT NULL,
  `meta`JSON NULl,
  `updated_at` timestamp
);

CREATE TABLE IF NOT EXISTS `prefetches` (
  `id` varchar(36) PRIMARY KEY,
  `distribution_id` varchar(36) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  `paths` json,
  `sync_at` timestamp NULL
);

CREATE TABLE IF NOT EXISTS `prefetch_providers` (
  `id` varchar(36) PRIMARY KEY,
  `purge_id` varchar(36),
  `provider_id` varchar(255),
  `sync_at` timestamp,
  `created_at` timestamp NOT NULL,
  `meta`JSON NULl,
  `updated_at` timestamp NULL
);

  create table if not exists error_logs (
    `id` varchar(36) primary key,
    `customer_id` varchar(36) not null,
    `code` varchar(255) not null,
    `message` text not null,
    `type` varchar(255) not null,
    `modelable_id` varchar(36) not null,
    `modelable_type` varchar(255) not null,
    `created_at` timestamp not null,
    `updated_at` timestamp null
  );