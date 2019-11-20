USE HuongVietRestaurant
GO

USE HuongVietRestaurant
GO

--LỖI LOST UPDATE
--Admin đang thực hiện update loại món ăn trong bảng món ăn (chưa commit) tại 1 chi nhánh, thì user đặt mua Phở bò (thuộc loại món ăn trước) của chi nhánh đó.
--T1: Admin thực hiện update loại món ăn
IF OBJECT_ID('PROC_LOSTUPDATE_T1_TRUNGDUC', 'p') is not null DROP PROC PROC_LOSTUPDATE_T1_TRUNGDUC
GO
CREATE PROC PROC_LOSTUPDATE_T1_TRUNGDUC
	@id_dish nchar(10),
	@type_dish nchar(10)
AS
BEGIN TRAN
	UPDATE DISH
	SET type_dish = @type_dish
	WHERE id_dish = @id_dish
	WAITFOR DELAY '00:00:15'
COMMIT TRAN

--T2: User đặt mua món ăn đó trước khi được cập nhật loại món ăn
IF OBJECT_ID('PROC_LOSTUPDATE_T2_TRUNGDUC', 'p') is not null DROP PROC PROC_LOSTUPDATE_T2_TRUNGDUC
GO
CREATE PROC PROC_LOSTUPDATE_T2_TRUNGDUC
	@agency nchar(10),
	@id_dish nchar(10)
AS
BEGIN TRAN
	BEGIN
		SELECT *
		FROM DISH D, MENU M
		WHERE D.id_dish = @id_dish AND M.id_agency = @agency
	END
	WAITFOR DELAY '00:00:15'
	BEGIN
		
	END
COMMIT TRAN
