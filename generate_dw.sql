USE [DWCovid]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 2024-06-11 17:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
	[DayNumber] [tinyint] NOT NULL,
	[DaySuffix] [char](2) NOT NULL,
	[WeekDayNumber] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) NOT NULL,
	[WeekendFlag] [char](3) NOT NULL,
	[HolidayFlag] [char](3) NOT NULL,
	[MonthNumber] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[QuarterNumber] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[YearNumber] [int] NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 2024-06-11 17:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[LocationKey] [bigint] NOT NULL,
	[CountryName] [varchar](200) NOT NULL,
	[ContinentName] [varchar](50) NOT NULL,
	[Latitude] [decimal](9, 6) NOT NULL,
	[Longitude] [decimal](9, 6) NOT NULL,
	[Population] [int] NOT NULL,
	[Area] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__DimLocat__C88254DF9FF828EF] PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVaccineProducent]    Script Date: 2024-06-11 17:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVaccineProducent](
	[VaccineProducentKey] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationKey] [bigint] NOT NULL,
	[ProducentName] [varchar](100) NOT NULL,
	[VaccineName] [varchar](255) NOT NULL,
	[VaccineDateDeveloped] [bigint] NOT NULL,
	[ValidFromDateKey] [bigint] NOT NULL,
	[ValidToDateKey] [bigint] NOT NULL,
	[ActiveProducentFlag] [char](3) NOT NULL,
 CONSTRAINT [PK__DimVacci__F046D8D9951C5991] PRIMARY KEY CLUSTERED 
(
	[VaccineProducentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimWelfare]    Script Date: 2024-06-11 17:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimWelfare](
	[WelfareKey] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationKey] [bigint] NOT NULL,
	[HDI] [numeric](4, 3) NOT NULL,
	[GDPPerCapita] [numeric](15, 2) NOT NULL,
	[HospitalBedsPerThousandPeople] [numeric](5, 2) NOT NULL,
	[Aged65PlusRate] [numeric](5, 2) NOT NULL,
	[LifeExpectancy] [numeric](5, 2) NOT NULL,
	[CardiovascularDeathRate] [numeric](5, 2) NOT NULL,
	[PercentOfMaleSmokers] [numeric](5, 2) NOT NULL,
	[ValidFromDateKey] [bigint] NOT NULL,
	[ValidToDateKey] [bigint] NOT NULL,
	[ActiveFlag] [char](3) NOT NULL,
 CONSTRAINT [PK__DimWelfa__73443EAD349D18B8] PRIMARY KEY CLUSTERED 
(
	[WelfareKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactCovidCases]    Script Date: 2024-06-11 17:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCovidCases](
	[CovidCaseKey] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationKey] [bigint] NOT NULL,
	[DateKey] [bigint] NOT NULL,
	[WelfareKey] [bigint] NOT NULL,
	[NumberOfCases] [int] NOT NULL,
	[NumberOfDeaths] [int] NOT NULL,
	[NumberOfTests] [int] NOT NULL,
 CONSTRAINT [PK__FactCovi__8E025CFFC695C8DC] PRIMARY KEY CLUSTERED 
(
	[CovidCaseKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactCovidVaccinations]    Script Date: 2024-06-11 17:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCovidVaccinations](
	[VaccinationKey] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationKey] [bigint] NOT NULL,
	[DateKey] [bigint] NOT NULL,
	[VaccineProducentKey] [bigint] NOT NULL,
	[NumberOfNewVaccinated] [int] NOT NULL,
	[PercentOfVaccinated] [float] NOT NULL,
	[PercentOfFullyVaccinated] [float] NOT NULL,
	[PercentOfVaccinatedAged65Plus] [float] NOT NULL,
 CONSTRAINT [PK__FactCovi__7A6897D00BC86763] PRIMARY KEY CLUSTERED 
(
	[VaccinationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimVaccineProducent]  WITH CHECK ADD  CONSTRAINT [FK_DimVaccineProducent_DimDate] FOREIGN KEY([ValidToDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimVaccineProducent] CHECK CONSTRAINT [FK_DimVaccineProducent_DimDate]
GO
ALTER TABLE [dbo].[DimVaccineProducent]  WITH CHECK ADD  CONSTRAINT [FK_DimVaccineProducent_DimDate1] FOREIGN KEY([ValidFromDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimVaccineProducent] CHECK CONSTRAINT [FK_DimVaccineProducent_DimDate1]
GO
ALTER TABLE [dbo].[DimVaccineProducent]  WITH CHECK ADD  CONSTRAINT [FK_DimVaccineProducent_DimLocation] FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[DimVaccineProducent] CHECK CONSTRAINT [FK_DimVaccineProducent_DimLocation]
GO
ALTER TABLE [dbo].[DimWelfare]  WITH CHECK ADD  CONSTRAINT [FK_DimWelfare_DimDate] FOREIGN KEY([ValidFromDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimWelfare] CHECK CONSTRAINT [FK_DimWelfare_DimDate]
GO
ALTER TABLE [dbo].[DimWelfare]  WITH CHECK ADD  CONSTRAINT [FK_DimWelfare_DimDate1] FOREIGN KEY([ValidToDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimWelfare] CHECK CONSTRAINT [FK_DimWelfare_DimDate1]
GO
ALTER TABLE [dbo].[DimWelfare]  WITH CHECK ADD  CONSTRAINT [FK_DimWelfare_DimLocation] FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[DimWelfare] CHECK CONSTRAINT [FK_DimWelfare_DimLocation]
GO
ALTER TABLE [dbo].[FactCovidCases]  WITH CHECK ADD  CONSTRAINT [FK_FactCovidCases_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactCovidCases] CHECK CONSTRAINT [FK_FactCovidCases_DimDate]
GO
ALTER TABLE [dbo].[FactCovidCases]  WITH CHECK ADD  CONSTRAINT [FK_FactCovidCases_DimLocation] FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[FactCovidCases] CHECK CONSTRAINT [FK_FactCovidCases_DimLocation]
GO
ALTER TABLE [dbo].[FactCovidCases]  WITH CHECK ADD  CONSTRAINT [FK_FactCovidCases_DimWelfare] FOREIGN KEY([WelfareKey])
REFERENCES [dbo].[DimWelfare] ([WelfareKey])
GO
ALTER TABLE [dbo].[FactCovidCases] CHECK CONSTRAINT [FK_FactCovidCases_DimWelfare]
GO
ALTER TABLE [dbo].[FactCovidVaccinations]  WITH CHECK ADD  CONSTRAINT [FK_FactCovidVaccinations_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactCovidVaccinations] CHECK CONSTRAINT [FK_FactCovidVaccinations_DimDate]
GO
ALTER TABLE [dbo].[FactCovidVaccinations]  WITH CHECK ADD  CONSTRAINT [FK_FactCovidVaccinations_DimLocation] FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[FactCovidVaccinations] CHECK CONSTRAINT [FK_FactCovidVaccinations_DimLocation]
GO
ALTER TABLE [dbo].[FactCovidVaccinations]  WITH CHECK ADD  CONSTRAINT [FK_FactCovidVaccinations_DimVaccineProducent] FOREIGN KEY([VaccineProducentKey])
REFERENCES [dbo].[DimVaccineProducent] ([VaccineProducentKey])
GO
ALTER TABLE [dbo].[FactCovidVaccinations] CHECK CONSTRAINT [FK_FactCovidVaccinations_DimVaccineProducent]
GO
