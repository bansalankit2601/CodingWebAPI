create proc GetItems
(
	@item_name varchar(30)=''
)
AS
if(@item_name<>'')
begin
select i.Id as Id,c.Name as Category,s.Name as SubCategory,i.Name as Item,i.Description  as Description
from item i
inner join SubCategory s on i.SubCategoryId=s.Id
inner join Category c on c.Id=s.CategoryId
where i.Name=@item_name
end
else
begin
select c.Name as Category,s.Name as SubCategory,i.Name as Item,i.Description  as Description
from item i
inner join SubCategory s on i.SubCategoryId=s.Id
inner join Category c on c.Id=s.CategoryId
end
