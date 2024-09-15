--Note: table names were changed to work on my computer

--This view provides the total worth of each sales rep's sales. Its main purpose is to 
--identify the dealership's top performers for sales contest or promotion purposes.
--It can also be used to help determine the dealership's total overall sales. 
CREATE VIEW TotalSalesByRep AS
SELECT E.employeeName, SUM(S.totalPrice) AS TotalSales
FROM Sales S
JOIN Employees E ON S.salesRepNumber = E.employeeID
GROUP BY E.employeeName;


--This view shows the count of sold, under maintenance, and available vehicles. 
--It is used to help the dealership manage its inventory.
CREATE VIEW VehiclesSoldAndAvailable AS
SELECT make, model, status, COUNT(*) AS NumberOfVehicles
FROM Vehicles
GROUP BY make, model, status;


--This view documents every appointment with identifying service name, VIN, and customer name.
--It is used to help track a car's service history for documentation and insurance purposes.
CREATE VIEW CustomerServiceAppointments AS
SELECT C.customerName, A.appointmentDate, S.serviceDescription, S.servicePrice, C.custVin
FROM Appointments A
JOIN Customers C ON A.customerID = C.customerID
JOIN Services S ON A.serviceID = S.serviceID;


--This view tracks total sales made in each month. It is used to analyse sales trends
--and make decisions based on sales and performance data.
CREATE VIEW MonthlySalesReport AS
SELECT TO_CHAR(saleDate, 'YYYY-MM') AS Month, SUM(totalPrice) AS MonthlySales
FROM Sales
GROUP BY TO_CHAR(saleDate, 'YYYY-MM');
