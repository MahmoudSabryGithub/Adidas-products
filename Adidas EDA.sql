use Adidas;
go
select * from [dbo].[Adidas cleaned data]

select count(*) from [dbo].[Adidas cleaned data] --829 rows available

select distinct name from [dbo].[Adidas cleaned data]  --415 Distincit name
select distinct currency from [dbo].[Adidas cleaned data]-- only one currency (Dollar)
select distinct availability from [dbo].[Adidas cleaned data]-- only two sources
select distinct color from [dbo].[Adidas cleaned data]  --Different 18 colors
select distinct category from [dbo].[Adidas cleaned data] --3 categories available
select distinct source from [dbo].[Adidas cleaned data]--Adidas at unitated state only
select distinct breadcrumbs from [dbo].[Adidas cleaned data]--21 breadcrumbs 
select distinct brand from [dbo].[Adidas cleaned data]-- adidas brand
select distinct country from [dbo].[Adidas cleaned data]--USA only

-- Product price depending on color 
select category,color,avg(selling_price) as 'Avg price' from [dbo].[Adidas cleaned data]
group by category,color order by 1,3

-- most available colors in each category
select category,color,count(*) as 'Availability' from [dbo].[Adidas cleaned data]
group by category,color order by 1,3 desc

-- Categories with highest discount
select category,breadcrumbs,avg(original_price) as 'Average price',avg(Discount) 'Average disocunt' from [dbo].[Adidas cleaned data]
group by category,breadcrumbs order by 1,3 desc


-- Available colors for each category and average discount for each color 
select availability,category,color,Avg(Discount) as 'Average discount' from [dbo].[Adidas cleaned data]
group by availability,category,color 
order by 1,2,4 desc


-- Avg rating for each category and color using CTE and temp table
with AvgRate as
(
select category,breadcrumbs,color,avg(average_rating) as 'Avg rating',avg(original_price) as 'Avg price'
,avg(Discount) as 'Avg discount'
from [dbo].[Adidas cleaned data]
group by category,breadcrumbs,color 
--order by 1,4 desc
)
select * into #Rating from AvgRate

select * from #Rating

-- Reviews count per each category and color
select category,breadcrumbs,color,avg(reviews_count) as 'Avg reviews'
,avg(original_price) as 'Avg price' from [dbo].[Adidas cleaned data]
group by category,breadcrumbs,color
order by 1,2,4 desc