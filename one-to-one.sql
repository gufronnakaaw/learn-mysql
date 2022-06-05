CREATE TABLE wallet (
	id INT NOT NULL AUTO_INCREMENT,
	id_customer INT NOT NULL,
	balance INT NOT NULL DEFAULT(0),
	PRIMARY KEY (id),
    UNIQUE KEY fk_id_customer_unique (id_customer),
	CONSTRAINT fk_wallet_customer FOREIGN KEY (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;


DESC wallet;

SELECT * FROM customers;
SELECT * FROM wallet;

INSERT INTO wallet (id_customer, balance) VALUES (1, 10000), (3, 0);

SELECT wal.balance, c.email FROM wallet as wal JOIN customers as C ON (wal.id_customer = c.id);



