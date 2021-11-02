CREATE DATABASE supplies_management;
USE supplies_management;
CREATE TABLE supplies(
    id_supplies int auto_increment primary key not null,
    code_supplies varchar(500) not null,
    name_supplies varchar(500) not null,
    unit_supplies int not null,
    price_supplies double not null
);

CREATE TABLE inventory(
    id_inventory int auto_increment primary key not null,
    id_supplies int not null,
    FOREIGN KEY (id_supplies) REFERENCES supplies (id_supplies),
    quantity_available_stock int not null,
    total_import int not null,
    total_export int not null
);

CREATE TABLE supplier(
    id_supplier int auto_increment primary key not null,
    code_supplier varchar(300),
    name_supplier nvarchar(500),
    address_supplier varchar(800),
    mobile_supplier varchar(100)
);

CREATE TABLE orders(
    id_order int auto_increment primary key not null,
    code_order varchar(500),
    date_order date not null,
    id_supplier int not null,
    FOREIGN KEY (id_supplier) REFERENCES supplier (id_supplier)
);

CREATE TABLE import_coupon(
    id_import_coupon int auto_increment primary key not null,
    code_import_coupon varchar(500) not null,
    date_import date not null,
    id_order int not null,
    FOREIGN KEY (id_order) REFERENCES orders(id_order)
);

CREATE TABLE export_coupon(
    id_export_coupon int auto_increment PRIMARY KEY not null,
    code_export_coupon varchar(500),
    date_export date not null,
    customer_name varchar(200) not null
);

CREATE TABLE order_detail(
    id_order_detail int auto_increment PRIMARY KEY not null,
    id_order int not null,
    FOREIGN KEY (id_order) REFERENCES orders (id_order),
    id_supplies int not null,
    FOREIGN KEY (id_supplies) REFERENCES supplies (id_supplies),
    num_order int not null
);

CREATE TABLE import_detail(
    id_import_detail int auto_increment PRIMARY KEY not null,
    id_import_coupon int not null,
    FOREIGN KEY (id_import_coupon) REFERENCES import_coupon (id_import_coupon),
    id_supplies int not null,
    FOREIGN KEY (id_supplies) REFERENCES supplies (id_supplies),
    quantity_import int not null,
    price_import double not null,
    note varchar(500)
);

CREATE TABLE export_detail(
    id_export_detail int auto_increment PRIMARY KEY not null,
    id_export_coupon int not null,
    FOREIGN KEY (id_export_coupon) REFERENCES export_coupon(id_export_coupon),
    id_supplies int not null,
    FOREIGN KEY (id_supplies) REFERENCES supplies(id_supplies),
    quantity_export int not null,
    price_export double not null,
    note varchar(500)
);

INSERT INTO supplies_management.supplies (code_supplies, name_supplies, unit_supplies, price_supplies) VALUE ('A0001', 'Brick', 10000, 10);
INSERT INTO supplies_management.supplies (code_supplies, name_supplies, unit_supplies, price_supplies) VALUE ('A0002', 'Iron', 15000, 30);
INSERT INTO supplies_management.supplies (code_supplies, name_supplies, unit_supplies, price_supplies) VALUE ('A0003', 'Steel', 20000, 100);
INSERT INTO supplies_management.supplies (code_supplies, name_supplies, unit_supplies, price_supplies) VALUE ('D0001', 'Weed', 300, 10000);
INSERT INTO supplies_management.supplies (code_supplies, name_supplies, unit_supplies, price_supplies) VALUE ('D0002', 'Candy', 200, 2000);

INSERT INTO supplies_management.inventory(id_supplies, quantity_available_stock, total_import, total_export) VALUE (1, 1000, 10000, 5000);
INSERT INTO supplies_management.inventory(id_supplies, quantity_available_stock, total_import, total_export) VALUE (2, 2000, 5000, 300);
INSERT INTO supplies_management.inventory(id_supplies, quantity_available_stock, total_import, total_export) VALUE (3, 100, 2000, 400);
INSERT INTO supplies_management.inventory(id_supplies, quantity_available_stock, total_import, total_export) VALUE (4, 2000, 500, 1000);
INSERT INTO supplies_management.inventory(id_supplies, quantity_available_stock, total_import, total_export) VALUE (5, 100, 100, 50);

