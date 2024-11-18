CREATE TABLE "rooms"(
    "EmployeesID" INT NOT NULL,
    "Capacity" INT NOT NULL,
    "roomType" NVARCHAR(50) NOT NULL,
    "PricePerNight" DECIMAL(10, 2) NOT NULL,
    "roomID" INT NOT NULL,
    "GuestID" INT NOT NULL,
    "roomNumber" NVARCHAR(10) NOT NULL
);
CREATE INDEX "rooms_roomnumber_index" ON
    "rooms"("roomNumber");
ALTER TABLE
    "rooms" ADD CONSTRAINT "rooms_roomid_primary" PRIMARY KEY("roomID");
CREATE TABLE "Employees"(
    "LastName" NVARCHAR(50) NOT NULL,
    "Position" NVARCHAR(50) NOT NULL,
    "Salary" DECIMAL(10, 2) NOT NULL,
    "EmployeesID" INT NOT NULL,
    "FirstName" NVARCHAR(50) NOT NULL
);
ALTER TABLE
    "Employees" ADD CONSTRAINT "employees_employeesid_primary" PRIMARY KEY("EmployeesID");
CREATE TABLE "Guests"(
    "Email" NVARCHAR(100) NOT NULL,
    "PhoneNumber" NVARCHAR(15) NOT NULL,
    "FirstName" NVARCHAR(50) NOT NULL,
    "EmployeesID" INT NOT NULL,
    "Address" NVARCHAR(255) NOT NULL,
    "LastName" NVARCHAR(50) NOT NULL,
    "GuestID" BIGINT NOT NULL
);
ALTER TABLE
    "Guests" ADD CONSTRAINT "guests_guestid_primary" PRIMARY KEY("GuestID");
CREATE TABLE "Reservations"(
    "ReservationID" INT NOT NULL,
    "RoomID" INT NOT NULL,
    "CheckInDate" DATE NOT NULL,
    "CheckOutDate" DATE NOT NULL,
    "GuestID" INT NOT NULL,
    "TotalAmount" DECIMAL(10, 2) NOT NULL
);
ALTER TABLE
    "Reservations" ADD CONSTRAINT "reservations_reservationid_primary" PRIMARY KEY("ReservationID");
ALTER TABLE
    "Reservations" ADD CONSTRAINT "reservations_roomid_foreign" FOREIGN KEY("RoomID") REFERENCES "rooms"("roomID");
ALTER TABLE
    "rooms" ADD CONSTRAINT "rooms_employeesid_foreign" FOREIGN KEY("EmployeesID") REFERENCES "Employees"("EmployeesID");
ALTER TABLE
    "Reservations" ADD CONSTRAINT "reservations_guestid_foreign" FOREIGN KEY("GuestID") REFERENCES "Guests"("GuestID");
ALTER TABLE
    "Guests" ADD CONSTRAINT "guests_employeesid_foreign" FOREIGN KEY("EmployeesID") REFERENCES "Employees"("EmployeesID");
ALTER TABLE
    "rooms" ADD CONSTRAINT "rooms_guestid_foreign" FOREIGN KEY("GuestID") REFERENCES "Guests"("GuestID");