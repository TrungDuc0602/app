USE HuongVietRestaurant
GO

--LỖI PHANTOM
--Người quản lý A xem toàn bộ đơn hàng (chưa xong) thì có đơn hàng mới được tạo.
--T1: quản lý A xem toàn bộ đơn hàng
IF OBJECT_ID('PROC_PHANTOM_T1_TRUNGDUC', 'p') is not null DROP PROC PROC_PHANTOM_T1_TRUNGDUC
GO
CREATE PROC PROC_PHANTOM_T1_TRUNGDUC
	@id_bill nchar(10)
AS
BEGIN TRAN
	SELECT *
	FROM BILL B
	WHERE B.id_bill = @id_bill
	WAITFOR DELAY '00:00:15'
COMMIT TRAN

--T2: Đơn hàng mới được tạo
IF OBJECT_ID('PROC_PHANTOM_T2_TRUNGDUC', 'p') is not null DROP PROC PROC_PHANTOM_T2_TRUNGDUC
GO
CREATE PROC PROC_PHANTOM_T2_TRUNGDUC
	@id_bill nchar(10),
	@agency nchar(10),
	@customer nchar(10),
	@status nchar(10),
	@order nchar(10),
	@payment_method nchar(10),
	@total float,
	@fee nchar(10),
	@isActive float
AS
BEGIN TRAN
	INSERT INTO BILL(id_bill,agency,customer,status,[order],payment_method,total,fee,isActive)
	VALUES (@id_bill,@agency,@customer,@status,@order,@payment_method,@total,@fee,@isActive)
COMMIT TRAN