INSERT INTO supplies_management.supplier(code_supplier, name_supplier, address_supplier, mobile_supplier) VALUE('P0001', 'Intelligent Pheo', 'VU DAI', '0981232124');
INSERT INTO supplies_management.supplier(code_supplier, name_supplier, address_supplier, mobile_supplier) VALUE('P0002', 'IronMan', 'DC Comic', '09812323232');
INSERT INTO supplies_management.supplier(code_supplier, name_supplier, address_supplier, mobile_supplier) VALUE('P0003', 'Hoà Phát', 'Hà Nội', '09235223423');
INSERT INTO supplies_management.supplier(code_supplier, name_supplier, address_supplier, mobile_supplier) VALUE('P0004', 'HIEU DAO', 'TP Hồ Chí Minh', '09123123213');
INSERT INTO supplies_management.supplier(code_supplier, name_supplier, address_supplier, mobile_supplier) VALUE('P0005', 'Baby shark', 'New Zealand', '0923423423');

INSERT INTO supplies_management.orders(code_order, date_order, id_supplier) VALUE ('OD001', '2021-04-20', 1);
INSERT INTO supplies_management.orders(code_order, date_order, id_supplier) VALUE ('OD001', '2021-08-21', 4);
INSERT INTO supplies_management.orders(code_order, date_order, id_supplier) VALUE ('OD001', '2021-11-02', 5);

INSERT INTO supplies_management.import_coupon(code_import_coupon, date_import, id_order) VALUE ('IP001', '2021-03-20',1);
INSERT INTO supplies_management.import_coupon(code_import_coupon, date_import, id_order) VALUE ('IP002', '2021-04-20',2);
INSERT INTO supplies_management.import_coupon(code_import_coupon, date_import, id_order) VALUE ('IP003', '2021-03-22',3);

INSERT INTO supplies_management.export_coupon(code_export_coupon, date_export, customer_name) VALUE ('EP001', '2021-03-28','NGUYỄN TIẾN LONG');
INSERT INTO supplies_management.export_coupon(code_export_coupon, date_export, customer_name) VALUE ('EP001', '2021-05-28','NGUYỄN MINH THẢO');
INSERT INTO supplies_management.export_coupon(code_export_coupon, date_export, customer_name) VALUE ('EP001', '2021-06-01','NGUYỄN ANH TUẤN');

INSERT INTO supplies_management.order_detail(id_order, id_supplies, num_order) VALUE (1, 3, 12);
INSERT INTO supplies_management.order_detail(id_order, id_supplies, num_order) VALUE(2, 4, 100);
INSERT INTO supplies_management.order_detail(id_order, id_supplies, num_order) VALUE(3, 5, 11);
INSERT INTO supplies_management.order_detail(id_order, id_supplies, num_order) VALUE(2, 1, 200);
INSERT INTO supplies_management.order_detail(id_order, id_supplies, num_order) VALUE(3, 2, 220);
INSERT INTO supplies_management.order_detail(id_order, id_supplies, num_order) VALUE(2, 5, 10);

INSERT INTO supplies_management.import_detail(id_import_coupon, id_supplies, quantity_import, price_import, note) VALUE (1, 2, 12, 123, 'FAST SHIP');
INSERT INTO supplies_management.import_detail(id_import_coupon, id_supplies, quantity_import, price_import, note) VALUE (2, 3, 15, 124, 'CHECK THINGS BEFORE PAY');
INSERT INTO supplies_management.import_detail(id_import_coupon, id_supplies, quantity_import, price_import, note) VALUE (3, 3, 18, 1334, 'PAY DONE');
INSERT INTO supplies_management.import_detail(id_import_coupon, id_supplies, quantity_import, price_import, note) VALUE (1, 2, 22, 3333, 'SHIP COD');
INSERT INTO supplies_management.import_detail(id_import_coupon, id_supplies, quantity_import, price_import, note) VALUE (3, 4, 12, 4444, 'GIFT');
INSERT INTO supplies_management.import_detail(id_import_coupon, id_supplies, quantity_import, price_import, note) VALUE (1, 5, 5, 555, 'NO REFUND');

