use master
drop database [AstroDailyDB]
go

use master
create database [AstroDailyDB]
go

use [AstroDailyDB]
go

create table [Quote](
	[Id] int primary key identity,
	[Script] varchar
)

create table [Role](
	[Id] int primary key identity,
	[Name] varchar
)

create table [Zodiac](
	[Id] int primary key identity,
	[Name] varchar,
	[Description] varchar
)

create table [House](
	[Id] int primary key identity,
	[Name] varchar,
	[Description] varchar
)

create table [Planet](
	[Id] int primary key identity,
	[Name] varchar,
	[Description] varchar
)

create table [Explanation](
	[Id] int primary key identity,
	[ZodiacId] int foreign key references [Zodiac],
	[HouseId] int foreign key references [House],
	[PlanetId] int foreign key references [Planet],
	[Description] varchar
)

create table [User](
	[Id] varchar primary key,
	[Email] varchar unique,
	[Phone] varchar unique,
	[Username] varchar unique,
	[Password] varchar,
	[FirstName] nvarchar,
	[LastName] nvarchar,
	[DobDay] tinyint,
	[DobMonth] tinyint,
	[DobYear] smallint,
	[BirthPlace] varchar,
	[RoleId] int foreign key references [Role]
)

create table [AspectType](
	[Id] int primary key identity,
	[Angle] float
)

create table [Aspect](
	[Id] int primary key identity,
	[PlanetId1] int foreign key references [Planet],
	[PlanetId2] int foreign key references [Planet],
	[AspectTypeId] int foreign key references [AspectType]
)

create table [LifeAttribute](
	[Id] int primary key identity,
	[Spirituality] varchar,
	[Routine] varchar,
	[SexLove] varchar,
	[ThinkingCreativity] varchar,
	[SocialLife] varchar,
	[Self] varchar
	--tải app đt để xem cái nào là tên cột--
)

create table [Horoscope](
	[Id] int primary key identity,
	[AspectId] int foreign key references [Aspect],
	[LifeAttributeId] int foreign key references [LifeAttribute],
	[Date] datetime,
	[Description] varchar
)

create table [AstroProfile](
	[Id] int primary key identity,
	[CustomerId] varchar foreign key references [User],
	[ExplanationId] int foreign key references [Explanation],
	[AspectId] int foreign key references [Aspect],
	[Comparatible] int --sẽ làm tròn các số sau khi tính (nếu sau khi tính là số thập phân)--
)