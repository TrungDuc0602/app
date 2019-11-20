USE HuongVietRestaurant
GO

--LỖI DIRTY READ
--Nhân viên cập nhật tình trạng ở BILL nhưng chưa commit thì quản lý xem tình trạng ở BILL.
--T1: Nhân viên cập nhật tình trạng bill
IF OBJECT_ID('PROC_DIRTYREAD_T1_TRUNGDUC', 'p') is not null DROP PROC PROC_DIRTYREAD_T1_TRUNGDUC
GO
CREATE PROC PROC_DIRTYREAD_T1_TRUNGDUC
	@id_bill nchar(10),
	@status nchar(10)
AS
BEGIN TRAN
	UPDATE BILL
	SET status = @status
	WHERE id_bill = @id_bill
	WAITFOR DELAY '00:00:15'
COMMIT TRAN

--T2: Admin xem tình trạng bill
IF OBJECT_ID('PROC_DIRTYREAD_T2_TRUNGDUC', 'p') is not null DROP PROC PROC_DIRTYREAD_T2_TRUNGDUC
GO
CREATE PROC PROC_DIRTYREAD_T2_TRUNGDUC @id_bill nchar(10)
AS
BEGIN TRAN
SET TRAN ISOLATION LEVEL READ UNCOMMITTED  --Đảm bảo cho việc xảy ra DirtyRead
	SELECT B.id_bill, S.description
	FROM BILL B, STATUS S
	WHERE B.id_bill = @id_bill AND B.status=S.id_status
COMMIT TRAN