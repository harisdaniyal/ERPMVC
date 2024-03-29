GO

CREATE TABLE [dbo].[ClearingAgent](
	[ClearingAgentId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[ChallanNumber] [nvarchar](max) NULL,
	[DeleteDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ClearingAgent] PRIMARY KEY CLUSTERED 
(
	[ClearingAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortAndTerminal]    Script Date: 2/20/2022 8:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortAndTerminal](
	[PortAndTerminalId] [bigint] IDENTITY(1,1) NOT NULL,
	[PortName] [nvarchar](max) NULL,
	[TerminalCode] [nvarchar](max) NULL,
	[TerminalName] [nvarchar](max) NULL,
	[Destination] [nvarchar](max) NULL,
	[PortOfDischarge] [nvarchar](max) NULL,
	[DeleteDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PortAndTerminal] PRIMARY KEY CLUSTERED 
(
	[PortAndTerminalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingAgent]    Script Date: 2/20/2022 8:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAgent](
	[ShippingAgentId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Line] [nvarchar](max) NULL,
	[LineCode] [nvarchar](max) NULL,
	[OtherCharges] [int] NOT NULL,
	[ChargesName] [nvarchar](max) NULL,
	[DeleteDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[BillDateType] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShippingAgent] PRIMARY KEY CLUSTERED 
(
	[ShippingAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingLine]    Script Date: 2/20/2022 8:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingLine](
	[ShippingLineId] [bigint] IDENTITY(1,1) NOT NULL,
	[ShippingLineName] [nvarchar](max) NOT NULL,
	[ShippingLineCode] [nvarchar](max) NOT NULL,
	[ShippingLineAgent] [nvarchar](max) NULL,
	[DeleteDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ShippingLine] PRIMARY KEY CLUSTERED 
(
	[ShippingLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClearingAgent] ON 

INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40026, N'SARFARAZ AHMED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40027, N'EMBARKATION HEADQUARTER KEAMARI', NULL, N'8888', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40028, N'JUMBO INTERNATIONAL', NULL, N'747', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40029, N'RAHMANI TRADERS', NULL, N'90', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40030, N'WORLD OCEAN CENTER', NULL, N'2640', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40031, N'ARBI ENTERPRISES', NULL, N'2136', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40032, N'SHELOZON MOVERS', NULL, N'2863', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40033, N'UNITED SPECTRUM', NULL, N'2777', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40034, N'IDEAL TRADING', NULL, N'2485', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40035, N'A.S.K INTERNATIONAL', NULL, N'1707', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40036, N'AWAN & AGHA ASSOCITES', NULL, N'2467', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40037, N'NOORANI TRADING', NULL, N'2506', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40039, N'EAGLE CLEARING & FORWARDING AGENCY', NULL, N'2426', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40040, N'BISMILLAH LOGISTICS PVT LTD', NULL, N'2624', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40041, N'A.B ENTERPRISES', NULL, N'1464', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40042, N'HAROON TRADERS', NULL, N'1263', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40043, N'OVERSEAS TRANSIT AGENCY PVT LTD', NULL, N'523', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40044, N'J.I.T ENTERPRISES', NULL, N'3100', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40045, N'NEHAL AGENCIES', NULL, N'2648', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40046, N'GLOBAL TRADE LINKERS', NULL, N'2903', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40047, N'A. A. K ENTERPRISES', NULL, N'2246', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40048, N'PAKHAL ENTERPRISES', NULL, N'3067', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40049, N'CARGO CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40050, N'A. M ENTERPRISES', NULL, N'1370', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40051, N'SHAH & SONS ENTERPRISES', NULL, N'3012', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40052, N'AILIA ENTERPRISES', NULL, N'772', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40053, N'A . A. K ENTERPRISES', NULL, N'2246', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40054, N'THE EXPEDITERS', NULL, N'1173', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40055, N'SEA PEARL LOGISTICS', NULL, N'2817', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40056, N'OCEAN LINK SHIPPING COMPANY (PVT) LTD.', NULL, N'2320', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40057, N'UNITED CARGO', NULL, N'1673', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40058, N'I.P.M ENTERPRISES', NULL, N'2289', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40060, N'INTEGRATED SERVICES', NULL, N'1421', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40061, N'HAVE MORE CARGO LOGISTICS', NULL, N'2504', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40062, N'ALICK INTERNATIONAL', NULL, N'2557', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40063, N'RAFAT RIZWAN', NULL, N'875', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40064, N'INNOVATIVE LOGISTICS', NULL, N'2728', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40065, N'RAZZAQ SONS', NULL, N'3007', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40066, N'FAIR AN FAIR ENTERPRISES', NULL, N'2596', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40067, N'FAWAD OMAD ENTERPRISES', NULL, N'1455', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40068, N'A. S. K INTERNATIONAL', NULL, N'1707', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40069, N'ABDULLAH M. MEMON', NULL, N'326', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40070, N'PAK HAIDER INTERNATIONAL', NULL, N'1682', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40071, N'PRIME BUSINESS CORPORATION', NULL, N'2102', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40072, N'R. H ENTERPRISES', NULL, N'1175', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40073, N'PARACHA TRADERS', NULL, N'2409', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40074, N'EL-FRICO', NULL, N'415', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40075, N'ALPHA CARGO SERVICES', NULL, N'2694', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40076, N'AMIRS INTERNATIONAL', NULL, N'616', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40078, N'NATIONWIDE INDUSTRIES (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40079, N'AWAN & AGHA ASSOIATES', NULL, N'2467', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40080, N'ALLIED SHIPPERS INT', NULL, N'2915', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40081, N'GATS ENTERPRISES', NULL, N'2107', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40082, N'GATRON INDUSTRIES LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40083, N'J . B SONS', NULL, N'2573', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40084, N'TRADE SERVICES', NULL, N'1612', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40085, N'OCEAN SERVICE COMPANY', NULL, N'2776', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40086, N'N. R. ENTRPRISES', NULL, N'2429', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40087, N'A SHAHZAD BROTHERS', NULL, N'1813', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40088, N'SWIFT IMPEX', NULL, N'2369', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40089, N'SHAFAQT AGENCIES', NULL, N'2151', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40090, N'SHAMEL ENTERPRISES', NULL, N'2098', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40091, N'SEA KING SHIPPING AGENCIES', NULL, N'739', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40092, N'AL HAKEEM TRADERS', NULL, N'2430', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40093, N'RAFAT RIZWAN & COMPANY', NULL, N'875', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40094, N'H.M & SONS', NULL, N'1920', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40095, N'GUL REHMAN TRADING COMPANY', NULL, N'958', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40096, N'ORIENTAL SHIPPING SERVICES', NULL, N'531', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40097, N'ZAMAN AGENCIES PVT LTD', NULL, N'1326', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40098, N'CARGO TRAKERS', NULL, N'2966', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40099, N'MOON INTERNATIONAL', NULL, N'1818', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40100, N'FAIRY INTERNATIONAL', NULL, N'1526', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40101, N'PREMIER SERVICES INTERNATIONAL', NULL, N'1067', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40102, N'MAKDA INTERNATIONAL', NULL, N'2450', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40103, N'M/S UNITED CARGO', NULL, N'1673', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40104, N'M/S WORLD OCEN CENTRE', NULL, N'2640', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40105, N'M/S BRIDGE CO', NULL, N'2264', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40106, N'MUHAMMAD ADEEL ASSOCIATES', NULL, N'1841', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40107, N'AKHTAR & SONS', NULL, N'2603', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40108, N'AWAN & AGHA ASSOCIATES', NULL, N'2467', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40109, N'M/S R.H ENTERPRISES', NULL, N'1175', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40110, N'BISMILLAH INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40111, N'M/S AILIA ENTERPRISES', NULL, N'772', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40112, N'M/S JFK TRADERS', NULL, N'3056', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40113, N'M/S KOHALA AGENCIES', NULL, N'2053', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40114, N'YOUSUF & SONS', NULL, N'2651', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40116, N'FAISAL INTERNATIONAL', NULL, N'1265', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40117, N'R.A AGENCY', NULL, N'2690', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40118, N'INTERNATIONAL IMPEX', NULL, N'986', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40119, N'SHAFIULLAH & SONS', NULL, N'504', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40120, N'YAQOOB IMPEX', NULL, N'473', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40121, N'ITTEHAD AGENCY', NULL, N'1488', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40122, N'SERVICE INDUSTRIES', NULL, N'310', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40123, N'SANA TRADERS', NULL, N'2774', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40124, N'R.A. AGENCY', NULL, N'2690', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40125, N'KHURRAM CARGO SERVICES', NULL, N'3105', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40126, N'FT CORPORATION', NULL, N'2790', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40127, N'IRSHAD ENTERPRISES', NULL, N'2396', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40128, N'MAK ENTERPRISE', NULL, N'2679', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40129, N'OVERSEAS TRANIT AGENCY', NULL, N'523', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40130, N'CARGO KINGS', NULL, N'2341', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40131, N'GUL RAHMAN TRADING COMPANY', NULL, N'958', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40132, N'AK BROTHERS', NULL, N'2667', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40133, N'TAWAKKAL ENTERPRISES', NULL, N'795', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40134, N'NOVATEX LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40135, N'ORIENTAL SHIPPING', NULL, N'531', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40136, N'SEVEN STAR ENTERPRISES', NULL, N'2550', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40137, N'UNIQUE SHIPPER CLEARING', NULL, N'2693', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40138, N'UNITED SPECTRUM AGENCIES', NULL, N'2777', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40139, N'SHAH & SON', NULL, N'3012', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40140, N'MARCO AGENCIES', NULL, N'1616', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40141, N'ALI POULTRY ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40142, N'MOONLANDERS (PVT) LTD.', NULL, N'3078', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40143, N'ADNAN & COMPANY', NULL, N'539', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40144, N'TAJ & SONS', NULL, N'2554', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40145, N'JAM INTERNATIONAL', NULL, N'2492', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40146, N'MEHRAN CORPORATION', NULL, N'366', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40147, N'FASTER LINE BUSINESS', NULL, N'2350', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40148, N'IMPO INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40149, N'LATIF SONS', NULL, N'1048', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40150, N'XACT LOGISTICS', NULL, N'2526', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40151, N'BETTER TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40152, N'A. M. ENTERPRISES', NULL, N'1370', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40153, N'GLAXY FORWARDERS', NULL, N'852', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40154, N'SEALAND AGENCY', NULL, N'727', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40155, N'JAVAID UMAR ENTERPRISES', NULL, N'18', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40156, N'INTEGRATED SERVICE', NULL, N'1421', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40157, N'SAAD CORPORATION', NULL, N'1414', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40158, N'F K ENTERPRIES', NULL, N'1853', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40159, N'TRADE LINE', NULL, N'691', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40160, N'FALCON EXPRESS', NULL, N'13', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40161, N'INTERNATIONAL FREIGHT SERVICE', NULL, N'1517', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40162, N'MOHSIN ENTERPRISES', NULL, N'1984', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40163, N'SHEEZA ENTERPRISES', NULL, N'2654', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40164, N'BHUNDI CORPORATION', NULL, N'1256', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40165, N'S K TRADERS', NULL, N'2449', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40166, N'ALLIED SHIPPERS', NULL, N'2915', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40167, N'NOBLE INTERNATIONAL', NULL, N'2273', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40168, N'DHL GLOBAL FORWARDING', NULL, N'2229', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40169, N'CHOUDHARY TRADING', NULL, N'204', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40170, N'XPERT ENTERPRISES', NULL, N'164', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40171, N'OIL AND GAS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40172, N'DELTACOM TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40173, N'UNITED IMPEX', NULL, N'1601', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40174, N'RAZZAK SONS', NULL, N'3007', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40175, N'ZAMIN ENTERPRISES', NULL, N'234', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40176, N'UDIYANA INTERNATIONAL', NULL, N'2379', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40177, N'KERALA INTERNATIONAL', NULL, N'1210', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40178, N'CARGO TRACKERS', NULL, N'2966', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40179, N'SAEED FAREEDI ASSOCIATES', NULL, N'1392', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40180, N'M.I BROTHERS', NULL, N'1057', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40181, N'AL-MAQBOOL TRADERS', NULL, N'1635', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40182, N'MOBEEN UL HAQ ENTERPRISES', NULL, N'1524', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40183, N'UNIQUE TRADERS', NULL, N'3134', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40184, N'ASHRAF IMPEX', NULL, N'187', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40185, N'ZULFI INTERNATIONAL', NULL, N'1814', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40186, N'7-STAR ENTERPRISES', NULL, N'2550', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40187, N'KASHMIR TRADERS', NULL, N'1599', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40188, N'SHAHNAWAZ (PVT.) LIMITED', NULL, N'258', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40189, N'ZAHID MASOOD', NULL, N'794', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40190, N'AZHAR ENTERPRISES', NULL, N'2835', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40191, N'S.N. SHAH ENTERPRISES', NULL, N'1694', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40192, N'BAZAI TRADERS', NULL, N'2542', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40193, N'RYAN AGENCIES', NULL, N'672', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40194, N'SEAKING SHIPPING AGENCIES', NULL, N'739', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40195, N'G.M. RAJA ASSOCIATES', NULL, N'2753', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40196, N'S. BALIGHUDDIN & SONS', NULL, N'95', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40197, N'SEA & AIR ENTERPRISES', NULL, N'2454', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40198, N'BHAGWANEE ASSOCIATES', NULL, N'2736', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40200, N'OCEAN AIDS INTERNATIONAL', NULL, N'48', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40201, N'AL MAQBOOL TRADERS', NULL, N'1635', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40202, N'AL SAAD ENTERPRISES', NULL, N'2678', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40203, N'PERFECT INTERNATIONAL', NULL, N'711', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40204, N'J. HABIB AGENCY', NULL, N'2455', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40205, N'TARIQ AGENCIES', NULL, N'4', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40206, N'FAISAL WILLAYAT ENTERPRISE', NULL, N'2820', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40207, N'ML CARGO SERVICES', NULL, N'3107', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40208, N'JUNAID QAMAR ENTERPRISES', NULL, N'2146', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40209, N'JILLANI FREIGHT SEVICES', NULL, N'2414', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40210, N'JUMBO INTERNATIONAL CLEARING AGENCY', NULL, N'3039', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40211, N'INOVI TECHNONGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40212, N'SHAMEEL ENTERPRISES', NULL, N'2098', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40213, N'R.A ENTERPRISES', NULL, N'1897', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40214, N'FRIENDS ENTERPRISES', NULL, N'1759', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40215, N'H R BROTHERS', NULL, N'316', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40216, N'SHAH CORPORATION', NULL, N'2051', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40217, N'AZEPHON INDUSTRIESFATEH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40218, N'DANISH ENTERPRISES', NULL, N'174', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40219, N'HAMD ASSOCIATES', NULL, N'2922', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40220, N'MOON CORPORATION', NULL, N'2028', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40221, N'SHABBIR A. STTAR', NULL, N'363', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40222, N'PAKISTAN TOBACCO COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40223, N'PESTONJI J. DAROGA & CO.', NULL, N'46', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40224, N'HUZAIFA ENTERPRISES', NULL, N'2819', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40225, N'JFK TRADERS', NULL, N'3056', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40226, N'AL-REHMAN LOGISTICS', NULL, N'2607', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40227, N'ZEENAT ENTERPRISES', NULL, N'2927', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40228, N'F.M BROTHERS', NULL, N'2730', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40229, N'N.I TRADING', NULL, N'2309', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40230, N'FREIGHTSHIP SERVICES', NULL, N'2027', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40231, N'A.A.K ENTERPRISES', NULL, N'2246', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40232, N'MEMON SHIPPING AGENCY', NULL, N'566', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40233, N'S. A. Z. LOGISTICS (PVT.) LIMITED', NULL, N'2984', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40234, N'HIRI JAAN AND COMPANY', NULL, N'2754', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40235, N'PYPPA ENTERPRISES', NULL, N'2779', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40237, N'RIL LOGISTICS (PVT) LTD.', NULL, N'2719', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40239, N'SHAFQUAT TRADERS', NULL, N'670', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40240, N'AL ASHER ENTERPRISES', NULL, N'2011', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40241, N'T.I INTERNATIONAL', NULL, N'1698', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40242, N'AL FAJAR ASSOCIATES', NULL, N'1596', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40243, N'FARHAT SONS', NULL, N'2345', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40244, N'F M ENTERPRISES', NULL, N'1207', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40245, N'S.A INTERNATIONAL', NULL, N'1532', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40246, N'M/S ARUAMZ ASSOCIATES', NULL, N'1334', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40247, N'FAIZAN AGENCIES', NULL, N'1919', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40248, N'NEW PAK TRADING', NULL, N'2773', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40249, N'SADIQ ENTERPRISES', NULL, N'1180', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40250, N'PAK MALAYSIA SHIPPING', NULL, N'1893', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40251, N'S.M ENTERPRISES', NULL, N'1548', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40252, N'KHAN BROTHERS', NULL, N'2575', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40253, N'KUEHNE & NAGEL (PVT.) LIMITED', NULL, N'2469', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40254, N'MASOOD TEXTILE MILLS LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40255, N'FAIR & FAIR ENTERPRISES', NULL, N'2596', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40256, N'FARHAN INTERNATIONAL', NULL, N'1458', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40257, N'EXPEDITORS INTERNATIONAL PAKISTAN', NULL, N'1951', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40258, N'FAISAL WALAT ENTERPRISE', NULL, N'2820', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40259, N'KUNDI SERVICES (PVT.) LIMITED', NULL, N'28', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40260, N'PHILIPS PAKISTAN LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40261, N'G.M RAJA ASSOCIATES', NULL, N'2753', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40262, N'JILLANI FREIGHT SERVICES', NULL, N'2414', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40263, N'HAJI ABDUL GHAFFAR', NULL, N'191', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40264, N'LIBERTY ENTERPRISES', NULL, N'2473', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40265, N'AGILITY LOGISTICS (PVT.) LIMITED', NULL, N'2248', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40266, N'SEARCH CARGO', NULL, N'1186', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40267, N'WALI INTERNATIONAL ASSOCIATES', NULL, N'2277', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40268, N'CMS INTERNATIONAL', NULL, N'2285', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40269, N'SETH AHMED', NULL, N'2646', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40270, N'K.S.K ENTERPRISES', NULL, N'2097', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40271, N'ASAR CUSTOM CLEARANCE', NULL, N'1960', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40272, N'UMER ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40273, N'M. NASIR AGENCIES', NULL, N'1378', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40274, N'THE EAGLE SERVICES', NULL, N'2305', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40275, N'TRACON SERVICES (PVT.) LIMITED', NULL, N'2205', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40276, N'HUSSAIN SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40277, N'CRYSTAL MOVERS', NULL, N'1860', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40278, N'SERWAR INTERNATIONAL', NULL, N'1593', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40279, N'MUHAMMAD HUSSAIN QURESHI', NULL, N'336', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40280, N'HABIB NOOR MUHAMMAD', NULL, N'999', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40281, N'KHYBER SHIPPERS', NULL, N'715', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40282, N'FRIENDS MOVERS', NULL, N'2054', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40283, N'ITTEHAD SEWING MACHINE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40284, N'SHIPPERS HOUSE', NULL, N'2740', CAST(N'2021-07-07T12:05:33.0546257' AS DateTime2), 1)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40285, N'ROYAL ASSOCIATES', NULL, N'901', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40286, N'M.NASIR AGENCIES', NULL, N'1378', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40287, N'SHABBIR A. SATTAR', NULL, N'363', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40288, N'M.A TECHGROUND', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40289, N'NASEEM ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40290, N'J.L ENTERPRISES', NULL, N'2269', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40291, N'PARAS ENTERPRISES', NULL, N'2364', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40292, N'TAU CORPORATION', NULL, N'3050', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40294, N'CHEEZAL & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40295, N'AHMED ASSOCIATES', NULL, N'1947', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40296, N'ALLIED PROMOTORS', NULL, N'262', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40297, N'HADI ENTERPRISES', NULL, N'951', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40298, N'ZAKI & BROS', NULL, N'77', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40300, N'I B M ENTERPRISES', NULL, N'2747', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40301, N'FAST SHIPPING & LOGISTICS', NULL, N'2974', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40302, N'MIDLINK TRADERS', NULL, N'765', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40303, N'INTERLINK LOGISTICS (PVT.) LIMITED', NULL, N'2897', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40304, N'THE HOUSE OF TRADE', NULL, N'276', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40305, N'A F AGENCIES', NULL, N'1740', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40306, N'SEVEN STAR AGENCIES', NULL, N'635', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40307, N'ABDUL AZIZ SAVUL', NULL, N'122', CAST(N'2021-07-31T13:01:01.2807833' AS DateTime2), 1)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40308, N'UNITRADE INTERNATIONAL', NULL, N'2674', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40309, N'NISAR BROTHERS', NULL, N'759', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40310, N'JILANI INTERNATIONAL', NULL, N'3124', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40311, N'DANISH INTERNATIONAL', NULL, N'644', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40312, N'SIDDIQUI & SONS', NULL, N'655', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40313, N'A.M. TRADERS', NULL, N'2620', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40314, N'MIT LOGISTICS', NULL, N'3072', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40315, N'KAIKOBAD PESTANJEE', NULL, N'31', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40316, N'CARGO LINKERS', NULL, N'778', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40317, N'AL-KARAM LOGISTICS', NULL, N'2593', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40318, N'SELWEL SERVICES', NULL, N'1174', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40319, N'AL-SHAHBAZ ENTERPRISES', NULL, N'1791', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40320, N'WELCOME LOGISTICS', NULL, N'2329', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40321, N'FAIR TRADE INTERNATIONAL', NULL, N'2064', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40322, N'RAYS ENTERPRISES', NULL, N'1426', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40323, N'J&A INTERNATIONAL', NULL, N'2358', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40324, N'RAFI SONS', NULL, N'2920', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40325, N'PRESTIGE SHIPPERS', NULL, N'397', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40326, N'AAA SOLUTIONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40327, N'SAZ LOGISTICS', NULL, N'2984', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40328, N'M.A INTERNATIONAL', NULL, N'2154', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40329, N'BHF SERVICES INTERNATIONAL', NULL, N'1945', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40330, N'IQBAL & SALEEM', NULL, N'1005', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40331, N'ISRAR TRADERS', NULL, N'2514', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40332, N'I & U AGENCIES', NULL, N'717', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40333, N'AL KARAM ENTERPRISES', NULL, N'2130', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40334, N'MASS TRADING AGENCY', NULL, N'930', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40335, N'G.R TRADERS', NULL, N'1583', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40336, N'TRADE LINE INT', NULL, N'691', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40337, N'COMMODITY SERVICES AGENCY', NULL, N'352', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40338, N'SABIR SHAD & COMPANY', NULL, N'2644', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40339, N'WHITE WAY ENTERPRISES', NULL, N'2245', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40340, N'MUSLIM ENTERPRISES', NULL, N'1250', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40341, N'COSMOS TRADING DEVELOPMENT', NULL, N'1145', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40342, N'ENGINEERS & ENGINEERING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40343, N'TAJ TRADERS', NULL, N'2296', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40344, N'MARINE & INDUSTRIAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40345, N'THE PIONEERS', NULL, N'2282', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40346, N'HASEEN HABIB CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40347, N'UNITED SHIPPERS', NULL, N'44', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40348, N'BAUJEE TRADERS', NULL, N'2771', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40349, N'H S ENTERPISES', NULL, N'1678', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40350, N'FRIENDS LOGISTICS', NULL, N'2803', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40351, N'AL-QUDDUS AGENCY', NULL, N'991', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40352, N'INTERNATIONAL CARGO SERVICES', NULL, N'1297', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40353, N'FOUR STAR CORPORATION', NULL, N'1480', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40354, N'PRIME CARGO SERVICES', NULL, N'2768', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40355, N'MEHNAS ENTERPRISES', NULL, N'1987', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40356, N'MURAD CORPORATION', NULL, N'2195', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40357, N'ABBAS ENTERPRISES', NULL, N'1278', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40358, N'MAHMOOD SIDDIQ LODHIA', NULL, N'261', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40359, N'KAZI  CARPORATION', NULL, N'356', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40361, N'NASIR STEEL', NULL, N'587', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40362, N'JABCON SERVICES', NULL, N'1797', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40363, N'AYYAZ ENTERPRISES', NULL, N'3146', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40364, N'KASHIR AGENCIES', NULL, N'1429', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40365, N'ZAHRA INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40366, N'JAWAD INTERNATIONAL', NULL, N'694', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40367, N'CARGO CARE', NULL, N'2445', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40368, N'HAIDER ALI & SONS', NULL, N'2074', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40369, N'SAFEER INTERNATIONAL', NULL, N'2834', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40370, N'QAZI ANWAR UL ISLAM & CO', NULL, N'530', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40371, N'GLOBE MASTER CARGO', NULL, N'3043', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40372, N'INTERNATIONAL FORWARDERS', NULL, N'167', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40373, N'MORRISWALA & COMPANY', NULL, N'116', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40375, N'NEW VISION', NULL, N'2470', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40376, N'PAK EXPEDITORS', NULL, N'716', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40377, N'SUN LINE GROUP', NULL, N'2965', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40378, N'SIGNAL TRADERS', NULL, N'2149', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40379, N'FAMSA LOGISTICS', NULL, N'1022', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40380, N'AKHTER CUSTOMS CLEARING', NULL, N'2947', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40381, N'FRIENDS FREIGHT SYSTEM', NULL, N'3132', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40382, N'COLONY TEXTILE MILLS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40383, N'RAAZIQ INTERNATIONAL', NULL, N'948', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40384, N'M & B ASSOCIATES', NULL, N'2039', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40385, N'S.A.T LINKS CUSTOM', NULL, N'2451', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40386, N'FAIZ TRADERS', NULL, N'2631', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40387, N'AAS ENTERPRISES (PVT) LTD.', NULL, N'2253', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40388, N'SAIFY SHIPPING SERVICE', NULL, N'774', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40389, N'VIKING SHIPPING SERVICES', NULL, N'919', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40391, N'BUSHRA ENTERPRISES', NULL, N'2425', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40392, N'DANISH IMPEX', NULL, N'1124', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40393, N'OVERSEAS SHIPPERS', NULL, N'2914', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40394, N'KAIKOBAD PESTANJEE KAKALIA', NULL, N'31', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40395, N'V.I.P CLEARING & FORWARDING', NULL, N'1610', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40396, N'SAMAR INTERNATIONAL', NULL, N'1667', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40397, N'S.J (C&F) INTERNATIONAL', NULL, N'1059', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40398, N'NESTLE PAKISTAN  LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40399, N'K.Y SHIPPERS', NULL, N'1810', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40400, N'V.N LAKHANI & CO', NULL, N'441', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40401, N'SETH AHMED DIN', NULL, N'2646', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40402, N'AUTO CLEAR', NULL, N'589', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40403, N'GOHAR AGENCIES', NULL, N'1710', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40404, N'SARHAD LOGISTICS', NULL, N'2890', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40405, N'T.W SERVICES', NULL, N'2112', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40406, N'FAIRWAYS AGENCY', NULL, N'353', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40407, N'WORLD WIDE CARGO', NULL, N'2297', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40408, N'JUNAID ENTERPRISES', NULL, N'2122', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40409, N'ASMA ENTERPRIZES', NULL, N'1676', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40410, N'SABRI FORWARDING AGENCY', NULL, N'1901', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40411, N'MB & COMPANY', NULL, N'2872', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40412, N'RABIA SHIPPING AGENCY', NULL, N'2609', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40413, N'HARRIS ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40414, N'NOOR CORPORATION', NULL, N'1137', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40415, N'SEAWAYS ENTERPRISES', NULL, N'86', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40417, N'MOHAMMAD AMIN MOHAMMAD QASEEM', NULL, N'518', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40419, N'MALIK BROTHERS', NULL, N'2017', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40420, N'USMAN ENTERPRISES', NULL, N'3103', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40421, N'M.REHMAN & SONS', NULL, N'2787', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40422, N'ALI INTERNATIONAL', NULL, N'763', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40423, N'PROMPT SERVICE SYNDICATE', NULL, N'459', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40424, N'S.N SHAH ENTERPRISES', NULL, N'1694', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40425, N'WASI INTERNATIONAL', NULL, N'2165', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40426, N'J & A INTERNATIONAL', NULL, N'2358', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40427, N'FOOD & RAW MATERIAL COMPANY', NULL, N'2880', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40428, N'ACME TECHNOLOGIESADAMJEE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40429, N'UNIQUE SHIPPER', NULL, N'2693', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40430, N'JARAL ENTERPRISES', NULL, N'3041', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40432, N'AKRAM ASSOCIATES', NULL, N'3014', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40433, N'AVISHAN INTERNATIONAL ', NULL, N'3024', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40434, N'GERMIN SHIPPING', NULL, N'1650', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40435, N'M/S DOCKS (PVT) LTD.', NULL, N'3015', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40436, N'M.Z.Y COMMERCIAL', NULL, N'954', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40437, N'SIDDIQUI & COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40438, N'M. A LAND TRANSPORT COMPANY', NULL, N'1898', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40440, N'RIAZ AGENCIES', NULL, N'2161', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40441, N'U TRADE LOGISTICS (PVT) LTD.', NULL, N'2929', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40442, N'SHAMS TRADING', NULL, N'259', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40443, N'SUPERLINE MARKETING CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40444, N'EXPRESS SERVICES', NULL, N'186', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40445, N'I G Y & SONS', NULL, N'2594', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40446, N'TRADE LINK INTERNATIONAL', NULL, N'2215', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40447, N'ARSHAD SUALEH', NULL, N'1368', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40448, N'F K INTERNATIONAL', NULL, N'2120', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40449, N'DIGITAL TRANS', NULL, N'2347', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40450, N'PUF TRADING ESTABLISHMENT', NULL, N'1338', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40451, N'AEG SHIPPING SERVICE', NULL, N'1921', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40452, N'ATIQUE TRADING', NULL, N'2520', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40453, N'DOCKS (PVT) LTD.', NULL, N'3015', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40454, N'YASIN & YASIN ', NULL, N'643', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40455, N'INTERLINK LOGISTICS', NULL, N'2897', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40456, N'CIRRUS INTERNATIONAL (PVT) LTD.', NULL, N'2797', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40457, N'WALI ENTERPRISES', NULL, N'1557', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40458, N'BUSH BOAKE ALLEN PAKISTAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40459, N'AL HAKEEM TRADERS AGENCY', NULL, N'2430', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40460, N'HAROON SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40461, N'SEA LINERS', NULL, N'1588', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40462, N'BATA PAKISTAN LIMITEDBATAPUR DISTT LAHORE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40463, N'ZAFAR MASOOD & CO', NULL, N'586', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40464, N'BEST BOARD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40465, N'BUSINESS LINX', NULL, N'3060', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40466, N'FAROOQ & COMPANY', NULL, N'297', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40467, N'CARE WELL', NULL, N'2095', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40468, N'CHANDA AGENCIES', NULL, N'417', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40469, N'ALL-E-IMRAN INTERNATIONAL', NULL, N'2325', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40470, N'FAIR AND FAIR ENTERPRISES', NULL, N'2596', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40471, N'K G TRADERS', NULL, N'3110', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40472, N'SINDH GREEN ENTERPRISES', NULL, N'1933', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40473, N'AZIZ BROTHERS', NULL, N'1268', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40474, N'TANOLI ASSOCIATES', NULL, N'1944', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40475, N'BROACH & CO (PVT) LTD.', NULL, N'3141', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40476, N'ROYAL TRADING CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40477, N'LOADS LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40478, N'CHANDANA IMPEX', NULL, N'730', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40479, N'LAND SEA CRUISERS', NULL, N'2225', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40480, N'ABA SEEN CLEARING', NULL, N'2623', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40481, N'YAHYA ENTERPRISES', NULL, N'1003', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40482, N'TARIQ SHEIKH INTERNATIONAL', NULL, N'984', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40483, N'K PARAGON SERVICES', NULL, N'2801', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40484, N'NIMIR INDUSTRIAL CHEMICALS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40485, N'M.H ENTERPRISES', NULL, N'1541', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40486, N'M.A.F CLEARING & FORWARDING', NULL, N'1934', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40487, N'SENTINAL SHIPPING CO', NULL, N'1953', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40488, N'IJAZ AND SONS', NULL, N'1576', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40489, N'SHAMSI TRADING', NULL, N'812', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40490, N'AL-QUDSIA SHIPPING SERVICES', NULL, N'1741', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40491, N'ATIQUE TRADING CO', NULL, N'2520', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40492, N'BARKAT KHAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40493, N'UNITEX UNITEX', NULL, N'1314', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40494, N'MAHBOOB SHEIKH ASSOCIATES', NULL, N'2465', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40495, N'SYED AMIR ALI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40496, N'GHAFFAR IBRAHIM', NULL, N'2484', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40497, N'U.S CORPORATION', NULL, N'2552', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40498, N'IBRAHIM FIBRES LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40499, N'YAQOOB ENTERPRISES', NULL, N'2501', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40500, N'DARIYA CORPORATION', NULL, N'2643', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40501, N'GINZA CORPORATION', NULL, N'1935', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40502, N'UF LOGISTICS', NULL, N'3037', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40503, N'HUSSAIN TARIQ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40504, N'AZIZA PAK (PVT) LTD.', NULL, N'2979', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40505, N'E.H.Q HEADQUARTER', NULL, N'8888', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40506, N'ESMAILJEE MUHAMMAD ALI & SONS', NULL, N'181', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40507, N'ARSHAD SULAEH', NULL, N'1368', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40508, N'THE PROFESSIONALS', NULL, N'3030', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40509, N'PRISM ENTERPRISES', NULL, N'1230', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40510, N'AL NOOR SHIPPERS', NULL, N'2389', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40511, N'SHERWANI INTERNATIONAL', NULL, N'1753', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40512, N'AMCO EXPRESS CARGO', NULL, N'2701', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40513, N'AL REHAN ENTERPRISE', NULL, N'1468', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40514, N'TARGET AGENCIES', NULL, N'2313', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40515, N'MELLINIUM ASSOCIATE', NULL, N'2659', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40516, N'CARGO JOBS', NULL, N'665', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40517, N'STAR ENTERPRISES', NULL, N'3090', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40518, N'FEROZ ABDULLAH MEMON', NULL, N'1176', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40519, N'AL-ASHER ENTERPRISES', NULL, N'2011', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40520, N'HYDER BROTHERS', NULL, N'113', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40521, N'GUL SONS INTERNATIONAL', NULL, N'2878', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40522, N'NESTLE PAKISTAN LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40523, N'AHSAN BROTHERS', NULL, N'2247', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40524, N'UROOJ AGENCICES', NULL, N'1350', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40525, N'BATA PAKISTAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40526, N'TRADE LINKERS', NULL, N'2238', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40527, N'WAHIDI & SONS', NULL, N'1126', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40528, N'SWIFT SERVICES', NULL, N'963', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40529, N'INTERNATIONAL TRADE LINKERS', NULL, N'660', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40530, N'MUHAMMADI CLEARING CORPORATION', NULL, N'1355', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40531, N'OMAL SONS CORPORATION', NULL, N'166', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40532, N'SAFETY PACKERS & FORWARDERS', NULL, N'406', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40533, N'NATHANIES INTERNATIONAL SREVICES', NULL, N'2653', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40534, N'U.F ENTERPRISES', NULL, N'1905', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40535, N'AL-NAWAB TRADERS', NULL, N'1502', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40536, N'S.A.B ENTERPRISES', NULL, N'3127', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40537, N'Z.A LOGISTICS', NULL, N'2833', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40538, N'ZAHID MASOOD & COMPANY', NULL, N'794', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40539, N'ZOHAIB QAISER AGENCY', NULL, N'2292', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40540, N'AAS ENTERPRISES', NULL, N'2253', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40541, N'RAJPOOT TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40542, N'BAADBAN SHIPPERS', NULL, N'242', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40543, N'AL SONS AUTO PARTS (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40544, N'PEOPLE AGENCY', NULL, N'335', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40545, N'SHADMAN CARGO SERVICES', NULL, N'1089', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40546, N'ALLIED TRADING CORPORATION', NULL, N'1235', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40547, N'M. NADEEM ASSOCIATES', NULL, N'2792', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40548, N'M.Z CORPORATION', NULL, N'1395', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40549, N'COSMOS ENTERPRISES', NULL, N'1130', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40550, N'ARSHAD SUALEH CORPORATION', NULL, N'1368', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40551, N'A.SHAKOOR AND BROTHERS', NULL, N'839', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40552, N'REGENT SERVICES', NULL, N'1331', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40553, N'SEMINAR (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40554, N'MEDIFLOW PHARMACEUTICAL (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40555, N'A.K CORPORATION', NULL, N'2784', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40556, N'SERVICE INDUSTRIES LTD', NULL, N'310', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40557, N'NORTH INTERNATIONAL', NULL, N'1342', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40558, N'RIZVI BROTHERS', NULL, N'2104', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40559, N'UNIVERSAL CUSTOM SERVICES', NULL, N'956', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40560, N'FAWAD HALEEM ASSOIATES', NULL, N'2180', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40561, N'JOSEPH V & SONS', NULL, N'1916', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40562, N'SYNERGY INTERNATIONAL', NULL, N'2381', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40563, N'DESCON ENGINEERING LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40564, N'A-O ENTERPRISES', NULL, N'1627', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40565, N'AREEB INTERNATIONAL', NULL, N'753', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40566, N'NASIR STEEL CO', NULL, N'587', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40567, N'FAIZ AND SONS', NULL, N'57', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40568, N'OCEAN ENGINEERING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40569, N'AL HARMAIN ENTERPRISES', NULL, N'606', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40570, N'MOHAMMAD  RAMZAN SEWING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40571, N'TALHA ASHRAF & TAHA ASHRAF SHIPPING & TRADING', NULL, N'2321', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40572, N'SYNDICATE WORKS IN FORWARDING', NULL, N'3047', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40573, N'WORLD WIDE CARGO CARE', NULL, N'760', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40574, N'REMPEX CORPORATION', NULL, N'1454', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40575, N'HAQ AGENCY', NULL, N'1114', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40576, N'WQAR ENTERPRISES', NULL, N'1537', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40577, N'ILYAS SONS', NULL, N'480', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40578, N'MERCHANT CARGO SERVICES PVT LTD', NULL, N'1462', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40579, N'ESCORT INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40580, N'SHAH IMPEX', NULL, N'2382', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40581, N'MALIK TRADING CO', NULL, N'1604', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40582, N'PIONEER TRADING', NULL, N'2497', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40583, N'SAYBAN INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40584, N'SETHI BROTHER', NULL, N'2343', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40585, N'AL BADAR MANUFACTURING (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40586, N'M.S SHIPPERS HOUSE', NULL, N'2740', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40587, N'KARKUN AGENCIES', NULL, N'142', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40588, N'M/S FATAMNA CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40589, N'SARHAD AGENCIES', NULL, N'2902', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40590, N'JAVAID BROTHERS', NULL, N'1777', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40591, N'OCEANIC TRADING CO', NULL, N'2327', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40592, N'AL-HAIDER INTERNATIONAL', NULL, N'2330', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40593, N'FRIENDS LOGISTICS (PVT) LTD.', NULL, N'2950', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40594, N'ABL SHIPPING CO', NULL, N'3052', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40595, N'LIBAH ENTERPRISES', NULL, N'2466', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40596, N'HASNAIN SONS', NULL, N'2256', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40597, N'M.S ENTERPRISES', NULL, N'1734', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40598, N'JAMAL ASSOCIATES', NULL, N'1545', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40599, N'ANCHORE CLEARING SERVICES', NULL, N'854', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40600, N'ABDULLAH INTERNATIONAL', NULL, N'953', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40601, N'M.R TRADERS ', NULL, N'1930', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40602, N'S. BHAYANI & SONS', NULL, N'2101', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40603, N'ATTA ENTERPRISES', NULL, N'2085', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40604, N'MB COMMUNICATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40605, N'DEEWAN ASSOCIATES', NULL, N'2518', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40606, N'S.A.K ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40607, N'ERMA ENTERPRISE', NULL, N'2052', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40608, N'KASSIM TEXTILE (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40609, N'A M ENTERPRISES', NULL, N'1370', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40610, N'UNIQUE FEREIGHT FORWARDERS', NULL, N'2219', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40611, N'QUICK & FAST CARGO', NULL, N'2262', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40612, N'AUSPICES INTERNATIONAL', NULL, N'683', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40613, N'REHAN AND CO', NULL, N'2757', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40614, N'EXPIDITOR AGENCY', NULL, N'710', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40615, N'FARRUKH JAVED & BROTHERS', NULL, N'2513', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40616, N'TARIQ BROTHERS', NULL, N'1981', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40617, N'OYSTER ENTERPRISES', NULL, N'1485', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40618, N'M. ZAFAR & CO', NULL, N'752', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40619, N'REMEL INTERNATIONAL', NULL, N'2566', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40620, N'KADERBHOY MUHAMMAD ALI & SONS', NULL, N'36', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40621, N'AMJAD TRADING CORPORATION', NULL, N'2070', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40622, N'SERVINCO INTERNATIONAL', NULL, N'1497', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40623, N'AL MURTAZA ENTERPRISES', NULL, N'652', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40624, N'UNION ENTERPRISES', NULL, N'266', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40625, N'CARGO CRYSTAL', NULL, N'2843', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40626, N'M. SHARIF & SONS', NULL, N'2375', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40627, N'THE EASTERN COMMERCIAL CORPORATION', NULL, N'410', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40628, N'ABBAS CORPORATION', NULL, N'1113', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40629, N'PAK MERCANTILE AGENCIES (PVT) LTD.', NULL, N'114', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40630, N'SEALINK SHIPPING & FORWARDING', NULL, N'1181', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40631, N'M. ANJUM NASEEM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40632, N'FFBL POWER COMPANY LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40633, N'MR. HASSAN ALI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40634, N'MUHAMMAD ASIF', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40635, N'CAMBRIDGE GARMENTS INDUSTRIES (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40636, N'M.M ENTERPRISES', NULL, N'2373', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40637, N'ISRAR UL HAQ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40638, N'AL-FAIZ INTERNATIONAL', NULL, N'612', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40639, N'THAL LIMTED', NULL, N'451', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40640, N'MUGHAL BROTHER', NULL, N'813', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40641, N'SEEMA INTERNATIONAL', NULL, N'2042', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40642, N'SHEIKH INTERNATIONAL ASSOCIATES', NULL, N'2222', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40643, N'MB & COMPANY (PVT) LTD.', NULL, N'2872', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40644, N'CHAMPION SHIPPERS', NULL, N'462', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40645, N'MS. WASIFA HUSSAIN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40646, N'SHAFFAF', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40647, N'AL RAHIM TEXTILE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40648, N'NEW LINE FREIGHT SYSTEM', NULL, N'2582', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40649, N'FATAMNA CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40650, N'TANVEER AGENCIES', NULL, N'615', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40651, N'MR. MUHAMMAD IDRESS AHMED (BIDDER)', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40652, N'BRIDGE CO', NULL, N'2264', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40653, N'ANSA INTERNATIONAL', NULL, N'2945', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40654, N'MUHAMMAD IQBAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40655, N'ASHRAFI ENTERPRISES', NULL, N'607', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40656, N'JAWED ENTERPRISES', NULL, N'823', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40657, N'ALI HAIDER INTERNATIONAL', NULL, N'2330', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40658, N'T. T. TRADERS', NULL, N'836', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40659, N'SNAAN SEALAND TRADERS', NULL, N'1539', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40660, N'AL SONS INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40661, N'FAIR AND FAST INTERNATIONAL', NULL, N'2666', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40662, N'INJECTION SYSTEM (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40663, N'LABEL EXPERT', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40664, N'HUZNAB ENTERPRISES', NULL, N'1397', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40665, N'AZAN INTERNATIONAL', NULL, N'3117', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40666, N'WORLD OCEN CENTRE', NULL, N'2640', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40667, N'SYED AHSAN UL HAQUE', NULL, N'2339', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40668, N'SHAHER INTERNATIONAL', NULL, N'1770', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40669, N'S.A. BASEER & COMPANY', NULL, N'45', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40670, N'INTERNATIONAL FREIGHT & LOGISTICS SERVICES', NULL, N'2493', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40671, N'MR. ABDUL QUDDUS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40672, N'SALATI TRADERS', NULL, N'398', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40673, N'JOAN MASUM IMPEX', NULL, N'345', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40674, N'KARIM INTERNATIONAL ', NULL, N'2570', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40675, N'NATIONAL SERVICES', NULL, N'478', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40676, N'S. BUSINESS PROMOTORS', NULL, N'373', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40677, N'M.S SHIPPERS', NULL, N'2740', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40678, N'BEST POWER SERVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40679, N'KISSA ENTERPRISES', NULL, N'2372', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40680, N'TRACK LOGISTICS', NULL, N'2531', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40681, N'KHURRAM CORPORATION', NULL, N'736', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40682, N'SASPAK CARGO (PVT) LTD.', NULL, N'1549', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40683, N'WAQAR & BROTHER', NULL, N'2065', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40684, N'MAX LOGISTICS PVT LTD', NULL, N'3145', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40685, N'NAYAB AGENCIES', NULL, N'2139', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40686, N'NEW ALLIED AGENCIES', NULL, N'850', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40687, N'AMIR ASSOCIATES', NULL, N'1819', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40688, N'ABBA QASIM INTERNATIONAL', NULL, N'2615', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40690, N'SARYAL CARGO ACHANNEL A.I.L. OFFICER COLONY', NULL, N'2281', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40691, N'SAAD IMPEX', NULL, N'1806', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40692, N'SUPER ASIA MOHAMMAD DIN SONS (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40693, N'HARIS ENTERPRISES', NULL, N'2086', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40694, N'SHANGAI SHANKAI PEROLEUM SCIENCE & TECHNOLOGY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40695, N'K & N S FOOD (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40696, N'OCEAN SERVICES COMPANY', NULL, N'2776', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40697, N'D.S ENTERPRISES', NULL, N'2614', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40698, N'RUPALI POLYESTER LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40699, N'JAWED ZAMAN ENTERPRISES', NULL, N'3169', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40700, N'LINKS SAS HOUSE JILANIABAD', NULL, N'2487', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40701, N'FAIZ CARGO (PVT) LTD.', NULL, N'2391', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40702, N'MALIK BROTHER LOGISTICS PVT LIMITED', NULL, N'2942', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40703, N'MASS TRADERS', NULL, N'2371', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40704, N'SHAN-E-AWAN', NULL, N'2723', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40705, N'MR. ABDUL QAYYUM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40706, N'AHSAN TRADERS', NULL, N'522', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40707, N'MUHAMMAD KASHIF', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40708, N'TRANSNATIONAL', NULL, N'2911', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40709, N'TAIBAH ENTERPRISES', NULL, N'2433', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40710, N'MUZAMMIL SHAH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40711, N'TOP TEN CORPORTION', NULL, N'1634', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40712, N'GLOBAL AGENCIES', NULL, N'1320', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40713, N'WELCOME SERVICES', NULL, N'775', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40714, N'IG CLEARING AND FORWARDING SERVICES', NULL, N'2649', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40715, N'CGA LOGISTICS', NULL, N'3091', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40716, N'ELEGENT SHIPPER', NULL, N'1528', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40717, N'TRADE PORT', NULL, N'2893', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40718, N'AYYAN INTERNATIONAL', NULL, N'2745', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40719, N'SAFEER ULLAH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40720, N'NOOR MUHAMMAD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40721, N'KHAWAJA TARIQ & CO', NULL, N'1688', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40722, N'BROADWAY LOGISTICS PAKISTAN', NULL, N'3180', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40723, N'RAJA TRADERS', NULL, N'1344', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40724, N'MANI ENTERPRISES', NULL, N'2140', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40725, N'NOOR ENGG SERVICE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40726, N'H.A & SONS', NULL, N'1733', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40727, N'KENHAR ENTERPRISES SUIT', NULL, N'2517', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40728, N'GHAZI LOGISTIC (PVT.) LIMITED', NULL, N'2159', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40729, N'RECKITT BENCKISER PAKISTAN LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40730, N'UNIVERSAL ASSOCIATES OFFICE', NULL, N'2838', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40731, N'AL- MUJADDAD CORPORATION', NULL, N'182', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40732, N'KAMAL AHMED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40733, N'SOUTHERN CLEARING SERVICE', NULL, N'1922', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40734, N'F.R.S AGENCY', NULL, N'2353', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40735, N'MR. SAJID MEHMOOD (BIDDER)', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40736, N'AZHAR & SONS', NULL, N'1354', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40737, N'ALAM SONS AGENCIES', NULL, N'1661', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40738, N'SABIR & SONS', NULL, N'1838', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40739, N'ABDUL AZIZ SAVUL & CO', NULL, N'122', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40740, N'SUB LINE GROUP', NULL, N'2965', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40741, N'P.M. LOGISTICS', NULL, N'2578', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40742, N'FLYING PAPER INDUSTRIES LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40743, N'BRITLITE ENGINEERING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40745, N'SUFYAN ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40746, N'N R A TRADERS', NULL, N'2600', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40747, N'INTERNATIONAL FREIGHT SERVICES', NULL, N'1517', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40748, N'RAHIMUDDIN H. ABDUL KARIM', NULL, N'485', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40749, N'M.A CORPORATION', NULL, N'3017', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40750, N'SHAN ENTERPRISES', NULL, N'1639', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40751, N'SHAH AGENCIES', NULL, N'613', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40752, N'B.M SONS', NULL, N'3081', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40753, N'AARAS INTERNATIONAL', NULL, N'2912', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40754, N'MUHAMMAD ASLAM MUHAMMAD ARIF', NULL, N'193', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40755, N'OKEYS LOGISTICS', NULL, N'2702', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40756, N'WAN INTERNATIONAL', NULL, N'2018', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40758, N'ALI CORPORATION', NULL, N'898', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40759, N'S.M. SADIQ & SONS', NULL, N'741', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40760, N'QUICK DEAL', NULL, N'749', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40762, N'KAY ESS INTERNATIONAL', NULL, N'1027', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40763, N'DYNAMIC TOOLING SERVICE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40764, N'ALI ASGHAR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40765, N'DANISH BROTHERS', NULL, N'1406', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40766, N'UNITED LINES', NULL, N'2764', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40767, N'ABDUL SATTAR & SONS', NULL, N'833', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40768, N'Z.CHEMICAL INTERNATIONAL', NULL, N'1912', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40769, N'H.I INTERNATIONAL', NULL, N'1141', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40770, N'N.R ENTERPRISES', NULL, N'2429', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40771, N'SULEMANI SHIPPING SERVICES', NULL, N'1298', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40772, N'ACCURATE LOGISTICS PARIS', NULL, N'1386', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40773, N'TRANSFRIEGHT CORPORATION (PVT) LTD.', NULL, N'1716', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40774, N'URJUMAND TRADERS', NULL, N'213', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40775, N'S.S TRADERS', NULL, N'891', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40776, N'UZAIR ASSOCIATES', NULL, N'2657', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40777, N'K.N ASSOCIATES', NULL, N'2474', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40778, N'K.A. AUTO INDUSTRY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40779, N'SHOE PLANET PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40780, N'LINK LOGISTICS', NULL, N'2763', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40781, N'G.N CORPORATION', NULL, N'1369', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40782, N'MANDI TRADERS', NULL, N'1058', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40783, N'H O ENTERPRISES', NULL, N'1313', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40784, N'MR.FARHAN ALI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40785, N'MUHAMMAD SALMAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40786, N'SHELLI ENTERPRISES', NULL, N'64', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40787, N'MANSOOR IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40788, N'S.NAJMUDDIN AHMED & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40789, N'TRADING HOUSE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40790, N'S S S ENTERPRISES', NULL, N'2480', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40791, N'ALIA IMPEX', NULL, N'1894', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40792, N'ZEESHAN ENTERPRISES', NULL, N'2798', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40793, N'SHAHEEN AGENCIES', NULL, N'472', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40794, N'ATLAS ENTERPRISES', NULL, N'680', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40795, N'JAFFSON ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40796, N'SAMANA CORPORATION', NULL, N'2014', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40797, N'S.A CHOUDARY & CO', NULL, N'3181', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40798, N'NATIONAL BUSINESS SERVICES', NULL, N'2756', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40799, N'FAISAL ASSOCIATES', NULL, N'2194', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40800, N'AES TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40801, N'Y.K TRADERS', NULL, N'2299', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40802, N'ABID TAYYAB & CO', NULL, N'1958', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40803, N'GUL RAHEEM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40804, N'SYED MOHAMMAD WASI KAZMI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40805, N'FAWAD NAEEM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40806, N'ALLCO TRANSFER  PRINTERS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40808, N'HABIB ENTERPRISES', NULL, N'1767', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40809, N'NAYYAR ENTERPRISES', NULL, N'2828', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40810, N'INDUS INTERNATIONAL', NULL, N'2302', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40811, N'CRYSTAL AGENCIES', NULL, N'2093', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40812, N'COTPAK INTERNATIONAL MEHR', NULL, N'1102', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40813, N'THE MALIK ASSOCIATES', NULL, N'2091', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40814, N'NABEEL BROTHERS', NULL, N'423', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40815, N'MUBASHER ENTERPRISES', NULL, N'1925', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40816, N'CARGO MOVING SERVICES', NULL, N'241', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40817, N'ZONA ENTERPRISES', NULL, N'1871', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40818, N'Z.S LOGISTICS (PVT) LTD. (PVT) LTD', NULL, N'2749', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40819, N'JAMALI METAL MARTSHOP', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40820, N'T.A. COMMERCIAL CORPORATION', NULL, N'1171', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40821, N'INTERNATIONAL MOVING & TRADING', NULL, N'1842', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40822, N'ANWER SONS', NULL, N'881', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40823, N'M.S TRADERS', NULL, N'2058', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40824, N'RAPID LOGISTICS PVT LTD', NULL, N'3069', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40825, N'PROGRESSIVE ENTERPRISES', NULL, N'2463', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40826, N'MUJEEBULLAH ASSOCIATES', NULL, N'817', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40827, N'ZEESHAN & CO', NULL, N'1725', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40828, N'AFZAL JAN & CO', NULL, N'1075', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40829, N'ASHRAF CLEARING & FORWARDING', NULL, N'1975', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40830, N'MUHAMMAD SHERYAR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40831, N'MESSRS. JUMBO INTERNATIONAL', NULL, N'747', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40832, N'MERAJ CARGO SERVICES', NULL, N'869', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40833, N'THE MEDIATORS', NULL, N'2589', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40834, N'QAZI ANWA UL ISLAM & CO', NULL, N'530', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40835, N'M.R IMPORT& EXPORT SERVICES', NULL, N'2886', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40836, N'EMMR & CO', NULL, N'1778', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40837, N'AL-ALI & ASPIREROOM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40838, N'ANWAR ASGHAR BROS', NULL, N'192', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40839, N'RAINBOW TRADERS', NULL, N'1401', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40840, N'ESMAILJI MUHAMMAD ALI & SONS', NULL, N'181', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40841, N'MANZOOR HUSSAIN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40842, N'MUMTAZ ENTERPRISES', NULL, N'1731', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40843, N'HAMDARD AGENCY', NULL, N'767', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40844, N'SUN CARGOES', NULL, N'2319', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40845, N'QUICK LOGISTIC SERVICE', NULL, N'2692', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40846, N'LONESONS ENTERPRISES', NULL, N'2590', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40847, N'SHIPPERS LAND', NULL, N'235', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40848, N'AZFA LOGISTICS', NULL, N'3201', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40849, N'HORIZON INTERNATIONAL', NULL, N'1955', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40850, N'GATEWAY INTERNATIONAL', NULL, N'2686', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40851, N'BEST FRIENDS CARGO SERVICES', NULL, N'2824', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40852, N'MARIAUM ASSOCIATES', NULL, N'1614', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40853, N'PAK ASIA INTERNATIONAL', NULL, N'1696', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40854, N'K.S.B. PUMPS CO.LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40855, N'KOKAB ENTERPRISES', NULL, N'1866', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40856, N'TANAVISH ENTERPRISES', NULL, N'1937', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40857, N'MAAZAN INTERNATIONAL', NULL, N'1989', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40858, N'CONCORD CARGO INTERNATIONAL', NULL, N'1738', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40859, N'CREATIVE ELECTRONICS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40860, N'SULTAN ENTERPRISES', NULL, N'661', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40861, N'FAITH ASSOCIATES', NULL, N'1942', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40862, N'SERVICES INTERNATIONAL', NULL, N'338', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40863, N'AL-FATIMA INTERNATIONAL', NULL, N'3025', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40864, N'HAJ ENTERPRISES', NULL, N'2408', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40865, N'BEST BOARD INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40866, N'PRIME TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40867, N'BABA AGENCIES', NULL, N'1096', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40868, N'OCEAN PACKERS & MOVERS', NULL, N'1787', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40869, N'SAMI PHARMACEUTICALS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40870, N'INDUS TRADING CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40871, N'MIAN ENTERPRISES', NULL, N'2147', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40872, N'PEOPLES CLEARING AGENCY', NULL, N'548', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40873, N'NIGAR NTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40874, N'PAKISTAN AGENCIES', NULL, N'603', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40875, N'GASCO ENGINEERING PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40876, N'SHAHJAHAN ENTERPRISES', NULL, N'1809', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40877, N'EASTERN AGENCIES', NULL, N'2606', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40878, N'FORWARD SPORTS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40879, N'EXCELLENT TRADERS', NULL, N'1185', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40880, N'S.BUSINESS PROMOTORS', NULL, N'373', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40881, N'MOHD AMIN MOHD BASHIR', NULL, N'271', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40882, N'RAHILA ENTERPRISES', NULL, N'499', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40883, N'M.AAMIR ENTERPRISES', NULL, N'2189', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40884, N'ALAM CORPORATION', NULL, N'81', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40885, N'J.J. & COMPANY', NULL, N'1632', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40886, N'AL MUQSIT ENTERPRISE', NULL, N'2361', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40887, N'TIJARAT WORLD WIDE', NULL, N'2356', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40888, N'NAYYER ENTERPRISES', NULL, N'2828', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40889, N'SHAN E AWAN ASSOCIATES', NULL, N'2842', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40890, N'RAJAB ALI & SONS', NULL, N'50', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40892, N'S.U. ENTERPRISES', NULL, N'1850', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40893, N'ROYAL ENTERPRISES', NULL, N'678', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40894, N'PROMPT CARGO SERVICES', NULL, N'3029', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40895, N'AMIR AGENCIES', NULL, N'705', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40896, N'ALISHA SHIPPING SERVICES', NULL, N'2751', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40897, N'NEW LIGHT HOUSE PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40898, N'MOBEEN TRADING COMPANY', NULL, N'565', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40899, N'AYUB TRADING', NULL, N'2605', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40900, N'PAKISTAN SOUVENIRS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40901, N'PAK TARDERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40902, N'DASTAGIR INTERNATIONAL', NULL, N'1417', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40903, N'FLYING CEMENT COMPANY LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40904, N'G.S TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40905, N'TALHA ASHRAF TRADING', NULL, N'2321', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40906, N'CINQ ASTRE ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40907, N'DANYAL AGENCIES', NULL, N'2549', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40908, N'WANHAR ENTERPRISES', NULL, N'2519', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40909, N'DECENT SERVICES', NULL, N'623', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40910, N'HENKEL INDUSTRIAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40911, N'S.I TRADERS', NULL, N'1594', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40912, N'BANGGASH CLEARING AGENCIES', NULL, N'868', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40913, N'SIGMA ASSOCIATES', NULL, N'1356', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40914, N'S.R ENTERPRISES', NULL, N'2310', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40915, N'KHURSHID BROTHERS', NULL, N'467', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40916, N'CARVAN CORPORATION', NULL, N'446', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40917, N'ZULFIQAR ASSOCIATES', NULL, N'1628', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40918, N'BRITER ENGINEERING CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40919, N'BLUE MOUNTAIN TRADING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40920, N'ZAFAR BROTHERS', NULL, N'137', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40921, N'HOMEPACK FREIGHT INT', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40922, N'ALI MUKHTAR AGENCIES', NULL, N'2057', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40923, N'AL-HAMD ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40924, N'OLYMPIC AGENCIES', NULL, N'866', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40925, N'TAHER ALI & SONS', NULL, N'1259', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40926, N'BILAL ASSOCIATES', NULL, N'1637', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40927, N'HAPPY LINKERS', NULL, N'395', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40928, N'REGIN PHARMACEUTICALS PCSIR KLC PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40929, N'KAKA TRADERS', NULL, N'929', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40930, N'FORWARD CORPORATION', NULL, N'1261', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40931, N'TRIO GRAPHIC SOLUTION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40932, N'CARGO LOGISTICS INTERNATIONAL', NULL, N'2727', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40933, N'GHADEER ENTERPRISES', NULL, N'2352', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40934, N'EXCEL FREIGHT SYSTEM', NULL, N'2443', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40935, N'BIN RASHEED COLORS & CHEMICALS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40936, N'THAL LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40937, N'PEOPLES SHIPPING AGENCY', NULL, N'319', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40938, N'S.S.S INTERNATIONAL', NULL, N'2515', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40939, N'INPRO PAKISTAN PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40940, N'FAIR BROTHERS', NULL, N'636', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40941, N'LEADER AG', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40942, N'TIJARAT INTERNATIONAL', NULL, N'1434', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40944, N'CHESS SHIPPING & LOGISTICS', NULL, N'2677', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40945, N'DEEN SHIPPERS', NULL, N'1172', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40946, N'SHABBIR TILES & CERAMICS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40947, N'AL FAIZ INTERNATIONAL', NULL, N'612', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40948, N'NISAR SHANGHI & SONS', NULL, N'1404', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40949, N'WANHAR ENETRPRISES', NULL, N'2519', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40950, N'CNINE INTERNATIONAL', NULL, N'3064', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40951, N'ROSE SHIPPERS', NULL, N'1241', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40952, N'UNITED COMMERCIAL SERVICES', NULL, N'2291', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40953, N'UNITED HEALTH CARE INC', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40954, N'JUNAID IMPEX', NULL, N'1827', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40955, N'UNITED SERVICES INTERNATIONAL', NULL, N'2265', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40956, N'A.F.A. ENTERPRISES', NULL, N'1296', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40957, N'WORLD LINKER MARTIME', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40958, N'WASIQ AND QADEER ASSOCIATES', NULL, N'1267', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40959, N'OMITRADE ASSOCIATES', NULL, N'2710', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40960, N'A.A.ENTERPRISES', NULL, N'924', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40961, N'NADEEM ASSOCIATES', NULL, N'2131', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40962, N'DANISH IQBAL ENTERPRISES', NULL, N'2160', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40963, N'T & F ENTERPRISES', NULL, N'1658', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40964, N'S.S.S. ENTERPRISES', NULL, N'2480', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40965, N'KHYBER AUTOS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40966, N'NAFAY ENGINEERING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40967, N'ATTA & SONS', NULL, N'1554', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40968, N'SAARC ENTERPRISES', NULL, N'1220', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40969, N'NARRISH ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40970, N'RIZWAN TRADING AGENCY', NULL, N'1990', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40971, N'BESTWAY LOGISTICS SERVICES PVT LTD ', NULL, N'2221', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40972, N'V.SHIPPERS', NULL, N'3183', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40973, N'AFTAB AND KHALEEL', NULL, N'455', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40974, N'A.H. ENTERPRISES', NULL, N'1029', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40975, N'AL-KHIZAR ENTERPRISES', NULL, N'864', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40976, N'WELCOME SHIPPING', NULL, N'520', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40977, N'TECHNO INDUSTRIAL MACHINERY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40978, N'FAZAL & CO', NULL, N'2539', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40979, N'KWICK KLEARING FORWARDING AGENCY', NULL, N'1205', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40980, N'MAMA ENTERPRISES', NULL, N'1200', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40981, N'ARHAM IMPEX', NULL, N'2780', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40982, N'UNIVERSAL TRADING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40983, N'FEROZ TRADING CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40984, N'FARRUKH INTERNATIONAL', NULL, N'1182', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40985, N'ISMAT TRADING CO', NULL, N'1499', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40986, N'SHAN E AWAN', NULL, N'2723', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40987, N'I A & SONS', NULL, N'1084', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40988, N'AISHA INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40989, N'EASTERN TRADING CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40990, N'ZAFAR MANSOOR AGENCY', NULL, N'597', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40991, N'SIKANDAR ENTERPRISES', NULL, N'3192', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40992, N'ROOMA INTERNATIONAL', NULL, N'1121', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40993, N'AWAN BROTHERS', NULL, N'2750', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40994, N'SHIRAZS EXPORTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40995, N'NURICON PETROSERVICES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40996, N'KHURSHID AZIZ & SONS', NULL, N'2360', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40997, N'SERVICES', NULL, N'1936', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40998, N'ALI IMPEX', NULL, N'2530', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (40999, N'S.S DE MOVERS', NULL, N'3123', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41000, N'AL HAMD ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41001, N'BIO MEDICAL TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41002, N'F.K BROTHER', NULL, N'1999', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41003, N'M.RAMZAN SEWING MACHINE & SILK YARN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41004, N'CAVISH ASSOCIATES PVT LTD', NULL, N'982', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41005, N'UMAIR TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41006, N'J. Y. ENTERPRISES', NULL, N'805', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41007, N'F.ZEE ENTERPRISESOPAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41008, N'ABA SEEN CLEARING & FORWARDING', NULL, N'2623', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41009, N'KHURRAM ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41010, N'SIALKOT DRY PORT TRUST', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41011, N'N.M.J INTERNATIONAL', NULL, N'2010', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41012, N'MALIK ASSOCIATES', NULL, N'2203', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41013, N'REX INTERNATIONAL', NULL, N'1742', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41014, N'ORIENTAL CORPORATION', NULL, N'811', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41015, N'OPTIMUM TECHNOLOGY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41016, N'AMIR BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41017, N'TAIBAH LOGISTICS', NULL, N'2680', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41018, N'KRYSTALITE PRODUCTS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41019, N'SHAH ENTERPRISES', NULL, N'1639', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41020, N'HADI INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41021, N'MACSONS', NULL, N'601', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41022, N'CHILTON ENTERPRISES', NULL, N'1684', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41023, N'OYSTER ENTERPRISE', NULL, N'1485', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41024, N'HARVESTER SERVICES PVT LTD', NULL, N'2163', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41025, N'S.A.S CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41026, N'M. ASIF & CO', NULL, N'2092', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41027, N'PAKISTAN BAGGAGE CORPRORATION ', NULL, N'3008', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41028, N'RAHBAR AGENCY', NULL, N'317', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41029, N'JS ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41030, N'EASTERN FREIGHTER SERVICES', NULL, N'2442', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41031, N'GODIL CLEARING AGENCY', NULL, N'1062', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41032, N'THE SEARLE PAKISTAN LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41033, N'RIDE TRIBE PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41034, N'FAZAL CARGO ENTERPRISES', NULL, N'2276', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41035, N'M A F CLEARING & FORWARDING CO', NULL, N'1934', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41036, N'NISAR AND SONS GK', NULL, N'1449', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41037, N'HABIB INTERNATIONAL', NULL, N'401', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41038, N'GULZAR SONS', NULL, N'1683', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41039, N'MOBEEN & BROTHERS', NULL, N'2621', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41040, N'SHAHI INTERNATIONAL', NULL, N'1899', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41041, N'KG TRADERS', NULL, N'3110', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41043, N'AUTO TRAC', NULL, N'2441', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41044, N'ALMAS ASSOCIATES OFFICE', NULL, N'2056', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41045, N'AMIR INTERNATIONAL SUITE', NULL, N'1206', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41046, N'MEHRAN PAKISTAN', NULL, N'3046', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41047, N'DELUXE FURNISHING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41048, N'MACCA FREIGHT SYSTEM', NULL, N'2587', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41049, N'AL FAZAL AGENCIES', NULL, N'1191', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41050, N'AVICO INTERNATIONAL', NULL, N'1459', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41051, N'PAL ENTERPRISES', NULL, N'1223', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41052, N'GOURMET FOODS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41053, N'BUKSH MACHINERY PARTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41054, N'HAFSA CORPORATION', NULL, N'733', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41055, N'OVERSEAS SHIPPING AGENCIES', NULL, N'201', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41056, N'ELLAHI ENTERPRISES', NULL, N'1664', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41057, N'SAM PRODUTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41058, N'SK ENTERPRISES', NULL, N'1750', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41059, N'FUNFA INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41060, N'ALLIED TRADING & PACKAGING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41061, N'SAQ INTERNATIONAL', NULL, N'1155', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41062, N'PINI TRADING AGENCY', NULL, N'1844', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41063, N'T.K. CORPORATION', NULL, N'2068', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41064, N'ALMAS TRADING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41065, N'MAHEM ENTERPRISES', NULL, N'761', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41066, N'SEVEN STAR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41067, N'WALI & SONS', NULL, N'1157', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41068, N'ZENY ENTERPRISES', NULL, N'700', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41069, N'MARIGOLD PAKISTAN', NULL, N'2949', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41070, N'M A AGENCIES', NULL, N'829', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41071, N'PANTHER TYRES LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41072, N'IMPEX CARGO', NULL, N'1992', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41073, N'CHAUDHRY SHIPPERS', NULL, N'585', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41074, N'TANVEER COTTON MILLS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41075, N'PERVAIZUMAR ENTERPRISES', NULL, N'26', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41076, N'MAXIM PAKISTAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41077, N'THE INDUS HOSPITAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41078, N'ACCURATE LOGISTICS', NULL, N'1386', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41079, N'GATRO POWER PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41080, N'UNIMIX', NULL, N'1801', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41081, N'SARWAR INTERNATIONAL', NULL, N'1593', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41082, N'LUMIERE AUTOMATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41083, N'A.B.C ENTERPRISES', NULL, N'89', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41084, N'AWAIS TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41085, N'KHAS INTERNATIONAL', NULL, N'646', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41086, N'ISHAQ IMPEX', NULL, N'2537', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41087, N'F. REHMAN & CO', NULL, N'106', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41088, N'KRSTOPAC ENERGY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41089, N'MUHAMMAD INTERNATIONAL', NULL, N'1222', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41090, N'F F ASSOCIATES PVT LTD', NULL, N'569', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41091, N'SIAL ENTERPRISES', NULL, N'2349', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41092, N'THE MONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41093, N'RISING IMPEX', NULL, N'2278', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41094, N'CONCERN LOGISTICS', NULL, N'2867', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41095, N'MUNDIA  EXPORTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41096, N'PAKISTAN POST FOUNDATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41097, N'M.Y. ENTERPRISES', NULL, N'2765', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41098, N'MAGNA PROCESSING INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41099, N'ADORN TRADING', NULL, N'2385', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41100, N'THOJANI CORPORATION', NULL, N'3031', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41101, N'I.J.LOGISTICS INTERNATIONAL', NULL, N'2663', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41102, N'MAHABAT KHAN & SONS', NULL, N'3058', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41103, N'TEJANI SONS', NULL, N'637', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41104, N'AL-FAIZ CUTOMS CLEARING', NULL, N'3066', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41105, N'Z.A ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41106, N'OTSUKA PAKISTAN LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41107, N'M/S SHAH ENTERPRISES', NULL, N'1639', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41108, N'PAKISTAN INTERNATIONAL BULK TERMINAL LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41109, N'KASHMIR TRADING CO', NULL, N'2335', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41110, N'RIZVI ASSOCIATES', NULL, N'1830', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41111, N'AYAN ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41112, N'FAIR TRADE IMPEX', NULL, N'2564', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41113, N'A.F AGENCIES', NULL, N'1740', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41114, N'A-R-W ENTERPRISES', NULL, N'2032', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41115, N'UNIQUE ENTERPRISES', NULL, N'1559', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41116, N'NATIONAL CLEARING & FORWARDING AGENCY', NULL, N'98', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41117, N'MAFHH ENTERPRISES', NULL, N'2114', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41118, N'RAZAQUE STEELS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41119, N'K.N & SONS', NULL, N'1954', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41120, N'F.J CORPORATION AGENTS PVT LTD', NULL, N'515', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41121, N'MAPCO ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41122, N'SYNDICATE IMPORTER', NULL, N'3047', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41123, N'DMK LOGISTICS', NULL, N'2821', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41124, N'CPP SERVICES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41125, N'EXPRESS FREIGHT', NULL, N'2207', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41126, N'RUMAN TRADING CORPORATION', NULL, N'2452', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41127, N'SABIR BROTHERS', NULL, N'2610', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41128, N'GLAMOUR SERVICES', NULL, N'2076', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41129, N'A K CORPORATION', NULL, N'2784', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41130, N'WORLD ZONE', NULL, N'2870', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41131, N'XTREME THIRLLF', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41132, N'GLOBAL RESOURCES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41133, N'FINE SERVICES', NULL, N'1534', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41134, N'AMIR AGENCIES ROOM', NULL, N'705', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41135, N'NAWAB SONS', NULL, N'859', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41136, N'JACK CARGO SERVICES', NULL, N'658', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41137, N'MANAB GROUP', NULL, N'3138', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41138, N'ASHRAF AND COMPANY', NULL, N'1784', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41139, N'ASB ENTERPRISES', NULL, N'3202', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41140, N'CONVELL LABORATORIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41141, N'CINZA CORPORATION', NULL, N'1935', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41142, N'SHABBIR & SONS', NULL, N'3185', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41143, N'CARGOTEC', NULL, N'2188', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41144, N'TAHA ENTERPRISES', NULL, N'2108', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41145, N'FAHAD INTERNATIONAL', NULL, N'2359', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41146, N'KHALID AGENCIES', NULL, N'657', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41147, N'AHSAN ENETERPRISES', NULL, N'2431', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41148, N'PROMPT SERVICE', NULL, N'459', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41150, N'ROBAB ENTERPRISES', NULL, N'2970', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41151, N'CHURRA & CO', NULL, N'376', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41152, N'FAZAL AHMED & SONS', NULL, N'2767', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41153, N'PAMCO ENTERPRISES', NULL, N'2316', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41154, N'AL-NASEEB TRADERS', NULL, N'1310', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41155, N'GATEXPO', NULL, N'1324', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41156, N'NATIONAL CARGO PVT LTD', NULL, N'1104', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41157, N'S.M.A ENTERPRISES', NULL, N'2488', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41158, N'H.S CORPORATION', NULL, N'2799', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41159, N'AL-SADAAT ENTERPRISES', NULL, N'2720', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41160, N'MOONLIGHT ENTERPRISES', NULL, N'1410', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41161, N'KZ INTERNATIONAL', NULL, N'2931', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41162, N'AFTAB ALAM', NULL, N'525', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41163, N'REMPLEX TRADING', NULL, N'2807', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41165, N'KINAN ENTERPRISES', NULL, N'2363', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41166, N'E A & H. TRADING COMPANY', NULL, N'3203', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41167, N'M/S SUN CARGOES', NULL, N'2319', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41168, N'J.K LAND TRANSPORT COMPANY', NULL, N'2370', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41169, N'S.B ARRAH AGENCY', NULL, N'481', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41170, N'ARIES LOGISTICS PVT LTD', NULL, N'2227', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41171, N'JAZEE INTERNATIONAL', NULL, N'2499', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41172, N'DYNAMIC TOOLING SERVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41173, N'ENTERPRISES AGENCY', NULL, N'460', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41174, N'AA LOGISTICS', NULL, N'2954', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41175, N'LAND SEA CRUISER', NULL, N'2225', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41176, N'ABDUL AZIZ SAVUL & CO PVT LTD', NULL, N'122', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41177, N'AL BARKET COR.', NULL, N'1540', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41178, N'DRASTIC EMPORIAM', NULL, N'2063', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41179, N'NJ & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41180, N'AL-MADINA LOGISTICS', NULL, N'2486', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41181, N'LAWARI INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41182, N'SANDAL AGENCIES', NULL, N'3074', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41183, N'AMIR INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41184, N'ALI BILAL ENTERPRISES', NULL, N'1804', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41185, N'SHALIMAR PLASTIC INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41186, N'EMAN ENTERPRISES', NULL, N'2021', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41187, N'SEA GUIDE AGENCIES', NULL, N'1087', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41188, N'ZAMAN AGENCIES (PVT) LTD', NULL, N'1236', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41189, N'AL NOOR ENTERPRISES', NULL, N'2029', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41190, N'IMRAN INTERNATIONAL LINKER', NULL, N'2337', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41191, N'NAVEED BROTHERS', NULL, N'758', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41192, N'INNOVATE MEDICAL TECHNOLOGIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41193, N'ENGINEERING CLEARING SERVICE', NULL, N'1312', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41194, N'AR ENTERPRISES', NULL, N'2263', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41195, N'EMEN ENTERPRISES', NULL, N'2021', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41196, N'ESSES AGENCIES PVT LTD', NULL, N'1198', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41197, N'ABU WALI TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41198, N'SACO TRADERS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41199, N'ALI & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41200, N'CARGO SERVICES', NULL, N'3107', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41201, N'HYCOMM ENGINEERING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41202, N'FARHAT MARINE CORPORATION', NULL, N'411', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41203, N'NOVAMED PHARMACEUTICALS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41204, N'M. AAMIR ENTERPRISES', NULL, N'2189', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41205, N'ERMA ENTERPRISES', NULL, N'2052', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41206, N'COTTON FIELD CO', NULL, N'2988', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41207, N'IBM ENTERPRISES', NULL, N'2747', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41208, N'SWIFT CLEARING', NULL, N'2836', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41209, N'EXPRESS AGENCIES', NULL, N'1307', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41210, N'HAJI MUHAMMAD ENTERPRISE', NULL, N'2500', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41211, N'RAVIAN INTERNATIONAL', NULL, N'2009', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41212, N'MAQSOOD CUSTOM AGENCY', NULL, N'2941', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41213, N'SILVER STAR ENTERPRISES (PVT) LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41214, N'MARIUM ASSOCIATES', NULL, N'1614', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41215, N'PROTEK DEVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41216, N'AL-KAREEM MEDICAL TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41217, N'SIGNIFY PAKISTAN LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41218, N'COMBINE COMMUNICATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41219, N'KOHINOOR TEXTILE MILLS LIMITED KOHINOOR COLONY PESHAWAR ROAD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41220, N'SHAFQAT AGENCIES', NULL, N'2151', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41221, N'T.T TRADERS', NULL, N'836', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41222, N'BABER ENTEPRISES', NULL, N'1803', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41223, N'AL IMRAN LINKS', NULL, N'2244', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41224, N'FACILITY SOLUTIONS', NULL, N'2604', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41225, N'EURO INTERNATIONAL', NULL, N'2186', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41226, N'S.W ENTERPRISES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41227, N'SHAFIQ TRADERS', NULL, N'2192', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41228, N'BAHRI TRADING CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41229, N'HB ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41230, N'CRESCENT INTERNATIONAL', NULL, N'2259', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41231, N'BILAL INTERNATIONAL', NULL, N'2156', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41232, N'QUICK SHIPPERS', NULL, N'435', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41233, N'KING AGENCY', NULL, N'1064', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41234, N'TRADE & TRANSPORT INTERNATIONAL', NULL, N'1163', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41235, N'HMA ENTERPRISES', NULL, N'3073', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41236, N'MAX TECH INTERNATIONAL', NULL, N'2670', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41237, N'ABDUL KARIM HAROON', NULL, N'273', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41238, N'IRANIAN CARPET INDUSTRIES', NULL, N'728', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41239, N'AASIM TRADERS', NULL, N'1358', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41240, N'N M J INTERNATIONAL', NULL, N'2010', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41241, N'MUNDIA EXPORTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41242, N'A.D ENTERPRISES', NULL, N'3156', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41243, N'ADNAN INTERNATIONAL', NULL, N'492', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41244, N'3 STAR ENTERPRISES', NULL, N'2724', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41245, N'NIMIR RESINS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41246, N'AMJAD CORPORATION', NULL, N'477', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41248, N'AMIN FATIMA ASSOCIATES', NULL, N'3166', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41249, N'TRI STAR ENTERPRISES', NULL, N'1125', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41250, N'MOHD IQBAL & CO', NULL, N'465', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41251, N'JAWAD USMAN & CO', NULL, N'2087', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41252, N'INTERVAC PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41253, N'HASSAN AND SONS', NULL, N'1508', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41254, N'POPULAR CLEARING SERVICES', NULL, N'303', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41255, N'METAL HOUSE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41256, N'SEA LINE SERVICE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41257, N'GUL TRADE AND SERVICES', NULL, N'609', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41258, N'ATHAR & CO', NULL, N'434', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41259, N'X PERT ENTERPRISES', NULL, N'164', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41260, N'IQBAL ENTERPRISES', NULL, N'234', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41261, N'SIND SHIPPING SYNDICATE', NULL, N'992', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41262, N'FRONTIER CERAMICS LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41265, N'DACO INTERNATIONAL TRANSPORT', NULL, N'2196', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41266, N'SEABOURNE PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41267, N'BURHANI ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41268, N'PANTHER TYRES LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41269, N'KAYS POULTRY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41270, N'IDEAS ASSOCIATES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41271, N'AZRA TRADING CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41272, N'AL-HAROON ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41274, N'A.R CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41275, N'PAK PORTS INTERNATIONAL', NULL, N'3186', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41276, N'TRADE SERVICE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41277, N'SAIF UR REHMAN', NULL, N'3088', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41278, N'DELTA ENTERPRISES', NULL, N'843', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41279, N'KHAN CO', NULL, N'361', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41280, N'THE GENERAL TYRE & RUBBER CO OF PAKISTAN LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41281, N'MAYO ENTERPRISES', NULL, N'2864', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41282, N'UNIPET PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41283, N'ZAFAR ALI & SONS', NULL, N'2398', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41284, N'HABIB TRADERS', NULL, N'3163', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41285, N'NEW HORIZON COMPUTERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41286, N'CLEARANCE MANAGEMENT SERVICE', NULL, N'2175', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41287, N'J.B. SONS', NULL, N'2573', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41288, N'EHTASHAM ENGINEERING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41289, N'KANESHIRO PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41290, N'PULCRA CHEMICALS PAKISTAN PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41291, N'MUNAWWAR CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41292, N'HAROON & BROTHERS', NULL, N'2354', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41293, N'MORRISWALA & CO', NULL, N'116', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41294, N'SUPER SERVICES', NULL, N'734', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41295, N'FAZEEL AND BROTHERS', NULL, N'807', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41296, N'ALIA INTERNATIONAL', NULL, N'1487', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41297, N'AHMED TRADING CO', NULL, N'2344', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41298, N'A & H INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41299, N'ASIM SERVICES', NULL, N'1052', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41300, N'MEHRAN INTERNATIONAL', NULL, N'1652', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41301, N'M H KABIR AGENCY', NULL, N'1876', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41302, N'GREEN T & D PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41303, N'SANIA ENTERPRISES', NULL, N'2103', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41304, N'EXCEL ENGINEERING ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41305, N'S Y TRADERS', NULL, N'3055', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41306, N'KHATRI ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41307, N'MAHRIA CLEARING & FORWARDING AGENCY', NULL, N'2437', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41308, N'AQSA INTERNATIONAL', NULL, N'1597', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41309, N'BABA IMPEX', NULL, N'1011', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41310, N'H. K MOORAD AGENCY', NULL, N'1670', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41312, N'HORIZON SOURCING PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41313, N'HINOPAK MOTORS LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41314, N'AL-HASAN AGENCIES', NULL, N'2061', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41315, N'MUMTAZ PACKAGES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41316, N'S.S.S INTRNATIONAL', NULL, N'2515', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41317, N'LOTTE KOLSON PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41318, N'MERCHANT INTERNATIONAL SERVICES', NULL, N'2166', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41319, N'GRACE CLEARING & FORWARDING PVT LTD', NULL, N'2708', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41320, N'LMP WORLDWIDE', NULL, N'3141', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41321, N'TRADE ZONE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41322, N'CONCEPTS ENTERPRISES', NULL, N'3212', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41323, N'GLOBAL FREIGHT SYSTEMS', NULL, N'2383', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41324, N'MARSHALLAS WORLD WIDE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41325, N'SNIA ENTERPRISES', NULL, N'2103', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41326, N'J.J & COMPANY', NULL, N'1632', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41327, N'BASIER & COMPANY', NULL, N'842', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41328, N'SHANGRILLA GARDEN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41329, N'ABDOOL ALY MOOSABHOY & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41330, N'BISMILLAH & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41331, N'VENUS PAKISTAN PVT LTD', NULL, N'2527', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41332, N'MUHAMMAD SHAMIM KHAN', NULL, N'894', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41333, N'CARGO 2 CARGO', NULL, N'3102', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41334, N'MUSTAFA TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41335, N'AL FAISAL TRADERS', NULL, N'1341', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41336, N'FRELINE MOVERS', NULL, N'1645', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41337, N'AL AHMED & CO', NULL, N'641', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41338, N'ISHAQ AND SONS', NULL, N'2611', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41340, N'KUNDUN CRUCIBLE INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41341, N'MARTCO', NULL, N'861', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41342, N'NATIONAL TRADING CO.', NULL, N'457', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41343, N'OCEAN WORLD CARGO', NULL, N'2682', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41344, N'SKY MERCHANTS INTL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41345, N'DIGITAL COPYING MANAGEMENT PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41346, N'P.P IMAGING TECHNOOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41347, N'TARIQ EECTRIC PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41348, N'HAQ TRADERS', NULL, N'341', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41349, N'M.R ENTERPRISES', NULL, N'2856', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41350, N'QURESHI AGENCIES', NULL, N'1347', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41351, N'S.ZAMAN & CO', NULL, N'2547', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41352, N'KALLAR KAHAR ASSOCIATES', NULL, N'2502', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41353, N'KHYBER ENTERPRISES', NULL, N'324', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41354, N'AL REHMAN ASSOCIATES', NULL, N'2628', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41355, N'MECHANO IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41356, N'AL SADAAT ENTERPRISES', NULL, N'2720', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41357, N'BEACON IMPEX PVT LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41358, N'ZEE SHIPPER INTERNATIONAL', NULL, N'2496', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41359, N'SWIFT SHIPPING PVT LTD', NULL, N'2697', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41360, N'UNIVERSAL EXPEDITORS & TRADERS', NULL, N'3152', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41361, N'LODGE INTERNATIONAL', NULL, N'1619', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41362, N'SAKINA ENTERPRISES', NULL, N'2006', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41363, N'TIME CLEARING SERVICES', NULL, N'781', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41364, N'TEXTILE AUXILIARIES COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41365, N'SPECIALITY SALE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41366, N'S.M ASGHAR (PVT) LTD', NULL, N'714', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41367, N'S.W & SONS', NULL, N'312', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41368, N'KASHIF KHAN & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41369, N'R.T ENTERPRISES', NULL, N'1862', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41370, N'SW & SONS', NULL, N'312', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41371, N'SHAH LOGISTICS PAKISTAN', NULL, N'3010', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41373, N'TIME PRESS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41374, N'H & J. CORPORATION', NULL, N'669', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41375, N'SADAQAT CORPORATION PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41376, N'PAKISTAN RAILWAYS KARACHI', NULL, N'999010', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41377, N'CARE SERVICES', NULL, N'2002', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41378, N'M SHARIF & SONS', NULL, N'2375', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41379, N'NAS GROUP', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41380, N'SGS-TRADERS', NULL, N'2288', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41381, N'ZED-BEE ENTERPRISES', NULL, N'1977', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41382, N'AL KHIZAR ENTERPRISES', NULL, N'864', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41383, N'ALIA ENTERPRISES', NULL, N'772', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41384, N'PROMINENT LINK', NULL, N'2127', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41385, N'KAINAT MUBARAK ENTERPRISES', NULL, N'2934', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41386, N'PKG INTERNATIONAL (PVT) LTD', NULL, N'3115', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41387, N'MIRANI ENTERPRISES', NULL, N'2387', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41388, N'AMROS PHARMACEUTICALS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41389, N'AXIS INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41390, N'AL FAIZ CUSTOMS CLEARING & LOGISTIC SERVICE', NULL, N'3066', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41391, N'SARHAD PLASTIC INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41392, N'SEVEN STAR COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41393, N'RTL PAKISTAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41394, N'EROS CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41395, N'USMAN IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41396, N'MEHRAN CARGO SERVICE', NULL, N'3089', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41397, N'NAKHEEL IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41398, N'HASSAN ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41399, N'S Z SURGICAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41400, N'SHARIQ INTERNATIONAL', NULL, N'1033', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41401, N'BRIGHT STAR', NULL, N'2199', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41402, N'CRYSTAL HEALTH CARE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41403, N'CREATIVE ASSOCIATES', NULL, N'2516', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41404, N'LIMSA AGENCIES PVT LTD', NULL, N'322', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41405, N'HABIB UR REHMAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41406, N'IFTIKHAR BROTHER', NULL, N'2072', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41407, N'RAJI INTERNATIONAL', NULL, N'1961', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41408, N'HAFIZ CORPORATION', NULL, N'2300', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41409, N'WELDON ELECTRONICS CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41410, N'BILAL SHAH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41411, N'MUGHAL IMPEX', NULL, N'2380', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41412, N'EQUIPWAY ENGINEERING SERVICES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41413, N'SAJID MEHMOOD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41414, N'AJR METAL FABRICATORS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41415, N'MUHAMMAD SAAD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41416, N'ZEESHAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41417, N'UNIVERSAL CLEARING & FORWARDING', NULL, N'2271', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41418, N'SYED BROTHERS', NULL, N'1023', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41419, N'MODERN SERVICES', NULL, N'2892', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41420, N'UNIVERSAL BUSINESS ASSOCIATES', NULL, N'1271', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41421, N'SPEED LINKS INTERNATIONAL', NULL, N'2158', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41422, N'AAYAN ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41423, N'NAZEER SONS', NULL, N'80', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41424, N'INTERCOM TRADE SERVICES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41425, N'MILLMEN INSPECTION PVT LTD', NULL, N'1715', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41426, N'EMBASSY OF THE KYRGYZ REPUBLIC', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41427, N'A.R.S EARTH MOVERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41428, N'ALIYAZ ENTERPRISES', NULL, N'2935', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41429, N'AHBAB ENTERPRISES', NULL, N'2034', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41430, N'LAABIS EXPORTERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41431, N'M.A ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41432, N'SUHAIL ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41433, N'EAST WEST ENTERPRISES', NULL, N'1693', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41434, N'COTPACK INTERNATIONAL', NULL, N'1102', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41435, N'EYE ASSOCIATE', NULL, N'2815', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41436, N'EMBASSY OF THE KINGDOM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41437, N'AMIN CORPORATION', NULL, N'339', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41438, N'TRANSWORLD', NULL, N'2089', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41439, N'SRC PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41440, N'SHERRY TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41441, N'PAKISTAN SAFETY GLASS WORK PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41442, N'SHINING OCEAN INTERNATIONAL PVT LTD', NULL, N'3070', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41443, N'MADNI TRADERS', NULL, N'1058', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41444, N'WELKIN ENTERPRISES', NULL, N'1343', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41445, N'A.R YOUSAFNIAZ NAGAR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41446, N'MUSAJI ADAM & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41447, N'SHARIF & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41448, N'PIONEER SHIPPERS', NULL, N'838', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41449, N'FEROZ BROTHERS', NULL, N'3165', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41451, N'RAUF ELECTRONICS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41452, N'URASIA IMPEX', NULL, N'645', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41453, N'FARHAT LOGISTICS', NULL, N'2831', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41454, N'STANDARD SUPPLY AGENCY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41455, N'AL KAREEM MEDICAL TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41456, N'HAMZA INTERNATIONAL', NULL, N'3153', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41457, N'PIONEER AGENCIES', NULL, N'34', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41458, N'OCEAN AIR INTERNATIONAL', NULL, N'1234', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41459, N'NATIONAL TRADE AGENCIES', NULL, N'188', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41460, N'ASGHAR ASSOCIATES', NULL, N'2168', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41461, N'AHMED ENTERPRISES', NULL, N'536', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41462, N'AL KARAM LOGISTICS', NULL, N'2593', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41463, N'ATHER JAVED & CO', NULL, N'179', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41464, N'REHAN BROTHERS', NULL, N'1098', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41465, N'ZEESHAN INTERNATIONAL', NULL, N'2775', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41466, N'TEMPRITES BISMILLAH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41467, N'B & A ENTERPRISES', NULL, N'2220', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41468, N'ANJUM MOTOR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41469, N'QAMAR ASSOCIATES', NULL, N'2193', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41470, N'BRIGHTEX INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41471, N'MAHA TAUFIQ IMPEX', NULL, N'2304', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41472, N'CPAC ENTERPRISES', NULL, N'3207', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41473, N'KHYBER SHIPPERS PVT LTD', NULL, N'715', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41474, N'TAQI AUTOS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41475, N'NOOR ZEB TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41476, N'GAXOSMITHKLINE CONSUMER HEATHCARE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41477, N'YOUNUS SONS', NULL, N'408', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41478, N'SEALINK SHIPPING', NULL, N'1181', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41479, N'CHANAR ASSOCIATES', NULL, N'2525', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41480, N'MUHAMMAD SHAHEEN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41481, N'STAR PLUS INTERNATIONAL', NULL, N'3173', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41482, N'SADDIQUI ENTERPRISES', NULL, N'1385', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41484, N'HAMMAD ENTERPRISES', NULL, N'2067', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41485, N'NET LINE PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41486, N'AL NAWAB TRADERS', NULL, N'1502', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41487, N'LOGISTIC VIEW', NULL, N'3075', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41488, N'HUSSAIN CAN CO PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41489, N'CNS ENGINEERING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41490, N'INAM SONS', NULL, N'882', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41491, N'M/S A.M. TRADERS', NULL, N'2620', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41492, N'YAMAHA MOTOR PAKISTAN PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41493, N'POLAR BEAR PAKISTAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41494, N'BASALTIC TRADING', NULL, N'1251', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41495, N'RAILWAY CONSTRUCTIONS PAKISTAN LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41496, N'H & J CORPORATION', NULL, N'669', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41497, N'JASS BROTHERS INTERNATIONAL', NULL, N'2559', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41498, N'ROYAL INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41499, N'ARMANI TEK', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41500, N'WORLD WIDE CARGO EXPRESS', NULL, N'2297', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41501, N'JAWED AND COMPANY', NULL, N'2167', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41502, N'EHSAN RAHIM ENTERPRISES', NULL, N'1116', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41503, N'NIMIR RESIND LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41504, N'UZAIR ALI AND BROTHERS', NULL, N'2078', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41505, N'TANVEER CARPORATION', NULL, N'1498', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41506, N'AHMED HUSSAIN', NULL, N'1030', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41507, N'UNIVERSAL AUTO ENGINEERING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41508, N'ULTIMA AUTOMOTIVE PARTS COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41509, N'WAH INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41510, N'ANWAR SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41511, N'EASTMAN AGENCIES', NULL, N'933', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41512, N'PERMAIR LEATHER PAKISTAN PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41513, N'AL TAJJIR & CO PVT LTD', NULL, N'436', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41514, N'HAKIMI ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41515, N'SYED & SHEIKH ASSOCIATES', NULL, N'790', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41516, N'KHAS TRADING CO', NULL, N'2669', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41517, N'UNIVERSAL PISTON HOUSE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41518, N'BANGASH CLEARING & FORWARDING', NULL, N'868', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41519, N'FAZAL INTERNATIONAL LOGISTICS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41520, N'SHAHNAWAZ ABDUL SATTAR', NULL, N'225', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41521, N'MIRZA CORPORATION', NULL, N'3016', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41522, N'BROOKES PHARMACEUTICAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41523, N'PAKISTAN SPRING ENGINEERING COMPANY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41524, N'FRANKLIN BUSINESS ASSOCIATES', NULL, N'3184', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41525, N'HUMAYUN BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41526, N'QAZI ANWAR UL ISLAM', NULL, N'530', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41527, N'M.M INTERNATIONAL', NULL, N'1024', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41528, N'MULTAN DRY PORT TRUST', NULL, N'2137', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41529, N'PEERZADA SERVICES INTERNATIONAL', NULL, N'2155', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41530, N'FREELINE MOVERS', NULL, N'1645', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41531, N'H.B ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41532, N'GLOBAL INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41533, N'JAVERIA ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41534, N'AZIZ ENTERPRISES', NULL, N'2424', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41535, N'TABISH AUTO CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41536, N'ALLIED AXIOM CHEMICAL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41537, N'INDUS TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41538, N'MERIN PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41539, N'FATIMA FERTILIZER COMPANY LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41540, N'MAC ENTERPRISES', NULL, N'3162', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41541, N'QAMARTEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41542, N'F.M SHOES INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41543, N'SILAT ENTERPRISES', NULL, N'2913', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41544, N'MANIA ENTERPRISES', NULL, N'2992', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41545, N'PAK ARMORING PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41546, N'THE LEGEND', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41547, N'AUN ASSOCIATES', NULL, N'1812', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41548, N'SKY POWER PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41549, N'NATIONAL TRADING CENTER', NULL, N'210', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41550, N'AL FATIMA INTERNATIONAL', NULL, N'3025', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41551, N'ZODIAC SPECIALITY PRODUCTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41552, N'GARBISONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41553, N'J.K LAND TRANSPORT COMPNAY PVT LTD', NULL, N'2370', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41554, N'MAAN KUBOTA COMPANY & AGRICULTURE SERVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41555, N'KHURRAM AND CO', NULL, N'1481', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41556, N'U.F. LOGISTICS', NULL, N'3037', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41557, N'KHURAM BROTHERS', NULL, N'618', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41558, N'SUCCESS INTERNATIONAL', NULL, N'2743', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41559, N'LUQMANIYA ENTERPRISES', NULL, N'2592', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41561, N'CREEK AGENCIES', NULL, N'3137', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41562, N'R-TRANS', NULL, N'3095', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41563, N'ANWAR AGENCY', NULL, N'138', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41564, N'SERVICE ASSOCIATES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41565, N'ARUAMZ ASSOCIATES', NULL, N'1334', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41566, N'ZAHRA INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41567, N'RAYAN AGENCIES (PVT) LTD', NULL, N'672', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41568, N'KOHINOOR TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41569, N'INTERNATIONAL CUSTOMER SERVICE', NULL, N'2435', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41570, N'MARIA TRADING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41571, N'ASHFAQ AHMED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41572, N'ADEEL MOVERS', NULL, N'1996', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41573, N'MAAZ ASSOCIATES', NULL, N'2576', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41574, N'CREATIVE ELECTRONIC', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41575, N'PAKISTAN ACCOMUTLATORS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41576, N'FAHAD IMPEX', NULL, N'1941', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41577, N'JAWED CORPORATION', NULL, N'577', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41578, N'NORANI SHIPPERS', NULL, N'1070', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41579, N'ECONOMY INTERNATIONAL', NULL, N'1832', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41580, N'ANGELS ADVRTISRS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41581, N'THE STILLMAN COMPANY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41582, N'COSMOPOLITAN AGENCIES', NULL, N'770', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41583, N'TRADE BATCH INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41584, N'F.BRIGHT AGENCY', NULL, N'29', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41585, N'MIRZA AND SONS', NULL, N'3177', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41586, N'CANDIDE GLOBAL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41587, N'MR.HUSSAIN TARIQ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41588, N'BURAQ INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41589, N'AKHTAR ANWAR & CO', NULL, N'809', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41590, N'BISMILLAH ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41591, N'OIL AND GAS DEVELOPMENT COMPANY LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41592, N'EA &  H TRADING COMPANY', NULL, N'3203', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41593, N'CHIEF AUTO CENTRE PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41594, N'UROOBA INTERNATIONAL', NULL, N'2825', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41595, N'FIVE STAR CORPORATION', NULL, N'633', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41596, N'ALI SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41597, N'MYWATER PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41598, N'S.ANIS ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41599, N'KURDSON INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41600, N'MNA INTERNATIONAL', NULL, N'2460', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41601, N'INAYAT SONS', NULL, N'2448', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41602, N'OFF ROAD DIESEL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41603, N'HIRANIS PHARMACEUTICALS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41604, N'J.N CORPORATION', NULL, N'668', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41605, N'SHEIKH CHEMICAL CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41606, N'AHMED ABDUL SATTAR', NULL, N'431', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41607, N'A.R ENTERPRISES', NULL, N'1229', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41608, N'HARIS TRADING CORPORATION', NULL, N'1456', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41609, N'A.S INTERNATIONAL', NULL, N'2626', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41610, N'P.F ENTERPRISES', NULL, N'246', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41611, N'ZARA  ENGINEERS', NULL, N'2834', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41612, N'H.M.A ENTERPRISES', NULL, N'3073', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41613, N'EMBASSY OF THE THE SOMALI PEPUBLIC', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41614, N'HS CORPORATION', NULL, N'2799', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41615, N'AL-SHARQI REAL LOGISTICS PVT LTD', NULL, N'2854', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41616, N'A.SHAHZAD BROTHERS', NULL, N'1813', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41617, N'GRAY MACKNZIE RESTAURENTS INTERNATIONAL LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41618, N'SELLING BUSINESS SYSTEMS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41619, N'HAKIMSONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41620, N'FIDA HUSSAIN ADAMJI ARBI', NULL, N'53', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41621, N'KAKA TRADERES', NULL, N'929', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41622, N'TRADEX INTERNATIONAL', NULL, N'3126', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41623, N'MR KAMAL AHMED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41624, N'STANDARD COLOURS AND CHMICALS CORPRATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41625, N'MEHRAN SHIPPERS', NULL, N'1746', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41626, N'PKG INTERNATIONAL PVT LTD', NULL, N'3115', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41627, N'AL REHMAT TRADING', NULL, N'2419', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41628, N'ADVANCED SOLUTIONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41629, N'NATIONAL ENTERPRISES', NULL, N'1308', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41630, N'EHSAN SONS', NULL, N'2421', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41631, N'SALEEM ENTERPRISES', NULL, N'2200', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41632, N'BILWANI INTERNATIONAL 9', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41633, N'PITAFI BROTHERS', NULL, N'1822', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41634, N'ABDULLAH YASEEN TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41635, N'BRIGHT INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41636, N'FURQAN INTERNATIONAL', NULL, N'2230', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41637, N'DARVAISH INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41638, N'PAK WINGS', NULL, N'3234', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41639, N'PROMINENT', NULL, N'2127', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41640, N'ORIENT AUTOMOBILES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41641, N'SARMAD IQBAL HOOSAYNI', NULL, N'1237', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41642, N'SUPER AUTOS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41643, N'ZAHID IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41644, N'LAHORE POLY PROPLENE INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41645, N'SMA ENGINEERING & SERVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41646, N'INDUS CHEMICALS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41647, N'ANWAR ASSOCIATES', NULL, N'2483', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41648, N'CLEARANCE MANAGEMENT SERVICES', NULL, N'2175', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41649, N'CITI PHARMA PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41650, N'MR.KAMAL AHMED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41651, N'EYSHAL ENTERPRISES', NULL, N'3231', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41653, N'M.A AGENCIES', NULL, N'829', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41654, N'PAK EXPREES', NULL, N'1323', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41655, N'TECHNO EXPERTS INTERNATIONAL', NULL, N'2476', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41656, N'SINOTC CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41657, N'FAREKH SHAIKH ASSOCIATES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41658, N'MAG CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41659, N'S.S.J.BROTHERS', NULL, N'1772', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41660, N'OVRSEAS MUTUAL NTRPRIS', NULL, N'372', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41661, N'ASAR CUSTOM  CLEARANCE', NULL, N'1960', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41662, N'A.M.S ENTERPRISES', NULL, N'2986', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41663, N'KARAM TRADRS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41664, N'FINE DAILY NECESSITIESF', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41665, N'AFTAB BROTHERS', NULL, N'1168', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41666, N'EMBASSY OF THE REPUBLIC OF UKRAINE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41667, N'H M BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41668, N'EVERSHINE INDUSTRIES (PRIVATE) LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41669, N'GLOBAL EXPRESS', NULL, N'370', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41670, N'AL REHMAN TRADERS', NULL, N'3176', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41671, N'NATIONAL RADIO AND TELECOMMUNICATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41672, N'PESTONJI J DAROGA', NULL, N'46', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41674, N'RECTO INTERNATIONAL ', NULL, N'1948', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41675, N'JAWAID ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41676, N'AQIB PROFESSIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41677, N'PEOPLES SERVICE CORP', NULL, N'269', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41678, N'SUNLIGHT AUTO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41679, N'ISHRAT SYNDICATE', NULL, N'494', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41680, N'HUSSAINI HAEMATOLOGY ONCOLOGY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41681, N'P A WALI MUHAMMAD', NULL, N'800', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41682, N'NOBLE INETRNATIONAL SERVICS', NULL, N'2273', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41683, N'TRADE INTERNATIONAL', NULL, N'3126', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41684, N'S.K NTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41685, N'INTERNATIONAL AIR CARGO SERVICE', NULL, N'3013', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41686, N'IMRAN & SONS', NULL, N'2338', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41687, N'AEG SHIPPING SERVICES', NULL, N'1921', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41688, N'G-PAC ENERGY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41689, N'MASTER BUSINESS ASSOCIATES', NULL, N'2633', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41690, N'OFFICE AUTOMOBILE GROUP', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41691, N'SIGMA SCIENTIFIC PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41692, N'RAPID SHIPPING AND CARGO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41693, N'BRAND MERCHANTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41694, N'RAZA & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41695, N'TIMA INTERNATIONAL ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41696, N'PROCON ENGINEERING PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41697, N'SECURITY TRANSPORT PVT LTD', NULL, N'1884', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41698, N'RDS INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41699, N'MOLAI CARGO LINKERS', NULL, N'2062', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41700, N'ALIA IMPX ROOM', NULL, N'1894', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41701, N'M. YOUNIS & CO', NULL, N'1495', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41702, N'NK.SURGICAL & TECHNOLOGY LINKS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41703, N'FAUJI CEMENT COMPANY LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41704, N'BRISKING NTERPRISES', NULL, N'1873', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41705, N'QUALITY CUSTOM BROKERS', NULL, N'3245', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41706, N'BIG W', NULL, N'1571', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41707, N'ANTARIA TOOLS & HARDWARE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41708, N'T.U PLASTIC INDUSTRY COMPANY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41709, N'AL MAROOF CARGO', NULL, N'1425', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41710, N'KARAM-E-MUSTAFA ENTERPRISES', NULL, N'3143', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41711, N'MR.YASIR NASEEM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41712, N'MR MUHAMMAD BILAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41713, N'MR KASHIF RAZA', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41714, N'MRS.GUL RUKH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41715, N'MR.MUHAMMAD SALMAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41716, N'MR.MUHAMMAD IQBAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41717, N'MR.KASHIF RAZA', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41718, N'MR SHAHID MEHMOOD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41719, N'SADQAIN HEALTH CARE PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41720, N'MR.MUZAMMIL SHAH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41721, N'MR.ANWAR IQBAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41722, N'AL-IMRAN LINKS', NULL, N'2244', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41723, N'GUL MUHAMMAD', NULL, N'3193', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41724, N'UNILEVER PAKISTAN LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41725, N'MR.IFTIKHAR HUSSAIN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41726, N'MR JUNAID UR REHMAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41727, N'HINO AUTO WORKSHOP', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41728, N'G S S TRADERS', NULL, N'1043', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41729, N'MR.ARIF SAEED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41730, N'MR.DOST MUHAMMAD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41731, N'MR.GULZAR REHMAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41732, N'AL-MUSLIM CARGO', NULL, N'3235', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41733, N'NEXTGEN TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41734, N'S.T.A INTERNATIONAL', NULL, N'2019', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41735, N'H & A MARKETING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41736, N'SPECIALITY SALES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41737, N'A.J KABANI & SONS', NULL, N'1335', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41738, N'T.S BUILDERS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41739, N'HAK ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41740, N'SHARIQ ALI ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41741, N'SHAMIN AHMED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41742, N'FATH ASSOCIATES', NULL, N'1942', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41743, N'H.M BROTHER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41744, N'ZAREEN INTERNATIONAL', NULL, N'484', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41745, N'RAJA SIKANDAR & COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41746, N'AMRELI STEELS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41747, N'GLOBAL TRADE WAY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41748, N'BABJI CHEMICAL CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41749, N'AL SHAHZAD BROTHERS', NULL, N'1813', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41750, N'QUETTA DISTILLERY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41751, N'S-T CORPORATION', NULL, N'1215', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41752, N'SOHAIL INTERNATIONAL', NULL, N'2022', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41753, N'SHOAIB SHIPPING AGENCIES', NULL, N'604', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41754, N'FOSTER LEVER PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41755, N'FEMCO IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41757, N'OCEANIC CLEARING SERVICES', NULL, N'1184', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41758, N'FARDAAN ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41759, N'MR.MANZOOR HUSSAIN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41760, N'ADVANCE TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41761, N'SEA LINE SERVICES', NULL, N'819', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41762, N'A.R.W ENTERPRISES', NULL, N'2032', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41763, N'MYSF IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41764, N'NADEEM O NAEEM', NULL, N'291', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41765, N'CARGO MANAGRS SUIT', NULL, N'3119', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41766, N'EPS-PACKAGES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41767, N'NISA SHIPPING LINE', NULL, N'3059', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41768, N'CARGO INTERNATIONAL', NULL, N'172', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41769, N'NK SURGICAL & TECHNOLOGY', NULL, N'2540', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41770, N'MR.SHEIKH NAJAM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41771, N'RAHEEL BROTHERS', NULL, N'1636', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41772, N'SEA LUCK ENTERPRISES', NULL, N'591', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41773, N'SALTECH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41774, N'COOL AGENCIES', NULL, N'1796', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41775, N'THE HELPERS', NULL, N'27370', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41776, N'SHAFI RESO CHEM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41777, N'N.D.R ENTERPRISES', NULL, N'1443', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41778, N'AL MUSTAFA AND SONS', NULL, N'2357', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41779, N'ZAINAB ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41780, N'A. J. KABANI & SONS', NULL, N'1335', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41781, N'GULF BEVERAGES AND FOOD PROCESSING PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41782, N'S.FARRUKH JAVED & BROTHERS', NULL, N'2513', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41783, N'AHMAD MEDIX PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41784, N'LEVANT EXPRESS PVT LTD', NULL, N'720', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41785, N'QAJ INTERNATIONAL', NULL, N'3238', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41786, N'SAS CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41787, N'MULTI MODE CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41788, N'EASTMAN SERVICES', NULL, N'1553', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41789, N'FAMCO INSTRUMENT', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41791, N'HASHMI SHIPPERS', NULL, N'1244', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41792, N'M.Z.Y COMMERCIAL ENTERPRISES', NULL, N'954', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41793, N'UNITED AUTO CENTRE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41794, N'AMRELIYA AGENCY', NULL, N'943', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41795, N'AVANCEON LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41796, N'SHAHBAZ GARMENTS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41797, N'CHEMI EQUIP SOLUTION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41798, N'FLOOR HOUSE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41799, N'AU TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41800, N'SETHI COMMERCIAL AGENCIES', NULL, N'304', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41801, N'SHAFAAT HUSSAIN KHAN & CO', NULL, N'4930', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41802, N'HOP INTERNATIONAL OFFIC', NULL, N'3223', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41803, N'OCEAN AIR LOGISTIC SERVICE', NULL, N'2377', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41804, N'R T NTERPRISES', NULL, N'1862', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41805, N'SIDRA INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41806, N'M.A HADI TRADE LINKERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41807, N'RESQ COMMUNICATIONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41808, N'CHALO CINEMA', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41809, N'GLOBE COSMETICSS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41810, N'SHAMIM & COMPANY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41811, N'NATIONAL LOGISTICS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41812, N'HUSSAIN ENTERPRISES', NULL, N'3227', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41813, N'THE HLPERS', NULL, N'2737', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41814, N'HUSSAIN TRADERS', NULL, N'1890', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41815, N'FRIESLAND AND CAMPINA ENGRO PAKISTAN LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41816, N'GREENWAYS AGENCIES', NULL, N'2400', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41817, N'MILLAT TRACTORS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41818, N'ISHRAN ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41819, N'I ABANGLORIA', NULL, N'2752', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41820, N'GHUGEE INTERNATIONAL', NULL, N'1179', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41821, N'PAKISTAN LIGHTING LD PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41822, N'FARSI GLOBAL SHIPPER', NULL, N'3128', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41823, N'MOHAMMAD AMIN MOHAMMAD MUQEEM', NULL, N'599', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41824, N'AGRI LIFE SCIENCES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41825, N'CLASSIC SHIPPERS OFFICE', NULL, N'2638', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41826, N'TEKNO STAR COMPANYROOM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41827, N'SPEEDWAYS INTERNATIONAL SHIPPING AGENCY', NULL, N'560', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41828, N'FLOOR ALTAF HUSSAIN', NULL, N'591', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41829, N'PAKISTAN FUTURE PRODUCTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41830, N'MAXIPLE INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41831, N'ARWA INTERNATIONAL', NULL, N'2622', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41832, N'SURGICAL WORLD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41833, N'PAKISTAN INTERNATIONAL SERVICES', NULL, N'970', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41834, N'S.G.S TRADERS', NULL, N'2288', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41835, N'ELECTROPOLYMERS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41837, N'A.H INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41838, N'MR.MUHAMMAD EHSAN SHEIKH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41839, N'AKZO NOBEL PAKISTAN LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41840, N'NEW HORIZON COMPUTER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41841, N'MR.HAKEEM KHAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41842, N'ESSANI BROTHERS', NULL, N'2020', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41843, N'MR.ABDUL BARI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41844, N'MR.QAZI MUSSAVIR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41845, N'IMTIAZ PROVISION STORE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41846, N'SONA INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41847, N'FRIESLAND CAMPINA ENGRO PAKISTAN LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41848, N'MR KHAN BAHADUR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41849, N'SHERAZI TRADING AGENCY', NULL, N'856', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41850, N'MR. BAKHT RAWAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41851, N'MR. MUSTAFA ABBAS KAPASI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41852, N'MR. MUHAMMAD MOIZ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41853, N'MR. ABDUL GHANI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41854, N'SUN AUTOMOBILE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41856, N'SHIRAZ WALI ENTERPRISES', NULL, N'2884', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41857, N'MR. SHAHZAIB GUL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41858, N'SM SHAHID & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41859, N'IRFAN CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41860, N'MOON LIGHT AUTOS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41861, N'AL-AKHYAR TRADERS', NULL, N'2581', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41862, N'INDUS AGENCIES', NULL, N'2255', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41863, N'PICK N SAVE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41864, N'MR QAZI MUSAWER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41865, N'HIKMAT TRADING & COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41866, N'ONE TEN PRODUCTION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41867, N'SAMAD TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41868, N'MR RANGEEN KHAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41869, N'SHAHJHAN BROTHERS', NULL, N'1663', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41870, N'ALTAF AUTO STORE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41871, N'AHMAR MUNEED AGENCIES', NULL, N'1949', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41872, N'KITT ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41873, N'TAUHEED ENTERPRISES', NULL, N'916', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41874, N'SHAHEEN USMAN & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41875, N'BEST CLOTHING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41876, N'THE PROTCEORS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41877, N'MR USMAN EHSAN CHEEMA', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41878, N'F.T CORPORATION', NULL, N'2790', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41879, N'MULTI TASK ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41880, N'RASHEED & CO', NULL, N'2326', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41881, N'ZODIAC SPECIALTY PRODUCTSSTREET', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41882, N'SM ENTRPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41883, N'NAEEM ENTERPRISES', NULL, N'3111', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41884, N'GETZ PHARMA PVT LTD ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41885, N'AL WASEED COPRORATION', NULL, N'1489', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41886, N'AL MUSLIM CARGO', NULL, N'3235', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41887, N'DERMA TECHNO PAKISTAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41888, N'SUN SHINE LOGISTICS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41889, N'ASHRAF ENTERPRISES', NULL, N'1381', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41890, N'ZAIN INTERNATIONAL', NULL, N'2601', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41891, N'COCA COLA BEVERAGES PAK LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41892, N'SHALIMAR IMPEX', NULL, N'1913', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41893, N'ACCURATE  LOGISTICS', NULL, N'1386', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41894, N'OFFICE AUTOMATION GROUP', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41895, N'ORIENTAL & OVERSEAS SERVICES', NULL, N'75', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41896, N'IMRAN TRADING CO', NULL, N'2088', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41897, N'SAJJAD & COMPANY LOGISTICS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41898, N'SHAMSI TRADING CORPORATION', NULL, N'812', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41899, N'M. AHSAN', NULL, N'437', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41900, N'ELECTROMED CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41901, N'MAGNA TEXTILE INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41902, N'DOST MUHAMMAD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41903, N'ACME TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41904, N'BRIGHT VISION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41905, N'ASIF ASSOCIATES PVT LTD', NULL, N'1391', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41906, N'GREAT EASTERN CO', NULL, N'810', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41907, N'ASTRON TECH DISTRIBUTION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41908, N'MR. NAUMAN IFTIKHAR KHAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41909, N'PROMRT LOGISYICS SUIT', NULL, N'2602', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41910, N'MR. FIDA KHAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41911, N'LEMANS INTERNATIONAL', NULL, N'2963', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41912, N'RAYYANCO BUSINESS SYSTEMS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41913, N'SUZAN INTERNATIONAL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41914, N'HINA ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41915, N'PAK DREAMS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41916, N'ORBIT DIAGNOSTICS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41917, N'GR INTERNATIONAL TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41918, N'SELMORE PHARMACEUTICALS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41919, N'BILAL NADEEM ENTERPRISES', NULL, N'2733', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41920, N'SHAHID BROTHR', NULL, N'2037', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41921, N'NAVEED ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41922, N'UNITED CLEARING & FORWARDING AGENIES', NULL, N'219', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41923, N'NINE STAR INTERNATIONAL', NULL, N'2177', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41924, N'AMIR BEARING CENTRE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41925, N'KABIR & COMPANY', NULL, N'564', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41926, N'HAMZA TRADERS', NULL, N'1671', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41927, N'M. AMEEN ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41928, N'AL MUJADAD CORPORATION', NULL, N'182', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41929, N'PULSE PHARMACEUTICALS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41930, N'BARAI INTERNATIONAL', NULL, N'1914', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41931, N'1 TEN ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41932, N'R.S. TRADING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41933, N'THE BEAUTY CURATORS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41934, N'W.W.BUSINESS ASSOCIATES', NULL, N'1252', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41935, N'TRADERS INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41936, N'SHEIKH INAM ELAHI & COBISMILLAH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41937, N'UNION SHINE INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41938, N'SAJAWAL INTERNATIONAL', NULL, N'2782', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41939, N'UNITED KING AGENNCIES', NULL, N'3155', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41940, N'SHAHEEN COSMETICS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41941, N'NADEEM & COMPANY', NULL, N'1041', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41942, N'GINZA COPORATION CUSTOMES CLEARING', NULL, N'3229', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41943, N'S. D. ENTERPRIESES', NULL, N'2642', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41944, N'MEDI SERVE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41945, N'GLAXY CARGO LOGISTICS', NULL, N'2648', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41946, N'DYNAMIC TECHNOLOGY SUPPLIERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41947, N'KHALIFA BROTHERS', NULL, N'1117', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41948, N'NATION TRADE INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41949, N'RAWAL INDUSTRIES EUIPMNT', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41951, N'TECHNICA PAK', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41952, N'MEDIATE PHARMACEUTICAL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41953, N'TECHNO TRADE INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41954, N'AL-RABI INTERNATIONAL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41955, N'IRS ASSOCIATES', NULL, N'3262', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41956, N'CIBA PHAMACUTICALS (PVT)LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41957, N'TRANSPACK PACKING AND FREIGHT FORWARDING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41958, N'MR MUZAMMIL SHAH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41959, N'LAHORE TADING CO.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41960, N'BUSSINESS LOGISTICS', NULL, N'3269', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41961, N'LIGHT TRADERS HOUSE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41962, N'J.J TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41963, N'PUNJAB SPRING & ENGG WORKS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41964, N'F.O ENTERPRISES', NULL, N'1578', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41965, N'GLOBAL GUM INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41966, N'M/S SILVER STAR ENTERPRISES', NULL, N'1478', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41967, N'SABOOR BEARING SHOP', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41968, N'WORLDWIDE CARGO CARE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41969, N'HYDER ALI & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41970, N'VISION MART INTERNATIONAL TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41971, N'MR.ZEESHAN AHMED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41972, N'AMEEJEE VALEEJEE  & SONS PVT LTD', NULL, N'175', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41973, N'HMA PUMPS (PVT)LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41975, N'KISSAN ENGINEERING TOKHAR NIAZ BAIG', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41976, N'AL WASEED CORPORATION', NULL, N'1489', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41978, N'SAFFRON ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41979, N'RAFFISONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41980, N'YAHOO COMPUTER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41981, N'CHAWALA ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41982, N'EPS PACKAGES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41983, N'S.S. COMMERCIAL CORPORATION SHOW', NULL, N'702', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41984, N'A.B ENTERPRISE ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41985, N'EXCELSIOR AGENCIES', NULL, N'254', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41986, N'IKFFA SMC PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41988, N'NAJAM ENTERPRISES', NULL, N'3108', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41990, N'GARIBSONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41992, N'MULTICARE INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41993, N'HAMMAD & BROTHERS AGENCY', NULL, N'2695', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41994, N'JAMEEL TRADERS', NULL, N'3200', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41995, N'A.J.CORPORATION', NULL, N'899', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41996, N'SAMAD RUBBER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41997, N'LOHAWALA  AGENCIES', NULL, N'516', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41998, N'FRIENDS INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (41999, N'GULF MINERAL FZE PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42000, N'FASIN INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42001, N'AWAN SOLUTIONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42002, N'GALAXY CARGO LOGISTICS', NULL, N'2645', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42003, N'KAMRAN BROTHERS', NULL, N'1315', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42004, N'SULEMAN AUTO SUPPLY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42005, N'SIGMA SHOES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42006, N'SEAGATE INTERNATIONAL', NULL, N'321', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42007, N'PAKISTAN PHARMACEUTICAL IMPORTERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42008, N'FINE TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42009, N'NAQI SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42010, N'FAISAL SEAWAYS SERVICES', NULL, N'1100', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42011, N'ARDUOUS ENTERPRISES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42012, N'SAM INTERNATIONAL', NULL, N'3267', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42013, N'M.A.K TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42014, N'EMINENT TRADING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42015, N'CRESCENT AUTO CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42016, N'S.K ENTERPRISES', NULL, N'1750', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42017, N'FAZAL INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42018, N'ZAHEER AND BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42019, N'WAH NOBEL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42021, N'KENHAR ENTERPRIES SUIT', NULL, N'2517', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42022, N'KOLACH INTERNATIONAL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42023, N'REDCO INTERNATIONAL', NULL, N'2597', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42024, N'FATTANI TXTIL INDUSTRIS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42025, N'INTERNATIONAL CINSUMER PRODUCTS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42026, N'BURHANI TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42027, N'TRS CHEM PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42028, N'NOMAN CORPORATION', NULL, N'3160', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42029, N'SWAT PHARMACEUTICAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42030, N'SYED MANUFACTURING INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42031, N'JANI SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42032, N'NEW MUJAHID ALCON INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42033, N'UTRADE LOGISTICS PVT LTD', NULL, N'2929', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42034, N'EVERSHINE INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42035, N'META TECH VISION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42036, N'RAWADAS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42037, N'KHAWAJA TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42038, N'BANBHORE REFRACTORIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42039, N'WE INTERNATIONAL', NULL, N'3140', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42040, N'HUB STAR FOAM PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42041, N'GREEN LUBE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42042, N'SAFETY PACKERS & FOWARDERS', NULL, N'406', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42043, N'MODERN MOTORS (PVT)LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42044, N'FAST TRACK & ASSOCIATES', NULL, N'2635', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42045, N'PAKISTAN INTERNATIONAL AIRLINES CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42046, N'MR. SAJID MEHMOOD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42047, N'MR ISRAR UL HAQ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42048, N'MR. JIBRAN KHAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42049, N'MR KHUWAJA MOHAMMAD ADNAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42050, N'MR HASSAN ANWAR KHAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42051, N'UNICO PAINT INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42052, N'MURREE BREWERY COMPANY LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42053, N'SIMAMM INTERNATIONAL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42054, N'MICROTECH INC', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42055, N'M.A TECH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42056, N'ABUL HASAN CHOKSHI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42057, N'FINE ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42058, N'NJ & SONSFLAT', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42059, N'HI TECH INKS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42060, N'MR MUHAMMAD RIZWAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42061, N'MR.GHULAM MUHAMMAD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42062, N'COMMODITY SRVICE AGENCY', NULL, N'352', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42063, N'HANIF BROTHERS SUITES', NULL, N'301', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42064, N'MR.IBRAHIM HINGORA', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42065, N'EXCEL CORPOARATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42066, N'MR.MUHAMMAD DANISH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42067, N'MR.BILAL SHAH', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42068, N'KHYBER EXPORTS', NULL, N'2904', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42069, N'AL MOHSIN INTEFRNATIONAL', NULL, N'1665', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42070, N'NANO ENERGY INKS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42071, N'CK INTERNATIONAL', NULL, N'2871', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42072, N'MR.SHAHZAIB GUL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42073, N'PACK N MOVE', NULL, N'2340', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42074, N'AMS ENTERPRISES', NULL, N'2986', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42075, N'SANA RAHIM PVT LTD', NULL, N'344', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42076, N'CUSTOMS ASSOCIATES PVT LTD', NULL, N'1520', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42077, N'N.F.Y TRADERS', NULL, N'2959', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42078, N'A R W ENTERPRISES', NULL, N'2032', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42079, N'LAHORE TRADING INTERNATINAL', NULL, N'3263', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42080, N'REHMAN TRADING CO.', NULL, N'3044', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42081, N'DRASTIC EMPORIAM MUGHAL', NULL, N'2063', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42082, N'MR.ZAHID AYUBJADOON', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42083, N'N K ENGINEERING WORKS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42084, N'BRITLITE ENGINEERING PRODUCTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42085, N'RIZVI &  COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42086, N'BATLA ENTERPRISES', NULL, N'1592', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42087, N'BAHRI ENTERPRISES', NULL, N'432', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42088, N'HAJI FAROOQ AGENCIES', NULL, N'2560', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42089, N'JAMSHED AGENCIES', NULL, N'3255', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42090, N'MR.ISRAR UL HAQ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42091, N'HAJI JUNAID AGENCIES', NULL, N'1708', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42092, N'F G ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42093, N'KING PAKISTAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42094, N'MIR TRADING CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42095, N'P.S TEXTILE CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42096, N'RABIA ASSOCCIAATES', NULL, N'1542', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42097, N'HAMIDA TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42098, N'ZAHID MASUD & COMPANY PVT LTD', NULL, N'794', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42099, N'ICON STAR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42100, N'PROLIGHT & SOUND ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42101, N'YASEEN PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42102, N'JUNAID KARIM ENTERPRISES', NULL, N'2362', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42103, N'AVANT PHARMACEUTICALS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42104, N'BROTHER', NULL, N'2822', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42105, N'PAKISTAN CHAIN CENTER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42106, N'DILIGENT ENERGY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42107, N'SIARA TEXTILE MILLS (PVT)LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42108, N'MIAN NAZIR SONS INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42109, N'MR.HARIS MANSOOB', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42110, N'HABIB RICE PRODUCTS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42111, N'UCH POWER PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42112, N'WALJI ENTERPRISES', NULL, N'1283', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42115, N'DAIRY SOLUTION PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42116, N'YARAFI ENTERPRISES BUSINESS', NULL, N'1917', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42118, N'AL-ABBAS FABRICSPVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42119, N'B AND A ENTERPRISES', NULL, N'2220', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42120, N'HORIZONE INTERNATIONAL', NULL, N'3281', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42121, N'NEW GULF CARGO', NULL, N'3249', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42122, N'MAXPOWER MOTOR SPORTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42123, N'MR.MUHAMMAD SAGHIR AHMAD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42124, N'H,A HAQ SPINNING MILLS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42125, N'CHEM WINGS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42126, N'RUPAFIL LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42127, N'AMCORP-GASCO JOINT VENTURE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42128, N'GLOBAL PACKERS & MOVERS PVT LTD', NULL, N'617', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42129, N'ATA BAKERY SOLUTION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42130, N'ALLIED LINK ENTERPRISES', NULL, N'1781', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42131, N'JAWAD AND COMPANY', NULL, N'1962', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42132, N'VPL LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42133, N'PROTECTAIL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42134, N'YOUNG AGENCIES', NULL, N'2157', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42135, N'ZAFAR ENTERPRISES', NULL, N'3265', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42136, N'A QAYYUM & SONS', NULL, N'1036', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42137, N'ZAHID MASOOD & COMPANY PVT LTD', NULL, N'794', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42139, N'FAIR LINE SHIPPING AGENCY', NULL, N'1560', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42140, N'BAT-HA TRADING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42141, N'SM ENTERPRISES', NULL, N'5950', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42142, N'AL-KASIB', NULL, N'732', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42143, N'NAUSHAD ENTERPRISES', NULL, N'1798', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42144, N'ECC-INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42145, N'A.K IMPEX', NULL, N'3208', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42146, N'MODERN SERVICE', NULL, N'2892', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42147, N'PARAGON MARKETINGROOM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42148, N'ASGHAR ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42149, N'UNIVERSAL TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42150, N'BASIC INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42151, N'SULEMAN SONS', NULL, N'2236', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42152, N'S.F ENTERPRISES', NULL, N'966', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42153, N'WINGS CHAIR PAKISTAN PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42154, N'CREATIVE SOLUTIONSA', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42155, N'RISSING IMPEX', NULL, N'704', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42156, N'KAMRAN SHAFIQUE ENTERPRISE', NULL, N'1196', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42157, N'TOOCHI TRANSPORT PVT LTD', NULL, N'2213', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42158, N'RANCHA AGRI BUSINESS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42160, N'Z.A. LOGISTICS', NULL, N'2833', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42161, N'METALEXSUITE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42162, N'OCEAN LINK SHPPING', NULL, N'2320', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42163, N'TUFAIL ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42164, N'DOST TRADING ASSOCIATES', NULL, N'2849', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42165, N'MEP SOLUTIONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42166, N'AKHTAR ENTERPRISES', NULL, N'1686', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42167, N'MR. MAAZ SHAMIM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42168, N'ATC HOPES INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42169, N'AZAM ENTERPRISES', NULL, N'1558', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42170, N'ESMAILJEE MOHAMMAD ALI SONS', NULL, N'181', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42171, N'AL AKHYAR TRADERS', NULL, N'2581', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42172, N'AQR TRADER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42173, N'Q.F CORPORATION', NULL, N'385', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42174, N'UNITED AUTO CENTREMURAD KHAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42175, N'PRIME CARGO INTERNATIONAL', NULL, N'3157', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42176, N'S.I REHMAN AND SONS', NULL, N'1747', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42177, N'A.E INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42178, N'FASHION & TRENDS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42179, N'PLASTO MOULDS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42180, N'SUN AUTOMOBILES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42181, N'NAZIR AGENCIES', NULL, N'328', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42182, N'WORLD LINKER', NULL, N'724', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42183, N'ZAIB INTERNATIONAL', NULL, N'3271', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42184, N'HALMORE POWER GENERATION COMPANY LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42185, N'SARAS INTERNATIONAL', NULL, N'2428', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42186, N'EXCEL INTERNATONAL CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42187, N'C.N.P.S ASSOCIATES PVT LIMITED', NULL, N'695', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42188, N'FARWA IMOEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42189, N'GAP GLOBAL AUTOMOTIVE PARTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42190, N'CENTRE PHOTO SERVICE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42192, N'BEST FAREIENDS CARGO SERVICES', NULL, N'2824', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42193, N'U.F. ENTERPRISES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42194, N'COTPAK INTERNATIONAL', NULL, N'1102', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42195, N'TRANSWORLD SHIPPING', NULL, N'2598', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42196, N'JEBCON SERVICES', NULL, N'1797', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42197, N'TIME & TUNE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42198, N'LIAQUAT TRADERS', NULL, N'1701', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42199, N'MB & COMPANY (PVT)LTD.', NULL, N'2872', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42200, N'SEA GUIDE AGENCIES PVT LTD', NULL, N'1087', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42201, N'SHAHID  & CO SELF', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42204, N'RABI ENTERPRISES', NULL, N'1835', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42205, N'NINE ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42206, N'GHELI INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42208, N'GLOBAL ENTERPRISES', NULL, N'2234', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42209, N'I.A BANGLORIA', NULL, N'2752', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42210, N'ORBIT INTERNATIONAL', NULL, N'1865', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42211, N'FOCUS SHIPPING AGENCIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42212, N'SADAQAT AND BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42213, N'SARSON', NULL, N'799', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42214, N'IBRAHIM AUTO IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42215, N'A HAKEEM AND SONS', NULL, N'228', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42216, N'WORLD WIDE TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42217, N'SILVER STAR ENTERPRISES', NULL, N'1478', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42218, N'SECURITY PACKERS', NULL, N'1082', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42219, N'INSTECH CONTROL & AUTOMATION ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42221, N'CHEM ZONE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42222, N'BUTT CARGO ENTERPRISES', NULL, N'514', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42223, N'WAQAR ENTERPRISES', NULL, N'1537', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42224, N'MOIN IMPEX', NULL, N'311', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42225, N'UNIVERSAL C&F AGENCIES PVT LTD', NULL, N'2271', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42226, N'FB TEXTIL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42227, N'DISTRICT CONTROLLER OF STORES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42228, N'TRADE FORTUNE ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42229, N'FLUID TECHNOLOGY INTERNATIONAL PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42230, N'J S SHIPPING AGENCY', NULL, N'2652', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42231, N'FRDAAN ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42232, N'BURHANI AGENCIES', NULL, N'71', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42233, N'GATEWAY EXPRESS TRANSPORT', NULL, N'2896', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42234, N'UNITED HEALTH CARE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42235, N'BIG BOSS INTERRATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42236, N'S.S. DE MOVERS', NULL, N'3123', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42237, N'AL-KARAM TEXTILE MILLS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42238, N'ENIGYS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42240, N'ALLIED COMPUTER SERVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42241, N'LEVANT EXPRESS', NULL, N'720', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42242, N'KNIGHT ENGINEERING WORKS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42243, N'AL-ABBAS FABRICS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42244, N'FARURUKH JAVED BROTHERS', NULL, N'2513', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42245, N'RIAZ UL HAQ LOGISTICS PVT LTD', NULL, N'3253', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42246, N'RAJOURVI CORPORATION', NULL, N'690', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42247, N'A R TRADING LINKS', NULL, N'3259', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42248, N'PARAGON MARKETING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42249, N'WOOD EMOTION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42250, N'AL QUDDUS AGENCY', NULL, N'991', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42251, N'MEER BROTHERS INTERNATIONAL', NULL, N'2888', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42252, N'ZHONG PAK FACILITATORS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42253, N'MR. TARIQ HAFEEZ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42254, N'A & S ENTERPRISES', NULL, N'2365', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42255, N'AL REHMAN LOGISTICS', NULL, N'2607', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42256, N'BUTT FOOTWEAR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42257, N'CEI SUPPLY PVT LTD', NULL, N'3168', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42258, N'ASKARI CEMENT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42259, N'WAQAS ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42260, N'WILAYAT & COMPANY', NULL, N'1703', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42261, N'HIGH TECH AUTOS TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42262, N'RAWAL ENTERPRISES', NULL, N'3279', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42263, N'ZA TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42264, N'ZAINAB AUTOMOBILES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42265, N'EDM TECHNOLOG', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42266, N'THE HOSE OF TRADE', NULL, N'276', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42267, N'VISION TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42268, N'IMAMS', NULL, N'595', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42269, N'AMFAH INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42270, N'AL BASHAR IMPEX', NULL, N'2658', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42271, N'B.H TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42272, N'RIZ TECHNOLOGY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42273, N'B A TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42274, N'GLOBAL LINKERS', NULL, N'2031', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42275, N'F.M ENTERPRISES', NULL, N'1207', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42276, N'MEHRAN DENTAL SUPPLIERSM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42277, N'NTC LOGISTICS PAKISTAN', NULL, N'2310', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42278, N'CRUSE ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42279, N'SHAHZAD TRADEER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42280, N'G.M & COMPANY', NULL, N'3193', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42281, N'A.A COTTON MILLS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42282, N'SHACHO ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42283, N'PLATINUM INDUSTRIES PVT LTD ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42284, N'DILSHAD & SONS', NULL, N'3284', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42285, N'AHN SYNTHETIC PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42286, N'M.J TEXTILE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42287, N'S.A.S. AGENCIES', NULL, N'997', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42288, N'MR.MAZHAR IQBAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42289, N'AL-TAHIR CORPORATION ', NULL, N'2013', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42290, N'AYESHA ENTERPRISES', NULL, N'2789', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42291, N'SHAZIA ENTERPRISES', NULL, N'2368', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42292, N'ABDULLAH & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42293, N'REHMAN TOOL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42294, N'SY OFFICE AUTOMATION PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42295, N'PERVAIZUMAR ENTERPRISE', NULL, N'26', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42296, N'MR. SHEIKH NAJAM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42297, N'SCIENTIFIC LABORATORY SUPPLIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42298, N'HAROON & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42299, N'BURRAQ ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42300, N'MR. AHMAD HASSAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42301, N'TARIQ HAFEEZ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42302, N'SCIEN TEC', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42303, N'CHARAG DIN & CO', NULL, N'3097', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42304, N'SHAH EPOXY SERVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42305, N'QUAPER PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42306, N'IMPERIAL AROMATICS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42307, N'INTERMODA BRANDS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42308, N'KARACHI SHIPYARD & ENGINEERING WORKS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42309, N'IQRA ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42310, N'CARGO SHIPPERS INTERNATIONAL', NULL, N'1493', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42311, N'RELIANCE TRADING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42312, N'A. J TRADING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42313, N'PAKLAND TRADING CORPORATION', NULL, N'1507', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42314, N'MAGNA PROCESSING INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42315, N'MASTER TEXTILE MILLS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42316, N'XCESS LOGISTICS', NULL, N'3215', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42317, N'WORLD BEST INTERIOR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42318, N'MR. SHAUKAT PARVEEN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42319, N'KINGS INTERNATIONAL FORWARDING AGENCY', NULL, N'932', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42320, N'KOLDKRAFT REFRIGERATION PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42321, N'INTERIORS HUB', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42322, N'MERLINSFIRST', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42323, N'AZIZ-UD-DIN & SONS', NULL, N'414', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42324, N'MARIUM CARGO SERVICS', NULL, N'1864', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42325, N'A.K ZAHID MAIN CHAMBER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42326, N'R- TRANS', NULL, N'3095', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42328, N'TRANSPACK', NULL, N'163', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42329, N'AHMAR MUNEEB AGENCIES', NULL, N'1949', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42330, N'3A-SONS CARO LOGISTICS', NULL, N'2785', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42331, N'MD ARF', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42332, N'A SHAKOOR AND BROTHERS', NULL, N'839', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42333, N'RATED LOGISTICS', NULL, N'3293', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42334, N'OCEAN FREIGHT SERVICE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42335, N'QURAISH ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42336, N'JEWA ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42337, N'PENTAGON TRADE LINKERS', NULL, N'1779', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42338, N'SOHAIL ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42339, N'SHOAIB IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42340, N'SALMAN ENTERPRISES', NULL, N'3277', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42341, N'EMBARKATION HQ AIR FORCE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42342, N'EJAZ & CO', NULL, N'2411', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42343, N'SHAMOON ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42344, N'FAST MOVERS', NULL, N'3268', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42345, N'ZEESHAN FOOTWEAR PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42346, N'SLO P721 DETT FAISAL KARACHI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42347, N'FARAAN AGENCIES', NULL, N'1051', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42348, N'FAAZ ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42349, N'AL-KARAM TEXTILE MILLS (PRIVATE) LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42351, N'THE NEW BEARING CENTRE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42352, N'YARARI ENTERPRISES', NULL, N'1719', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42353, N'CASCADE ENTERPRISES', NULL, N'3042', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42355, N'GREEN TOP PHARMA', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42356, N'INNOVATIVE ENGINEERING & INDUSTRIAL SERVICE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42357, N'ELITE INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42358, N'PACMOVE LOGISTICS INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42359, N'ERCON INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42360, N'A H TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42361, N'WARSI & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42362, N'THAL BOSHOKU PAKISTAN PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42363, N'EXPRESS PUBLICATIONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42364, N'PAK INTERNATIONAL FALAK NAZ', NULL, N'2755', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42365, N'ZAHID ENTRPRISES', NULL, N'2967', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42366, N'SIDDIQUI ENTERPRISES', NULL, N'1385', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42367, N'MAHAFIZ TRADING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42368, N'UTOPIA SOURCING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42369, N'FAIR ENTERPRISES', NULL, N'249', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42370, N'MEDSMITH INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42372, N'ZIA CUSTOM AGENCY', NULL, N'1980', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42373, N'GREEN RIVER ENTERPRISES', NULL, N'3131', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42374, N'ALLIACE LOGISTICS', NULL, N'3148', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42375, N'SHAHID INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42376, N'ALI PRINTPACK PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42377, N'HAMMAD INTERNATIONAL', NULL, N'2952', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42378, N'WISE PHARMACEUTICALS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42379, N'EFFICIENT MARKETERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42380, N'BASATHIA IMPEX', NULL, N'786', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42381, N'MOVE IT CARGO INTERNATIONAL', NULL, N'3114', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42382, N'NUSRAT ENTERPRISES', NULL, N'1304', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42383, N'KHALID & KHALID HOLDINGS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42384, N'GALAXY INTERNATIONAL', NULL, N'766', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42385, N'BANI IMPEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42386, N'AMCO EXPRESS CARGO SYSTEMS', NULL, N'2701', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42387, N'F.K. BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42388, N'S R TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42389, N'GLOBAL TRADING AGENCY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42390, N'CNA INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42391, N'KBRO ENGINEERING (SMC-PVT) LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42392, N'UCH POWER (PVT)LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42393, N'MONTINA TRADING CORPORATION', NULL, N'835', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42394, N'INTERNATIONAL FRAGRANCE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42395, N'AL-GHANI TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42396, N'HUMERA INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42397, N'S.A ENTERPRISES', NULL, N'914', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42398, N'HASSAN CARGO SERVICES', NULL, N'2468', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42399, N'AAL-E-IMRAN INTERNATIONAL', NULL, N'2325', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42400, N'TRANS ATLANTIC MACHINERY CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42401, N'HAMZA BEARING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42402, N'KINGS INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42403, N'BIN SADIQ INTERNATIONAL', NULL, N'2569', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42404, N'IZAN INTERNATIONAL', NULL, N'2173', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42405, N'THE ELECTRIC CONCERN CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42406, N'YASIR ENTERPRIESES', NULL, N'1122', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42407, N'MUBEEN ELECTRIC CONCERN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42408, N'UNIVERSAL DRILLING & SUBMERSIBLE PUMPSPLOT', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42409, N'ZARSHER KHAN AND CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42410, N'PAK OCEAN', NULL, N'1032', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42411, N'MUHIB INTERNATIONAL', NULL, N'3222', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42412, N'CHAUDHRY WORLD TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42413, N'MR. MUHAMMAD GHUFRAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42414, N'KARAM TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42415, N'WAZEER ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42416, N'GOLDSHEFF NUTRACEUTICALS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42417, N'AXIS PHARMACEUTICAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42418, N'ANAS ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42419, N'MEKAAIL SHIPPING PVT LTD', NULL, N'2391', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42420, N'EASTERN TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42421, N'ROOMI ENTERPRISES', NULL, N'3254', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42422, N'ASHHAD IMPEX', NULL, N'2583', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42424, N'PAK TRADER', NULL, N'2848', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42425, N'AL-KARAM TEXTILE MILLS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42426, N'S.A KNITWEAR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42427, N'JUBILEE ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42428, N'FASIN INTERRNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42429, N'UMER ENGINEERING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42430, N'FIELDWAY TWCHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42431, N'B&R ENTERPRISES', NULL, N'3285', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42432, N'S.K TRADERS', NULL, N'2449', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42434, N'MR. IMRAN SHEHZAD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42436, N'AL- SHARQI REAL LOGISTICS PVT LTD', NULL, N'2854', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42437, N'MR. AYAZ BAAKZA', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42438, N'MR. MUHAMMAD SHAFIQ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42440, N'SHAH CUSTOM CLEARING AGENCY', NULL, N'3194', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42442, N'A.I ENTERPRISES', NULL, N'1908', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42443, N'MR. SHAFQUAT ALI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42444, N'U.M ENTERPRISES', NULL, N'1214', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42445, N'CONTRA SERVICES', NULL, N'3189', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42446, N'ANGELA CAFFE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42447, N'MR SYED AMIR ALI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42448, N'BUTT INSTRUMENTS CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42449, N'MR.AMJAD ALI', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42450, N'DIYAN TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42451, N'MR. ANAS AHMED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42452, N'KASHMIR BEARING STORE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42454, N'AL MASOOD PARTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42455, N'MOHAMMAD ENTERPRISES', NULL, N'342', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42456, N'AD CITY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42457, N'LURELLA COSMETICS PAKISTAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42458, N'INTERNATIONAL TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42459, N'VILLAGE BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42460, N'CLASSIC INTERNATIONAL', NULL, N'1420', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42461, N'A R TRADING', NULL, N'3259', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42462, N'MASTER POWER (PRIVATE) LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42463, N'ZEY SQUARE & CO (PVT) LTD.', NULL, N'965', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42464, N'MUSHTAQ ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42465, N'S.J ENTERPRISES', NULL, N'797', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42466, N'SUPER TECH AUTOPARTS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42467, N'PAFARS COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42468, N'MR. FAZAL ABBAS JACKWALA', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42469, N'WAHID ASSOCIATES', NULL, N'1460', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42470, N'MIC MAC', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42471, N'FBK TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42472, N'A.S.K ENTERPRISES', NULL, N'1490', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42473, N'AL GHANI', NULL, N'2672', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42474, N'Total CASH :', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42475, N'AL MADINA ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42476, N'A. R. INTERNATIONAL', NULL, N'2447', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42477, N'M/S A.R INTERNATIONAL', NULL, N'2447', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42478, N'M/S OCEAN SERVICES COMPANY', NULL, N'2776', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42479, N'J.Y ENTERPRISES', NULL, N'805', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42480, N'A.R INTERNATIONAL', NULL, N'2447', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42481, N'PERVAIZUMER ENTERPRISE', NULL, N'26', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42482, N'POWER CONTROL SOLUTIONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42483, N'NRA TRADERS', NULL, N'2600', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42484, N'AEROTRADIA INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42485, N'D.K ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42486, N'SAPPHIRE TEXTILE MILLS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42487, N'ARTISTIC FABRIC', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42488, N'IDEAL AUTONETICS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42489, N'PACIFIC PHARMACEUTICALS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42490, N'SASPAK CARGO', NULL, N'1549', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42491, N'TETRA PAK LIMTED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42494, N'MUSSARRAT HUSSAIN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42495, N'LUCKY ONE (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42496, N'FATIMA TRADING CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42497, N'SANPAK ENGINEERING INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42498, N'LAHORE FASHIONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42499, N'NAWAN TRADING CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42500, N'N.T.A ENTERPRISES', NULL, N'1752', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42501, N'DIAMOND ENTERPRISES', NULL, N'3139', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42502, N'MUHAMMAD AMIN MUHAMMAD MOQEEM', NULL, N'599', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42503, N'RAWAHA INTERNATIONAL PVT LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42504, N'F.REHMAN & CO', NULL, N'106', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42505, N'LUCKY CEMENT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42506, N'GHANDHARA NISSAN LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42507, N'PROCTER & GAMBLE PAKISTAN PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42508, N'T.G BROTHERS', NULL, N'870', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42509, N'PINE MATCH PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42510, N'B.A. TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42511, N'UNIK PRODUCTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42512, N'COMET SPORTS (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42513, N'FAST CABLES LIMITED', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42514, N'SIX AS TRADING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42515, N'BLUE HORIZON PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42516, N'SUPER NOVA SPORTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42517, N'BERGER PAINTS PAKISTAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42518, N'INTERNATIONAL AIR CARGO SERVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42519, N'HAFIZ DYES & CHEMICAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42520, N'RELIANCE COTTON SPINNING MILLS LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42521, N'ARROWS MARKETING SERVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42522, N'KALEEM IMPEX', NULL, N'2812', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42523, N'AL-MOQASS CARGO SERVICES', NULL, N'512', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42524, N'TAUFIQ IMPEX', NULL, N'1004', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42525, N'RAJWANI DENIM MILLS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42526, N'ROYAL LEATHER INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42527, N'ISLAND TEXTILE MILLS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42528, N'GASOLINE TECHMEZZANINE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42529, N'RELIANCE INTERNATIONAL', NULL, N'1239', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42530, N'DASTAGIR & SONS', NULL, N'696', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42531, N'MINI STAR INTERNATIONAL', NULL, N'2177', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42532, N'PAKGEN POWER LIMITED', NULL, N'53', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42533, N'MUAAZ ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42534, N'RANA ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42535, N'N.J. HANIF & SONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42536, N'BHOLA BROTHERS', NULL, N'777', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42537, N'A K SHIPPERS', NULL, N'828', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42538, N'SELF', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42539, N'M/S RYAN AGENCIES PVT LTD', NULL, N'672', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42540, N'AAD ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42542, N'CROSS BORDER SOLUTION', NULL, N'3161', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42543, N'CARGO TRADING SYSTEM', NULL, N'1902', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42544, N'UNION FABRICS (PVT)LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42545, N'Z.U.A INTERNATIONAL', NULL, N'769', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42546, N'AK MARKETING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42547, N'THE PAK TRADERS', NULL, N'1889', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42548, N'ZA ENGINEERING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42549, N'PGT SHIPPING SERVICES PVT LTD', NULL, N'597', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42550, N'AMFCO INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42551, N'GLOBAL EXPORTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42552, N'PREMIER PAINT PALACE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42553, N'SALEEM SONS', NULL, N'1826', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42554, N'GHAZI BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42555, N'MOBIL POWER SOLUTIONS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42556, N'MINHAL ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42557, N'SUBLIM ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42558, N'A.A. INTERNATIONAL', NULL, N'2301', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42559, N'LOGISTICS WORLD', NULL, N'2630', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42560, N'ABBASI ENTERPRISES', NULL, N'1910', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42562, N'SMART EWAR', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42563, N'FAKHRI BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42564, N'AL MADINA LOGISTICS', NULL, N'2486', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42565, N'NAZIR & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42566, N'MITSUBOSHI AUTO PARTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42567, N'ASSOCIATION FOR ACADEMIC QUALITY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42568, N'TALHA ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42569, N'NASIR TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42570, N'AUTOMOTIVE SOLUTIONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42571, N'SPECIALIST SHIPPING SERVICES', NULL, N'802', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42573, N'AIA TRADERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42574, N'ACT INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42575, N'MUSTAQIM DYING & PRINTING INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42576, N'POLY PACK PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42577, N'FIVE BROS', NULL, N'1943', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42578, N'ALI EMBROIDARY MILLS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42579, N'MIYANJI TRADING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42580, N'IQBAL & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42581, N'MAQSOOD ALAM & CO', NULL, N'390', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42582, N'JAMEED TRADERS', NULL, N'3200', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42583, N'H.I. INTERNATIONAL', NULL, N'141', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42585, N'JAMAL TRADERS', NULL, N'3200', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42586, N'KING CHEMICALS CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42587, N'BAQRI ASSOCIATES', NULL, N'2232', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42588, N'PABANI TRADE LINKERS', NULL, N'2071', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42589, N'DROP HOME (SMC-PVT) LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42590, N'MEER MEDICINE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42591, N'BENCHMARK CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42592, N'RUPALI POLYESTER LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42593, N'ROYAL LEATHER INDUSTRIES LD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42594, N'RAJBY INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42595, N'AUVITRONICS LIMITED ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42596, N'BEHRAM TEHMURAS KAKLIA', NULL, N'280', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42597, N'MUHAMMED PLASTIC INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42598, N'SO-SAFE WATER TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42599, N'MOBIL MASTERBATCH INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42600, N'INTEG ENGINEERING & TRADING SERVICESSALMAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42602, N'PAL NTERPRISES', NULL, N'1223', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42603, N'AYN MANUFACTURERS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42604, N'EMBASSY OF CZECH REPUBLIC', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42605, N'ORIENT POWER COMPANY PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42606, N'PREMIER SYSTEMS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42607, N'PLASTIPACK MACHINES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42608, N'WIN INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42609, N'AIR COMMERCIAL SERVICES', NULL, N'1699', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42610, N'ASIF AGENCIES', NULL, N'1020', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42611, N'S.B ENGIREEING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42612, N'CORNISH FOOD INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42613, N'GEAOFMAN PHARMACEUTICALS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42614, N'M.ISMAILJI & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42615, N'PAK SECURITY & SAFETY SYSTEMS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42616, N'MILKYZ FOOD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42617, N'SHAMS SHAHZAD INTERNATIONAL', NULL, N'885', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42619, N'SKYLINK DISTRIBUTION', NULL, N'3247', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42620, N'SKARDU SURGICAL SUPPLIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42621, N'M/S PARAGON SERVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42622, N'BOLAN SEVICES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42623, N'H.R BROTHERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42625, N'KG TRADERS PVT LTD', NULL, N'416', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42626, N'BOLAN CASTING LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42627, N'UNIQUE TARDERS ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42628, N'WEB CONVERTORS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42629, N'SALMAN PAPER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42630, N'HUSAINI HAEMATOLOGY & ONCOLOGY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42631, N'UNI-TIECH PHARMACEUTICALS PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42632, N'SOURCE INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42633, N'NDS COMPUTERS SYSTEM', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42634, N'ALSONS AUTO PARTS (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42635, N'HARIS ASSOCIATES', NULL, N'1870', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42636, N'MBS FALCON PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42637, N'CMS INTERNATIONA', NULL, N'2285', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42638, N'RAJBY TEXTILE PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42639, N'DYNAMIC SHIPPING AGENCIES PVT LTD', NULL, N'2548', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42640, N'GROWMORE INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42641, N'CROWN TEXTILE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42642, N'AL KARAM TOWEEL INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42643, N'RTS ENGINEERING WORKS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42644, N'SHAH TRADERS', NULL, N'2390', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42645, N'AUTOMAXPLAZA HOUSE MECLEAN', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42647, N'GLOBAL TECHNICAL SERICES', NULL, N'2434', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42648, N'PROGRESSIVE ENGINEERING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42649, N'U.K TRADERS', NULL, N'2916', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42650, N'MULTI TRADING', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42651, N'METALINE INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42652, N'MAIN ENTERPRISES', NULL, N'2147', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42653, N'J.S SHIPPING AGENCY', NULL, N'26520', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42654, N'NAUMAN AUTOS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42655, N'MUSHTAQ & CO PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42656, N'ORIENT WATER TECHNOLOGIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42657, N'YOUSUF SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42658, N'BASE WELDING COMPANY STEEL HOUSE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42659, N'BERYAR INTERNATIONAL', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42660, N'MAKKAH ZARI STORE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42661, N'FAY TRADERS FAROOQ MANSION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42662, N'REHMAN BROTHERS', NULL, N'726', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42663, N'SEASON FOODS (PVT) LTD.', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42664, N'S.NAZAR HUSSAIN & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42665, N'SUNSHINE SERVICES', NULL, N'265', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42666, N'SHAKOOR BROTHERS PLYWOOD INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42667, N'QUICK MARKETING SERVICES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42668, N'AZHAR CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42669, N'WORLDWIDE TRADING CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42670, N'IMRAN TRADER', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42671, N'GRO SURE ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42672, N'FAIZAN HASSAN PROPRIETOR MACRO CARE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42673, N'EXPEDITORS INTERNATIONAL', NULL, N'1951', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42674, N'MOBIN IMPEX', NULL, N'1940', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42675, N'AL-INAYAT & SONS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42676, N'TYFON PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42677, N'GOOD LUCK TRADERS', NULL, N'1581', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42680, N'SUNMARS ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42681, N'TECHNO AUTOMOTIVE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42682, N'SYSTEK PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42683, N'LINURO TECH PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42684, N'T W SERVICES', NULL, N'2112', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42685, N'SHAHBAZ SCIENTIFIC CORPORATION  ', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42686, N'IKRAM CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42688, N'GARIBSONS PV T LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42690, N'SHOAIB ENETERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42691, N'AGRIAUTO INDUSTRIES LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42692, N'MUKHTAR AND SONS', NULL, N'1807', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42693, N'FAST CLEARING SERVICES', NULL, N'3274', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42694, N'DIGITEC SYSTEMS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42695, N'WADIWALA ENTERPRISE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42696, N'CARGO DISTRIBUTION SERVICES', NULL, N'2050', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42697, N'ZAMAN ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42698, N'ELSONS CORPORATION', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42699, N'YAKUB IMPEX', NULL, N'473', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42700, N'TARIQ INTERNATIONAL', NULL, N'1763', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42701, N'MUHAMMAD HANIF & COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42702, N'INCOM SERVICSES (PVT) LTD.', NULL, N'263', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42703, N'THAHEEM BROTHERS', NULL, N'2083', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42704, N'A.R.M.Y ENTERPRISES', NULL, N'2119', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42705, N'ASHRAF ASSOCIATES', NULL, N'2394', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42706, N'Z & I TRADING COMPANY', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42707, N'ANA GARMENTS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42708, N'KHALQ ENTERPRISE', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42710, N'S.K. TRADERSS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42711, N'PAK APPARELS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42712, N'AL HAMED & COMPANY ', NULL, N'641', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42713, N'SHEERAZ & CO', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42714, N'UTOPIA INDUSTRIES PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42715, N'BABA ENTERPRISES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42716, N'M/S JAN TEX', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42717, N'GOLDREEF COMPUTERS', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42718, N'GLOBAL TECHNICAL SERVICES', NULL, N'2434', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42719, N'H.M ENTERPRISES', NULL, N'1589', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42720, N'COMMERCIAL PIPE PVT LTD', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42721, N'AL-KHALEEJ INDUSTRIES', NULL, N'SELF', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42722, N'AL FAISAL INTERNATIONAL', NULL, N'3150', CAST(N'2021-04-19T08:15:06.6323940' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42723, N'JASANI SCIENTIFIC (SELF)', NULL, NULL, CAST(N'2021-04-24T12:11:44.8884233' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42724, N'EL FRICO ', NULL, N'415', CAST(N'2021-05-01T06:31:59.5919138' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42725, N'A.K BARAI AND SONS ', NULL, N'2507', CAST(N'2021-05-01T06:36:20.7003656' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42726, N'PATANWALA TRADERS', NULL, N'1451', CAST(N'2021-05-01T06:55:03.9169499' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42727, N'KHALID & KHALID HOLDINGS', NULL, N'SELF', CAST(N'2021-05-01T07:09:53.3642659' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42728, N'AL KARAM RICE ENGINEERING', NULL, NULL, CAST(N'2021-05-01T07:14:22.9531209' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42729, N'SEALINK SHIPPING & FORWARDING ', NULL, N'1181', CAST(N'2021-05-01T07:42:18.5126835' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42730, N'FURQAN INTERNATIONAL (2760)', N'000', N'2760', CAST(N'2021-05-01T07:51:57.8140422' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42731, N'GHAZI ENTERPRISES (1909', NULL, NULL, CAST(N'2021-05-01T07:55:45.6938480' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42732, N'N.R.A TRADERS ', NULL, N'2600', CAST(N'2021-05-01T08:12:24.5285000' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42733, N'A.D ENTERPRISES ', NULL, N'3156', CAST(N'2021-05-01T08:19:21.1984146' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42734, N'SMART TRADING COMPANY ', NULL, N'SELF', CAST(N'2021-05-01T08:24:39.1371951' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42735, N'SERVICE INDUSTRIES LTD', NULL, N'310', CAST(N'2021-05-01T08:44:31.7883434' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42736, N'N.I TRADING', NULL, N'2309', CAST(N'2021-05-01T09:12:00.4088094' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42737, N'IFS CHEMICALS ', NULL, N'SELF', CAST(N'2021-05-01T09:33:49.3739292' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42738, N'OCEANIC CLEARING SERVICES ', NULL, N'3093', CAST(N'2021-05-01T09:38:36.3125731' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42739, N'SNAAN SEALAND TRADERS ', NULL, N'1539', CAST(N'2021-05-01T09:43:20.1878158' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42740, N'S.B ARRAH AGENCY (481)', NULL, NULL, CAST(N'2021-05-01T10:49:33.7025857' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42741, N'S.B ARRAH AGENCY', NULL, N'481', CAST(N'2021-05-01T10:49:59.0308079' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42742, N'SERVICE INTERNATIONAL ', NULL, N'338', CAST(N'2021-05-05T06:23:56.4122241' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42743, N'A TECH INTERNATIONAL ', NULL, NULL, CAST(N'2021-05-05T06:27:55.1496961' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42744, N'ASHAD IMPEX ', NULL, N'2583', CAST(N'2021-05-05T09:51:28.0751205' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42745, N'ZAMAN AGENCIES PVT LTD ', NULL, N'1326', CAST(N'2021-05-05T11:23:34.2571159' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42746, N'BIO MEDICS MEDICAL SYSTEM ', NULL, N'SELF', CAST(N'2021-05-05T12:12:24.3414981' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42747, N'MARELINE INDUSTRY', NULL, N'SELF', CAST(N'2021-05-06T08:53:01.6328815' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42748, N'ASIATIC TRADERS (SELF)', NULL, NULL, CAST(N'2021-05-07T05:39:36.9653271' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42749, N'MIAN & SONS ', NULL, N'1187', CAST(N'2021-05-07T07:20:27.6842235' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42750, N'MATCO PRIVATE LIMITED', NULL, N'SELF', CAST(N'2021-05-07T09:57:49.7717410' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42751, N'NATIONAL LOGISTIC ', NULL, N'SELF', CAST(N'2021-05-08T06:59:37.5128716' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42752, N'BROTHERS ', NULL, N'2822', CAST(N'2021-05-08T08:03:12.3209904' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42753, N'SHINING OCEAN INTERNATIONAL PVT LTD ', NULL, N'3070', CAST(N'2021-05-08T09:16:06.7930106' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42754, N'SHAHZAD ENTERPRISES & TECHNOLOGIES ', NULL, N'SELF', CAST(N'2021-05-08T09:56:15.1917272' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42755, N'AIM ASSOCIATES SHOP (1608)', NULL, NULL, CAST(N'2021-05-11T05:53:18.8310150' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42756, N'SWIZ INTERNATIONAL', NULL, N'SELF', CAST(N'2021-05-11T06:50:53.7659997' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42757, N'AMIR INTERNATIONAL ', NULL, N'616', CAST(N'2021-05-17T11:22:47.1759638' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42758, N'KHAN CUSTOM CLEARANCE ', NULL, N'2439', CAST(N'2021-05-17T11:58:05.5836939' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42759, N'DOT PIXEL LTD ', NULL, N'SELF', CAST(N'2021-05-18T09:38:31.8026793' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42760, N'SERVICE INTERNATIONAL (338)', NULL, NULL, CAST(N'2021-05-19T06:40:55.0513651' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42761, N'NATION WIDE IND PVT LTD ', NULL, N'SELF', CAST(N'2021-05-19T11:50:26.2154848' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42762, N'H R BROTHERS ', NULL, N'316', CAST(N'2021-05-20T11:31:22.0102822' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42763, N'A.R.M TRADING ', NULL, N'SELF', CAST(N'2021-05-21T05:59:10.0506104' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42764, N'J & P COATS PAKISTAN PVT LTD', NULL, N'SELF', CAST(N'2021-05-21T06:26:34.2638669' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42765, N'ANNEX AGENCIES ', NULL, N'3294', CAST(N'2021-05-21T09:49:04.6643672' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42766, N'M.A LAND TRANSPORT CO PVT LTD ', NULL, N'1898', CAST(N'2021-05-21T12:04:24.9333032' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42767, N'SAIGAL', NULL, N'1450', CAST(N'2021-05-21T15:11:32.5962635' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42768, N'DANYAL AGENCIES', NULL, N'1700', CAST(N'2021-05-22T06:45:05.5219506' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42769, N'AGROW MARKC', NULL, N'SELF', CAST(N'2021-05-22T11:30:59.4134196' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42770, N'IST TRADERSSHOP ', NULL, N'SELF', CAST(N'2021-05-22T11:59:06.4703538' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42771, N'AN ENTERPRISES ', NULL, N'1824', CAST(N'2021-05-24T09:27:00.8797098' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42772, N'TECHNOMAN', NULL, N'SELF', CAST(N'2021-05-25T13:29:21.9016388' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42773, N'RIVER WOOD INCMAIN ZAFARWAL', NULL, N'SELF', CAST(N'2021-05-25T14:48:00.5691150' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42774, N'SOLEHRE BROTHERS INDUSTRIES', NULL, N'SELF', CAST(N'2021-05-25T14:55:00.0170101' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42775, N'M/S TECHNO INSTRUMENTS PVT LTD', NULL, N'SELF', CAST(N'2021-05-25T15:02:32.2315846' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42776, N'ELEONE SEWING CORPORATION', NULL, N'SELF', CAST(N'2021-05-25T16:10:48.4860506' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42777, N'KHURRAM CARGO SERVICE ', NULL, N'3105', CAST(N'2021-05-26T05:57:23.1679424' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42778, N'X-PERTS ENTERPRISES', NULL, N'61', CAST(N'2021-05-26T06:23:04.1626495' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42779, N'X-PERTS ENTERPRISES', NULL, N'164', CAST(N'2021-05-26T06:26:24.5339944' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42780, N'GALOPE', NULL, N'SELF', CAST(N'2021-05-26T07:10:08.4758452' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42781, N'ALI HAIDER INTERNATIONAL ROOM', NULL, N'2894', CAST(N'2021-05-27T12:04:26.7388415' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42782, N'BRITLITE ENGINERRRING', NULL, N'SELF', CAST(N'2021-05-27T13:45:52.3190965' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42783, N'BABAR BUTT & SONS', NULL, N'SELF', CAST(N'2021-05-27T16:02:59.3461459' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42784, N'KHANZADAD INTERNATIONAL ', NULL, N'1988', CAST(N'2021-05-28T12:26:02.2164241' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42785, N'S.M SADIQ & SONS ', NULL, N'741', CAST(N'2021-05-29T06:46:53.3961994' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42786, N'AL KARAM TEXTILES PVT LTD', NULL, N'SELF', CAST(N'2021-05-29T07:45:01.5049187' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42787, N'K.Y SHIPPERS', NULL, N'1810', CAST(N'2021-05-29T10:21:26.2873094' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42788, N'PAKISTAN ARMY', NULL, N'SELF', CAST(N'2021-05-31T14:23:49.5833166' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42789, N'BUSINESS LINKS INTERNATIONAL PVT LTD', NULL, N'SELF', CAST(N'2021-06-01T07:40:46.9464049' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42790, N'AKHTAR CUSTOM CLEARING ', NULL, N'2947', CAST(N'2021-06-01T10:17:59.3805021' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42791, N'YOUR CHOICE SERVICES ', NULL, N'3154', CAST(N'2021-06-01T11:58:23.6243502' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42792, N' MIR YOUSUF LEATHER WORK ', NULL, N'SELF', CAST(N'2021-06-01T14:54:36.0361943' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42793, N'GALEIC  ZONENAI ABAI', NULL, N'SELF', CAST(N'2021-06-01T15:41:07.5169805' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42794, N'INDUS AGENCIES ', NULL, N'SELF', CAST(N'2021-06-02T06:27:27.2402597' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42795, N'RAFIQ PRESS ', NULL, N'SELF', CAST(N'2021-06-02T08:09:29.7678426' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42796, N'FIRST AMERICAN CORP PVT LTD', NULL, NULL, CAST(N'2021-06-02T08:49:02.1969099' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42797, N'FIRST AMERICAN CORP PVT LTD', NULL, N'SELF', CAST(N'2021-06-02T08:49:16.2426688' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42798, N'MOHSIN RUBBER ', NULL, N'SELF', CAST(N'2021-06-02T10:55:29.3472150' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42799, N'HASSAIN', NULL, N'SELF', CAST(N'2021-06-02T11:43:17.0283408' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42800, N'F K ENTERPRISES ', NULL, N'1853', CAST(N'2021-06-03T11:14:42.5372987' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42801, N'BIN NAEEM', NULL, N'SELF', CAST(N'2021-06-04T04:43:24.9493609' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42802, N'ALI TRADING CO PVT LTD', NULL, N'SELF', CAST(N'2021-06-04T12:02:03.4350468' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42803, N'MEDICAL DEVICES PVT LTD', NULL, N'SELF', CAST(N'2021-06-04T12:09:43.6693982' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42804, N'HASSAN AND BROTHERS', NULL, N'SELF', CAST(N'2021-06-05T06:23:52.8541824' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42805, N'MANZOOR CO ', NULL, N'486', CAST(N'2021-06-05T09:22:53.8490829' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42806, N'STR INTERNATIONAL', NULL, N'SELF', CAST(N'2021-06-05T09:32:22.7039951' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42807, N'MIDLAND INTERNATIONAL', NULL, N'SELF', CAST(N'2021-06-05T12:21:52.6935247' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42808, N'CORRECT BUSINESS CORP', NULL, N'SELF', CAST(N'2021-06-05T12:28:48.0987341' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42809, N'ROTOTEC PVT LTD ', NULL, N'SELF', CAST(N'2021-06-07T07:05:14.6965183' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42810, N'FOAMCO PRIVATE LTD', NULL, N'SELF', CAST(N'2021-06-07T08:48:53.6673789' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42811, N'QADRI AUTOS', NULL, N'SELF', CAST(N'2021-06-08T07:22:26.9388667' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42812, N'FAHTIMA SUPPLIES PVT LTD ', NULL, N'SELF', CAST(N'2021-06-08T10:20:23.5961073' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42813, N'R-TRANS ', NULL, N'3905', CAST(N'2021-06-09T05:28:13.8854988' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42814, N'MUSTAFAI CORPORATION', NULL, N'152', CAST(N'2021-06-09T09:10:55.4773068' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42815, N'AL HAMD INTERNATIONAL', NULL, N'SELF', CAST(N'2021-06-10T09:24:21.5770747' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42816, N'BISMILLAH TRADERS ', NULL, N'SELF', CAST(N'2021-06-11T06:25:30.3301246' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42817, N'AR ENTERPRISES ', NULL, N'2263', CAST(N'2021-06-11T07:14:46.2312344' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42818, N'ARIA TRADING ', NULL, N'3248', CAST(N'2021-06-11T12:17:55.3404786' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42819, N'FIVE M INTERNATIONAL', NULL, N'2075', CAST(N'2021-06-12T05:22:14.5664914' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42820, N'JAVERIA ENTERPRSIESESGUL', NULL, N'SELF', CAST(N'2021-06-12T06:05:40.4125877' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42821, N'CARGO TEC ', NULL, N'2188', CAST(N'2021-06-12T07:46:44.2133799' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42822, N'DAWAR IMPEX', NULL, N'SELF ', CAST(N'2021-06-12T09:43:31.3698671' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42823, N'M.ZAFAR & COMPANY ', NULL, N'752', CAST(N'2021-06-12T11:12:22.4266246' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42824, N'HASSAN ENTERPRISES ', NULL, N'2898', CAST(N'2021-06-12T11:54:54.5929141' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42825, N'SADARDUDDIN ', NULL, N'SELF ', CAST(N'2021-06-14T06:28:48.8237517' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42826, N'NASF INTERNATIONAL ', NULL, N'SELF', CAST(N'2021-06-14T10:07:15.9965009' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42827, N'MULTI COLOUR ', NULL, N'SELF', CAST(N'2021-06-14T10:08:28.8399121' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42828, N'AR TRADING ', NULL, N'3259', CAST(N'2021-06-14T10:10:30.5179273' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42829, N'SABRI LOGISTIC', NULL, N'2591', CAST(N'2021-06-14T12:28:17.0733200' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42830, N'SADRUDDIN AND SONSSHOP', NULL, N'SELF', CAST(N'2021-06-14T12:42:15.6996819' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42831, N'MR. GOHAR EJAZ', NULL, N'42301-9686840-3', CAST(N'2021-06-15T13:26:44.8453641' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42832, N'VISION INTELLEC', NULL, N'SELF', CAST(N'2021-06-16T07:26:37.3616701' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42833, N'WAETZ ASIASITE ', NULL, N'SELF', CAST(N'2021-06-16T07:30:21.2545836' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42834, N'BLUE SIGMA ', NULL, N'SELF', CAST(N'2021-06-16T10:47:02.8757954' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42835, N'SIALKOT DRY PORT TRUST ', NULL, N'1903', CAST(N'2021-06-16T13:36:14.5381210' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42836, N'MOHAMMAD AMIN MOHAMMAD MUQEEM', NULL, N'599', CAST(N'2021-06-18T10:37:38.0860854' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42837, N'INNOVATIVE SCIENTIFIC SOLUTIONS', NULL, N'SELF', CAST(N'2021-06-18T13:29:42.8017333' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42838, N'ARCHONE', NULL, N'SELF', CAST(N'2021-06-18T13:36:03.7921346' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42839, N'SANA PAPER PRODUCTS ', N'SELF ', N'SELF', CAST(N'2021-06-19T10:55:57.8471454' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42840, N'MASTER ENTERPRISES ', NULL, N'SELF', CAST(N'2021-06-19T11:13:57.3060702' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42841, N'CREATIVE APPARELS PVT LTD', NULL, N'SELF', CAST(N'2021-06-19T13:48:37.6371669' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42842, N'FOREIGN TRADE SERVICE ', NULL, N'874', CAST(N'2021-06-21T09:12:29.4950479' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42843, N'TOP SELLER PAKISTAN PVT LTD ', NULL, N'SELF', CAST(N'2021-06-21T10:17:56.1430745' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42844, N'ZARKASH INTERNATIONAL ', NULL, N'SELF', CAST(N'2021-06-21T10:19:25.4507050' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42845, N'SAA INTERNATIONAL ', NULL, N'SELF', CAST(N'2021-06-21T11:02:09.8433432' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42846, N'RUSH ENTERPRISES ', NULL, N'SELF', CAST(N'2021-06-21T12:47:46.2908579' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42847, N'QUALITY CUSTOM BROKERS', NULL, N'3245', CAST(N'2021-06-21T14:22:17.0432506' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42848, N'M.S.H COMPANY ', NULL, N'SELF', CAST(N'2021-06-22T05:04:30.5223134' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42849, N'SUNDUS ENTERPRISES ', NULL, N'SELF', CAST(N'2021-06-22T05:05:53.0824997' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42850, N'MASTER OFFISYS PVT LTD ', NULL, N'SELF', CAST(N'2021-06-22T05:56:27.2705061' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42851, N'S BHAYANI & SONS ', NULL, N'2101', CAST(N'2021-06-22T07:38:32.6461939' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42852, N'SIR ENGINEERING ENTERPRISES ', NULL, N'SELF', CAST(N'2021-06-22T11:03:19.8241361' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42853, N'S.S COMMERCIAL CORPORATION ', NULL, N'702', CAST(N'2021-06-23T05:41:33.4955982' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42854, N'AHMED MEDIX PVT LTD', NULL, N'SELF', CAST(N'2021-06-23T08:10:15.7698390' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42855, N'PAKISTAN INTERNATIONAL AIRLINES CORPORATION ', NULL, N'SELF', CAST(N'2021-06-24T06:14:59.3598412' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42856, N'M.T BEARING ', NULL, N'SELF', CAST(N'2021-06-25T05:23:50.3282291' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42857, N'STAR SOURCING ', NULL, N'SELF', CAST(N'2021-06-25T11:45:55.5110655' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42858, N'TECHNO TEXTILE ', NULL, N'SELF', CAST(N'2021-06-26T08:01:20.7513882' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42859, N'MR. MUHAMMAD HARIS MANSOOB', NULL, NULL, CAST(N'2021-06-26T13:49:35.7189488' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42860, N'MR. MUHAMMAD HARIS MANSOOB', NULL, N'SELF', CAST(N'2021-06-26T13:49:47.3634023' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42861, N'MR. MUHAMMAD MUSTAFA QASIM ', NULL, N'SELF', CAST(N'2021-06-26T14:00:33.4412306' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42862, N'WSW INTERNATIONAL', NULL, N'SELF', CAST(N'2021-06-28T09:11:22.9238349' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42863, N'MR. MUHAMMAD FAROOQ MAMJI', NULL, N'SELF', CAST(N'2021-06-28T11:03:36.0819507' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42864, N'MR. FARHAN IFTIKHAR KHAN', NULL, N'SELF', CAST(N'2021-06-29T14:20:56.9954486' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42865, N'COMFORT TRADING PVTLTD ', NULL, N'SELF', CAST(N'2021-06-29T16:03:36.6378430' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42866, N'MS SHIPPER', NULL, NULL, CAST(N'2021-06-30T14:04:56.0946619' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42867, N'AKMAL PRINT HOUSE PVT LTD', NULL, N'SELF', CAST(N'2021-06-30T14:11:00.0877268' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42868, N'AROCHEM ENTERPRISES', NULL, N'SELF', CAST(N'2021-06-30T16:01:42.9184211' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42869, N'MR. YAQOOB PARACHA', NULL, N'SELF', CAST(N'2021-06-30T20:12:39.9973442' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42870, N'MUHAMMAD ASLAM', NULL, N'SELF', CAST(N'2021-07-01T13:06:57.2326121' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42871, N'FINE TECH MARTIAL ARTS & BOXING EQUIPMENT PVT LTD', NULL, N'SELF', CAST(N'2021-07-02T18:17:15.5106467' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42872, N'MR. NAVEED BILWANI', NULL, N'SELF', CAST(N'2021-07-03T11:10:03.4326155' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42873, N'MAZUMA INDUSTRIES ', NULL, N'SELF', CAST(N'2021-07-05T15:48:11.8423577' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42874, N'WORLDWIDE TRADING CORPORATION', NULL, N'814', CAST(N'2021-07-05T15:48:19.6393185' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42875, N'SHABBIR ASSOCIATES', NULL, N'SELF', CAST(N'2021-07-06T14:06:06.2610639' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42876, N'ALPHA CHEMICAL', NULL, N'SELF', CAST(N'2021-07-06T14:15:18.7222532' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42877, N'CAPRICE INTERNATIONAL', NULL, N'SELF', CAST(N'2021-07-06T14:41:11.5435557' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42878, N'CAPRICE INTERNATIONAL', NULL, N'3287', CAST(N'2021-07-06T14:41:33.9816356' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42879, N'CRESPAK MEDICAL INDUSTRIES', NULL, N'SELF', CAST(N'2021-07-06T15:08:46.7083889' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42880, N'FM RAWAT ENTERPRISES ', NULL, NULL, CAST(N'2021-07-07T10:20:36.2065538' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42881, N'EMBASSY OF NEPAL', NULL, N'SELF', CAST(N'2021-07-07T12:08:11.1939503' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42882, N'KARSAZ CLEARING & FORWARDING', NULL, N'1272', CAST(N'2021-07-07T12:50:34.2973631' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42883, N'GREEN CARE TRADING PVT LTD', NULL, N'SELF', CAST(N'2021-07-07T13:04:49.9201516' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42884, N'ASA PRINTING PRESS (SMC-PVT) LTD', NULL, N'`', CAST(N'2021-07-07T14:17:03.5144817' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42885, N'NOVELTY ENTERPRISES', NULL, N'SELF', CAST(N'2021-07-08T12:13:47.6174062' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42886, N'INTERWOOD MOBEL PVT ', NULL, NULL, CAST(N'2021-07-08T12:15:33.3175932' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42887, N'SILVER STAR ENTERPRISES', NULL, N'2722', CAST(N'2021-07-08T12:30:19.5511246' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42888, N'FAVOURITE LOGISTIC SERVICES (SELF)', NULL, NULL, CAST(N'2021-07-08T12:56:50.1242964' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42889, N'FAVOURITE LOGISTIC SERVICES', NULL, N'SELF', CAST(N'2021-07-08T13:01:20.6500723' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42890, N'EROZ CORPORATION UNIT (SELF)', NULL, NULL, CAST(N'2021-07-08T13:04:10.3270936' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42891, N'SHAH RUBBER PRODUCT', NULL, N'SELF', CAST(N'2021-07-08T14:39:33.6626457' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42892, N'ALLIED SHIPPERS ', NULL, N'621', CAST(N'2021-07-08T14:44:48.7214104' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42893, N'ORAMACO AGENCIES (PAKISTAN) 1081', NULL, NULL, CAST(N'2021-07-09T12:37:55.8308439' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42894, N'PAKISTAN BUSINESS INTERNATIONAL ', NULL, N'SELF', CAST(N'2021-07-09T12:47:13.4744298' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42895, N'GREEN FAIR INTERNATIONAL', NULL, N'2766', CAST(N'2021-07-10T09:56:05.5432937' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42896, N'AHMED IMPEX', NULL, N'SELF', CAST(N'2021-07-10T10:38:49.4548238' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42897, N'ABID TAYYAB & COMPANY ', NULL, N'1958', CAST(N'2021-07-10T11:02:53.4941016' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42898, N'TARIQ TRADERS', NULL, N'SELF', CAST(N'2021-07-10T11:50:22.9989637' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42899, N'ARSHAD & BROTHERS', NULL, N'1000', CAST(N'2021-07-10T12:14:08.8331292' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42900, N'TRACK TRIANGLE AVIATION SERVICES PVT LTD', NULL, N'2413', CAST(N'2021-07-12T10:25:16.1278875' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42901, N'GLOBAL AUTOMOBILES ', NULL, NULL, CAST(N'2021-07-12T11:20:25.0368266' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42902, N'MH IMPEX INTERNATIONAL ', NULL, N'SELF', CAST(N'2021-07-13T15:28:03.4661239' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42903, N'AAA PLUS TRADE IMPEX', NULL, N'SELF', CAST(N'2021-07-13T15:50:46.8403689' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42904, N'JEEWA TRADING COMPANY', NULL, N'SELF', CAST(N'2021-07-13T16:30:30.5637963' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42905, N'TRADE SOLUTION ', NULL, N'3232', CAST(N'2021-07-14T12:36:41.9782127' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42906, N'MR. ABDUL BASIT', NULL, N'SELF', CAST(N'2021-07-14T14:11:47.6046536' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42907, N'JAWED & SONS SURGICAL ', NULL, N'SELF', CAST(N'2021-07-15T10:52:46.9797317' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42908, N'CURVE TECHNOLOGIES PVT LTD', NULL, N'SELF', CAST(N'2021-07-15T10:53:48.5546446' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42909, N'M/S CONVELL LABROTIES SAIDU SELF', NULL, NULL, CAST(N'2021-07-15T14:07:32.9755732' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42910, N'ELITE AGENCIES ', NULL, N'239', CAST(N'2021-07-16T10:28:11.7264195' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42911, N'EMBARKATION HEADQUARTERS PAKISTAN NAVY', NULL, N'SELF', CAST(N'2021-07-16T11:04:27.3167457' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42912, N'MR. ABDUL RAZZAQ', NULL, N'SELF', CAST(N'2021-07-16T17:46:33.0886133' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42913, N'M/S. GHAZI & COMPANY', NULL, N'SELF', CAST(N'2021-07-16T17:47:05.7429138' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42914, N'ABDULLAH ASSOCIATES', NULL, N'SELF', CAST(N'2021-07-17T14:18:23.9393581' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42915, N'SHAMS TRADING CO', NULL, N'359', CAST(N'2021-07-17T14:39:32.6916635' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42916, N'RELIABLE MEDICAL SUPPLIES', NULL, N'SELF', CAST(N'2021-07-19T12:06:22.3086200' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42917, N'A. R. YUSAF NIAZ NAGAR', NULL, N'SELF', CAST(N'2021-07-19T16:26:59.2704700' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42918, N'SHAN CONTROLS PVT LTD', NULL, N'SELF', CAST(N'2021-07-27T14:14:12.7798674' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42919, N'MAIRAJ & SONS', NULL, N'SELF', CAST(N'2021-07-27T14:47:35.0157090' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42920, N'MR. MUHAMMAD ARIF', NULL, N'SELF', CAST(N'2021-07-28T17:41:38.2049445' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42921, N'MULTI TECH ASSOCIATES ', NULL, N'SELF', CAST(N'2021-07-29T14:15:14.5958394' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42922, N'IFTIKHAR AUTOS (SELF)', NULL, NULL, CAST(N'2021-07-29T15:03:51.4008801' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42923, N'LABEL EXPERT', NULL, NULL, CAST(N'2021-07-30T09:17:32.2966117' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42924, N'QUALITY VISIONF-39 SELF', NULL, N'SELF', CAST(N'2021-07-30T10:12:57.3994722' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42925, N'INTELLIGENT METERING ', NULL, NULL, CAST(N'2021-07-30T10:43:18.1352646' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42926, N'INTELLIGENT METERING ', NULL, N'SELF', CAST(N'2021-07-30T10:44:00.6819528' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42927, N'FATIMI IMPEX', NULL, NULL, CAST(N'2021-07-30T11:35:19.4338059' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42928, N'EMBASSY OF THE REPUBLIC OF TAJIKISTAN ', NULL, NULL, CAST(N'2021-07-31T09:36:05.4923113' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42929, N'FAHAD SAAD & CO', NULL, N'2172', CAST(N'2021-07-31T10:40:23.8935094' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42930, N'TECMENS SWITCHGEAR SERVICES ', NULL, N'SELF', CAST(N'2021-07-31T14:58:27.5062192' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42931, N'COTTON WEB PVT LTD ', NULL, N'SELF ', CAST(N'2021-08-02T14:04:32.7612939' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42932, N'QSA SURGICAL PVT LTD', NULL, N'SELF', CAST(N'2021-08-02T14:19:20.5823167' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42933, N'MOHAMMAD RAMZAN SEWING MACHING & SILK', NULL, N'SELF', CAST(N'2021-08-03T12:35:55.6465728' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42934, N'EURO INTERNATIONAL ', NULL, N'2993', CAST(N'2021-08-03T14:07:24.7751646' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42935, N'JAWA INDUSTRY ', NULL, N'SELF', CAST(N'2021-08-03T15:35:04.0071923' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42936, N'GT GLOBAL ENTERPRISES ', NULL, N'SELF', CAST(N'2021-08-04T14:16:19.6380705' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42937, N'BISMILLAH FARM INDUSTRIES & REPAIRING', NULL, NULL, CAST(N'2021-08-04T15:05:52.9187439' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42938, N'MALIK TRADER', NULL, NULL, CAST(N'2021-08-04T15:43:54.6673748' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42939, N'POWER TECHNOLOGY INTERNATIONAL PVT LTD', NULL, N'SELF', CAST(N'2021-08-05T14:10:36.9545000' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42940, N'HB LOGISTIC ', NULL, N'3289', CAST(N'2021-08-05T15:07:38.5921862' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42941, N'AHMED TRADE AGENCY', NULL, N'SELF', CAST(N'2021-08-06T11:16:03.3841610' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42942, N'NADEEM TRADERS ', NULL, N'SELF', CAST(N'2021-08-06T14:47:11.8111212' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42943, N'REHMAT TRADING CO ', NULL, N'3044', CAST(N'2021-08-07T09:39:45.9247208' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42944, N'DAWN SHIPPING AGENCIES', NULL, N'404', CAST(N'2021-08-07T10:50:03.3961291' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42945, N'ABDUL SATTAR EDHI FOUNDATION', NULL, N'SELF', CAST(N'2021-08-07T12:55:11.3384218' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42946, N'JUNAID MOTORS ', NULL, N'SELF', CAST(N'2021-08-07T14:12:05.5820667' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42947, N'ARYAN INTERNATIONAL ASSOCIATES (SELF)', NULL, NULL, CAST(N'2021-08-10T14:16:51.3278514' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42948, N'MYLAB (PVT) LTD', NULL, NULL, CAST(N'2021-08-11T11:14:09.2869976' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42949, N'MEMON VALVE CENTER', NULL, N'SELF', CAST(N'2021-08-11T14:17:53.7125804' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42950, N'CONTINENTAL TRDING CO', NULL, N'1978', CAST(N'2021-08-12T09:33:31.7230987' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42951, N'M.A.K TRADERS ', NULL, N'SELF', CAST(N'2021-08-13T10:24:29.6994129' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42952, N'WATTAN AUTOS', NULL, NULL, CAST(N'2021-08-13T16:42:47.3305977' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42953, N'FASTAM INDUSTRIES ', NULL, N'SELF', CAST(N'2021-08-16T15:38:09.5010087' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42954, N'GREENZ INTERNATIONAL ', NULL, N'SELF', CAST(N'2021-08-17T10:33:53.7028288' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42955, N'IRFAN GARMENTS (SELF)', NULL, NULL, CAST(N'2021-08-17T11:36:18.7562976' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42956, N'EHQ PAF', NULL, N'SELF', CAST(N'2021-08-17T12:22:14.4887590' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42957, N'STARCOM TECHNOLOGIES (PVT) LTD. (SELF)', NULL, NULL, CAST(N'2021-08-17T14:00:38.7929062' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42958, N'YAQOOB BROTHERS', NULL, N'SELF', CAST(N'2021-08-17T14:05:17.1271044' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42959, N'HAROON BROTHERS PROP (SELF)', NULL, NULL, CAST(N'2021-08-17T14:06:17.3089556' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42960, N'ISHFAQUE ALI (SELF)', NULL, NULL, CAST(N'2021-08-17T16:17:30.9709908' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42961, N'SIAGAL PACKAGES INDUSTRIES PVT LTD ( SELF)', NULL, NULL, CAST(N'2021-08-20T15:51:47.0276228' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42962, N'RANA ENTERPRISES ', NULL, N'507', CAST(N'2021-08-21T15:59:07.0073997' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42963, N'JAVEED BROTHERS ', NULL, N'SELF', CAST(N'2021-08-24T12:17:27.5248130' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42964, N'MOUNT FUJI TEXTILE', NULL, N'SELF', CAST(N'2021-08-25T12:30:28.1768165' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42965, N'POPULAR FABRICS LTD ', NULL, N'SELF', CAST(N'2021-08-25T16:01:11.9207341' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42966, N'F.D & C PVT LTD ', NULL, N'SELF', CAST(N'2021-08-26T11:42:51.4434239' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42967, N'GLOBAL BUSINESS LINK', NULL, N'SELF', CAST(N'2021-08-27T09:39:32.1188884' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42968, N'INTERNATIONAL A & A IMPORTERS', NULL, N'SELF', CAST(N'2021-08-27T16:07:13.9884208' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42969, N'SIDDIQUE CORPORATION SUIT', NULL, N'SELF', CAST(N'2021-08-28T12:17:12.1007828' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42970, N'QASIM TRADERS', NULL, N'SELF', CAST(N'2021-08-28T15:02:37.0165497' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42971, N'SIDDIQUE ENTERPRISES ', NULL, N'2509', CAST(N'2021-08-31T11:25:54.6741850' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42972, N'H A ENTERPRISES ', NULL, N'3304', CAST(N'2021-08-31T15:30:19.4416505' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42973, N'TIMES ROAD PVT LTD.', NULL, NULL, CAST(N'2021-09-01T14:08:53.7842985' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42974, N'ALI ENTERPRISES', NULL, N'SELF', CAST(N'2021-09-01T14:41:23.1284369' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42975, N'FAST MOVERS ', NULL, N'1690', CAST(N'2021-09-01T16:05:04.7545392' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42976, N'PKG INTERNATIONAL SHIPPING & LOGISTICS LTD', NULL, N'1586', CAST(N'2021-09-02T10:17:25.9957461' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42977, N'AL GHORI ENTERPRISES ', NULL, N'SELF', CAST(N'2021-09-03T16:09:55.1309623' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42978, N'AR INSTRUMERDAIR PORT ', NULL, N'SELF', CAST(N'2021-09-04T14:54:55.5230877' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42979, N'NS CUSTOMS CLEARANCE CONSULTYANCY', NULL, N'9010410', CAST(N'2021-09-06T14:42:31.6024077' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42980, N'MEDITEC INSTRUMENTS CO', NULL, N'SELF ', CAST(N'2021-09-06T15:58:54.5978487' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42981, N'I.R ENTERPRISES', NULL, N'SELF', CAST(N'2021-09-07T12:32:07.2012870' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42982, N'MOMENTUM LOGISTICS PVT LTD ', NULL, N'9010423', CAST(N'2021-09-07T12:32:15.9814665' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42983, N'COMBINED CLEARING  CORPORATION ', NULL, N'903', CAST(N'2021-09-07T14:15:36.0641277' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42984, N'COMMANDER AGRO PVT LTD ', NULL, N'SELF ', CAST(N'2021-09-07T14:59:04.3505007' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42985, N'ENGINEERING EXPERT ', NULL, N'SELF', CAST(N'2021-09-09T10:29:49.0183061' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42986, N'SHAN CORPORATION ', NULL, N'1852', CAST(N'2021-09-09T14:23:02.8425801' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42987, N'JAVED BUTT & SONS', NULL, N'2113', CAST(N'2021-09-09T15:11:07.1887875' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42988, N'KAYS SONS INTERNATIONAL ', NULL, N'SELF ', CAST(N'2021-09-10T12:17:34.9876065' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42989, N'CONTINANTAL COURIER SYSTEM ', NULL, N'1613', CAST(N'2021-09-10T12:51:08.3061124' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42990, N'ATHER CORPORATION (293)', NULL, NULL, CAST(N'2021-09-14T12:35:14.5822579' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42991, N'SEA FREIGHT NATION ', NULL, N'SELF', CAST(N'2021-09-14T14:19:08.9835672' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42992, N'IDEAL BUSSINESS PRODUCTS ', NULL, N'SELF', CAST(N'2021-09-14T15:09:54.7871782' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42993, N'PRINT WORLD TECHNOLOGY ', NULL, N'SELF', CAST(N'2021-09-14T15:34:03.0866520' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42994, N'AUTOMATE INDUSTRIES PVT LTD ', NULL, NULL, CAST(N'2021-09-15T12:23:58.8323591' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42995, N'QAMAR TRADING COMANY', NULL, N'168', CAST(N'2021-09-15T14:58:51.6771813' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42996, N'RAFI ENTERPRISES ', NULL, N'1482', CAST(N'2021-09-15T15:29:54.1366482' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42997, N'BOLAN SERVICES ', NULL, N'1400', CAST(N'2021-09-16T15:16:14.4288039' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42998, N'BAY WEST PVT LTD', NULL, N'SELF', CAST(N'2021-09-17T12:11:22.0032032' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (42999, N'B & R ENTERPRISES', NULL, N'3285', CAST(N'2021-09-17T16:09:43.5933974' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43000, N'TRIFIT LIMITED', NULL, N'SELF', CAST(N'2021-09-20T10:44:46.6623483' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43001, N'MUHAMMAD ZAI ', NULL, N'3009', CAST(N'2021-09-20T15:51:32.2864828' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43002, N'SPEEDY AUTOMATION', NULL, N'SELF', CAST(N'2021-09-23T14:39:07.7394860' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43003, N'SUBHANI ENGINEERING ', NULL, N'SELF ', CAST(N'2021-09-24T15:34:57.3752695' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43004, N'FEROZE 1888 MILLS LTD', NULL, NULL, CAST(N'2021-09-25T09:53:21.2226081' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43005, N'SAWAL & COMPANY ', NULL, N'973', CAST(N'2021-09-27T11:13:49.1175142' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43006, N'A.I.K INDUSREIS ', NULL, N'SELF ', CAST(N'2021-09-27T12:41:58.8903309' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43007, N'MOMENTUM LOGISTICS ', NULL, N'3318', CAST(N'2021-09-27T16:07:04.6079051' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43008, N'MUHAMMAD DIN MALANG INDUSTRIES ', NULL, N'SELF ', CAST(N'2021-09-28T14:21:36.8807868' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43009, N'FUNFA INTERNATIONL', NULL, N'2294', CAST(N'2021-09-28T14:27:15.5455350' AS DateTime2), 0)
GO
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43010, N'GRAND PHARMA PVT LTD', NULL, N'SELF', CAST(N'2021-09-29T10:00:14.0890380' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43011, N'AHMED ENTEPRISES 18-', NULL, N'350', CAST(N'2021-09-29T12:46:44.4557432' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43012, N'TAB CORPORATE INT ', NULL, N'SELF', CAST(N'2021-09-30T15:55:02.0145508' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43013, N'KONCEPT TECHNOLOGIES ', NULL, N'SELF', CAST(N'2021-10-02T12:46:57.2927474' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43014, N'GULF PHARMACEUTIALS', NULL, N'SELF', CAST(N'2021-10-05T12:42:51.6002010' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43015, N'CHIEF AUTO CENTER ', NULL, N'SELF ', CAST(N'2021-10-05T15:38:49.5869015' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43016, N'SUNAIN CARGO LOGISTIC ', NULL, N'2990', CAST(N'2021-10-05T15:59:41.1473428' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43017, N'PAK PHARMACEUTICAL ', NULL, N'SELF', CAST(N'2021-10-05T17:00:11.5329506' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43018, N'S.A.K ENTERPRISES', NULL, N'SELF', CAST(N'2021-10-06T10:48:11.7335741' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43019, N'RED SON INTERNATIONAL ', NULL, N'SELF ', CAST(N'2021-10-09T12:01:01.9809335' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43020, N'SHAFIQUE BROTHERS', NULL, N'1287', CAST(N'2021-10-11T15:11:57.2337693' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43021, N'TECHTRIX SYSTEM ', NULL, N'SELF ', CAST(N'2021-10-11T15:12:00.2518705' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43022, N'ARMOZ PHARMA (PVT) LTD', NULL, N'SELF', CAST(N'2021-10-12T12:02:59.3846301' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43023, N'AUTOMATE INDUSTRIES (PVT) LTD.', NULL, NULL, CAST(N'2021-10-13T11:54:31.3494926' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43024, N'NAFEESA TRADING CO', NULL, N'SELF', CAST(N'2021-10-13T14:41:00.7319755' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43025, N'KASHIF AND CO ', NULL, N'SELF ', CAST(N'2021-10-13T14:43:33.8273591' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43026, N'MID ASIAN ENTERPRISES ', NULL, N'1783', CAST(N'2021-10-13T15:32:40.7844408' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43027, N'MHK ENTERPRISE', NULL, N'SELF', CAST(N'2021-10-14T09:57:22.2604754' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43028, N'PURE GOLD PAPER & BOARD MILLS PVT LTD', NULL, NULL, CAST(N'2021-10-14T10:46:55.4251064' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43029, N'M/S KAY SONS', NULL, N'SELF', CAST(N'2021-10-14T11:47:20.5793245' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43030, N'SALEEM FAROOQUI ', NULL, N'2241', CAST(N'2021-10-14T14:09:41.3936820' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43031, N'MR. UMER ZAHID', NULL, N'42201-3224638-9', CAST(N'2021-10-15T11:03:04.4269772' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43032, N'RAUF BROTHERS ROOM ', NULL, N'2588', CAST(N'2021-10-15T11:43:28.3869985' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43033, N'AL- RAHEEM IMPEX ', NULL, N'SELF', CAST(N'2021-10-15T16:30:35.2572119' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43034, N'JABBI INTERNATIONAL ', NULL, N'2121', CAST(N'2021-10-16T12:09:43.4922033' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43035, N'FATAMNA CORPORATION ', NULL, N'SELF', CAST(N'2021-10-16T15:47:12.5995054' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43036, N'RANA INTERNATIONAL ', NULL, N'3171', CAST(N'2021-10-20T16:04:41.3460589' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43037, N'JAVED NOULAHA ', NULL, N'1729', CAST(N'2021-10-21T11:07:58.2763237' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43038, N'ZUBAIR TRADERS SHOP', NULL, NULL, CAST(N'2021-10-21T15:57:47.3161445' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43039, N'MEGA TRADERS', NULL, N'SELF', CAST(N'2021-10-22T10:56:17.4668578' AS DateTime2), 0)
INSERT [dbo].[ClearingAgent] ([ClearingAgentId], [Name], [PhoneNumber], [ChallanNumber], [DeleteDate], [IsDeleted]) VALUES (43040, N'IBRAHEEM PRECISION ', NULL, N'SELF ', CAST(N'2021-10-22T16:12:00.1842360' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[ClearingAgent] OFF
GO
SET IDENTITY_INSERT [dbo].[PortAndTerminal] ON 

INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (1, N'KARACHI', N'T001', N'SUP', N'PAK', N'KARACHI', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (2, N'KARACHI 2', N'T002', N'SUP 2', N'PAK', N'CITY OF DISCHARGE', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (3, N'KARACHI', N'KICT', N'KARACHI INTERNATIONAL CONTAINER TERMINAL', N'UK', N'FELIXCITO', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (4, N'KARACHI PORT TRUST', N'SAPT', N'SOUTH ASIA PAKISTAN TERMINAL', N'PAKISTAN', N'KARACHI', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (5, N'BRATISLAVA', N'BICT', N'BRATISLAVA', N'SLOVAKIA', N'BRATISLAVA', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (6, N'GOTHENBURG', N'SEGOT', N'GOTHENBURG', N'SWEDEN', N'GOTHENBURG', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (7, N'PRAHA', N'NONE', N'PRAHA', N'THE CZECH REPUBLIC', N'PRAGUE,PRAHA', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (8, N'HAMBURG', N'DEHAM', N'HAMBURG', N'GERMANY', N'HAMBURG', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (9, N'HELSINKI', N'011', N'HELSINKI', N'FINLAND', N'HELSINKI', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (10, N'OSLO ', N'NOOSL', N'OSLO', N'NORWAY', N'OSLO', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (11, N'NORRKOEPING', N'SENRK', N'NORRKOEPING', N'SWEDEN', N'NORRKOEPING', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (12, N'AARHUS', N'AUS', N'AARHUS', N'DENMARK', N'AARHUS', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (13, N'GDYNIA', N'PLGDY', N'GDYNIA', N'POLAND', N'GDYNIA', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (14, N'COPENHAGEN', N'DK CPH', N'COPENHAGEN', N'DENMARK', N'COPENHAGEN', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (16, N'LAHORE', N'T0011', N'SUP L', N'PAK', N'LAHORE , LAH', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (18, N'COPENHAGEN', N'CPHN', N'COPENHAGEN', N'DENMARK', N'COPENHAGEN', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (19, N'BUDAPEST', N'BDST', N'BUDAPEST', N'HUNGARY', N'BUDAPEST', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (21, N'FREDERICIA-DENMARK', N'FREDERICIA', N'FREDERICIA-DENMARK', N'DENMARK', N'FREDERICIA', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (22, N'BERLIN', N'BER', N'BERLIN', N'GERMANY', N'BERLIN', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (23, N'CHITTAGONG', N'CHITTAGONG', N'CHITTAGONG', N'BANGLADESH', N'CHITTAGONG', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (24, N'PICT', N'PICT', N'PAKISTAN INTERNATIONAL CONTAINER TERMINAL', N'PAK', N'KARACHI', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (25, N'PORT OF MALMO', N'18', N'PORT OF MALMO', N'SWEDEN', N'MALMO', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (26, N'BRATISLAVA', N'BAB', N'BRATISLAVA PORT', N'SALVOKIA', N'BRATISLAVA', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (27, N'KOPER ', N'KOP', N'PORT OF KOPER ', N'SLOVENIA', N'KOPER', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (28, N'ZURICH', N'ZUR', NULL, N'SWITZERLAND', N'ZURICH', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (29, N'TALLINN', N'TAL', N'TALLINN', N'ESTONIA', N'TALLINN', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (30, N'NAVEGANTES', N'NAV', N'NASS', N'BRAZIL', N'NAVEGANTES', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (31, N'QICT', N'QICT', N'QASIM INTERNATIONAL CONTAINER TERMINAL', N'PAK', N'KARACHI', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (32, N'RUDAN ', N'RDN', N'RUDAN ', N'CZECH REPUBLIC ', N'CZECH REPUBLIC ', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (33, N'FRANKFURT ', N'FNF', N'FRANKFURT', N'GERMANY', N'GERMANY', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (35, N'RIJEKA', N'RJK', N'PORT OF RIJEKA', N' CROATIA ', N'RIJEKA', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (36, N'LE HARVE ', N'-', N'LE HARVE', N'FRANCE', N'LE HARVE ', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (37, N'KOLN', N'KON', N'KOLN', N'GERMANY', N'KOLN', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (38, N'BEROUN', N'4011', N'BEROUN', N'CZECH REPUBLIC', N'BEROUN', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (39, N'TEMA', N'TEM', N'TEMA', N'GHANA', N'TEMA ', CAST(N'2021-02-24T19:02:42.0139589' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (40, N'JELENIA GORA', N'N/A', N'JELENIA GORA', N'POLAND', N'JELENIA GORA', CAST(N'2021-03-10T15:15:32.9780518' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (41, N'ETTLINGEN', N'875', N'125', N'GERMANY', N'ETTLINGEN', CAST(N'2021-05-10T10:44:46.4999870' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (42, N'PUERTO CALDERA', N'33333', N'PUERTO CALDERA', N'COSTA RICA', N'PUERTO CALDERA', CAST(N'2021-05-26T18:40:10.8233359' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (43, N'KOUVOLA', N'596', N'SOUTH ASIA PAKISTAN TERMINAL', N'FINLAND', N'KOUVOLA', CAST(N'2021-07-15T21:17:05.0870053' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (44, N'NACHOD', N'CZR', N'NACHOD', N'CZECH REPUBLIC', N'NACHOD', CAST(N'2021-08-03T00:26:34.5074610' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (45, N'LUANDA ANGOLA', N'244', N'WIKIPEDIA', N'NA', N'SAOUTH AFRICA', CAST(N'2021-08-07T19:29:07.6943916' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (46, N'LJUBBJANA', N'555', N'LJUBBJANA', N'LJUBBJANA', N'LJUBBJANA', CAST(N'2021-08-16T16:23:19.0051517' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (47, N'KEELUNG', N'KEL', N'KEELUNG (CHILUNG)', N'TAIWAN', N'KEELUNG', CAST(N'2021-08-25T04:08:43.9116959' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (48, N'MONTEVIDEO', N'0012', N'MONTEVIDEO', N'MONTEVIDEO', N'MONTEVIDEO', CAST(N'2021-08-25T17:25:12.1355425' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (49, N'MANILA', N'MANILA', N'MANILA', N'SINGAPORE', N'MANILA', CAST(N'2021-08-26T03:52:56.2917089' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (50, N'TRIESTE', N'ITTRS', N'TMT', N'ITALY', N'TRIESTE', CAST(N'2021-09-09T18:14:22.8836629' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (51, N'SANTOS', N'SN', N'SANTOS', N'SANTOS', N'SANTOS', CAST(N'2021-09-19T05:26:11.0250558' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (52, N'MUNICH', N'MUN', N'MUNICH', N'GERMANY', N'GERMANY', CAST(N'2021-10-11T13:07:52.7447025' AS DateTime2), 0)
INSERT [dbo].[PortAndTerminal] ([PortAndTerminalId], [PortName], [TerminalCode], [TerminalName], [Destination], [PortOfDischarge], [DeleteDate], [IsDeleted]) VALUES (53, N'DJIBOUTI', N'DJIBOUTI', N'DJIBOUTI', N'DJOBOUTI', N'DJIBOUTI', CAST(N'2021-10-18T22:14:51.2048968' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[PortAndTerminal] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingAgent] ON 

INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50029, N'CIRRUS INTERNATIONAL VEHICLE', N'CIRRUS INTERNATIONAL VEHICLE', N'1', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50030, N'OVERSEAS TRANSIT AGENCY (PVT) LTD.', N'OVERSEAS TRANSIT AGENCY (PVT) LTD.', N'2', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50031, N'GLOBELINK PAKISTAN (PVT) LTD.', N'GLOBELINK PAKISTAN (PVT) LTD.', N'3', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50032, N'QUALITY FREIGHT SYSTEMS', N'QUALITY FREIGHT SYSTEMS', N'4', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50033, N'EM-A SHIPPING AGENCIES', N'EM-A SHIPPING AGENCIES', N'5', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50034, N'MIT LOGISTICS', N'MIT LOGISTICS', N'6', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50035, N'ARUAMZ SHIPPING', N'ARUAMZ SHIPPING', N'7', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50036, N'EMIRATES LOGISTICS', N'EMIRATES LOGISTICS', N'8', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50037, N'SEAGOLD PVT LTD', N'SEAGOLD PVT LTD', N'9', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50038, N'FOCUS SHIPPING', N'FOCUS SHIPPING', N'10', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50039, N'FREIGHT CONNECTION', N'FREIGHT CONNECTION', N'11', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50040, N'ACTIVE FREIGHT SERVICES PVT. LTD', N'ACTIVE FREIGHT SERVICES PVT. LTD', N'12', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50041, N'TRANSBRIDGE LOGISTICS PAKISTAN', N'TRANSBRIDGE LOGISTICS PAKISTAN', N'13', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50042, N'LOGISTIC SOLUTION', N'LOGISTIC SOLUTION', N'14', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50043, N'SEAGULL SHIPPING', N'SEAGULL SHIPPING', N'15', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50044, N'JAGUAR SHIPPING LINE (PVT) LTD.', N'JAGUAR SHIPPING LINE (PVT) LTD.', N'16', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50045, N'SHIPCO TRANSPORT PAKISTAN', N'SHIPCO TRANSPORT PAKISTAN', N'17', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50046, N'PAKLINK SHIPPING SERVICES', N'PAKLINK SHIPPING SERVICES', N'18', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50047, N'PORT LINK INTERNATIONAL SERVICES (PVT) LTD', N'PORT LINK INTERNATIONAL SERVICES (PVT) LTD', N'19', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50048, N'GREENPAK SHIPPING (PVT) LIMITED', N'GREENPAK SHIPPING (PVT) LIMITED', N'20', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50049, N'SEATRANS LOGISTICS CO. LTD', N'SEATRANS LOGISTICS CO. LTD', N'21', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50050, N'INTERNATIONAL CARGO MANAGEMENT', N'INTERNATIONAL CARGO MANAGEMENT', N'22', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50051, N'INTERNATIONAL FREIGHT SERVICES & LOGISTICS SERVICES', N'INTERNATIONAL FREIGHT SERVICES & LOGISTICS SERVICES', N'23', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50052, N'SHARAF SHIPPING AGENCY (PVT) LTD', N'SHARAF SHIPPING AGENCY (PVT) LTD', N'24', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50053, N'Freight Hub Total Logistics Solutions', N'Freight Hub Total Logistics Solutions', N'25', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50054, N'SUPREME SCM PVT LTD', N'SUPREME SCM PVT LTD', N'26', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50055, N'MERCHANT SHIPPING PVT LTD', N'MERCHANT SHIPPING PVT LTD', N'27', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50056, N'MARLIN MARINE LOGISTICS', N'MARLIN MARINE LOGISTICS', N'28', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50057, N'SYNERGY FREIGHT INTERNATIONAL', N'SYNERGY FREIGHT INTERNATIONAL', N'29', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50058, N'SEA TRADE INTERNATIONAL', N'SEA TRADE INTERNATIONAL', N'30', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50059, N'WMA SHIPCARE SERVICES PVT LTD', N'WMA SHIPCARE SERVICES PVT LTD', N'31', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50060, N'SEA HAWK SHIPPING LINE PVT LTD', N'SEA HAWK SHIPPING LINE PVT LTD', N'32', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50061, N'GATE WAY SHIPPING', N'GATE WAY SHIPPING', N'33', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50062, N'FACILITIES SHIPPING AGENCY PVT LTD.', N'FACILITIES SHIPPING AGENCY PVT LTD.', N'34', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50063, N'BAYWEST (PVT) LTD', N'BAYWEST (PVT) LTD', N'35', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50064, N'SM TRADERS', N'SM TRADERS', N'36', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50065, N'PRINCE ENTERPRISE', N'PRINCE ENTERPRISE', N'37', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50066, N'ZAS SHIPPING PVT LTD', N'ZAS SHIPPING PVT LTD', N'38', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50067, N'UNITED SPECTRUM AGENCIES', N'UNITED SPECTRUM AGENCIES', N'39', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50068, N'AVENTIS INTERNATIONAL SHIPPING & LOGISTICS', N'AVENTIS INTERNATIONAL SHIPPING & LOGISTICS', N'40', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50069, N'DYNAMIC', N'DYNAMIC', N'41', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50070, N'CP WORLD CO', N'CP WORLD CO', N'42', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50071, N'CSS PAKISTAN PVT. LTD.', N'CSS PAKISTAN PVT. LTD.', N'43', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50072, N'PENANSHIN SHIPPING PAKISTAN', N'PENANSHIN SHIPPING PAKISTAN', N'44', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50073, N'SEA FREIGHT NATION', N'SEA FREIGHT NATION', N'45', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50074, N'PRINCE ENT.', N'PRINCE ENT.', N'46', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50075, N'IRFAN IMPEX', N'IRFAN IMPEX', N'47', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50076, N'SHERRY TRADERS', N'SHERRY TRADERS', N'48', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50077, N'TRANSNET SHIPPING', N'TRANSNET SHIPPING', N'49', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50078, N'HAMZA & BROTHERS', N'HAMZA & BROTHERS', N'50', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50079, N'NEWS LOGISTICS', N'NEWS LOGISTICS', N'51', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50080, N'RANKS LOGISTICS PAKISTAN PVT LTD', N'RANKS LOGISTICS PAKISTAN PVT LTD', N'52', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50081, N'GSLL AGENCIES PAKISTAN', N'GSLL AGENCIES PAKISTAN', N'53', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50082, N'CMA CGM PVT LTD', N'CMA CGM PVT LTD', N'54', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50083, N'SEA BLUE LOGISTICS', N'SEA BLUE LOGISTICS', N'55', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50084, N'T.K. CORPORATION (PVT) LTD', N'T.K. CORPORATION (PVT) LTD', N'56', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50085, N'WATERLINK PAKISTAN', N'WATERLINK PAKISTAN', N'57', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50086, N'CONNECT FREIGHT SERVICES', N'CONNECT FREIGHT SERVICES', N'58', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50087, N'RAVIAN INTERNATIONAL AGENCIES PAKISTAN', N'RAVIAN INTERNATIONAL AGENCIES PAKISTAN', N'59', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50088, N'COMMANDER LOGISTICS INTERNATIONAL', N'COMMANDER LOGISTICS INTERNATIONAL', N'60', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50089, N'ONE WORLD SHIPPING PVT LTD', N'ONE WORLD SHIPPING PVT LTD', N'61', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50090, N'EMAAN & CO', N'EMAAN & CO', N'62', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50091, N'QUICK FREIGHT MANAGEMENT PAKISTAN', N'QUICK FREIGHT MANAGEMENT PAKISTAN', N'63', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50092, N'QUALITY TRANSPORT PAKISTAN', N'QUALITY TRANSPORT PAKISTAN', N'64', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50093, N'FREIGHT WORLD PAKISTAN', N'FREIGHT WORLD PAKISTAN', N'65', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50094, N'SNS SHIPPING AGENCY', N'SNS SHIPPING AGENCY', N'66', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50095, N'PGT SHIPPING', N'PGT SHIPPING', N'67', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50096, N'BILAL BROTHER INDUSTRIES', N'BILAL BROTHER INDUSTRIES', N'68', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50097, N'FOCUS SHIPPING - LCL', N'FOCUS SHIPPING - LCL', N'69', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50098, N'TRI- ANGLE ELECTRONICS', N'TRI- ANGLE ELECTRONICS', N'70', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50099, N'PEOPLE’S SERVICES', N'PEOPLE’S SERVICES', N'71', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50100, N'RAJA CARGO SERVICE', N'RAJA CARGO SERVICE', N'72', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50101, N'AKTHAR CUSTOMS CLEARING AGENT', N'AKTHAR CUSTOMS CLEARING AGENT', N'73', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50102, N'KARAM E MUSTAFA', N'KARAM E MUSTAFA', N'74', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50103, N'ZAS SHIPPING PVT LTD - LCL', N'ZAS SHIPPING PVT LTD - LCL', N'75', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50104, N'TRADE SERVICE', N'TRADE SERVICE', N'76', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50105, N'BEST CLOTHINGS', N'BEST CLOTHINGS', N'77', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50106, N'RAHEEL BROTHER', N'RAHEEL BROTHER', N'78', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50107, N'ASHRAF ENTERPRISE', N'ASHRAF ENTERPRISE', N'79', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50108, N'AWAN & AGHA', N'AWAN & AGHA', N'80', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50109, N'AMPLE SHIPPING & LOGISTIC SERVICES', N'AMPLE SHIPPING & LOGISTIC SERVICES', N'81', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50110, N'SW SHIPPING', N'SW SHIPPING', N'82', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50111, N'NAVEED ENTERPRISES', N'NAVEED ENTERPRISES', N'83', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50112, N'FACILITIES SHIPPING AGENCY PVT LTD - CY', N'FACILITIES SHIPPING AGENCY PVT LTD - CY', N'84', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50113, N'SKY SHIPPING', N'SKY SHIPPING', N'85', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50114, N'ALLIED CONTAINER LINE', N'ALLIED CONTAINER LINE', N'86', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50115, N'ROYAL SHIPPING & LOGISTICS.', N'ROYAL SHIPPING & LOGISTICS.', N'87', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50116, N'CARGO SHIPPING & LOGISTICS', N'CARGO SHIPPING & LOGISTICS', N'88', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50117, N'TECHNO FREIGHT PAKISTAN', N'TECHNO FREIGHT PAKISTAN', N'89', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50118, N'INFINITY SHIPPING', N'INFINITY SHIPPING', N'90', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50119, N'FIH LOGISTICS', N'FIH LOGISTICS', N'91', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50120, N'TRANSPARENCY SHIPPING PAKISTAN', N'TRANSPARENCY SHIPPING PAKISTAN', N'92', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50121, N'TRANS LOGISTICS', N'TRANS LOGISTICS', N'93', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50122, N'ZALAAN SOLUTIONS (PVT.)', N'ZALAAN SOLUTIONS (PVT.)', N'94', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50123, N'GALAXY FREIGHT FORWARDING', N'GALAXY FREIGHT FORWARDING', N'95', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50124, N'APPLE CONSOLIDATION', N'APPLE CONSOLIDATION', N'96', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50125, N'MSC AGENCY PAKISTAN (PVT) LTD', N'MSC AGENCY PAKISTAN (PVT) LTD', N'97', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50126, N'GREENPAK SHIPPING', N'GREENPAK SHIPPING', N'98', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50127, N'FORBES SHIPPING', N'FORBES SHIPPING', N'99', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
GO
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50128, N'WESTERN FREIGHT SHIPPING', N'WESTERN FREIGHT SHIPPING', N'100', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50129, N'GALAXY FREIGHT FORWARDING - LCL.', N'GALAXY FREIGHT FORWARDING - LCL.', N'101', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (50130, N'SHIPPING', N'SHIPPING', N'102', 0, NULL, CAST(N'2021-04-07T13:26:49.2053686' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60061, N'GLOBAL CONSOLIDATOR', N'GLOBAL CONSOLIDATOR', N'103', 0, N'NULL', CAST(N'2021-04-15T14:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60062, N'OVERSEASE SHIPPER', N'OVERSEASE SHIPPER', N'104', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60063, N'SERVOTECH SHIPPING', N'SERVOTECH SHIPPING', N'105', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60064, N'IDEAL TRADING', N'IDEAL TRADING', N'106', 0, NULL, CAST(N'2021-05-01T07:41:53.6731003' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60065, N'GHAZI ENTERPRISES (1909)', NULL, NULL, 0, NULL, CAST(N'2021-05-01T07:53:24.8605618' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60066, N'RAVIAN INTERNATIONAL AGENCIES PAKISTAN - CY', N'RAVIAN INTERNATIONAL AGENCIES PAKISTAN - CY', N'107', 0, NULL, CAST(N'2021-05-07T06:46:49.3809466' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60067, N'AXL CONTAINER LINE PVT L;TD', NULL, NULL, 0, NULL, CAST(N'2021-06-02T14:11:20.5738605' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60068, N'M.R. TRADERS ', N'M.R. TRADERS ', N'MRT', 0, NULL, CAST(N'2021-07-10T12:40:57.7587227' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60069, N'PACIFIC DELTA SHIPPING (PVT.) LTD.', N'PACIFIC DELTA SHIPPING (PVT.) LTD.', N'0', 0, NULL, CAST(N'2021-07-24T14:47:34.6807887' AS DateTime2), 0, N'GateIn')
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType]) VALUES (60070, N'ALLIED LOGISTICS', NULL, N'0', 0, NULL, CAST(N'2021-09-25T10:27:54.2582638' AS DateTime2), 0, N'GateIn')
SET IDENTITY_INSERT [dbo].[ShippingAgent] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingLine] ON 

INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (1, N'SHIPPING LINE ', N'001', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (4, N'SHIPPING LINE 2', N'002', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (5, N'GLOBE LINK', N'03', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (6, N'HAPAG LLOYD', N'HLL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (7, N'COSCO', N'COSCO', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (8, N'TEST', N'123', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (9, N'BALTIC SHIPPING', N'BALT', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (10, N'OCEAN NETWORK EXPRESS', N'ONE', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (11, N'CMA CGM TRANSPORT COMPANY', N'CMA', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (15, N'AA', N'A', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (17, N'a', N'a', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (18, N'a', N'a', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (19, N'a', N'a', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (20, N'a', N'a', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (22, N'TEST SHIPING LINE', N'0011', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (23, N'AT', N'AAAAT', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (24, N'QER', N'QER', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (25, N'AD', N'AD', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (26, N'TQ', N'TQ', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (27, N'OOCL', N'222', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (28, N'MEDITERRANIAN SHIPPING COMPANY', N'MSC', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (29, N'MODERN SHIPPING AGENCIES PRIVATE LIMITED', N'MSA', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (30, N'COSCO SHANGHAI', N'COS SHANGHAI', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (31, N'MAXICON CONTAINER LINE PTE LTD', N'MCL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (32, N'FOCUS FREIGHT SOLUTION', N'FFS', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (33, N'ANL SINGAPORE PTE LTD', N'ANL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (34, N'COMPAGNIE MARITIME DAFFRETEMENT', N'CMD', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (35, N'UNIVERSAL SHIPPING PVT LTD.', N'USL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (36, N'GLOBAL FEEDER SHIPPING', N'GFS', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (37, N'EVERGREEN LINE', N'ERNL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (38, N'WAN HAI LINES LTD', N'WHL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (39, N'HYUNDAI MERCHANT MARINE', N'HMM', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (40, N'KOREA MARINE TRANSPORT CONTAINERS', N'KMTC', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (41, N'AAA SHIPPING & LOGISTIC', N'AAASL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (42, N'AAA SHIPPING & LOGISTICS PVT LTD', N'AAA', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (43, N'YANG MING MARINE TRANSPORT CORPORATION', N'YML', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (44, N'PERMA SHIPPING LINE UK LTD', N'PSL', NULL, CAST(N'2021-01-05T19:21:06.9617032' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (45, N'LAUREL NAVIGATION (MAURITIUS) LTD', N'LNL', NULL, CAST(N'2021-01-14T15:34:50.4573087' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (46, N'ECU LINE PAKISTAN PVT LTD', N'ECU', NULL, CAST(N'2021-01-21T00:18:07.7467330' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (47, N'MAERSK LINE', N'MAERSK LINE', NULL, CAST(N'2021-02-02T01:28:35.4350943' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (48, N'COMPAGINE INTERNATIONAL MARITIMOS', N'-', NULL, CAST(N'2021-03-24T19:12:54.6133557' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (49, N'CLEAR FREIGHT INTERNATIONAL', N'CFI', NULL, CAST(N'2021-03-25T02:48:57.4287801' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (50, N'WEST EUROPEAN CONTAINER LINES', N'009', NULL, CAST(N'2021-04-10T15:51:52.5420305' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (51, N'COASTAL CONTAINER LINES', N'CCL', NULL, CAST(N'2021-05-21T12:49:45.7795579' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (52, N'HAMBURG SUED CONTAINER LINE ', N'HSCL', NULL, CAST(N'2021-06-24T21:09:16.8895389' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (53, N'PAK LINER AGENCIES PVT LTD', N'PLA', NULL, CAST(N'2021-07-09T20:37:58.5530354' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (54, N'POLLUX & CASTOR INTERNATIONAL (FZC)', N'PCI', NULL, CAST(N'2021-07-30T22:51:36.6063571' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (55, N'T K C', N'T K CORPORATION', NULL, CAST(N'2021-08-13T16:32:05.8296947' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (56, N'FACILITIES SHIPPING AGENCY', N'FSA', NULL, CAST(N'2021-08-13T21:01:07.9533813' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (57, N'PACIFIC INTERNATIONAL LINE', N'PIL', NULL, CAST(N'2021-09-08T05:01:06.6794872' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[ShippingLine] OFF
GO
ALTER TABLE [dbo].[ClearingAgent] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DeleteDate]
GO
ALTER TABLE [dbo].[ClearingAgent] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PortAndTerminal] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DeleteDate]
GO
ALTER TABLE [dbo].[PortAndTerminal] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ShippingAgent] ADD  DEFAULT ((0)) FOR [OtherCharges]
GO
ALTER TABLE [dbo].[ShippingAgent] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DeleteDate]
GO
ALTER TABLE [dbo].[ShippingAgent] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ShippingLine] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DeleteDate]
GO
ALTER TABLE [dbo].[ShippingLine] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
CREATE TABLE [dbo].[Stations](
	[StationID] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[StationName] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] datetime NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] datetime NULL,
	[DeletedBy] [nvarchar](250) NULL,
	[DeleteDate] datetime,
	Status bit default(0)
	)

	GO	
	alter table GenerateOrder add ShippingLineId int
	Go
	alter table GenerateOrder add ShippingAgentId int
	Go
	alter table GenerateOrder add FreeDays int
	Go
	alter table GenerateOrder add Remarks nvarchar(1000)
	Go
	alter table GenerateOrder add VesselBerthingDate Datetime
	GO
	alter table GenerateOrder add  [BookingPOCName] [nvarchar](250) 
GO
	alter table Logistics add Status nvarchar(50)
	Go
	alter table Logistics add ModeOfTransportation nvarchar(50)
	Go
	alter table Logistics add PreDispatched bit
	Go
	alter table Logistics add Comodities nvarchar(1000)
	Go
	alter table GenerateOrder add BookingPOCName nvarchar(250)
	Go

Create table ReadyForDispatched(
	[ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[OrderId] [int] NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[BLnumber] [nvarchar](250) NULL,
	
	[DOGranty] [datetime] NULL,
	[ImportEIR] [datetime] NULL,
	[PortWeighment] [datetime] NULL,
	[OutSidePortWeighment] [datetime] NULL,
	[GD] [datetime] NULL,
	[BL] [datetime] NULL,
	
	[IsCompleted] [bit] NULL default(0),
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL
)

----2/21/2022 Aleem Last Run

INSERT INTO [dbo].[Stations] VALUES('BEDIYA ROAD',null,null,null,null,null,null,1) 
INSERT INTO [dbo].[Stations] VALUES('FAISALABAD',null,null,null,null,null,null,1)
INSERT INTO [dbo].[Stations] VALUES('ISLAMABAD',null,null,null,null,null,null,1)
INSERT INTO [dbo].[Stations] VALUES('KANA KACHA',null,null,null,null,null,null,1)
INSERT INTO [dbo].[Stations] VALUES('KASUR',null,null,null,null,null,null,1)
INSERT INTO [dbo].[Stations] VALUES('MANGA MANDI',null,null,null,null,null,null,1)
INSERT INTO [dbo].[Stations] VALUES('SHAHKOT',null,null,null,null,null,null,1)
INSERT INTO [dbo].[Stations] VALUES('SHEIKHUPURA',null,null,null,null,null,null,1)
INSERT INTO [dbo].[Stations] VALUES('TOKHER NIAZ BAIG',null,null,null,null,null,null,1)
INSERT INTO [dbo].[Stations] VALUES('LAHORE',null,null,null,null,null,null,1)
INSERT INTO [dbo].[Stations] VALUES('KOT RADHA KISHAN',null,null,null,null,null,null,1)

Create table ReadyForDispatched(
[ID] [int] IDENTITY(1,1) NOT NULL primary key,
[OrderId] [int] NOT NULL,
[OrderNo] [varchar](9) NOT NULL,
[ContainerNo] [nvarchar](250) NOT NULL,
[ContainerSize] [nvarchar](250) NOT NULL,
[BLnumber] [nvarchar](250) NULL,

[DOGranty] [datetime] NULL,
[ImportEIR] [datetime] NULL,
[PortWeighment] [datetime] NULL,
[OutSidePortWeighment] [datetime] NULL,
[GD] [datetime] NULL,
[BL] [datetime] NULL,

[IsCompleted] [bit] NULL default(0),
[CreatedBy] [nvarchar](250) NULL,
[CreateDate] [datetime] NULL,
[UpdatedBy] [nvarchar](250) NULL,
[UpdateDate] [datetime] NULL
)
Go

Create table DispatchedOrder(
[ID] [int] IDENTITY(1,1) NOT NULL primary key,
[OrderId] [int] NOT NULL,
[OrderNo] [varchar](9)NOT NULL,
[ContainerNo] [nvarchar](250) NOT NULL,
[ContainerSize] [nvarchar](250)NOT NULL,
[BLnumber] [nvarchar](250)NOT NULL,

PriorityForDispatched nvarchar(100),
TrainID nvarchar(100),
DispatchedDate datetime, 
StationID int,
StationName nvarchar(250),
WagonNo nvarchar(100), 
WagonType nvarchar(100),
RRNo nvarchar(100), 
EngineNo nvarchar(100), 
InvoiceNumber nvarchar(100), 

IsCompleted bit default(0),
[CreatedBy] [nvarchar](250) NULL,
[CreateDate] datetime NULL,
[UpdatedBy] [nvarchar](250) NULL,
[UpdateDate] datetime NULL,
[IsDeleted] bit DEFAULT(0)
)
Go
Create table InTransactTrain(
ID [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
OrderId int NOT NULL,
OrderNo varchar(9) NOT NULL,
ContainerNo nvarchar(250) NOT NULL,
ContainerSize nvarchar(250)NOT NULL,
BLnumber nvarchar(250) NOT NULL,

StationID int,
TrainID nvarchar(100),
Customer_Name nvarchar(100),
PriorityForDispatched nvarchar(100),
ArrivalDate datetime, 
LOLO bit, 

IsCompleted bit default(0),
[CreatedBy] [nvarchar](250) NULL,
[CreateDate] datetime NULL,
[UpdatedBy] [nvarchar](250) NULL,
[UpdateDate] datetime NULL,
[IsDeleted] bit DEFAULT(0),
)
GO
Create table DeliveryTrain(
ID [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
OrderId int NOT NULL,
OrderNo varchar(9) NOT NULL,
ContainerNo nvarchar(250)NOT NULL,
ContainerSize nvarchar(250) NOT NULL,
BLnumber nvarchar(250) NOT NULL,


PriorityForDispatched nvarchar(100),
TrainID nvarchar(100),
DispatchedDate datetime,
DeliveryLocation nvarchar(100),
VehicleNo nvarchar(100),
ArrivalDate datetime, 
DeliveryDate datetime, 
 

IsCompleted bit default(0),
[CreatedBy] [nvarchar](250) NULL,
[CreateDate] datetime NULL,
[UpdatedBy] [nvarchar](250) NULL,
[UpdateDate] datetime NULL,
[IsDeleted] bit DEFAULT(0),
)

GO

CREATE TABLE [dbo].[ReDispatched](
ID [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
OrderId int NOT NULL,
OrderNo varchar(9) NOT NULL,
ContainerNo nvarchar(250) NOT NULL,
ContainerSize nvarchar(250) NOT NULL,
BLnumber nvarchar(250) NOT NULL,

StationID int null,
[VehicleNo] [nvarchar](250) NULL,
[ReDispatchedDate] [datetime] NULL,
[TranspoterName] [nvarchar](250) NULL,
[BiltyNumber] [nvarchar](250) NULL,
[TransportationCost] [numeric](18, 0) NULL,

IsCompleted bit default(0),
[CreatedBy] [nvarchar](250) NULL,
[CreateDate] datetime NULL,
[UpdatedBy] [nvarchar](250) NULL,
[UpdateDate] datetime NULL,
[IsDeleted] bit DEFAULT(0),
)
Go
--------Haris 02/26/2022

Create table EmptyDropOff(
ID [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
OrderId int NOT NULL,
OrderNo varchar(9) NOT NULL,
ContainerNo nvarchar(250) NOT NULL,
ContainerSize nvarchar(250)NOT NULL,
BLnumber nvarchar(250) NOT NULL,

PortAndTerminalId int,
TerminalName nvarchar(250),
ShippingLineName nvarchar(250),
EIRNo nvarchar(250),
ExpenseAtEmptyLocation numeric(18, 0),
Remarks nvarchar(100), 
DeliveryDate datetime, 
 

IsCompleted bit default(0),
[CreatedBy] [nvarchar](250) NULL,
[CreateDate] datetime NULL,
[UpdatedBy] [nvarchar](250) NULL,
[UpdateDate] datetime NULL,
[IsDeleted] bit DEFAULT(0),
)
Go
Create table DispatchedTruck(
ID [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
OrderId int NOT NULL,
OrderNo varchar(9) NOT NULL,
ContainerNo nvarchar(250)NOT NULL,
ContainerSize nvarchar(250) NOT NULL,
BLnumber nvarchar(250) NOT NULL,


DispatchedDate datetime,
LastDateOfEmptyReturn datetime,
VehicleNo nvarchar(100),
DriverName nvarchar(100),
DriverNo nvarchar(100),
TransporterName nvarchar(100),
BiltyNo nvarchar(100), 

 

IsCompleted bit default(0),
[CreatedBy] [nvarchar](250) NULL,
[CreateDate] datetime NULL,
[UpdatedBy] [nvarchar](250) NULL,
[UpdateDate] datetime NULL,
[IsDeleted] bit DEFAULT(0),
)

GO
Create table DeliveryTruck(
ID [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
OrderId int NOT NULL,
OrderNo varchar(9) NOT NULL,
ContainerNo nvarchar(250)NOT NULL,
ContainerSize nvarchar(250) NOT NULL,
BLnumber nvarchar(250) NOT NULL,


ArrivalDate datetime,
DeliveryDate datetime, 


IsCompleted bit default(0),
[CreatedBy] [nvarchar](250) NULL,
[CreateDate] datetime NULL,
[UpdatedBy] [nvarchar](250) NULL,
[UpdateDate] datetime NULL,
[IsDeleted] bit DEFAULT(0),
)




---Aleem new 03/04/2022
drop table FromLocOil
go
CREATE TABLE [dbo].[Location](
	[ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[LocationName] [nvarchar](50) NULL,
	[CompanyID] [int] NULL,
 )
go
CREATE TABLE [dbo].[EmptyDropOffLoc](
	[ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[LocationName] [nvarchar](50) NULL,
	[CompanyID] [int] NULL,
 )


 ---- Haris new 03/05/22

 USE [ERPMVC]
GO
/****** Object:  Table [dbo].[ShippingLine]    Script Date: 3/5/2022 12:34:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingLine](
	[ShippingLineId] [bigint] IDENTITY(1,1) NOT NULL,
	[ShippingLineName] [nvarchar](max) NULL,
	[ShippingLineCode] [nvarchar](max) NULL ,
	[ShippingLineAgent] [nvarchar](max) NULL,
	[DeleteDate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ShippingLine] PRIMARY KEY CLUSTERED 
(
	[ShippingLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ShippingLine] ON 

INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (1, N'SHIPPING LINE ', N'001', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (4, N'SHIPPING LINE 2', N'002', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (5, N'GLOBE LINK', N'03', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (6, N'HAPAG LLOYD', N'HLL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (7, N'COSCO', N'COSCO', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (8, N'TEST', N'123', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (9, N'BALTIC SHIPPING', N'BALT', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (10, N'OCEAN NETWORK EXPRESS', N'ONE', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (11, N'CMA CGM TRANSPORT COMPANY', N'CMA', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (15, N'AA', N'A', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (17, N'a', N'a', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (18, N'a', N'a', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (19, N'a', N'a', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (20, N'a', N'a', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (22, N'TEST SHIPING LINE', N'0011', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (23, N'AT', N'AAAAT', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (24, N'QER', N'QER', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (25, N'AD', N'AD', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (26, N'TQ', N'TQ', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (27, N'OOCL', N'222', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (28, N'MEDITERRANIAN SHIPPING COMPANY', N'MSC', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (29, N'MODERN SHIPPING AGENCIES PRIVATE LIMITED', N'MSA', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (30, N'COSCO SHANGHAI', N'COS SHANGHAI', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (31, N'MAXICON CONTAINER LINE PTE LTD', N'MCL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (32, N'FOCUS FREIGHT SOLUTION', N'FFS', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (33, N'ANL SINGAPORE PTE LTD', N'ANL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (34, N'COMPAGNIE MARITIME DAFFRETEMENT', N'CMD', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (35, N'UNIVERSAL SHIPPING PVT LTD.', N'USL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (36, N'GLOBAL FEEDER SHIPPING', N'GFS', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (37, N'EVERGREEN LINE', N'ERNL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (38, N'WAN HAI LINES LTD', N'WHL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (39, N'HYUNDAI MERCHANT MARINE', N'HMM', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (40, N'KOREA MARINE TRANSPORT CONTAINERS', N'KMTC', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (41, N'AAA SHIPPING & LOGISTIC', N'AAASL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (42, N'AAA SHIPPING & LOGISTICS PVT LTD', N'AAA', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (43, N'YANG MING MARINE TRANSPORT CORPORATION', N'YML', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (44, N'PERMA SHIPPING LINE UK LTD', N'PSL', NULL, CAST(N'2021-01-05T19:21:06.9617032' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (45, N'LAUREL NAVIGATION (MAURITIUS) LTD', N'LNL', NULL, CAST(N'2021-01-14T15:34:50.4573087' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (46, N'ECU LINE PAKISTAN PVT LTD', N'ECU', NULL, CAST(N'2021-01-21T00:18:07.7467330' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (47, N'MAERSK LINE', N'MAERSK LINE', NULL, CAST(N'2021-02-02T01:28:35.4350943' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (48, N'COMPAGINE INTERNATIONAL MARITIMOS', N'-', NULL, CAST(N'2021-03-24T19:12:54.6133557' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (49, N'CLEAR FREIGHT INTERNATIONAL', N'CFI', NULL, CAST(N'2021-03-25T02:48:57.4287801' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (50, N'WEST EUROPEAN CONTAINER LINES', N'009', NULL, CAST(N'2021-04-10T15:51:52.5420305' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (51, N'COASTAL CONTAINER LINES', N'CCL', NULL, CAST(N'2021-05-21T12:49:45.7795579' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (52, N'HAMBURG SUED CONTAINER LINE ', N'HSCL', NULL, CAST(N'2021-06-24T21:09:16.8895389' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (53, N'PAK LINER AGENCIES PVT LTD', N'PLA', NULL, CAST(N'2021-07-09T20:37:58.5530354' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (54, N'POLLUX & CASTOR INTERNATIONAL (FZC)', N'PCI', NULL, CAST(N'2021-07-30T22:51:36.6063571' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (55, N'T K C', N'T K CORPORATION', NULL, CAST(N'2021-08-13T16:32:05.8296947' AS DateTime2), 1)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (56, N'FACILITIES SHIPPING AGENCY.', N'FSA', NULL, CAST(N'2021-08-13T21:01:07.9533813' AS DateTime2), 0)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted]) VALUES (57, N'PACIFIC INTERNATIONAL LINE', N'PIL', NULL, CAST(N'2021-09-08T05:01:06.6794872' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[ShippingLine] OFF
GO
ALTER TABLE [dbo].[ShippingLine] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DeleteDate]
GO
ALTER TABLE [dbo].[ShippingLine] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO

EXEC SP_RENAME 'generateorder.BusinessDevisionID' , 'BusinessDivisionId', 'COLUMN'

   -------------------- 10-03-2022-------------------------- 

GO

CREATE TABLE [dbo].[BLAgentDetail](
	[AgentId] [bigint] IDENTITY(1,1) NOT NULL Primary key,
	[BLAgent] [nvarchar](max) NULL,
	[BLAgentDetail] [nvarchar](700) NULL,
	[DeleteDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	)
drop table BAShippingLine
GO




GO

CREATE TABLE [dbo].[BLShippingContainer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContainerNo] [nvarchar](250) NULL,
	[SealNo] [nvarchar](250) NULL,
	[ContainerType] [nvarchar](250) NULL,
	[ContainerSize] [nvarchar](50) NULL,
	[DeleteDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	)
	
	/****** 14-03-2022 *****/


---------- 15-03-2022----------

CREATE TABLE [dbo].[ExportBookingOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL Primary Key ,
	[OrderNo] [varchar](9) NOT NULL,

	[DateOfBooking] [datetime] NULL,
	[Forwarder] [nvarchar](500)  NULL,
	[ShipperName] [nvarchar](500) NULL,
	[ShipperContact] [nvarchar](250) NULL,
	[TwentyContainerQty] [int] NULL,
	[FortyContainerQty] [int] NULL,
	[TwentyContainerPrice] [nvarchar](250) NULL,
	[FortyContainerPrice] [nvarchar](250) NULL,
	[RateOfTransportation] [nvarchar](250) NULL,
	[PointOfLoadingStation] [nvarchar](250) NULL,

	[IsCompleted] [bit] default(0) NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] default(0) NULL
)
Go



-----------------16-03-2022---------------------------

CREATE TABLE [dbo].[ExportLogistic](
	[LogisticId] [int] IDENTITY(1,1) Primary Key NOT NULL ,
	[OrderId] [int]  NOT NULL,

	[ContainerNo] [nvarchar](250) NULL,
	[ContainerType] [nvarchar](500)  NULL,
	[ContainerSize] [nvarchar](20) NULL,
	[EGNo] [nvarchar](250) NULL,
	[CRO] [nvarchar](250) NULL,
	[vessel] [nvarchar] (250) NULL,
	[Voyage] [nvarchar](250) NULL,
	[ETD] [datetime] NULL,
	[VesselCutOff] [datetime] NULL,
	[ShippingLine] [nvarchar](500) NULL,
	[ClearingAgentName] [nvarchar](250) NULL,
	[CAContactNo] [nvarchar](250) NULL,
	[BookingPort] [nvarchar](50) NULL,
	[ModeOfTransportation] [nvarchar](20) NULL,
	[DateOfReceivingCargo] [datetime] NULL,
	[PreDispatched] bit,
	[Status] [nvarchar](50) NULL,

	[IsCompleted] [bit] default(0) NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] default(0) NULL
)

----------17-03-2022-------------------

CREATE TABLE [dbo].[ExportPreDispatched](
	[ID] [int] IDENTITY(1,1) Primary Key NOT NULL ,
	[OrderId] [int]  NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[CRO] [nvarchar](250) NULL,


	[PickupFrom] [datetime] NULL,
	[VehicleNo] [nvarchar](250) NULL,
	[TransporterName] [nvarchar](250) NULL,
	[TransporterCost] [int] NULL,
	
	
	
	[IsCompleted] [bit] default(0) NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] default(0) NULL
)


CREATE TABLE [dbo].[ExportDispatchedTrain](
	[ID] [int] IDENTITY(1,1) Primary Key NOT NULL ,
	[OrderId] [int]  NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[ContainerType] [nvarchar](500)  NULL,
	[CRO] [nvarchar](250) NULL,

	[TrainID] [nvarchar] (50) NULL,
	[DispatchedOfDate] [datetime] NULL,
	[WagonNo] [nvarchar](250) NULL,
	[RRNo] [nvarchar](250) NULL,
	[EngineNo] [nvarchar](250) NULL,
	[ShipperName] [nvarchar](250) NULL,
	[WagonType] [nvarchar](250) NULL,
	[ReDispatched] [nvarchar](100) NULL,
	[CargoWeight] [nvarchar](250) NULL,
	[TareWeight] [nvarchar](250) NULL,
	
	
	[IsCompleted] [bit] default(0) NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] default(0) NULL
)

   -------------18-03-2022----------------

CREATE TABLE [dbo].[ExportDispatchedTruck](
	[ID] [int] IDENTITY(1,1) Primary Key NOT NULL ,
	[OrderId] [int]  NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[ContainerType] [nvarchar](500) NOT NULL,
	[CRO] [nvarchar](250)  NULL,

	[TruckNo] [nvarchar] (150) NULL,
	[DateOfDispatched] [datetime] NULL,
	[CustomerName] [nvarchar](250) NULL,
	[TruckContactNo] [nvarchar](250) NULL,
	[BiltyNo] [nvarchar](250) NULL,
	[DeliveryLocation] [nvarchar](250) NULL,
	
	
	[IsCompleted] [bit] default(0) NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] default(0) NULL
)



CREATE TABLE [dbo].[ExportReDispatched](
	[ID] [int] IDENTITY(1,1) Primary Key NOT NULL ,
	[OrderId] [int]  NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[ContainerType] [nvarchar](500) NOT NULL,
	[CRO] [nvarchar](250) NULL,

	[TransporterName] [nvarchar] (250) NULL,
	[VehicleNo] [nvarchar] (250) NULL,
	[CustomerName] [nvarchar](250) NULL,
	[TruckingCost] [int] NULL,
	
	
	
	[IsCompleted] [bit] default(0) NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] default(0) NULL
)
---------------Last ran 18-03-2022

CREATE TABLE [dbo].[ExportDelivery](
	[ID] [int] IDENTITY(1,1) Primary Key NOT NULL ,
	[OrderId] [int]  NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[ContainerType] [nvarchar](500) NOT NULL,
	[CRO] [nvarchar](250) NULL,

	[VehicleNo] [nvarchar] (250) NULL,
	[TruckNo] [nvarchar] (150) NULL,
	[WagonNo] [nvarchar](250) NULL,
	[DeliveryDate] [datetime] NULL,
	
	[IsCompleted] [bit] default(0) NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] default(0) NULL
)

Go

CREATE TABLE [dbo].[GenerateOrder](
	[OrderID] [int] IDENTITY(1,1) Primary key NOT NULL,
	[OrderNo] [varchar](9) NULL,
	[CustomerID] [int] NULL,
	[BusinessDivisionId] [int] NULL,
	[OrderType] [nvarchar](20) NULL,
	[BL] [nvarchar](50) NULL,
	[CRO] [nvarchar](50) NULL,
	[InBond_Number] [nvarchar](50) NULL,
	[DeliveryNo] [nvarchar](50) NULL,
	[TwentyContainerQty] [int] NULL,
	[FortyContainerQty] [int] NULL,
	[TwentyContainerPrice] [nvarchar](250) NULL,
	[FortyContainerPrice] [nvarchar](250) NULL,
	[OrderDate] [date] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[isActive] [bit] NULL,
	[InvoiceAmount] [numeric](18, 0) NULL,
	[isCompleted] [bit] NULL,
	[ShippingLineId] [int] NULL,
	[ShippingAgentId] [int] NULL,
	[FreeDays] [int] NULL,
	[Remarks] [nvarchar](1000) NULL,
	[VesselBerthingDate] [datetime] NULL,
	[BookingPOCName] [nvarchar](250) NULL
) 
             --Last Run---- 22-03-2022----
GO
CREATE TABLE [dbo].[BAShippingLine](
	[BLShippingID] [int] IDENTITY(1,1) primary key NOT NULL,
	[BL] [nvarchar](50) NULL,
	[Approval] [bit] NULL,
	[Collect] [int] NOT NULL,
	[NumberOfOrignalBL] [nvarchar](50) NULL,
	[Shipper] [nvarchar](max) NULL,
	[Consignee] [nvarchar](max) NULL,
	[NotifyParty] [nvarchar](max) NULL,
	[precarriageby] [nvarchar](50) NULL,
	[ForwardingAgent] [nvarchar](250) NULL,
	[FinalDestination] [nvarchar](250) NULL,
	[placeofreceipt] [nvarchar](50) NULL,
	[OceanVessel] [nvarchar](50) NULL,
	[VoyNo] [nvarchar](20) NULL,
	[Portoflanding] [nvarchar](50) NULL,
	[PortofDischarge] [nvarchar](50) NULL,
	[PlaceOfIssue] [nvarchar](250) NULL,
	[DateOfIssue] [datetime] NULL,
	[PlaceOfDelivery] [nvarchar](50) NULL,
	[ContainerNo] [nvarchar](max) NULL,
	[SealNo] [varchar](50) NULL,
	[NumberOfConatinerPack] [nvarchar](max) NULL,
	[KindOfPackagesDescriptionOfGoods] [nvarchar](max) NULL,
	[GrossWeight] [nvarchar](50) NULL,
	[NetWeight] [nvarchar](50) NULL,
	[Frightandcharges] [nvarchar](50) NULL,
	[TypeOfService] [nvarchar](50) NULL,
	[BLAgent] [nvarchar](700) NULL,
	[FrightPayable] [nvarchar](50) NULL,
	[placeOfDateofIssue] [datetime] NULL,

	[IsCompleted] [bit] default(0) NULL,
	[UserID] [varchar](50) NULL,
	[UpdateBy] [varchar](50) NULL,
	[CreateDate] [varchar](50) NULL,
	[UpdateDate] [varchar](50) NULL,
	)

Drop Table BAShippingLine

--- 24-03-2022--
USE [ERPMVC]
GO

/****** Object:  Table [dbo].[GenerateOrder]    Script Date: 3/24/2022 2:36:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GenerateOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](9) NULL,
	[CustomerID] [int] NULL,
	[BusinessDivisionId] [int] NULL,
	[OrderType] [nvarchar](20) NULL,
	[BL] [nvarchar](50) NULL,
	[CRO] [nvarchar](50) NULL,
	[InBond_Number] [nvarchar](50) NULL,
	[DeliveryNo] [nvarchar](50) NULL,
	[TwentyContainerQty] [int] NULL,
	[FortyContainerQty] [int] NULL,
	[TwentyContainerPrice] [nvarchar](250) NULL,
	[FortyContainerPrice] [nvarchar](250) NULL,
	[OrderDate] [date] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[isActive] [bit] NULL,
	[InvoiceAmount] [numeric](18, 0) NULL,
	[isCompleted] [bit] NULL,
	[ShippingLineId] [int] NULL,
	[ShippingAgentId] [int] NULL,
	[FreeDays] [int] NULL,
	[Remarks] [nvarchar](1000) NULL,
	[VesselBerthingDate] [datetime] NULL,
	[BookingPOCName] [nvarchar](250) NULL,
	[DOGuarantee] [datetime] NULL,
	[ImportEIR] [datetime] NULL,
	[PortWeighment] [datetime] NULL,
	[OutSidePortWeighment] [datetime] NULL,
	[GD] [datetime] NULL,
	[BLDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


---- 12--04-2022 -----



USE [ERPMVC]
GO

/****** Object:  Table [dbo].[ExportBookingOrder]    Script Date: 4/12/2022 10:31:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExportBookingOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[DateOfBooking] [datetime] NULL,
	[Forwarder] [nvarchar](500) NULL,
	[ShipperName] [nvarchar](500) NULL,
	[ShipperContact] [nvarchar](250) NULL,
	[TwentyContainerQty] [int] NULL,
	[FortyContainerQty] [int] NULL,
	[TwentyContainerPrice] [nvarchar](250) NULL,
	[FortyContainerPrice] [nvarchar](250) NULL,
	[RateOfTransportation] [nvarchar](250) NULL,
	[PointOfLoadingStation] [nvarchar](250) NULL,
	[IsCompleted] [bit] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[CRO] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExportBookingOrder] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO

ALTER TABLE [dbo].[ExportBookingOrder] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO


-------------------------------------------------------------------------------------------------

USE [ERPMVC]
GO

/****** Object:  Table [dbo].[ExportLogistic]    Script Date: 4/12/2022 10:29:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExportLogistic](
	[LogisticId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ContainerNo] [nvarchar](250) NULL,
	[ContainerType] [nvarchar](500) NULL,
	[ContainerSize] [nvarchar](20) NULL,
	[EGNo] [nvarchar](250) NULL,
	[CRO] [nvarchar](250) NULL,
	[vessel] [nvarchar](250) NULL,
	[Voyage] [nvarchar](250) NULL,
	[ETD] [datetime] NULL,
	[VesselCutOff] [datetime] NULL,
	[ShippingLine] [nvarchar](500) NULL,
	[ClearingAgentName] [nvarchar](250) NULL,
	[CAContactNo] [nvarchar](250) NULL,
	[RefrenceContainer] [nvarchar](250) NULL,
	[BookingPort] [nvarchar](50) NULL,
	[ModeOfTransportation] [nvarchar](20) NULL,
	[DateOfReceivingCargo] [datetime] NULL,
	[PreDispatched] [bit] NULL,
	[Status] [nvarchar](50) NULL,
	[IsCompleted] [bit] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__ExportLo__FAAA7286A55F933F] PRIMARY KEY CLUSTERED 
(
	[LogisticId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExportLogistic] ADD  CONSTRAINT [DF__ExportLog__IsCom__2C1E8537]  DEFAULT ((0)) FOR [IsCompleted]
GO

ALTER TABLE [dbo].[ExportLogistic] ADD  CONSTRAINT [DF__ExportLog__IsDel__2D12A970]  DEFAULT ((0)) FOR [IsDeleted]
GO


----------------------------------------------------------------------------------------------------------------
USE [ERPMVC]
GO

/****** Object:  Table [dbo].[ExportPreDispatched]    Script Date: 4/12/2022 10:32:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExportPreDispatched](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[RefrenceContainer] [nvarchar](250) NULL,
	[CRO] [nvarchar](250) NULL,
	[PickupFrom] [datetime] NULL,
	[VehicleNo] [nvarchar](250) NULL,
	[TransporterName] [nvarchar](250) NULL,
	[TransporterCost] [int] NULL,
	[IsCompleted] [bit] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__ExportPr__3214EC273D43D7C8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExportPreDispatched] ADD  CONSTRAINT [DF__ExportPre__IsCom__2FEF161B]  DEFAULT ((0)) FOR [IsCompleted]
GO

ALTER TABLE [dbo].[ExportPreDispatched] ADD  CONSTRAINT [DF__ExportPre__IsDel__30E33A54]  DEFAULT ((0)) FOR [IsDeleted]
GO


--------------------------------------------------------------------------------------------------------------------------------

USE [ERPMVC]
GO

/****** Object:  Table [dbo].[ExportDispatchedTrain]    Script Date: 4/12/2022 10:32:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExportDispatchedTrain](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[ContainerType] [nvarchar](500) NULL,
	[RefrenceContainer] [nvarchar](250) NULL,
	[CRO] [nvarchar](250) NULL,
	[TrainID] [nvarchar](50) NULL,
	[DispatchedOfDate] [datetime] NULL,
	[WagonNo] [nvarchar](250) NULL,
	[RRNo] [nvarchar](250) NULL,
	[EngineNo] [nvarchar](250) NULL,
	[ShipperName] [nvarchar](250) NULL,
	[WagonType] [nvarchar](250) NULL,
	[ReDispatched] [nvarchar](100) NULL,
	[CargoWeight] [nvarchar](250) NULL,
	[TareWeight] [nvarchar](250) NULL,
	[IsCompleted] [bit] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__ExportDi__3214EC27C32C015A] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExportDispatchedTrain] ADD  CONSTRAINT [DF__ExportDis__IsCom__33BFA6FF]  DEFAULT ((0)) FOR [IsCompleted]
GO

ALTER TABLE [dbo].[ExportDispatchedTrain] ADD  CONSTRAINT [DF__ExportDis__IsDel__34B3CB38]  DEFAULT ((0)) FOR [IsDeleted]
GO


-----------------------------------------------------------------------------------------------------------------------

USE [ERPMVC]
GO

/****** Object:  Table [dbo].[ExportDispatchedTruck]    Script Date: 4/12/2022 10:33:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExportDispatchedTruck](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[ContainerType] [nvarchar](500) NOT NULL,
	[RefrenceContainer] [nvarchar](250) NULL,
	[CRO] [nvarchar](250) NULL,
	[TruckNo] [nvarchar](150) NULL,
	[DateOfDispatched] [datetime] NULL,
	[CustomerName] [nvarchar](250) NULL,
	[TruckContactNo] [nvarchar](250) NULL,
	[BiltyNo] [nvarchar](250) NULL,
	[DeliveryLocation] [nvarchar](250) NULL,
	[IsCompleted] [bit] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__ExportDi__3214EC279A735F33] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExportDispatchedTruck] ADD  CONSTRAINT [DF__ExportDis__IsCom__379037E3]  DEFAULT ((0)) FOR [IsCompleted]
GO

ALTER TABLE [dbo].[ExportDispatchedTruck] ADD  CONSTRAINT [DF__ExportDis__IsDel__38845C1C]  DEFAULT ((0)) FOR [IsDeleted]
GO


--------------------------------------------------------------------------------------------------------------------------------

USE [ERPMVC]
GO

/****** Object:  Table [dbo].[ExportReDispatched]    Script Date: 4/12/2022 10:35:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExportReDispatched](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[ContainerType] [nvarchar](500) NOT NULL,
	[RefrenceContainer] [nvarchar](250) NULL,
	[CRO] [nvarchar](250) NULL,
	[TransporterName] [nvarchar](250) NULL,
	[VehicleNo] [nvarchar](250) NULL,
	[CustomerName] [nvarchar](250) NULL,
	[TruckingCost] [int] NULL,
	[IsCompleted] [bit] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__ExportRe__3214EC27F14A9E1B] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExportReDispatched] ADD  CONSTRAINT [DF__ExportReD__IsCom__3B60C8C7]  DEFAULT ((0)) FOR [IsCompleted]
GO

ALTER TABLE [dbo].[ExportReDispatched] ADD  CONSTRAINT [DF__ExportReD__IsDel__3C54ED00]  DEFAULT ((0)) FOR [IsDeleted]
GO


------------------------------------------------------------------------------------------------------------------------------
USE [ERPMVC]
GO

/****** Object:  Table [dbo].[ExportDelivery]    Script Date: 4/12/2022 10:36:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExportDelivery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderNo] [varchar](9) NOT NULL,
	[ContainerNo] [nvarchar](250) NOT NULL,
	[ContainerSize] [nvarchar](250) NOT NULL,
	[ContainerType] [nvarchar](500) NOT NULL,
	[RefrenceContainer] [nvarchar](250) NULL,
	[CRO] [nvarchar](250) NULL,
	[VehicleNo] [nvarchar](250) NULL,
	[TruckNo] [nvarchar](150) NULL,
	[WagonNo] [nvarchar](250) NULL,
	[DeliveryDate] [datetime] NULL,
	[IsCompleted] [bit] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__ExportDe__3214EC27BD4628B3] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExportDelivery] ADD  CONSTRAINT [DF__ExportDel__IsCom__48BAC3E5]  DEFAULT ((0)) FOR [IsCompleted]
GO

ALTER TABLE [dbo].[ExportDelivery] ADD  CONSTRAINT [DF__ExportDel__IsDel__49AEE81E]  DEFAULT ((0)) FOR [IsDeleted]
GO


CREATE TABLE [dbo].[BLApproval](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Approval] [nvarchar](250) NULL,
	[ContainerNo] [nvarchar](250) NULL,
	[BLnumber] [nvarchar](250) NOT NULL,
	[SealNo] [nvarchar](250) NULL,
	[IsCompleted] [bit] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[BLShippingContainerDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContainerNo] [nvarchar](250) NULL,
	[SealNo] [nvarchar](250) NULL,
	[Bl] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ShippingContainerDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

alter table Logistics add [ReferenceContainer] [nvarchar](250) NULL
GO
alter table DispatchedOrder add [ReferenceContainer] [nvarchar](250) NULL
Go

---- sp For 22-04-2022 ----

 alter proc SP_GetContainerWiseInvoice(@BL nvarchar(100))--SP_GetContainerWiseInvoice 'A9022011439'
 as

 SELECT GenerateOrder.OrderType, GenerateOrder.BL, GenerateOrder.InvoiceAmount, GenerateOrder.Remarks, Logistics.ContainerSize, 
 Logistics.ContainerWeight, DispatchedOrder.ContainerNo, DispatchedOrder.WagonNo, BACustomerRegistration.Customer_Name
 FROM   ERPMVC.dbo.Logistics Logistics INNER JOIN (ERPMVC.dbo.DispatchedOrder DispatchedOrder 
 INNER JOIN ERPMVC.dbo.GenerateOrder GenerateOrder ON DispatchedOrder.OrderId=GenerateOrder.OrderID) ON Logistics.OrderId=GenerateOrder.OrderID
 INNER JOIN BACustomerRegistration on BACustomerRegistration.CustomerID = GenerateOrder.CustomerID
 where GenerateOrder.BL=@BL

GO
alter table ExportBookingOrder add InvoiceNo [nvarchar](50) NULL
update GenerateOrder set isCompleted=0, InvoiceNo=null where InvoiceNo is not null
update ExportBookingOrder set isCompleted=0, InvoiceNo=null where InvoiceNo is not null

---- Aleem 11-05-2022 ----
GO
CREATE TABLE [dbo].[OrderContainer](
	[ID] [int] primary key IDENTITY(1,1) NOT NULL ,
	[OrderID] int not null,
	[ContainerNo] [nvarchar](250) NULL,
	[ContainerSize] [nvarchar](50) NULL,
	[ContainerWeight] int NULL,
	[OrderType] nvarchar(50) null
)
 ------- Haris 14/05/2022 ---------
Go
Drop Table Menu

Go 

CREATE TABLE [dbo].[Menu](
	[MenuId] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](250) NULL,
	[Url] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Menu__C99ED2304AC94DF3] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (1, N'BL Listing', N'/BLShippingLine/Index', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (2, N'Inventory Container', N'/DropDownMenu/BLShippingContainer', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (3, N'BLApproval', N'/BLShippingLine/BLApproval', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (4, N'VehicleRegistration', N'/BVMS/VehicleRegistration', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (5, N'EmployeeDetails', N'/HumanResourceManagment/EmployeeDetails', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (6, N'Expenses', N'/DropDownMenu/Expenses', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (7, N'Vendor', N'/Vendor/Index', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (8, N'Country', N'/Country/Index', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (9, N'Shipping Agent', N'/DropDownMenu/ShippingAgent', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (10, N'Shipping Line', N'/DropDownMenu/ShippingLine', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (11, N'EmptyDropOff Location', N'/DropDownMenu/EmptyDropOffLoc', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (12, N'Department', N'/Department/Index', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (13, N'City', N'/City/Index', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (14, N'BusinessDivision', N'/BusinessDivision/Index', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (15, N'Designation', N'/Designation/Index', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (16, N'Facility', N'/DropDownMenu/Facility', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (17, N'Location', N'/DropDownMenu/Location', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (18, N'Oil', N'/Setup/Oil', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (19, N'OilInvoiceDetail', N'/Setup/OilInvoiceDetail', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (20, N'Import Create Order', N'/OrderBooking/Index', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (21, N'Import OrderListing', N'/OrderBooking/OrderList', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (22, N'Train Import Order Report', N'/OrderExecution/TrainReport', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (23, N'Import Booking Truck Report', N'/OrderExecution/ImportOrderReportTruck', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (24, N'Import Booking Train Report', N'/OrderExecution/ImportOrderReport', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (25, N'Import PreDispatched', N'/OrderExecution/PreDispatched', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (26, N'Import Dispatched(Train)', N'/OrderExecution/Dispatched', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (27, N'Import Dispatched(Truck)', N'/OrderExecution/DispatchedTruck', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (28, N'Import InTransact(Train)', N'/OrderExecution/InTransactTrain', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (29, N'Import Re-Dispatched(Train)', N'/OrderExecution/ReDispatched', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (30, N'Import Delivery(Train)', N'/OrderExecution/DeliveryTrain', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (31, N'Import Delivery(Truck)', N'/OrderExecution/DeliveryTruck', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (32, N'Import EmptyDropOff', N'/OrderExecution/EmptyDropOff', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (33, N'Export CreateOrder', N'/OrderBooking/ExportOrder', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (34, N'Export OrderListing', N'/OrderBooking/ExportOrderList', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (35, N'Export PreDispatched', N'/OrderExecution/ExportPreDispatched', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (36, N'Export Dispatched(Train)', N'/OrderExecution/ExportDispatchedTrain', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (37, N'Export Dispatched(Truck)', N'/OrderExecution/ExportDispatchedTruck', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (40, N'Export ReDispatched', N'/OrderExecution/ExportReDispatched', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (41, N'Export Delivery', N'/OrderExecution/ExportDelivery', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (42, N'Customer Registration', N'/Customer/CustomerRegistration', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (43, N'Pricing', N'/CustomerPrice/index', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (44, N'Logistic Operations', N'/sales/LocalLogisticOperation', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (45, N'Trip Detail', N'/sales/TripDetails', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (46, N'UpComingTrips', N'/sales/UpCommingTrips', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (47, N'Print Report', N'/Invoices/PrintReportLogistics', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (48, N'Generate Invoice', N'/Invoices/InvoiceGeneration', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (49, N'Print Order Invoice', N'/OrderBooking/BLOrCROReport', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (50, N'Print Invoice', N'/Invoices/LogisticInvoice', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (51, N'Print Invoice Report', N'/Invoices/LogisticInvoiceReport', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (52, N'User Registration', N'/Account/Register', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (53, N'Role', N'/Role/CreateRole', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (54, N'Menu', N'/Account/Menu', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (55, N'Permission', N'/Account/Permission', 0)
INSERT [dbo].[Menu] ([MenuId], [MenuName], [Url], [IsDeleted]) VALUES (56, N'Assign User-Menu', N'/Role/AssignMenu', 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO


	CREATE TABLE [dbo].[MenuAssignment](
	[Id] [int] IDENTITY(1,1) Primary key NOT NULL,
	[MenuId] [int] Not NULL,
	[UserId] nvarchar(128) Not NULL,
	[IsView] [bit] NULL,
	[IsDeleted] [bit] NULL
	)

	
GO
/****** Object:  Table [dbo].[ShippingAgent]    Script Date: 5/24/2022 5:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ShippingAgent](
	[ShippingAgentId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Line] [nvarchar](max) NULL,
	[LineCode] [nvarchar](max) NULL,
	[OtherCharges] [int] NOT NULL,
	[ChargesName] [nvarchar](max) NULL,
	[DeleteDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[BillDateType] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ShippingAgent] PRIMARY KEY CLUSTERED 
(
	[ShippingAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingLine]    Script Date: 5/24/2022 5:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ShippingLine](
	[ShippingLineId] [bigint] IDENTITY(1,1) NOT NULL,
	[ShippingLineName] [nvarchar](max) NULL,
	[ShippingLineCode] [nvarchar](max) NULL,
	[ShippingLineAgent] [nvarchar](max) NULL,
	[DeleteDate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ShippingLine] PRIMARY KEY CLUSTERED 
(
	[ShippingLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleRegistrationDetail]    Script Date: 5/24/2022 5:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VehicleRegistrationDetail](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[Vehicle_Number] [varchar](20) NULL,
	[VehicleTypeID] [int] NOT NULL,
	[VehicleColor] [varchar](50) NULL,
	[VehicleEngineNo] [varchar](50) NULL,
	[VehicleChassisNO] [varchar](50) NULL,
	[VehicleName] [varchar](250) NULL,
	[IsActive] [bit] NULL,
	[UserID] [varchar](50) NULL,
	[UpdateBy] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[TTID] [int] NULL,
	[AxelType] [varchar](50) NULL,
	[TireQuantity] [int] NULL,
	[CreatedBy] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ShippingAgent] ON 

INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50029, N'CIRRUS INTERNATIONAL VEHICLE', N'CIRRUS INTERNATIONAL VEHICLE', N'1', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50030, N'OVERSEAS TRANSIT AGENCY (PVT) LTD.', N'OVERSEAS TRANSIT AGENCY (PVT) LTD.', N'2', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50031, N'GLOBELINK PAKISTAN (PVT) LTD.', N'GLOBELINK PAKISTAN (PVT) LTD.', N'3', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50032, N'QUALITY FREIGHT SYSTEMS', N'QUALITY FREIGHT SYSTEMS', N'4', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50033, N'EM-A SHIPPING AGENCIES', N'EM-A SHIPPING AGENCIES', N'5', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50034, N'MIT LOGISTICS', N'MIT LOGISTICS', N'6', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50035, N'ARUAMZ SHIPPING', N'ARUAMZ SHIPPING', N'7', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50036, N'EMIRATES LOGISTICS', N'EMIRATES LOGISTICS', N'8', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50037, N'SEAGOLD PVT LTD', N'SEAGOLD PVT LTD', N'9', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50038, N'FOCUS SHIPPING', N'FOCUS SHIPPING', N'10', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50039, N'FREIGHT CONNECTION', N'FREIGHT CONNECTION', N'11', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50040, N'ACTIVE FREIGHT SERVICES PVT. LTD', N'ACTIVE FREIGHT SERVICES PVT. LTD', N'12', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50041, N'TRANSBRIDGE LOGISTICS PAKISTAN', N'TRANSBRIDGE LOGISTICS PAKISTAN', N'13', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50042, N'LOGISTIC SOLUTION', N'LOGISTIC SOLUTION', N'14', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50043, N'SEAGULL SHIPPING', N'SEAGULL SHIPPING', N'15', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50044, N'JAGUAR SHIPPING LINE (PVT) LTD.', N'JAGUAR SHIPPING LINE (PVT) LTD.', N'16', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50045, N'SHIPCO TRANSPORT PAKISTAN', N'SHIPCO TRANSPORT PAKISTAN', N'17', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50046, N'PAKLINK SHIPPING SERVICES', N'PAKLINK SHIPPING SERVICES', N'18', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50047, N'PORT LINK INTERNATIONAL SERVICES (PVT) LTD', N'PORT LINK INTERNATIONAL SERVICES (PVT) LTD', N'19', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50048, N'GREENPAK SHIPPING (PVT) LIMITED', N'GREENPAK SHIPPING (PVT) LIMITED', N'20', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50049, N'SEATRANS LOGISTICS CO. LTD', N'SEATRANS LOGISTICS CO. LTD', N'21', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50050, N'INTERNATIONAL CARGO MANAGEMENT', N'INTERNATIONAL CARGO MANAGEMENT', N'22', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50051, N'INTERNATIONAL FREIGHT SERVICES & LOGISTICS SERVICES', N'INTERNATIONAL FREIGHT SERVICES & LOGISTICS SERVICES', N'23', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50052, N'SHARAF SHIPPING AGENCY (PVT) LTD', N'SHARAF SHIPPING AGENCY (PVT) LTD', N'24', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50053, N'Freight Hub Total Logistics Solutions', N'Freight Hub Total Logistics Solutions', N'25', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50054, N'SUPREME SCM PVT LTD', N'SUPREME SCM PVT LTD', N'26', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50055, N'MERCHANT SHIPPING PVT LTD', N'MERCHANT SHIPPING PVT LTD', N'27', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50056, N'MARLIN MARINE LOGISTICS', N'MARLIN MARINE LOGISTICS', N'28', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50057, N'SYNERGY FREIGHT INTERNATIONAL', N'SYNERGY FREIGHT INTERNATIONAL', N'29', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50058, N'SEA TRADE INTERNATIONAL', N'SEA TRADE INTERNATIONAL', N'30', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50059, N'WMA SHIPCARE SERVICES PVT LTD', N'WMA SHIPCARE SERVICES PVT LTD', N'31', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50060, N'SEA HAWK SHIPPING LINE PVT LTD', N'SEA HAWK SHIPPING LINE PVT LTD', N'32', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50061, N'GATE WAY SHIPPING', N'GATE WAY SHIPPING', N'33', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50062, N'FACILITIES SHIPPING AGENCY PVT LTD.', N'FACILITIES SHIPPING AGENCY PVT LTD.', N'34', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50063, N'BAYWEST (PVT) LTD', N'BAYWEST (PVT) LTD', N'35', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50064, N'SM TRADERS', N'SM TRADERS', N'36', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50065, N'PRINCE ENTERPRISE', N'PRINCE ENTERPRISE', N'37', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50066, N'ZAS SHIPPING PVT LTD', N'ZAS SHIPPING PVT LTD', N'38', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50067, N'UNITED SPECTRUM AGENCIES', N'UNITED SPECTRUM AGENCIES', N'39', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50068, N'AVENTIS INTERNATIONAL SHIPPING & LOGISTICS', N'AVENTIS INTERNATIONAL SHIPPING & LOGISTICS', N'40', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50069, N'DYNAMIC', N'DYNAMIC', N'41', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50070, N'CP WORLD CO', N'CP WORLD CO', N'42', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50071, N'CSS PAKISTAN PVT. LTD.', N'CSS PAKISTAN PVT. LTD.', N'43', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50072, N'PENANSHIN SHIPPING PAKISTAN', N'PENANSHIN SHIPPING PAKISTAN', N'44', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50073, N'SEA FREIGHT NATION', N'SEA FREIGHT NATION', N'45', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50074, N'PRINCE ENT.', N'PRINCE ENT.', N'46', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50075, N'IRFAN IMPEX', N'IRFAN IMPEX', N'47', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50076, N'SHERRY TRADERS', N'SHERRY TRADERS', N'48', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50077, N'TRANSNET SHIPPING', N'TRANSNET SHIPPING', N'49', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50078, N'HAMZA & BROTHERS', N'HAMZA & BROTHERS', N'50', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50079, N'NEWS LOGISTICS', N'NEWS LOGISTICS', N'51', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50080, N'RANKS LOGISTICS PAKISTAN PVT LTD', N'RANKS LOGISTICS PAKISTAN PVT LTD', N'52', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50081, N'GSLL AGENCIES PAKISTAN', N'GSLL AGENCIES PAKISTAN', N'53', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50082, N'CMA CGM PVT LTD', N'CMA CGM PVT LTD', N'54', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50083, N'SEA BLUE LOGISTICS', N'SEA BLUE LOGISTICS', N'55', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50084, N'T.K. CORPORATION (PVT) LTD', N'T.K. CORPORATION (PVT) LTD', N'56', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50085, N'WATERLINK PAKISTAN', N'WATERLINK PAKISTAN', N'57', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50086, N'CONNECT FREIGHT SERVICES', N'CONNECT FREIGHT SERVICES', N'58', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50087, N'RAVIAN INTERNATIONAL AGENCIES PAKISTAN', N'RAVIAN INTERNATIONAL AGENCIES PAKISTAN', N'59', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50088, N'COMMANDER LOGISTICS INTERNATIONAL', N'COMMANDER LOGISTICS INTERNATIONAL', N'60', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50089, N'ONE WORLD SHIPPING PVT LTD', N'ONE WORLD SHIPPING PVT LTD', N'61', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50090, N'EMAAN & CO', N'EMAAN & CO', N'62', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50091, N'QUICK FREIGHT MANAGEMENT PAKISTAN', N'QUICK FREIGHT MANAGEMENT PAKISTAN', N'63', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50092, N'QUALITY TRANSPORT PAKISTAN', N'QUALITY TRANSPORT PAKISTAN', N'64', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50093, N'FREIGHT WORLD PAKISTAN', N'FREIGHT WORLD PAKISTAN', N'65', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50094, N'SNS SHIPPING AGENCY', N'SNS SHIPPING AGENCY', N'66', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50095, N'PGT SHIPPING', N'PGT SHIPPING', N'67', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50096, N'BILAL BROTHER INDUSTRIES', N'BILAL BROTHER INDUSTRIES', N'68', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50097, N'FOCUS SHIPPING - LCL', N'FOCUS SHIPPING - LCL', N'69', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50098, N'TRI- ANGLE ELECTRONICS', N'TRI- ANGLE ELECTRONICS', N'70', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50099, N'PEOPLE’S SERVICES', N'PEOPLE’S SERVICES', N'71', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50100, N'RAJA CARGO SERVICE', N'RAJA CARGO SERVICE', N'72', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50101, N'AKTHAR CUSTOMS CLEARING AGENT', N'AKTHAR CUSTOMS CLEARING AGENT', N'73', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50102, N'KARAM E MUSTAFA', N'KARAM E MUSTAFA', N'74', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50103, N'ZAS SHIPPING PVT LTD - LCL', N'ZAS SHIPPING PVT LTD - LCL', N'75', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50104, N'TRADE SERVICE', N'TRADE SERVICE', N'76', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50105, N'BEST CLOTHINGS', N'BEST CLOTHINGS', N'77', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50106, N'RAHEEL BROTHER', N'RAHEEL BROTHER', N'78', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50107, N'ASHRAF ENTERPRISE', N'ASHRAF ENTERPRISE', N'79', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50108, N'AWAN & AGHA', N'AWAN & AGHA', N'80', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50109, N'AMPLE SHIPPING & LOGISTIC SERVICES', N'AMPLE SHIPPING & LOGISTIC SERVICES', N'81', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50110, N'SW SHIPPING', N'SW SHIPPING', N'82', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50111, N'NAVEED ENTERPRISES', N'NAVEED ENTERPRISES', N'83', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50112, N'FACILITIES SHIPPING AGENCY PVT LTD - CY', N'FACILITIES SHIPPING AGENCY PVT LTD - CY', N'84', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50113, N'SKY SHIPPING', N'SKY SHIPPING', N'85', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50114, N'ALLIED CONTAINER LINE', N'ALLIED CONTAINER LINE', N'86', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50115, N'ROYAL SHIPPING & LOGISTICS.', N'ROYAL SHIPPING & LOGISTICS.', N'87', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50116, N'CARGO SHIPPING & LOGISTICS', N'CARGO SHIPPING & LOGISTICS', N'88', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50117, N'TECHNO FREIGHT PAKISTAN', N'TECHNO FREIGHT PAKISTAN', N'89', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50118, N'INFINITY SHIPPING', N'INFINITY SHIPPING', N'90', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50119, N'FIH LOGISTICS', N'FIH LOGISTICS', N'91', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50120, N'TRANSPARENCY SHIPPING PAKISTAN', N'TRANSPARENCY SHIPPING PAKISTAN', N'92', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50121, N'TRANS LOGISTICS', N'TRANS LOGISTICS', N'93', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50122, N'ZALAAN SOLUTIONS (PVT.)', N'ZALAAN SOLUTIONS (PVT.)', N'94', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50123, N'GALAXY FREIGHT FORWARDING', N'GALAXY FREIGHT FORWARDING', N'95', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50124, N'APPLE CONSOLIDATION', N'APPLE CONSOLIDATION', N'96', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'Destuffed', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50125, N'MSC AGENCY PAKISTAN (PVT) LTD', N'MSC AGENCY PAKISTAN (PVT) LTD', N'97', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50126, N'GREENPAK SHIPPING', N'GREENPAK SHIPPING', N'98', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50127, N'FORBES SHIPPING', N'FORBES SHIPPING', N'99', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
GO
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50128, N'WESTERN FREIGHT SHIPPING', N'WESTERN FREIGHT SHIPPING', N'100', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50129, N'GALAXY FREIGHT FORWARDING - LCL.', N'GALAXY FREIGHT FORWARDING - LCL.', N'101', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (50130, N'SHIPPING', N'SHIPPING', N'102', 0, NULL, CAST(N'2021-04-07T13:26:49.2053686' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60061, N'GLOBAL CONSOLIDATOR', N'GLOBAL CONSOLIDATOR', N'103', 0, N'NULL', CAST(N'2021-04-15T14:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60062, N'OVERSEASE SHIPPER', N'OVERSEASE SHIPPER', N'104', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60063, N'SERVOTECH SHIPPING', N'SERVOTECH SHIPPING', N'105', 0, N'NULL', CAST(N'2021-04-07T00:00:00.0000000' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60064, N'IDEAL TRADING', N'IDEAL TRADING', N'106', 0, NULL, CAST(N'2021-05-01T07:41:53.6731003' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60065, N'GHAZI ENTERPRISES (1909)', NULL, NULL, 0, NULL, CAST(N'2021-05-01T07:53:24.8605618' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60066, N'RAVIAN INTERNATIONAL AGENCIES PAKISTAN - CY', N'RAVIAN INTERNATIONAL AGENCIES PAKISTAN - CY', N'107', 0, NULL, CAST(N'2021-05-07T06:46:49.3809466' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60067, N'AXL CONTAINER LINE PVT L;TD', NULL, NULL, 0, NULL, CAST(N'2021-06-02T14:11:20.5738605' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60068, N'M.R. TRADERS ', N'M.R. TRADERS ', N'MRT', 0, NULL, CAST(N'2021-07-10T12:40:57.7587227' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60069, N'PACIFIC DELTA SHIPPING (PVT.) LTD.', N'PACIFIC DELTA SHIPPING (PVT.) LTD.', N'0', 0, NULL, CAST(N'2021-07-24T14:47:34.6807887' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60070, N'ALLIED LOGISTICS', NULL, N'0', 0, NULL, CAST(N'2021-09-25T10:27:54.2582638' AS DateTime2), 0, N'GateIn', NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60074, N'N/A', N'N/A', NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60077, N'SAS PAK', N'SAS PAK', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60078, N'ATIQUE TRADING CO', N'ATIQUE TRADING CO', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60079, N'BAIG AND SONS', N'BAIG AND SONS', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60080, N'IBRAHIM FIBER', N'IBRAHIM FIBER', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60081, N'MAX LOGISTICS', N'MAX LOGISTICS', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60082, N'ASAR CUSTOM CLEARANCE (MR. FAIZAN 0304-2100326)', N'ASAR CUSTOM CLEARANCE (MR. FAIZAN 0304-2100326)', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60083, N'FAZAL AHMED & SONS', N'FAZAL AHMED & SONS', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60084, N'SETHI COMMERCIAL AGENCIES', N'SETHI COMMERCIAL AGENCIES', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60085, N'TRADE PORT', N'TRADE PORT', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60086, N'FIVE M INTERNATIONAL', N'FIVE M INTERNATIONAL', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60087, N'OMAL SONS CORP', N'OMAL SONS CORP', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60088, N'MHQ', N'MHQ', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60089, N'SEALAND AGENCY', N'SEALAND AGENCY', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60090, N'HAMZA INTERNATIONAL', N'HAMZA INTERNATIONAL', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60091, N'SK Enterprises', N'SK Enterprises', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60092, N'NUDRAT AND CO', N'NUDRAT AND CO', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60093, N'BABA AGENCIES', N'BABA AGENCIES', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60094, N'MUSTAFA INTERNATIONAL', N'MUSTAFA INTERNATIONAL', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60095, N'UNIVERSAL CLEARING', N'UNIVERSAL CLEARING', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60096, N'EMPTY', N'EMPTY', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60097, N'SERVIS INDUSTRIES', N'SERVIS INDUSTRIES', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60098, N'FAHAD IMPEX', N'FAHAD IMPEX', N'0', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60099, N'THE MALIK ASSOCIATES', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60100, N'HASSAN ENTERPRICE', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60101, N'CAST PACKING FILMS', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60102, N'RIAZEDA (PVT) LTD', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60103, N'MUHAMMAD ALI', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60104, N'QUICK SHIPPER', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60105, N'AVISHAN INTERNATIONAL', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60106, N'MAMA ENTERPRICES ', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60107, N'SUFIYAN', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60108, N'NAYYER INDUSTRIES (PVT) LTD', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60109, N'HASEEB & CO', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60110, N'AK CORPORATION', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[ShippingAgent] ([ShippingAgentId], [Name], [Line], [LineCode], [OtherCharges], [ChargesName], [DeleteDate], [IsDeleted], [BillDateType], [CreatedBy], [CreatedDate]) VALUES (60111, N'SHAHID BROTHERS', NULL, NULL, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ShippingAgent] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingLine] ON 

INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (28, N'MEDITERRANIAN SHIPPING COMPANY', N'MSC', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (29, N'MODERN SHIPPING AGENCIES PRIVATE LIMITED', N'MSA', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (30, N'COSCO SHANGHAI', N'COS SHANGHAI', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (31, N'MAXICON CONTAINER LINE PTE LTD', N'MCL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (33, N'ANL SINGAPORE PTE LTD', N'ANL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (34, N'COMPAGNIE MARITIME DAFFRETEMENT', N'CMD', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (35, N'UNIVERSAL SHIPPING PVT LTD.', N'USL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (36, N'GLOBAL FEEDER SHIPPING', N'GFS', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (37, N'EVERGREEN LINE', N'ERNL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (38, N'WAN HAI LINES LTD', N'WHL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (39, N'HYUNDAI MERCHANT MARINE', N'HMM', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (40, N'KOREA MARINE TRANSPORT CONTAINERS', N'KMTC', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (41, N'AAA SHIPPING & LOGISTIC', N'AAASL', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (42, N'AAA SHIPPING & LOGISTICS PVT LTD', N'AAA', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (43, N'YANG MING MARINE TRANSPORT CORPORATION', N'YML', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (44, N'PERMA SHIPPING LINE UK LTD', N'PSL', NULL, CAST(N'2021-01-05T19:21:06.9617032' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (45, N'LAUREL NAVIGATION (MAURITIUS) LTD', N'LNL', NULL, CAST(N'2021-01-14T15:34:50.4573087' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (46, N'ECU LINE PAKISTAN PVT LTD', N'ECU', NULL, CAST(N'2021-01-21T00:18:07.7467330' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (47, N'MAERSK LINE', N'MAERSK LINE', NULL, CAST(N'2021-02-02T01:28:35.4350943' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (48, N'COMPAGINE INTERNATIONAL MARITIMOS', N'-', NULL, CAST(N'2021-03-24T19:12:54.6133557' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (49, N'CLEAR FREIGHT INTERNATIONAL', N'CFI', NULL, CAST(N'2021-03-25T02:48:57.4287801' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (50, N'WEST EUROPEAN CONTAINER LINES', N'009', NULL, CAST(N'2021-04-10T15:51:52.5420305' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (51, N'COASTAL CONTAINER LINES', N'CCL', NULL, CAST(N'2021-05-21T12:49:45.7795579' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (52, N'HAMBURG SUED CONTAINER LINE ', N'HSCL', NULL, CAST(N'2021-06-24T21:09:16.8895389' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (53, N'PAK LINER AGENCIES PVT LTD', N'PLA', NULL, CAST(N'2021-07-09T20:37:58.5530354' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (54, N'POLLUX & CASTOR INTERNATIONAL (FZC)', N'PCI', NULL, CAST(N'2021-07-30T22:51:36.6063571' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (55, N'T K C', N'T K CORPORATION', NULL, CAST(N'2021-08-13T16:32:05.8296947' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (56, N'FACILITIES SHIPPING AGENCY.', N'FSA', NULL, CAST(N'2021-08-13T21:01:07.9533813' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (57, N'PACIFIC INTERNATIONAL LINE', N'PIL', NULL, CAST(N'2021-09-08T05:01:06.6794872' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (59, N'CMA CGM', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (60, N'MSC', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (61, N'HLL', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (62, N'ONE', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (63, N'MSK', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (64, N'WAN HAI', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (65, N'YML', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (66, N'OOCL', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (67, N'EVERGREEN', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (68, N'UMA', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (69, N'HYUNDAI', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (70, N'AEGIST SHIPPING', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (71, N'CMA', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (72, N'EMC', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (73, N'REHMAT SHIPPING', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (74, N'UNIVERSAL', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (75, N'COSCO', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (76, N'EASTERN SEA', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (77, N'REGAL SHIPPING', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (78, N'CCL / AL REHMAT', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (79, N'FOCUS FREIGHT SOLUTION', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (80, N'ICM', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (81, N'TSJ', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (82, N'EMPTY', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (83, N'KMTC', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (84, N'OSL', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (85, N'SAMUDERA', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (86, N'HPL', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (87, N'MESSINA ', NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (88, N'SOC', NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (89, N'GOLD STAR LINE LTD', NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (90, N'CAPITAL AGENCY AGENCY', NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (91, N'BAY LINE ', NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (92, N'TSL', NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (93, N'MARKHOR ', NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[ShippingLine] ([ShippingLineId], [ShippingLineName], [ShippingLineCode], [ShippingLineAgent], [DeleteDate], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (94, N'BATLIC', NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ShippingLine] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleRegistrationDetail] ON 

INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (1, N'JS-4734', 5, N'Hydrolic Crane', N'JS-4734', N'84942', N'Hydrolic Crane', 1, NULL, N'arif', NULL, CAST(N'2020-03-07T17:40:06.197' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (2, N'JS-4741', 5, N'', N'', N'92256', N'Hydrolic Crane', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (3, N'JS-4743', 5, N'', N'', N'540183', N'Hydrolic Crane', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (4, N'JS-4897', 5, N'', N'75073', N'540215', N'Hydrolic Crane', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (5, N'JS-4828', 4, N'', N'C240-241255', N'020301M0785', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (6, N'JS-4829', 4, N'', N'C240-241276', N'020301M2012', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (7, N'JS-4968', 4, N'Forklifter', N'C240-P2464929', N'020301N5444', N'Forklifter', 1, NULL, N'sabor', NULL, CAST(N'2020-07-24T17:09:17.197' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (8, N'JS-4969', 4, N'Forklifter', N'C240-P244987G', N'020301N4443', N'Forklifter', 1, NULL, N'sabor', NULL, CAST(N'2020-07-24T17:08:07.873' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (9, N'JS-4970', 4, N'Forklifter', N'C240-P245004', N'020301N4444', N'Forklifter', 1, NULL, N'sabor', NULL, CAST(N'2020-07-24T17:08:26.850' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10, N'JS-4971', 4, N'Forklifter', N'C240-P2464637', N'020301N5443', N'Forklifter', 1, NULL, N'sabor', NULL, CAST(N'2020-07-24T17:08:50.393' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (11, N'LES-14-7985', 4, N'', N'224359', N'FD30C3Z2U831341', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (12, N'LES-14-7987', 4, N'', N'224360', N'FD30C3Z2U831342', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (13, N'JS-2158', 4, N'', N'D-107979', N'FDA50-10026', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (14, N'JS-1285', 4, N'', N'', N'', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (15, N'JS-3023', 4, N'', N'', N'', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (16, N'JS-3521', 4, N'', N'975058', N'E9374', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (17, N'JS-3581', 4, N'', N'965699', N'E0258', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (18, N'JS-5190', 4, N'', N'252858', N'020301Q4384', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (19, N'JS-5191', 4, N'', N'252897', N'020301Q4387', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (20, N'JS-5192', 4, N'', N'252900', N'020301Q4386', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (21, N'JS-5193', 4, N'', N'252828', N' 020301Q4385', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (22, N'JS-5194', 4, N'', N'B368012V', N'011001Q4193 ', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (23, N'JS-5195', 4, N'', N'6BG1QC-02E3893E1001E', N'011001Q4192', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (24, N'JS-5482', 4, N'', N'1DZ0061821', N'6FU30-60601', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (25, N'JS-5481', 4, N'', N'0061821', N'30K00825', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (26, N'JS-5483', 4, N'', N'511194', N'FD45T-134670', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (27, N'JS-5479', 4, N'', N'13Z-0032870', N'7FDA-5022029', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (28, N'JS-5478', 4, N'', N'4D941E-07692', N'M229-709973', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (29, N'JS-5485', 4, N'', N'15Z-0004371', N'7DFU35-70861', N'Forklifter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (30, N'Z-7928', 2, N'', N'EH700213375', N'GT175K11064', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (31, N'Z-7910', 2, N'', N'EH700209216', N'GT175K10891', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (32, N'Z-7948', 2, N'', N'EH700213562', N'GT175K11088', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (33, N'Z-7892', 2, N'', N'EH700213904', N'GT175K11131', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (34, N'Z-7969', 2, N'', N'EH700206063', N'GT175K10863', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (35, N'Z-7927', 2, N'', N'EH700209268', N'GT175K10893', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (36, N'Z-7909', 2, N'', N'EH700213192', N'GT175K11046', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (37, N'Z-7933', 2, N'', N'EH700214131', N'GT175K11154', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (38, N'Z-7914', 2, N'', N' ', N' ', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (39, N'Z-7968', 2, N'', N'EH700212495', N'GT175K10979', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40, N'LSB-6175', 2, N'', N'', N'', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (41, N'TKK-408', 2, N'', N'H06C-TL13298', N'GKIHRA-10130', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (42, N'TLM-136', 2, N'', N'K13D-B-13225', N'FH2KNB-10094', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (43, N'TLN-831', 2, N'', N'067587', N'TK20LH24279', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (44, N'TLL-454', 2, N'', N'6HHI-00967P', N'FTR33K-7-7000567', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (45, N'TLL-264', 2, N'', N'6HHI-00972P', N'FTR33K-7-7000572', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (46, N'TLL-414', 2, N'', N'6HHI-00970P', N'FTR33K-7-7000570', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (47, N'JQ-0446', 2, N'', N'51500729', N'9AC33556', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (48, N'JQ-0443', 2, N'', N'51500513', N'9AC33646', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (49, N'JQ-0451', 2, N'', N'51510873', N'9AC33993', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (50, N'JP-8496', 2, N'', N'51548427', N'AAC00340', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (51, N'JQ-0450', 2, N'', N'51501346', N'9AC33476', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (52, N'JQ-0445', 2, N'', N'NE6-029872P', N'PKD311H-02330P', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (53, N'TLB-132', 2, N'', N'PE6-083440-T', N'CV46N-50093', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (54, N'TLS-136', 2, N'', N'F21C-D-10491', N'SH4FDG-10221', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (55, N'TLS-436', 2, N'', N'F20C-B-17051', N'SH3FDB-11082', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (56, N'TLM-886', 2, N'', N'50917372', N'7ad-07932', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (57, N'TLS-823', 2, N'', N'GE13-000243B', N'CD48CW-00168', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (58, N'TLP-043', 2, N'', N'RG8-102876', N'CD53BN-00047', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (59, N'TLA-238', 2, N'', N'PE6-095365T', N'CV46L-60789', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (60, N'TLB-130', 2, N'', N'PF6-111922A', N'CKB450BT-00138', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (61, N'TLB-134', 2, N'', N'PE6-086816T', N'CK67BT-00705', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (62, N'TLB-138', 2, N'', N'PE6-089292T', N'LW46W-15231', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (63, N'TLC-308', 2, N'', N'PF6-000082T', N'CD47U-00001', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (64, N'TLC-463', 2, N'', N'PF6-103848A', N'CKB450BT-00171', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (65, N'TLC-106', 2, N'', N'PE6-080010-T', N'CK66BT-12392', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (66, N'TLB-146', 2, N'', N'PE6-085161T', N'CV46L-50636', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (67, N'TLM-986', 2, N'', N'50917367', N'7AD-07937', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (68, N'TLG-160', 2, N'', N'075637', N'PKC311-01389', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (69, N'TLL-343', 1, N'Nissan', N'6HIII-00971P', N'FTR33K-7-7000571', N'Nissan', 1, NULL, N'admin', NULL, CAST(N'2021-06-09T22:59:02.357' AS DateTime), 1, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (70, N'TLP-502', 2, N'', N'RG8-203731', N'CD53BN-20112', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (71, N'TLG-164', 2, N'', N'075641', N'PKC311-01393', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (72, N'JP-9155', 2, N'', N'H06CTL-15601', N'FDIHJA-10501', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (73, N'JP-9255', 2, N'', N'H06CTL-13762', N'FD2HKA-10480', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (74, N'TLA-241', 2, N'', N'K13D-B-11135', N'FN2KWB-10163', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (75, N'JU-5986', 2, N'', N'51501782', N'9AD30197', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (76, N'E-6886', 2, N'', N'No Record', N'No Record', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (77, N'LSC-2439', 2, N'', N'No Record', N'No Record', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (78, N'TLN-857', 2, N'', N'PF6-104377', N'CD450VN-01631', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (79, N'TLR-386', 2, N'', N' ', N' ', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (80, N'TLK-586', 2, N'', N' ', N' ', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (81, N'TLA-334', 2, N'', N'PE6-082887T', N'CK3IT-25623', N'Tanker', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (82, N'JS-3960', 3, N'', N'', N'T34101-0405', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (83, N'JS-3789', 3, N'', N'', N'45263', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (84, N'LES-5577', 3, N'', N' ', N'T341010368', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (85, N'JS-2364', 3, N'', N' ', N'T34101-0038', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (86, N'JS-2365', 3, N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (87, N'LES-5775', 3, N'', N' ', N'T34110.2140', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (88, N'JS-1876', 3, N'', N' ', N'T34110.0847', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (89, N'LSB-1804', 3, N'', N' ', N' ', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (90, N'JS-3990', 3, N'', N' ', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (91, N'LSC-4248', 3, N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (92, N'JS-1883', 3, N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (93, N'JS-1284', 3, N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (94, N'LSB-1420', 3, N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (96, N'JS-1290', 3, N'', N'H-1199', N'E-52396', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (97, N'JS-1039', 3, N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (98, N'JS-2051', 3, N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (99, N'JS-3008', 3, N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (100, N'JS-3947', 3, N'', N'', N'T34111.0595', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (101, N'JS-3864', 3, N'', N'TAD720VE-0931838', N'T34111-0418', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (102, N'JS-3709(YELLOW)', 3, N'0', N'0', N'45236', N'0', 1, NULL, N'saif', NULL, CAST(N'2021-03-01T11:53:59.530' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (103, N'JS-3946', 3, N'', N'', N'T34111.0323', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (104, N'JS-3890(MT03)', 3, N'0', N'0', N'T34111.0069', N'0', 1, NULL, N'saif', NULL, CAST(N'2021-02-25T17:55:49.290' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (105, N'JS-3850(MT07)', 3, N'0', N'0', N'T34111.0586', N'0', 1, NULL, N'Asif', NULL, CAST(N'2021-03-05T18:46:09.123' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (106, N'JS-3948', 3, N'Lifter js-3948', N'TAD720VE-00674582', N'DCE90-45E7T341110159', N'Lifter js-3948', 1, NULL, N'Admin', NULL, CAST(N'2020-03-07T21:58:31.333' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (107, N'JS-3777(SMV)', 3, N'0', N'0', N'M5411', N'0', 1, NULL, N'saif', NULL, CAST(N'2021-03-02T11:03:54.150' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (108, N'JS-3710', 3, N'', N'', N'T34111.0159', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (109, N'JS-3836', 3, N'', N'', N'T34111.0354', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (110, N'JS-3834(MT08)', 3, N'0', N'0', N'T34111.0594', N'0', 1, NULL, N'saif', NULL, CAST(N'2021-02-25T17:53:55.660' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (111, N'JS-1621', 3, N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (112, N'TMA-828', 1, N'Black', N'466128', N'MMC-05-TC-00250', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:18.383' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (113, N'TMA-832', 1, N'Black', N'678886', N'JALFZ34TF-7000145', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:18.460' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (114, N'TMA-839', 1, N'Black', N'678890', N'JALFZ34TF-7000146', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:18.523' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (115, N'TMA-840', 1, N'Black', N'673892', N'JALFZ34TF-7000148', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:18.597' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (116, N'TMA-841', 1, N'Black', N'673888', N'JALFZ34TF-7000149', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:18.667' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (117, N'TMA-829', 1, N'Black', N'466124', N'MMC-05-TC-00251', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:18.733' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (118, N'TMA-830', 1, N'Black', N'466136', N'MMC-05-TC-00252', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:18.803' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (119, N'TMA-831', 1, N'Black', N'466135', N'MMC-05-TC-00253', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:18.910' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (120, N'TMB-246', 1, N'Black', N'51883323', N'6160161', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:18.987' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (121, N'TMB-247', 1, N'Black', N'51883327', N'6160162', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.060' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (122, N'TMB-248', 1, N'Black', N'51883339', N'6160163', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.127' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (123, N'TMB-249', 1, N'Black', N'51883317', N'6160168', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.213' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (124, N'TMB-250', 1, N'Black', N'51883341', N'6160169', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.287' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (125, N'JV-1967', 1, N'Black', N'686729', N'JALFVR34MG7000115', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.353' AS DateTime), NULL, 2, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (126, N'JV-1968', 1, N'Black', N'686718', N'JALFVR34MG7000116', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.423' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (127, N'JV-1969', 1, N'Black', N'686724', N'JALFVR34MG7000117', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.490' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (128, N'JV-1970', 1, N'Black', N'686710', N'JALFVR34MG7000118', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.590' AS DateTime), NULL, 3, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (129, N'JV-1971', 1, N'Black', N'686722', N'JALFVR34MG7000119', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.660' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (130, N'JV-2043', 1, N'Black', N'689457', N'JALFVR34MG7000134', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.730' AS DateTime), NULL, 4, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (131, N'JV-2034', 1, N'Black', N'689453', N'JALFVR34MG7000132', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.800' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (132, N'JV-2029', 1, N'Black', N'689460', N'JALFVR34MG7000136', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.873' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (133, N'JV-2036', 1, N'Black', N'689455', N'JALFVR34MG7000133', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:19.943' AS DateTime), NULL, 5, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (134, N'JV-2035', 1, N'Black', N'689462', N'JALFVR34MG7000137', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.017' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (135, N'TMD-316', 1, N'Black', N'78547467', N'LGAG4CY26HH190486', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.090' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (136, N'TMD-318', 1, N'Black', N'78547472', N'LGAG4CY28HH190487', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.167' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (137, N'TMD-319', 1, N'Black', N'78547470', N'LGAG4CY2XHH190488', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.237' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (138, N'TMD-320', 1, N'Black', N'78547469', N'LGAG4CY21HH190489', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.310' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (139, N'TMD-321', 1, N'Black', N'78547471', N'LGAG4CY28HH190490', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.383' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (140, N'TMD-380', 1, N'Black', N'78541125', N'LGAG4CY27HH190528', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.457' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (141, N'TMD-381', 1, N'Black', N'78541129', N'LGAG4CY29HH190529', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.527' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (142, N'TMD-382', 1, N'Black', N'78541120', N'LGAG4CY25HH190530', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.610' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (143, N'TMD-390', 1, N'Black', N'78541127', N'LGAG4CY27HH190531', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.693' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (144, N'TMD-391', 1, N'Black', N'78541130', N'LGAG4CY29HH190532', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.770' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (145, N'TMD-653', 1, N'Black', N'78541123', N'LGAG4CY25HH190527', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.837' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (146, N'TMD-654', 1, N'Black', N'78541122', N'LGAG4CY23HH190526', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.907' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (147, N'TMD-656', 1, N'Black', N'78541121', N'LGAG4CY21HH190525', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:20.977' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (148, N'TMD-657', 1, N'Black', N'78541126', N'LGAG4CY2XHH190524', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:21.047' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (149, N'TMD-658', 1, N'Black', N'78541128', N'LGAG4CY28HH190523', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:00:21.120' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (188, N'JU-4828', 1, N'Black', N'9AC33828', N'FAW', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.130' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (189, N'JU-4842', 1, N'Black', N'9AC33642', N'FAW', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.207' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (190, N'JU-4932', 1, N'Black', N'9AC33832', N'FAW', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.277' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (191, N'JU-4954', 1, N'Black', N'9AC33654', N'FAW', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.350' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (192, N'JU-5022', 1, N'Black', N'9AC33822', N'FAW', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.423' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (193, N'JU-9918', 1, N'Black', N'AAC00708', N'FAW', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.500' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (194, N'JU-9929', 1, N'Black', N'AAC00329', N'FAW', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.570' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (195, N'JU-9939', 1, N'Black', N'AAC00339', N'FAW', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.637' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (196, N'JU-9920', 1, N'Black', N'AAC00520', N'FAW', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.703' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (197, N'TLA-262', 1, N'Black', N'PE6-180010T', N'LW46W-15304', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.780' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (198, N'TLB-160', 1, N'Black', N'PE6-101159', N'CKB450N-00014', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.853' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (199, N'TLA-318', 1, N'Black', N'PE6-095615T', N'LG46V-00412', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.920' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (200, N'TLC-462', 1, N'Black', N'No,', N'No,', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:19.997' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (201, N'LSC-7475', 1, N'Black', N'No,', N'No,', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:20.077' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (202, N'JT-5252', 1, N'Black', N'PB6-010554T', N'TK206L-05145', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:20.153' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (203, N'JT-8788', 1, N'Black', N'No,', N'No,', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:20.223' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (204, N'QA-5657', 1, N'Black', N'No,', N'No,', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:19:20.297' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (205, N'JU-4653', 1, N'Black', N'51549644', N'9AC33653', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:52.940' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (206, N'JU-9907', 1, N'Black', N'51548964', N'AAC00687', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:53.010' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (207, N'JU-9938', 1, N'Black', N'51548442', N'AAC00338', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:53.107' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (208, N'JU-9921', 1, N'Black', N'NO', N'AAC00521', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:53.223' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (209, N'JU-5090', 1, N'Black', N'51510880', N'9AC33990', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:53.327' AS DateTime), NULL, 6, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (210, N'JU-9904', 1, N'Black', N'51549632', N'AAC00704', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:53.417' AS DateTime), NULL, 7, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (211, N'JU-4708', 1, N'Black', N'51509940', N'9AC34008', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:54.153' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (212, N'JU-9913', 1, N'Black', N'51548428', N'AAC00513', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:54.260' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (213, N'JU-9914', 1, N'1', N'51548975', N'AAC00506', N'1', 1, NULL, N'sabor', CAST(N'2020-03-11T15:25:54.340' AS DateTime), CAST(N'2020-09-10T14:43:58.063' AS DateTime), 8, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (214, N'JU-9901', 1, N'Black', N'51549638', N'AAC00681', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:54.490' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (215, N'JU-9919', 1, N'Black', N'51548968', N'AAC00519', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:54.563' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (216, N'JT-0780', 1, N'Black', N'NO', N'NO', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:54.693' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (217, N'JU-4837', 1, N'Black', N'NO', N'NO', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:54.797' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (218, N'Z-7961', 1, N'Black', N'EH700211889', N'GT175K10935', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:54.870' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (219, N'Z-7935', 1, N'Black', N'EH700206233', N'GT175K10872', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:55.003' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (220, N'Z-7905', 1, N'Black', N'EH700206304', N'GT175K10876', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:55.157' AS DateTime), NULL, 9, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (221, N'JU-9903', 1, N'Black', N'51548440', N'AAC00323', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:55.333' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (222, N'JU-5023', 1, N'Black', N'51510882', N'9AC33823', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:55.403' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (223, N'JU-9925', 1, N'Black', N'51548425', N'AAC00325', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:55.510' AS DateTime), NULL, 10, N'SINGLE', 6, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (224, N'JU-9941', 1, N'Black', N'51548444', N'AAC00511', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:55.583' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (225, N'JU-4624', 1, N'Black', N'51510877', N'9AC33824', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:25:55.650' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (226, N'JU-3126', 1, N'Black', N'BEJ12834', N'4LMCN51156L017045', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:55.997' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (227, N'KJ-2241', 1, N'Black', N'014249', N'4LMCN51113L', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.073' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (228, N'JU-3127', 1, N'Black', N'BEJ13040', N'4LMCN51136L017044', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.150' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (229, N'KJ-2248', 1, N'Black', N'014246', N'4LMCN51163L', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.250' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (230, N'JS-3206', 1, N'Black', N'BEJ04250', N'4LMCN51183L014250', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.327' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (231, N'TLK-060', 1, N'Black', N'NE6-075907TP', N'PKC311E-01749P', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.410' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (232, N'TLK-057', 1, N'Black', N'NE6-075909TP', N'PKC311E-01751P', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.480' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (233, N'TLK-056', 1, N'Black', N'NE6-075908TP', N'PKC311E-01750P', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.553' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (234, N'TLL-221', 1, N'Black', N'6HHI-00968P', N'FTR33K-7-7000568', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.633' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (235, N'TLL-253', 1, N'Black', N'6HHI-00969P', N'FTR33K-7-7000569', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.787' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (236, N'Z-7886', 1, N'Black', N'EH700213456', N'GT175K11074', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:56.933' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (239, N'Z-8046', 1, N'Black', N'EH700213925', N'GT175K11133', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.203' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (241, N'Z-7929', 1, N'Black', N'EH700213420', N'GT175K11070', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.360' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (242, N'Z-7887', 1, N'Black', N'EH700214060', N'GT175K11150', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.433' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (243, N'Z-7888', 1, N'Black', N'EH700214278', N'GT175K11160', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.503' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (244, N'TLC-028', 1, N'Black', N'PF6-110889A', N'CKB450 BT - 00086', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.580' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (245, N'TLB-152', 1, N'Black', N'PF6-113665A', N'CKB-450BT-00246', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.680' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (246, N'JU-1818', 1, N'Black', N'H0TCTA-14401', N'FD2HGA-10075', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.757' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (247, N'TLC-116', 1, N'Black', N'ED-100-91580', N'HE335-12128', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.827' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (248, N'TLB-506', 1, N'Black', N'PE6-091246T', N'CK66BT-12905', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.910' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (249, N'JU-2403', 1, N'Black', N'NE6-029943P', N'PKD311H-02401P', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:57.983' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (250, N'JU-2401', 1, N'Black', N'NE6-029968P', N'PKD311H-02426P', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:58.077' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (251, N'JU-2402', 1, N'Black', N'NE6-029920P', N'PKD311H-02378P', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:58.160' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (252, N'JU-2405', 1, N'Black', N'NE6-029967P', N'PKD311H-02425P', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:58.230' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (253, N'TLE-320', 1, N'Black', N'65426', N'61109', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:58.310' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (254, N'TLC-816', 1, N'Black', N'ED100-92097', N'HE335-12161', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:58.390' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (255, N'TLC-916', 1, N'Black', N'ED100-91050', N'HE335-12141', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:58.463' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (256, N'LSC-726', 1, N'Black', N'H07C-TA-14515', N'FD2HJA-10367', N'1', 1, NULL, NULL, CAST(N'2020-03-11T15:33:58.533' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (258, N'JU-9908', 1, N'FAW-200', N'0', N'0', N'FAW-200', 1, N'sabor', NULL, CAST(N'2020-07-24T17:07:00.580' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (259, N'EL-06', 4, N'YALE', N'0', N'0', N'YALE', 1, N'sabor', NULL, CAST(N'2020-07-24T17:11:47.803' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (260, N'TAJ-924', 8, N'JAC', N'0', N'0', N'JAC', 1, N'sabor', N'saif', CAST(N'2020-07-24T17:13:25.480' AS DateTime), CAST(N'2021-02-10T11:04:18.367' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10258, N'JU-5891', 1, N'FAW-200', N'0', N'0', N'FAW-200', 1, N'sabor', NULL, CAST(N'2020-07-28T17:04:03.070' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10259, N'JS-3787(BLUE S)', 3, N'Kalmar SISU', N'0', N'0', N'Kalmar SISU', 1, N'sabor', N'saif', CAST(N'2020-07-28T17:16:06.800' AS DateTime), CAST(N'2021-03-01T11:53:08.817' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10260, N'JS-6030', 3, N'Kalmar DRF-450', N'0', N'0', N'Kalmar DRF-450', 1, N'sabor', NULL, CAST(N'2020-07-28T17:17:03.873' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10261, N'JU-4843', 1, N'FAW-200', N'0', N'0', N'FAW-200', 1, N'sabor', NULL, CAST(N'2020-08-07T02:02:35.643' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10262, N'JU-9910', 1, N'FAW-200', N'0', N'0', N'FAW-200', 1, N'sabor', NULL, CAST(N'2020-08-07T02:03:14.567' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10263, N'EL-05', 4, N'YALE', N'0', N'0', N'YALE', 1, N'sabor', NULL, CAST(N'2020-08-10T05:04:43.553' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10264, N'JU-9983', 1, N'FAW-200', N'0', N'0', N'FAW-200', 1, N'sabor', NULL, CAST(N'2020-08-10T06:11:33.627' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10265, N'JU-9934', 1, N'FAW-200', N'0', N'0', N'FAW-200', 1, N'sabor', NULL, CAST(N'2020-08-10T06:12:16.617' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10266, N'KH-3061', 1, N'Shezore', N'0', N'0', N'Shezore', 1, N'sabor', NULL, CAST(N'2020-08-10T06:13:26.903' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10267, N'JU-2499', 1, N'FAW-200', N'0', N'0', N'FAW-200', 1, NULL, N'sabor', CAST(N'2020-08-12T05:25:27.187' AS DateTime), CAST(N'2020-10-26T15:21:00.087' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10268, N'EL-02', 4, N'Electrci Lifter', N'0', N'0', N'Electrci Lifter', 1, NULL, N'sabor', CAST(N'2020-08-12T05:26:11.327' AS DateTime), CAST(N'2020-11-02T18:21:07.107' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10269, N'JU-9905', 1, N'FAW-200', N'0', N'0', N'FAW-200', 1, N'Admin', N'sabor', CAST(N'2020-08-12T05:30:36.830' AS DateTime), CAST(N'2020-11-04T16:21:08.677' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10270, N'EL-01', 4, N'YALE', N'0', N'0', N'YALE', 1, N'sabor', NULL, CAST(N'2020-08-20T05:00:34.017' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10271, N'TEU-05', 4, N'Toyota', N'0', N'0', N'Toyota', 1, N'sabor', NULL, CAST(N'2020-08-20T05:01:10.317' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10272, N'TEU-03', 4, N'Toyota', N'0', N'0', N'Toyota', 1, N'sabor', NULL, CAST(N'2020-08-20T05:02:42.193' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10273, N'Heli-01', 4, N'HELI', N'0', N'0', N'HELI', 1, N'sabor', NULL, CAST(N'2020-08-20T06:21:32.890' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10274, N'Heli-02', 4, N'HELI', N'0', N'0', N'HELI', 1, N'sabor', NULL, CAST(N'2020-08-20T06:21:57.860' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10275, N'TEU-04(4808)', 4, N'Toyota', N'0', N'0', N'Toyota', 1, N'sabor', N'saif', CAST(N'2020-08-20T06:22:19.757' AS DateTime), CAST(N'2021-02-24T18:37:27.860' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10276, N'JU-9926', 1, N'FAW-200', N'0', N'0', N'FAW-200', 1, N'sabor', N'Admin', CAST(N'2020-08-21T23:22:05.443' AS DateTime), CAST(N'2020-08-25T00:51:36.553' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10281, N'JE-6516', 1, N'Mazda', N'0', N'0', N'MAZDAH', 1, NULL, NULL, CAST(N'2021-01-28T13:20:50.253' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10282, N'JS-3178(DRF)', 3, N'KALMAR', N'0', N'0', N'KALMAR', 1, N'Asif', N'Asif', CAST(N'2021-01-28T21:16:14.267' AS DateTime), CAST(N'2021-03-25T19:06:43.650' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10283, N'Perkin', 4, N'Toyota', N'0', N'0', N'Toyota', 1, N'Asif', NULL, CAST(N'2021-01-29T17:47:37.470' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10284, N'TMA-600', 1, N'HINO SG', N'00', N'00', N'HINO SG', 1, N'Admin', NULL, CAST(N'2021-01-30T10:36:27.483' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10285, N'EL-03', 4, N'Eletric Lifter', N'0', N'0', N'Eletric Lifter', 1, N'Asif', NULL, CAST(N'2021-02-02T11:42:19.683' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10286, N'HELI GRABBER', 4, N'HELI', N'0', N'0', N'HELI', 1, N'Asif', NULL, CAST(N'2021-02-06T19:08:50.587' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10287, N'TEU-5', 4, N'China', N'0', N'0', N'China', 1, N'Admin', NULL, CAST(N'2021-02-08T16:26:41.957' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10288, N'LES-4813', 4, N'CHINA', N'0', N'0', N'CHINA', 1, N'Admin', NULL, CAST(N'2021-02-08T16:28:16.487' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10289, N'Teu-02(4815)', 4, N'TEU', N'00', N'00', N'TEU', 1, N'saif', N'saif', CAST(N'2021-02-09T13:54:44.377' AS DateTime), CAST(N'2021-02-24T18:37:04.873' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10290, N'JS 4834', 4, N'00', N'00', N'00', N'00', 1, N'saif', N'saif', CAST(N'2021-02-09T13:55:28.323' AS DateTime), CAST(N'2021-02-09T15:29:04.510' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10291, N'Tlm 629', 1, N'Hino', N'00', N'00', N'Hino', 1, N'saif', NULL, CAST(N'2021-02-09T15:47:12.003' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10293, N'TEU-01', 4, N'Teu', N'00', N'00', N'Teu', 1, N'saif', NULL, CAST(N'2021-02-11T16:20:04.627' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10294, N'KW-5870', 8, N'Suzuki', N'00', N'00', N'Suzuki', 1, N'Admin', NULL, CAST(N'2021-02-17T09:57:07.190' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10295, N'EL-08', 4, N'00', N'00', N'00', N'00', 1, N'Asif', N'Asif', CAST(N'2021-02-18T13:08:18.933' AS DateTime), CAST(N'2021-02-18T13:08:35.260' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (10296, N'2J(TOYOTA 3TON)', 4, N'00', N'00', N'00', N'00', 1, N'Asif', NULL, CAST(N'2021-02-19T10:28:40.993' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (20294, N'JU-5995', 1, N'00', N'00', N'00', N'00', 1, N'Asif', NULL, CAST(N'2021-02-19T17:35:15.893' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (20295, N'KS-7027', 8, N'TOYOTA HILUX', N'0', N'0', N'TOYOTA HILUX', 1, N'Asif', N'saif', CAST(N'2021-03-02T19:02:06.877' AS DateTime), CAST(N'2021-03-04T13:16:18.167' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (30295, N'5675', 1, NULL, N'6752165', N'5454', N'VEHICLE NAME ', 1, N'Admin', NULL, CAST(N'2021-03-08T02:14:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (30296, N'5675', 1, NULL, N'6752165', N'5454', N'VEHICLE NAME ', 1, N'Admin', NULL, CAST(N'2021-03-08T02:14:00.740' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (30297, N'5675', 1, NULL, N'6752165', N'5454', N'VEHICLE NAME ', 1, N'Admin', NULL, CAST(N'2021-03-08T02:14:00.937' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40295, N'EL-04', 4, N'ELECTRIC LIFTER', N'0', N'0', N'ELECTRIC LIFTER', 1, N'Asif', NULL, CAST(N'2021-03-12T15:18:28.143' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40296, N'EL-07', 4, N'ELECTRIC LIFTER', N'0', N'0', N'ELECTRIC LIFTER', 1, N'Asif', NULL, CAST(N'2021-03-12T15:19:00.530' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40297, N'EL-09', 4, N'ELECTRIC LIFTER', N'0', N'0', N'ELECTRIC LIFTER', 1, N'Asif', NULL, CAST(N'2021-03-12T15:19:48.467' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40298, N'EL-10', 4, N'ELECTRIC LIFTER', N'0', N'0', N'ELECTRIC LIFTER', 1, N'Asif', NULL, CAST(N'2021-03-12T15:20:22.887' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40299, N'TLD-373', 1, N'LOCAL TRAILER', N'0', N'0', N'LOCAL TRAILER', 1, N'saif', NULL, CAST(N'2021-03-24T10:27:18.313' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40300, N'KIB-3590', 7, N'Ashley Bike', N'7dy-373001k', N'7dy-373001k', N'Ashley Bike', 1, N'Asif', NULL, CAST(N'2021-03-26T15:56:14.607' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40301, N'67567', 1, NULL, N'2783487', N'78378387', N'test', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40302, N'673476', 2, NULL, N'63727632', N'673254', N'TEST280', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40303, N'67356', 2, NULL, N'6524', N'76532', N'TSET', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40304, N'653475', 2, NULL, N'6523456', N'76567534', N'TEST240', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40305, N'672536', 3, NULL, N'6753', N'76567532', N'TEST', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40306, N'324675', 2, NULL, N'32456', N'67543265', N'ZAIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40307, N'JU-5995', 2, NULL, N'6372667', N'76363', N'SUZKI', 1, N'admin', NULL, CAST(N'2021-05-26T00:53:10.103' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40308, N'JU-5995', 2, NULL, N'2020', N'2020', N'2020HONDA', 1, N'admin', NULL, CAST(N'2021-05-26T00:53:53.783' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40309, N'AJ19898', 1, NULL, N'232332', N'232332', N'DSSDDS TEST BY --EDIT SHAN', 1, N'admin', N'admin', CAST(N'2021-05-26T03:21:27.097' AS DateTime), CAST(N'2021-05-26T03:22:17.203' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40310, N'Test-123', 2, NULL, N'1211', N'1233', N'truck by shan', 1, N'admin', NULL, CAST(N'2021-05-27T03:11:20.140' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40311, N'JU-5995', 3, NULL, N'564654564', N'564564', N'test', 1, N'admin', NULL, CAST(N'2021-05-28T22:07:59.693' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40312, N'564564', 3, NULL, N'564654', N'675675', N'test', 1, N'admin', NULL, CAST(N'2021-05-28T22:08:24.503' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40313, N'65675', 4, NULL, N'56454', N'65765', N'zain', 1, N'admin', NULL, CAST(N'2021-05-28T22:09:04.943' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40314, N'JU-5995', 2, NULL, N'NaN', N'NaN', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-05-31T22:21:53.937' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40315, N'JU-5995', 1, NULL, N'NaN', N'NaN', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-05-31T22:22:59.903' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40316, N'JU-5995', 1, NULL, N'67325', N'675675', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-05-31T22:23:28.510' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40317, N'TMA-832', 2, NULL, N'NaN', N'NaN', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-05-31T22:29:08.583' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40318, N'JU-5995', 2, NULL, N'NaN', N'NaN', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-05-31T22:32:46.440' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40319, N'JU-5995', 3, NULL, N'NaN', N'NaN', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-05-31T22:35:01.240' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40320, N'JU-5995', 2, NULL, N'PE6-095615T', N'PE6-095615T', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-05-31T22:37:21.050' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40321, N'TEST BY ZAIN TRUCK ', 1, NULL, N'68554', N'5645454', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-06-26T04:04:51.907' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40322, N'TEST BY OIL TANKER', 2, NULL, N'100', N'FTR33K-7-7000571', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-06-26T04:05:15.517' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40323, N'TESTS BY GAS', 9, NULL, N'76876876', N'54564654', N'TEST BY ZAIN', 1, N'admin', NULL, CAST(N'2021-06-26T04:05:36.323' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[VehicleRegistrationDetail] ([VehicleID], [Vehicle_Number], [VehicleTypeID], [VehicleColor], [VehicleEngineNo], [VehicleChassisNO], [VehicleName], [IsActive], [UserID], [UpdateBy], [CreateDate], [UpdateDate], [TTID], [AxelType], [TireQuantity], [CreatedBy]) VALUES (40324, N'Fulton Shepherd', 5, NULL, N'Dillon Mcfarland', N'Latifah Macias', N'Bernard Faulkner', 1, N'admin', NULL, CAST(N'2022-05-24T16:04:30.867' AS DateTime), NULL, NULL, NULL, NULL, N'admin')
SET IDENTITY_INSERT [dbo].[VehicleRegistrationDetail] OFF
GO
ALTER TABLE [dbo].[ShippingAgent] ADD  DEFAULT ((0)) FOR [OtherCharges]
GO
ALTER TABLE [dbo].[ShippingAgent] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DeleteDate]
GO
ALTER TABLE [dbo].[ShippingAgent] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ShippingLine] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DeleteDate]
GO
ALTER TABLE [dbo].[ShippingLine] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VehicleRegistrationDetail] ADD  CONSTRAINT [DF_VehicleRegistrationDetail_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

---- 25/05/2022 ------ HARIS
GO

CREATE TABLE [dbo].[ExpenseInvoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [nvarchar](9) NULL,
	[ContainerNo] [nvarchar](50) NULL,
	[OrderType] [nvarchar](50) NULL,
	[HeadType] [nvarchar](50) NULL,
	[HeadName] [nvarchar](250) NULL,
	[HeadID] [int] NULL,
	[Amount] [numeric](18, 0) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ExpenseInvoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[InvoiceHead](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HeadType] [nvarchar](50) NULL,
	[HeadName] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](250) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_InvoiceHead] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

alter table [EmptyDropOffLoc] add [CreatedBy] [nvarchar](250) NULL
alter table [EmptyDropOffLoc] add [CreatedDate] [datetime] NULL

GO

alter table [BAShippingLine] add [CreatedBy] [nvarchar](250) NULL

Go

alter table [stp_BusinessDivision] add [CreatedBy] [nvarchar](250) NULL
alter table [stp_BusinessDivision] add [CreatedDate] [datetime] NULL

GO

alter table [Location] add [CreatedBy] [nvarchar](250) NULL
alter table [Location] add [CreatedDate] [datetime] NULL

GO

alter table [stp_Facility] add [CreatedBy] [nvarchar](250) NULL
alter table [stp_Facility] add [CreatedDate] [datetime] NULL

Go

alter table [ShippingAgent] add [CreatedBy] [nvarchar](250) NULL
alter table [ShippingAgent] add [CreatedDate] [datetime] NULL

Go

alter table [ShippingLine] add [CreatedBy] [nvarchar](250) NULL
alter table [ShippingLine] add [CreatedDate] [datetime] NULL

Go

alter table [VehicleRegistrationDetail] add [CreatedBy] [nvarchar](250) NULL

Go

select * from menu
insert into menu values ('Invoice Heads', '/Invoices/InvoiceHead',0)
insert into menu values ('Container Expense', '/Invoices/ExpenseInvoice',0)

---------- 6.1.2022 --------------- Haris
Go

alter table [ExpenseInvoice] add [Remarks] [nvarchar](500) NULL
Go

alter table [ExpenseInvoice] add [UserName] [nvarchar](500) NULL

Go

alter table [ExpenseInvoice] add [UserID] [int] NULL
GO
CREATE TABLE tbl_User(
	[ID] [int] IDENTITY(1,1) primary key NOT NULL,
	[UserName] [nvarchar](500) NULL,
	[CNIC] [nvarchar](100) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	)

select * from menu
insert into menu values ('Users', '/Setup/GetUsers',0)


---- 06.07.2022----- Haris

insert into menu values ('Export Train Report', '/OrderExecution/ExportTrainReport',0)
insert into menu values ('TrainID', '/Setup/GetTrainId',0)

Create TABLE tbl_TrainId (
	[ID] [int] IDENTITY(1,1) primary key NOT NULL,
	[TrainID] [nvarchar](250) NULL,
	
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	)




	select * from DispatchedOrder where ContainerNo = 'TEMU0635820'

	----- 10.06.2022 ---- Haris

	Create TABLE tbl_ExportTrain (
	[ID] [int] IDENTITY(1,1) primary key NOT NULL,
	[TrainID] [nvarchar](250) NULL,
	
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	)

	insert into menu values ('ExportTrain', '/Setup/GetExportTrainId',0)

	--- 13.06.2022--- Haris

Go
alter table [BLShippingContainerDetail] add [KindOfPackagesDescriptionOfGoods] [nvarchar] (max) NULL
alter table [BLShippingContainerDetail] add [GrossWeight] [nvarchar](50) NULL
alter table [BLShippingContainerDetail] add [NetWeight] [nvarchar](50) NULL
