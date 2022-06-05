-- create table
CREATE TABLE barang (
kode INT,
nama VARCHAR(100),
harga INT,
jumlah INT
) ENGINE = InnoDB;

-- lihat table
SHOW TABLES;

-- struktur table
DESCRIBE barang;

-- versi tulisan
SHOW CREATE TABLE barang;

DROP TABLE barang;

-- ubah table
-- tambah kolom
ALTER TABLE barang ADD COLUMN deskripsi TEXT;
ALTER TABLE barang ADD COLUMN salah TEXT;
ALTER TABLE barang ADD COLUMN id INT;
-- hapus
ALTER TABLE barang DROP COLUMN salah;

-- merubah tipe data kolom
ALTER TABLE barang MODIFY nama VARCHAR(200) AFTER deskripsi;
ALTER TABLE barang MODIFY nama VARCHAR(200) FIRST; -- rubah posisi ke pertama

-- not null 
ALTER TABLE barang MODIFY id INT NOT NULL;
ALTER TABLE barang MODIFY nama VARCHAR(200) NOT NULL;

-- default value
ALTER TABLE barang MODIFY harga INT NOT NULL DEFAULT 0;
ALTER TABLE barang MODIFY jumlah INT NOT NULL DEFAULT 0;
ALTER TABLE barang ADD COLUMN waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- membuat ulang table
TRUNCATE barang;