INSERT INTO supplies_management.export_detail(id_export_coupon, id_supplies, quantity_export, price_export, note) VALUE (1, 2, 33, 2212, 'COD');
INSERT INTO supplies_management.export_detail(id_export_coupon, id_supplies, quantity_export, price_export, note) VALUE (2, 3, 22, 412, 'NO REFUND');
INSERT INTO supplies_management.export_detail(id_export_coupon, id_supplies, quantity_export, price_export, note) VALUE (3, 4, 11, 212, 'PAY DONE');
INSERT INTO supplies_management.export_detail(id_export_coupon, id_supplies, quantity_export, price_export, note) VALUE (3, 5, 222, 112, 'GIFT');
INSERT INTO supplies_management.export_detail(id_export_coupon, id_supplies, quantity_export, price_export, note) VALUE (2, 1, 333, 12212, 'NONE');
INSERT INTO supplies_management.export_detail(id_export_coupon, id_supplies, quantity_export, price_export, note) VALUE (1, 5, 444, 122, 'COD');


# Câu 1: Tạo view gồm số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập

CREATE VIEW vw_CRPNHAP AS
SELECT import_coupon.id_import_coupon, s.code_supplies, id.quantity_import, id.price_import, SUM(id.quantity_import * id.price_import) 'Thành tiền'
FROM import_coupon
INNER JOIN import_detail id on import_coupon.id_import_coupon = id.id_import_coupon
INNER JOIN supplies s on id.id_supplies = s.id_supplies
GROUP BY import_coupon.id_import_coupon, s.code_supplies, id.quantity_import, id.price_import;

# Câu 2: Tạo view bao gồm các thông tin: Số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập

CREATE VIEW vw_CTPNHAP_VT AS
    SELECT import_coupon.id_import_coupon, s.code_supplies, s.name_supplies, id.quantity_import, id.price_import, SUM(id.price_import * id.quantity_import) 'Thành tiền'
FROM import_coupon
INNER JOIN import_detail id on import_coupon.id_import_coupon = id.id_import_coupon
INNER JOIN supplies s on id.id_supplies = s.id_supplies
GROUP BY import_coupon.id_import_coupon, s.code_supplies, s.name_supplies, id.quantity_import, id.price_import;

#Câu 3: Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập
CREATE VIEW vw_CTPNHAP_VT_PN AS
    SELECT import_coupon.id_import_coupon, import_coupon.date_import, od.num_order, s.code_supplies, s.name_supplies, id.quantity_import, id.price_import, SUM(id.quantity_import * id.price_import) 'Thành tiền nhập:'
FROM import_coupon
INNER JOIN import_detail id on import_coupon.id_import_coupon = id.id_import_coupon
INNER JOIN supplies s on id.id_supplies = s.id_supplies
INNER JOIN order_detail od on s.id_supplies = od.id_supplies
GROUP BY import_coupon.id_import_coupon, import_coupon.date_import, od.num_order, s.code_supplies, s.name_supplies, id.quantity_import, id.price_import;

# Câu 4: Tạo view bao gồm các thông tin sau: Số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập

CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
    SELECT import_coupon.id_import_coupon, import_coupon.date_import, o.id_order, s2.code_supplier, s.code_supplies, s.name_supplies, id.quantity_import, id.price_import, SUM(id.quantity_import * id.price_import) 'Thành tiền nhập:'
FROM import_coupon
INNER JOIN orders o on import_coupon.id_order = o.id_order
INNER JOIN import_detail id on import_coupon.id_import_coupon = id.id_import_coupon
INNER JOIN supplies s on id.id_supplies = s.id_supplies
INNER JOIN supplier s2 on o.id_supplier = s2.id_supplier
GROUP BY import_coupon.id_import_coupon, import_coupon.date_import, o.id_order, s2.code_supplier, s.code_supplies, s.name_supplies, id.quantity_import, id.price_import;


# Câu 5: tạo view có các thông tín sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.
CREATE VIEW vw_CTPNHAP_loc AS
    SELECT import_coupon.id_import_coupon, s.code_supplies, id.quantity_import, id.price_import, SUM(id.quantity_import * id.price_import) 'Thành tiền nhập'
FROM import_coupon
INNER JOIN import_detail id on import_coupon.id_import_coupon = id.id_import_coupon
INNER JOIN supplies s on id.id_supplies = s.id_supplies
GROUP BY import_coupon.id_import_coupon, s.code_supplies, id.quantity_import, id.price_import
HAVING quantity_import > 5;

# Câu 6: tạo view có các thông tin sau:số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
CREATE VIEW vw_CTPNHAP_VT_loc AS
    SELECT import_coupon.id_import_coupon, s.id_supplies, s.name_supplies, id.quantity_import, id.price_import, SUM(id.quantity_import * id.price_import)
