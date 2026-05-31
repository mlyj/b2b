PRAGMA defer_foreign_keys=TRUE;
CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  description TEXT,
  detailed_description TEXT,
  specifications TEXT,
  image_url TEXT,
  gallery_images TEXT, 
  category TEXT,
  is_featured BOOLEAN DEFAULT 0,
  is_active BOOLEAN DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "products" VALUES(1,' Food grade z type bucket elevator',replace('1. The hopper is made of food-grade PP or ABS via injection molding, or welded from 304 stainless steel.\n2. Quick-release design for easy cleaning.\n3. Adjustable speed for precise control of lifting and lowering.\n4. Modular design for easy assembly.\n5. Hygienic construction with durable components; features a high lifting capacity and high conveying capacity.\n6. Corrosion-resistant, wear-resistant, and compact.\n7. Easy to operate, with casters that allow for easy positioning.\n8. Low maintenance.\n9. Reliable operation with low energy consumption.\n10. Customizable to meet customer requirements.\n11. Can be combined with other auxiliary equipment to form continuous or intermittent automatic material conveyance systems, ensuring uniform feeding for downstream metering or feeding equipment.','\n',char(10)),'bucket elevator exporter and one of the bucket elevator chain manufacturers an z type conveyor manufacturers in China and we have been building custom bucket elevator for over 12 years. Bucket elevators are highly customizable, allowing for design of a system tailored to the specific challenges and goals. Bucket elevators are enclosed systems, making them ideal in both indoor and outdoor handling applications, as well as when dust is a concern. Bucket elevators are the preferred choice for vertical handling applications in a range of industries for the many advantages they offer. Indoor or Outdoor Handling.',replace('Hopper Capacity: 1.8 L / 4 L / 6 L\nMaterial: 201 Stainless Steel / 304 Stainless Steel / Carbon Steel\nThroughput: 4–6 m²/h, 6–8 m²/h, 8–12 m²/h, 12–16 m²/h\nVoltage: AC 220 V / 380 V, 50 Hz / 60 Hz\nPower: 0.75 kW / 1.1 kW–2.5 kW / 3 kW / 4 kW\nAll components feature easily removable inspection covers and clearly visible inspection windows. The hopper is equipped with a quick-release mechanism for rapid installation or removal. All units are equipped with an automatic material-feeding system that pulls material from low to high, enabling vertical conveying.\n','\n',char(10)),'/api/upload/image/products/1780063747376-hl6h5d.jpg',NULL,'Conveyor',1,1,'2026-05-29 12:50:53','2026-05-29 14:21:06');
INSERT INTO "products" VALUES(2,'Bowl Conveyor','Inclined Stainless Steel Bowl Conveyor',replace('     1.It can work with other equipment for continuous or intermittent type weighing and packaging line.\n     2.The bowl, made of 304 stainless steel material, is easy to disassemble and clean.\n     3.The stainless steel chain and machine frame makes it strong, durable and not easy to deform.\n     4.It can feed the material twice through flipping the switch and adjusting the timing sequence.\n     5.Speed is adjustable.\n     6.Keep the bowl straight without spilling the materials.\n     7.Can be combined with doypack filling machine, achieving the mixture of granule and liquid packing.','\n',char(10)),replace('Model	Inclined Bowl Conveyor\nMachine Frame	304 stainless steel or carbon steel\nBowl Volume	1L, 2L, 3L, 4L, 6L, 8L\nTransportation Speed	Adjustable\nMachine Height	To be customized\nVoltage	AC220v or three phase 380v, 50hz/60hz','\n',char(10)),'/api/upload/image/products/1780064221950-mg7eg4.jpg',NULL,'Conveyor',1,1,'2026-05-29 12:50:53','2026-05-29 14:22:02');
INSERT INTO "products" VALUES(3,'Output Conveyor','Premium quality equipment','Reliable equipment for professional use...',replace('Output Conveyor\nMachine Frame	304 stainless steel or carbon steel\nBelt Material	PP belt, PVC belt, PU belt, Stainless steel belt\nTransportation Speed	30m/minute\nVoltage	AC220v or three phase 380v, 50hz/60hz\nPower Supply	0.75kw','\n',char(10)),'/api/upload/image/products/1780064809552-qfdlup.jpg',NULL,'Conveyor',1,1,'2026-05-29 12:50:53','2026-05-29 14:29:29');
CREATE TABLE inquiries (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  product_id INTEGER,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  company TEXT,
  phone TEXT,
  country TEXT,
  message TEXT NOT NULL,
  status TEXT DEFAULT 'pending', 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES products(id)
);
CREATE TABLE admins (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  email TEXT,
  role TEXT DEFAULT 'admin', 
  last_login DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "admins" VALUES(1,'admin123','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9','admin@example.com','super_admin','2026-05-29 13:05:49','2026-05-29 12:50:53','2026-05-29 12:50:53');
INSERT INTO "admins" VALUES(2,'staff','10176e7b7b24d317acfcf8d2064cfd2f24e154f7b5a96603077d5ef813d6a6b6','staff@example.com','admin',NULL,'2026-05-29 12:50:53','2026-05-29 12:50:53');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('admins',2);
INSERT INTO "sqlite_sequence" VALUES('products',3);
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_products_featured ON products(is_featured);
CREATE INDEX idx_inquiries_status ON inquiries(status);
CREATE INDEX idx_inquiries_product ON inquiries(product_id);