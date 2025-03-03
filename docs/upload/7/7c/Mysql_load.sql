CREATE DATABASE tpch;
use tpch;

create table nation (
n_nationkey  decimal(3,0) not null,
n_name       char(25) not null,
n_regionkey  decimal(2,0) not null,
n_comment    varchar(152)
) TYPE=MyISAM;

create table region (
r_regionkey  decimal(2,0) not null,
r_name       char(25) not null,
r_comment    varchar(152)
) TYPE=MyISAM;

create table part (
p_partkey     decimal(10,0) not null,
p_name        varchar(55) not null,
p_mfgr        char(25) not null,
p_brand       char(10) not null,
p_type        varchar(25) not null,
p_size        decimal(2,0) not null,
p_container   char(10) not null,
p_retailprice decimal(6,2) not null,
p_comment     varchar(23) not null
) TYPE=MyISAM;

create table supplier (
s_suppkey     decimal(8,0) not null,
s_name        char(25) not null,
s_address     varchar(40) not null,
s_nationkey   decimal(3,0) not null,
s_phone       char(15) not null,
s_acctbal     decimal(7,2) not null,
s_comment     varchar(101) not null
) TYPE=MyISAM;

create table partsupp (
ps_partkey     decimal(10,0) not null,
ps_suppkey     decimal(8,0) not null,
ps_availqty    decimal(5,0) not null,
ps_supplycost  decimal(6,2) not null,
ps_comment     varchar(199) not null
) TYPE=MyISAM;

create table customer (
c_custkey     decimal(9,0) not null,
c_name        varchar(25) not null,
c_address     varchar(40) not null,
c_nationkey   decimal(3,0) not null,
c_phone       char(15) not null,
c_acctbal     decimal(7,2) not null,
c_mktsegment  char(10) not null,
c_comment     varchar(117) not null
) TYPE=MyISAM;

create table orders  (
o_orderkey       decimal(12,0) not null,
o_custkey        decimal(9,0) not null,
o_orderstatus    char(1) not null,
o_totalprice     decimal(8,2) not null,
o_orderdate      date not null,
o_orderpriority  char(15) not null,
o_clerk          char(15) not null,
o_shippriority   decimal(1,0) not null,
o_comment        varchar(79) not null
) TYPE=MyISAM;

create table lineitem (
l_orderkey    decimal(12,0) not null,
l_partkey     decimal(10,0) not null,
l_suppkey     decimal(8,0) not null,
l_linenumber  decimal(1,0) not null,
l_quantity    decimal(2,0) not null,
l_extendedprice  decimal(8,2) not null,
l_discount    decimal(3,2) not null,
l_tax         decimal(3,2) not null,
l_returnflag  char(1) not null,
l_linestatus  char(1) not null,
l_shipdate    date not null,
l_commitdate  date not null,
l_receiptdate date not null,
l_shipinstruct char(25) not null,
l_shipmode     char(10) not null,
l_comment      varchar(44) not null
) TYPE=MyISAM;

LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/region.tbl'   INTO TABLE region   FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/nation.tbl'   INTO TABLE nation   FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/supplier.tbl' INTO TABLE supplier FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/part.tbl'     INTO TABLE part     FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/partsupp.tbl' INTO TABLE partsupp FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/customer.tbl' INTO TABLE customer FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/orders.tbl'   INTO TABLE orders   FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem1.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem2.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem3.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem4.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem5.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem6.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem7.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem8.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem9.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
LOAD DATA INFILE '/apps/jvs/mtpch/SF-10/z/lineitem10.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';

ALTER TABLE region ADD CONSTRAINT pkey_region PRIMARY KEY(r_regionkey);
ALTER TABLE nation ADD CONSTRAINT pkey_nation PRIMARY KEY(n_nationkey);
ALTER TABLE part ADD CONSTRAINT pkey_part PRIMARY KEY(p_partkey);
ALTER TABLE supplier ADD CONSTRAINT pkey_supplier PRIMARY KEY(s_suppkey);
ALTER TABLE partsupp ADD CONSTRAINT pkey_partsupp PRIMARY KEY(ps_partkey,ps_suppkey);
ALTER TABLE customer ADD CONSTRAINT pkey_customer PRIMARY KEY(c_custkey);
ALTER TABLE lineitem ADD CONSTRAINT pkey_lineitem PRIMARY KEY(l_orderkey,l_linenumber);
ALTER TABLE orders ADD CONSTRAINT pkey_orders PRIMARY KEY(o_orderkey);

create index fkey_nation_1 on nation(n_regionkey);
create index fkey_supplier_1 on supplier(s_nationkey);
create index fkey_customer_1 on customer(c_nationkey);
create index fkey_partsupp_1 on partsupp(ps_suppkey);
create index fkey_partsupp_2 on partsupp(ps_partkey);
create index fkey_orders_1 on orders(o_custkey);
create index fkey_lineitem_1 on lineitem(l_orderkey);
create index fkey_lineitem_2 on lineitem(l_partkey,l_suppkey);
create index fkey_lineitem_3 on lineitem(l_suppkey);
create index xxx1 on lineitem(l_shipdate);
create index xxx2 on customer(c_mktsegment);
create index xxx3 on orders(o_orderdate);
create index xxx4 on region(r_name);
create index xxx5 on lineitem(l_discount);
create index xxx6 on lineitem(l_quantity);
create index xxx7 on lineitem(l_returnflag);
create index xxx8 on lineitem(l_shipmode);
create index xxx9 on lineitem(l_commitdate);
create index xxx10 on lineitem(l_receiptdate);
create index xxx11 on lineitem(l_partkey);
create index xxx12 on part(p_size);
create index xxx13 on part(p_type);
create index xxx14 on partsupp(ps_supplycost);
create index xxx15 on nation(n_name);
create index xxx16 on part(p_name);
create index xxx17 on orders(o_clerk);
create index xxx18 on part(p_brand);
create index xxx19 on part(p_container);

analyze table nation;
analyze table region;
analyze table part;
analyze table supplier;
analyze table partsupp;
analyze table customer;
analyze table orders;
analyze table lineitem;