FROM import_coupon
INNER JOIN supplies s on import_coupon.id_import_coupon = s.id_supplies
INNER JOIN import_detail id on import_coupon.id_import_coupon = id.id_import_coupon
    WHERE s.unit_supplies > 2000
GROUP BY import_coupon.id_import_coupon, s.id_supplies, s.name_supplies, id.quantity_import, id.price_import;

# Câu 7: Tạo view có các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.

CREATE VIEW vw_CTPXUAT AS
    SELECT export_coupon.id_export_coupon, s.id_supplies, s.code_supplies, ed.quantity_export, ed.price_export, SUM(ed.quantity_export * ed.price_export) 'Thành tiền xuất:'
FROM export_coupon
INNER JOIN export_detail ed on export_coupon.id_export_coupon = ed.id_export_coupon
INNER JOIN supplies s on ed.id_supplies = s.id_supplies
GROUP BY export_coupon.id_export_coupon, s.id_supplies, s.code_supplies, ed.quantity_export, ed.price_export;

# Câu 8: Tạo view có các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.

CREATE VIEW vw_CTPXUAT_VT AS
    SELECT export_coupon.id_export_coupon, s.code_supplies, s.name_supplies, ed.quantity_export, ed.price_export
FROM export_coupon
INNER JOIN export_detail ed on export_coupon.id_export_coupon = ed.id_export_coupon
INNER JOIN supplies s on ed.id_supplies = s.id_supplies
GROUP BY s.code_supplies, export_coupon.id_export_coupon, s.name_supplies, ed.quantity_export, ed.price_export;

# Câu 9: tạo view có các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.

CREATE VIEW vw_CTPXUAT_VT_PX AS
    SELECT export_coupon.id_export_coupon, export_coupon.customer_name, s.code_supplies, s.name_supplies, ed.quantity_export, ed.price_export
FROM export_coupon
INNER JOIN export_detail ed on export_coupon.id_export_coupon = ed.id_export_coupon
INNER JOIN supplies s on ed.id_supplies = s.id_supplies
GROUP BY export_coupon.id_export_coupon, export_coupon.customer_name, s.code_supplies, s.name_supplies, ed.quantity_export, ed.price_export;


# Câu 10: Tạo stored procedure (SP) tổng số lượng cuốic ủa vật tư với mã vật tư là tham số vào

CREATE PROCEDURE get_last_quantity(In code_suppliess INT)
BEGIN
    SELECT quantity_available_stock
    FROM inventory
        INNER JOIN supplies s on inventory.id_supplies = s.id_supplies
    WHERE s.id_supplies = code_suppliess;
end;

CALL get_last_quantity(1);

# Câu 11: tạo SP tổng tiền xuất vật tư với mã vật tư là tham số đầu vào

CREATE PROCEDURE get_total_money_export (In code_suppliess INT)
BEGIN
    SELECT export_detail.quantity_export * export_detail.price_export 'Tổng xuất là:'
        FROM export_detail
            INNER JOIN supplies s ON export_detail.id_supplies = s.id_supplies
    WHERE s.id_supplies = code_suppliess;
end;
DROP PROCEDURE  get_total_money_export;
CALL get_total_money_export(1);

# Câu 12: Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số truyền vào

CREATE PROCEDURE get_total_order(In code_order INT)
BEGIN
    SELECT SUM(order_detail.num_order)
        FROM order_detail
            INNER JOIN orders o ON order_detail.id_order = o.id_order
    WHERE o.id_order = code_order;
end;

CALL get_total_order(2);


# Câu 13: Tạo SP dùng để thêm 1 đơn đặt hàng

CREATE PROCEDURE creat_new_order(IN code_orders VARCHAR(500), date_orders DATE, id_suppliers INT)
BEGIN
    INSERT INTO supplies_management.orders(code_order, date_order, id_supplier) VALUES (code_orders, date_orders, id_suppliers );
end;

CALL creat_new_order('A0005', '2020-03-15', 3);

# CÂU 14: Tạo SP dùng để thêm chi tiết một đơn hàng

CREATE PROCEDURE create_new_order_detail(IN id_orders INT, id_suppliess INT, num_orders INT)
BEGIN
    INSERT INTO supplies_management.order_detail(id_order, id_supplies, num_order) VALUE (id_orders, id_suppliess, num_orders);
end;

CALL create_new_order_detail(2, 3, 12);