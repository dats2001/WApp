CREATE TABLE "wapp"."clients"  ( 
	"id"      	uuid NOT NULL,
	"login"   	varchar(50) NOT NULL,
	"password"	varchar(50) NOT NULL,
	"role"    	varchar(50) NOT NULL,
	PRIMARY KEY("id")
)
GO

CREATE TABLE "wapp"."сontacts"  ( 
	"id"               	uuid NOT NULL,
	"phone_number"     	varchar(25) NOT NULL,
	"name"             	varchar(255) NULL,
	"last_sent_through"	varchar(50) NULL,
	PRIMARY KEY("id")
)
GO
ALTER TABLE "wapp"."сontacts"
	ADD CONSTRAINT "iux_contact_phone"
	UNIQUE ("phone_number")
GO

CREATE TABLE "wapp"."active_connections"  ( 
	"id"              	uuid NOT NULL,
	"client_id"       	uuid NOT NULL,
	"user_agent"      	varchar(255) NULL,
	"connected"       	timestamp with time zone NOT NULL,
	"own_phone_number"	varchar(25) NULL,
	"connection_id"   	varchar(255) NOT NULL,
	"whatsapp_status" 	varchar(25) NULL,
	"status_updated"  	timestamp with time zone NULL,
	PRIMARY KEY("id")
)
GO
ALTER TABLE "wapp"."active_connections"
	ADD CONSTRAINT "fk_active_connections_client"
	FOREIGN KEY("client_id")
	REFERENCES "wapp"."clients"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO

CREATE TABLE "wapp"."connection_logs"  ( 
	"id"    	serial NOT NULL,
	"login" 	varchar(50) NOT NULL,
	"action"	varchar(50) NOT NULL,
	"date"  	time with time zone NOT NULL,
	PRIMARY KEY("id")
)
GO

CREATE TABLE "wapp"."messages"  ( 
	"id"        	uuid NOT NULL,
	"contact_id"	uuid NOT NULL,
	"date"      	timestamp with time zone NULL,
	"content"   	text NULL,
	"direction" 	integer NULL,
	PRIMARY KEY("id")
)
GO
ALTER TABLE "wapp"."messages"
	ADD CONSTRAINT "fk_message_contact"
	FOREIGN KEY("contact_id")
	REFERENCES "wapp"."сontacts"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO

insert into wapp.clients("id","login","password","role" )
values('c71759b3-6176-4a7a-ba08-1793880bc001',	'admin',	'test',	'Admin'),
('b4f9adcc-5e0d-4391-84e7-34b4245f605b',	'wappclient01',	'test',	'Client')
('83fc36d9-5f8d-4574-b28b-fe1d7148a519',	'wappclient02',	'test',	'Client')
('eb72c54b-b442-4503-a755-b704f04598cd',	'wappclient03',	'test',	'Client')
('c292879d-cab2-4efb-a974-40622e4ad192',	'wappclient04',	'test',	'Client')
('21f9008c-b531-46fc-adc5-ef9be6dd8432',	'wappclient05',	'test',	'Client')
('a599c86a-9876-4e6f-bba9-f5da3093a7e5',	'publisher01',	'test',	'Publisher')
        





