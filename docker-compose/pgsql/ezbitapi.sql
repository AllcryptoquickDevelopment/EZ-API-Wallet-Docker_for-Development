-- Adminer 4.8.1 PostgreSQL 9.4.26 dump

DROP TABLE IF EXISTS "addresses";
DROP SEQUENCE IF EXISTS addresses_id_seq;
CREATE SEQUENCE addresses_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."addresses" (
    "id" bigint DEFAULT nextval('addresses_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "crypto_type_id" integer DEFAULT '1' NOT NULL,
    "address" character varying(48),
    "label" text,
    "balance" bigint DEFAULT '0' NOT NULL,
    "total_received" bigint DEFAULT '0' NOT NULL,
    "previous_balance" bigint DEFAULT '0' NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    CONSTRAINT "addresses_address_unique" UNIQUE ("address"),
    CONSTRAINT "addresses_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "addresses" ("id", "user_id", "crypto_type_id", "address", "label", "balance", "total_received", "previous_balance", "created_at", "updated_at") VALUES
(1,	1,	1,	'mtqSqRAGB7EuPtgCwvMtX74S2tvTapDWD6',	NULL,	0,	0,	0,	'2021-08-25 11:59:15',	'2021-08-25 11:59:15'),
(2,	1,	1,	'n21cjTZa59QcMBXFvoKx2WoRotBV9mErnJ',	NULL,	0,	0,	0,	'2021-08-25 11:59:15',	'2021-08-25 11:59:15'),
(3,	1,	1,	'mxKRETCDzCuLVLiw9MieJb8xFi1WhkQ9wY',	NULL,	0,	0,	0,	'2021-08-25 11:59:15',	'2021-08-25 11:59:15');

DROP TABLE IF EXISTS "balances";
DROP SEQUENCE IF EXISTS balances_id_seq;
CREATE SEQUENCE balances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."balances" (
    "id" integer DEFAULT nextval('balances_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "crypto_type_id" integer DEFAULT '1' NOT NULL,
    "balance" bigint DEFAULT '0' NOT NULL,
    "total_received" bigint DEFAULT '0' NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "num_transactions" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "balances_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "balances" ("id", "user_id", "crypto_type_id", "balance", "total_received", "created_at", "updated_at", "num_transactions") VALUES
(1,	1,	1,	0,	0,	'2021-08-25 11:59:15',	'2021-08-25 11:59:15',	0);

DROP TABLE IF EXISTS "change_addresses";
DROP SEQUENCE IF EXISTS change_addresses_id_seq;
CREATE SEQUENCE change_addresses_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."change_addresses" (
    "id" bigint DEFAULT nextval('change_addresses_id_seq') NOT NULL,
    "address" character varying(48),
    "user_id" integer NOT NULL,
    "crypto_type_id" integer DEFAULT '1' NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    CONSTRAINT "change_addresses_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "change_addresses" ("id", "address", "user_id", "crypto_type_id", "created_at", "updated_at") VALUES
(1,	'xxx',	2,	1,	'2021-08-25 11:59:15',	'2021-08-25 11:59:15'),
(2,	'xxx',	2,	1,	'2021-08-25 11:59:15',	'2021-08-25 11:59:15'),
(3,	'xxx',	2,	1,	'2021-08-25 11:59:15',	'2021-08-25 11:59:15'),
(4,	'xxx',	2,	1,	'2021-08-25 11:59:15',	'2021-08-25 11:59:15');

DROP TABLE IF EXISTS "crypto_types";
DROP SEQUENCE IF EXISTS crypto_types_id_seq;
CREATE SEQUENCE crypto_types_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."crypto_types" (
    "id" bigint DEFAULT nextval('crypto_types_id_seq') NOT NULL,
    "crypto_type" character varying(12) NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    CONSTRAINT "crypto_types_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "crypto_types" ("id", "crypto_type", "created_at", "updated_at") VALUES
(1,	'BTC',	'2021-08-25 11:59:15',	'2021-08-25 11:59:15');

DROP TABLE IF EXISTS "failed_jobs";
DROP SEQUENCE IF EXISTS failed_jobs_id_seq;
CREATE SEQUENCE failed_jobs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."failed_jobs" (
    "id" integer DEFAULT nextval('failed_jobs_id_seq') NOT NULL,
    "connection" text NOT NULL,
    "queue" text NOT NULL,
    "payload" text NOT NULL,
    "failed_at" timestamp NOT NULL,
    CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "invoice_addresses";
DROP SEQUENCE IF EXISTS invoice_addresses_id_seq;
CREATE SEQUENCE invoice_addresses_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."invoice_addresses" (
    "id" bigint DEFAULT nextval('invoice_addresses_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "crypto_type_id" integer DEFAULT '1' NOT NULL,
    "address" character varying(48),
    "destination_address" character varying(48),
    "label" text,
    "invoice_amount" bigint DEFAULT '0' NOT NULL,
    "callback_url" text,
    "received" boolean DEFAULT false NOT NULL,
    "forward" boolean DEFAULT false NOT NULL,
    "received_amount" bigint DEFAULT '0' NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    CONSTRAINT "invoice_addresses_address_unique" UNIQUE ("address"),
    CONSTRAINT "invoice_addresses_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "migrations";
CREATE TABLE "public"."migrations" (
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL
) WITH (oids = false);

INSERT INTO "migrations" ("migration", "batch") VALUES
('2015_01_10_145606_initial_structure',	1),
('2015_03_09_222900_add_num_transactions',	1),
('2015_05_22_021717_add_external_user_id',	1),
('2015_07_13_220408_failed_transaction_table_and_fee_column',	1),
('2015_10_27_191129_create_change_addresses_settings_tables',	1),
('2016_03_02_211932_add_ignore_balance_column_users_table',	1),
('2016_03_08_154134_create_failed_jobs_table',	1);

DROP TABLE IF EXISTS "payout_history";
DROP SEQUENCE IF EXISTS payout_history_id_seq;
CREATE SEQUENCE payout_history_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."payout_history" (
    "id" bigint DEFAULT nextval('payout_history_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "crypto_type_id" integer DEFAULT '1' NOT NULL,
    "crypto_amount" bigint DEFAULT '0' NOT NULL,
    "tx_id" character varying(100),
    "address_to" character varying(48),
    "confirmations" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "external_user_id" bigint,
    CONSTRAINT "payout_history_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "settings";
DROP SEQUENCE IF EXISTS settings_id_seq;
CREATE SEQUENCE settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."settings" (
    "id" integer DEFAULT nextval('settings_id_seq') NOT NULL,
    "key" character varying(128) NOT NULL,
    "value" text NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    CONSTRAINT "settings_key_unique" UNIQUE ("key"),
    CONSTRAINT "settings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "settings" ("id", "key", "value", "created_at", "updated_at") VALUES
(1,	'monitor_outputs',	'1',	'2021-08-25 11:59:15',	'2021-08-25 11:59:15'),
(2,	'minimum_outputs_threshold',	'125',	'2021-08-25 11:59:15',	'2021-08-25 11:59:15'),
(3,	'outputs_to_add',	'125',	'2021-08-25 11:59:15',	'2021-08-25 11:59:15'),
(4,	'outputs_cache_duration',	'45',	'2021-08-25 11:59:15',	'2021-08-25 11:59:15'),
(5,	'amount_to_add',	'6900000',	'2021-08-25 11:59:15',	'2021-08-25 11:59:15');

DROP TABLE IF EXISTS "transactions";
DROP SEQUENCE IF EXISTS transactions_id_seq;
CREATE SEQUENCE transactions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."transactions" (
    "id" bigint DEFAULT nextval('transactions_id_seq') NOT NULL,
    "tx_id" character varying(100) NOT NULL,
    "user_id" bigint NOT NULL,
    "crypto_type_id" integer DEFAULT '1' NOT NULL,
    "address_to" character varying(48),
    "address_from" character varying(48),
    "crypto_amount" bigint DEFAULT '0' NOT NULL,
    "confirmations" integer DEFAULT '0' NOT NULL,
    "response_callback" text,
    "callback_status" boolean DEFAULT false NOT NULL,
    "callback_url" text,
    "block_hash" text,
    "block_index" integer,
    "block_time" integer,
    "tx_time" integer DEFAULT '0' NOT NULL,
    "tx_timereceived" integer DEFAULT '0' NOT NULL,
    "tx_category" character varying(24),
    "address_account" character varying(100),
    "balance" bigint DEFAULT '0' NOT NULL,
    "previous_balance" bigint,
    "bitcoind_balance" numeric(8,2),
    "note" text,
    "transaction_type" character varying(25) NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "user_balance" bigint DEFAULT '0' NOT NULL,
    "external_user_id" bigint,
    "network_fee" integer,
    CONSTRAINT "transactions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "transactions_tx_id_index" ON "public"."transactions" USING btree ("tx_id");


DROP TABLE IF EXISTS "transactions_failed";
DROP SEQUENCE IF EXISTS transactions_failed_id_seq;
CREATE SEQUENCE transactions_failed_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."transactions_failed" (
    "id" bigint DEFAULT nextval('transactions_failed_id_seq') NOT NULL,
    "tx_id" character varying(100),
    "user_id" integer NOT NULL,
    "crypto_type_id" integer DEFAULT '1' NOT NULL,
    "address_to" character varying(48),
    "crypto_amount" bigint DEFAULT '0' NOT NULL,
    "network_fee" integer,
    "error" text,
    "user_note" text,
    "sent_to_network" boolean DEFAULT false NOT NULL,
    "transaction_type" character varying(25) NOT NULL,
    "external_user_id" bigint,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    CONSTRAINT "transactions_failed_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "transactions_failed_tx_id_index" ON "public"."transactions_failed" USING btree ("tx_id");


DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."users" (
    "id" integer DEFAULT nextval('users_id_seq') NOT NULL,
    "guid" character varying(255) NOT NULL,
    "password" character varying(64) NOT NULL,
    "email" character varying(45) NOT NULL,
    "name" character varying(255) NOT NULL,
    "secret" character varying(255) NOT NULL,
    "callback_url" text NOT NULL,
    "blocknotify_callback_url" text NOT NULL,
    "rpc_connection" text NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "ignore_balance" boolean DEFAULT false NOT NULL,
    CONSTRAINT "users_guid_unique" UNIQUE ("guid"),
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "users" ("id", "guid", "password", "email", "name", "secret", "callback_url", "blocknotify_callback_url", "rpc_connection", "created_at", "updated_at", "ignore_balance") VALUES
(1,	'7xDsRLyXEd1PgJ6Glrhs6d',	'strong_pass_plz',	'foo@bar.com',	'John Doe',	'secretsecret',	'https://url.to/send/on/btc/received',	'https://url.to/send/on/btc/received',	'https://btcrpc:btcpayserver4ever@3g7koka44nh4j5bwnl554ddr7mkmq6ylaqcjhx6z5k62gautgburmdqd.onion:8332',	'2021-08-25 11:59:15',	'2021-08-25 11:59:15',	'0');

-- 2021-08-31 23:29:42.188968+00
