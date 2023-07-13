--Cleaning Sale Date Data

--Select SaleDate, CONVERT(date, SaleDate)
--From PortfolioProject2.dbo.NashvilleHousing

--update NashvilleHousing
--set SaleDate = CONVERT(date, SaleDate)

--alter table nashvilleHousing
--Add SaleDateConverted Date;

--Update NashvilleHousing
--Set SaleDateConverted = convert (Date, SaleDate)

--Populating Property Address Data

--Select *
--from NashvilleHousing
--where PropertyAddress is null
--order by ParcelID

--Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress,ISNULL(a.propertyaddress, b.PropertyAddress)
--from NashvilleHousing a
--join NashvilleHousing b
--on a.ParcelID = b.ParcelID
--and a.[UniqueID ] <> b.[UniqueID ]
--where a.PropertyAddress is null

--Update a
--set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
--from NashvilleHousing a
--join NashvilleHousing b
--on a.ParcelID = b.ParcelID
--and a.[UniqueID ] <> b.[UniqueID ]
--where a.PropertyAddress is null

--Breaking Out Address into individiual columns (Address,city,state)

--select PropertyAddress
--from NashvilleHousing
----Order by ParcelID

--select 
--SUBSTRING(propertyaddress, 1, charindex (',', PropertyAddress)-1) as address
--,SUBSTRING(propertyaddress, charindex (',', PropertyAddress)+1, len(propertyaddress)) as city

--from NashvilleHousing

--Alter Table NashvilleHousing
--add StreetAddress nvarchar (255)

--update NashvilleHousing
--Set StreetAddress = SUBSTRING(propertyaddress, 1, charindex (',', PropertyAddress)-1)

--Alter table NashvilleHousing
--add City nvarchar (255)

--update NashvilleHousing
--set city = SUBSTRING(propertyaddress, charindex (',', PropertyAddress)+1, len(propertyaddress))


--Select OwnerAddress
--from NashvilleHousing

--Select
--PARSENAME(Replace(owneraddress, ',','.'), 3),
--PARSENAME(Replace(owneraddress, ',','.'), 2),
--PARSENAME(Replace(owneraddress, ',','.'), 1)

----from NashvilleHousing

--ALTER TABLE NashvilleHousing
--Add OwnerSplitAddress Nvarchar(255);

--Update NashvilleHousing
--SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)


--ALTER TABLE NashvilleHousing
--Add OwnerSplitCity Nvarchar(255);

--Update NashvilleHousing
--SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)



--ALTER TABLE NashvilleHousing
--Add OwnerSplitState Nvarchar(255);

--Update NashvilleHousing
--SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)

--Select *
--from NashvilleHousing

-- change y and n to yes and no in " sold as vacant " field

--select distinct(SoldAsVacant), count(SoldAsVacant)
--from NashvilleHousing
--group by SoldAsVacant
--order by 2

--select SoldAsVacant
--	,case when soldasvacant = 'Y' then 'Yes'
--	when soldasvacant= 'N' then'No'
--	else SoldAsVacant
--	end
--from NashvilleHousing

--Update NashvilleHousing
--set SoldAsVacant = case when soldasvacant = 'Y' then 'Yes'
--	when soldasvacant= 'N' then'No'
--	else SoldAsVacant
--	end

--remove duplicates

--with RowNumCTE as (
--Select *,
--	ROW_NUMBER() OVER (
--	PARTITION BY ParcelID,
--				 PropertyAddress,
--				 SalePrice,
--				 SaleDate,
--				 LegalReference
--				 ORDER BY
--					UniqueID
--					) row_num
--from NashvilleHousing
----order by ParcelID
--)
--select*
--from RowNumCTE
--where row_num > 1


---- Delete Unused Column

--select*
--from NashvilleHousing

--Alter table nashvillehousing
--Drop column saledate