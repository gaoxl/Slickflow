USE [WfDB]
GO
/****** Object:  Table [dbo].[BizAppFlow]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BizAppFlow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AppName] [nvarchar](50) NOT NULL,
	[AppInstanceID] [varchar](50) NOT NULL,
	[ActivityName] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](1000) NULL,
	[ChangedTime] [datetime] NOT NULL,
	[ChangedUserID] [int] NOT NULL,
	[ChangedUserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SALWALLWAORDERFLOW] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HrsLeave]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HrsLeave](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveType] [smallint] NOT NULL DEFAULT ((0)),
	[Days] [decimal](18, 1) NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[CurrentActivityText] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[CreatedUserID] [int] NOT NULL,
	[CreatedUserName] [nvarchar](50) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[DepManagerRemark] [nvarchar](50) NULL,
	[DirectorRemark] [nvarchar](50) NULL,
	[DeputyGeneralRemark] [nvarchar](50) NULL,
	[GeneralManagerRemark] [nvarchar](50) NULL,
 CONSTRAINT [PK_HRLEAVE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysRole]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleCode] [varchar](50) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WfRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SysRoleUser]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRoleUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_WfRoleUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysUser]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WfUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WfActivityInstance]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WfActivityInstance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessInstanceID] [int] NOT NULL,
	[AppName] [nvarchar](50) NOT NULL,
	[AppInstanceID] [varchar](50) NOT NULL,
	[ProcessGUID] [varchar](100) NOT NULL,
	[ActivityGUID] [varchar](100) NOT NULL,
	[ActivityName] [nvarchar](50) NOT NULL,
	[ActivityType] [smallint] NOT NULL,
	[ActivityState] [smallint] NOT NULL CONSTRAINT [DF_SSIP_WfActivityInstance_State]  DEFAULT ((0)),
	[AssignedToUsers] [nvarchar](1000) NULL,
	[BackwardType] [smallint] NULL,
	[BackSrcActivityInstanceID] [int] NULL,
	[GatewayDirectionTypeID] [smallint] NULL,
	[CanRenewInstance] [tinyint] NOT NULL CONSTRAINT [DF_SSIP_WfActivityInstance_CanInvokeNextActivity]  DEFAULT ((0)),
	[TokensRequired] [int] NOT NULL CONSTRAINT [DF_SSIP_WfActivityInstance_TokensRequired]  DEFAULT ((1)),
	[TokensHad] [int] NOT NULL,
	[ComplexType] [smallint] NULL,
	[MIHostActivityInstanceID] [int] NULL,
	[CompleteOrder] [float] NULL,
	[CreatedByUserID] [varchar](50) NOT NULL,
	[CreatedByUserName] [nvarchar](50) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSIP_WfActivityInstance_CreatedDateTime]  DEFAULT (getdate()),
	[LastUpdatedByUserID] [varchar](50) NULL,
	[LastUpdatedByUserName] [nvarchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[EndedDateTime] [datetime] NULL,
	[EndedByUserID] [varchar](50) NULL,
	[EndedByUserName] [nvarchar](50) NULL,
	[RecordStatusInvalid] [tinyint] NOT NULL CONSTRAINT [DF_SSIP_WfActivityInstance_RecordStatusInvalid]  DEFAULT ((0)),
	[RowVersionID] [timestamp] NULL,
 CONSTRAINT [PK_WfActivityInstance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WfLog]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WfLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventTypeID] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[Severity] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Message] [nvarchar](500) NULL,
	[StackTrace] [nvarchar](4000) NULL,
	[InnerStackTrace] [nvarchar](4000) NULL,
	[RequestData] [nvarchar](2000) NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WfProcess]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WfProcess](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessGUID] [varchar](100) NOT NULL,
	[ProcessName] [nvarchar](50) NOT NULL,
	[AppType] [varchar](20) NOT NULL,
	[PageUrl] [nvarchar](100) NULL,
	[XmlFileName] [nvarchar](50) NOT NULL,
	[XmlFilePath] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[CreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSIP-WfPROCESS_CreatedDateTime]  DEFAULT (getdate()),
	[LastUpdatedDateTime] [datetime] NULL,
	[RowVersionID] [timestamp] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WfProcessInstance]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WfProcessInstance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessGUID] [varchar](100) NOT NULL,
	[ProcessName] [nvarchar](50) NOT NULL,
	[AppInstanceID] [varchar](50) NOT NULL,
	[AppName] [nvarchar](50) NOT NULL,
	[AppInstanceCode] [nvarchar](50) NULL,
	[ProcessState] [smallint] NOT NULL CONSTRAINT [DF_SSIP_WfProcessInstance_State]  DEFAULT ((0)),
	[ParentProcessInstanceID] [int] NULL CONSTRAINT [DF_WfProcessInstance_ParentProcessInstanceID]  DEFAULT ((0)),
	[ParentProcessGUID] [varchar](100) NULL,
	[InvokedActivityInstanceID] [int] NULL CONSTRAINT [DF_WfProcessInstance_InvokedActivityInstanceID]  DEFAULT ((0)),
	[InvokedActivityGUID] [varchar](100) NULL,
	[CreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSIP_WfProcessInstance_CreatedDateTime]  DEFAULT (getdate()),
	[CreatedByUserID] [varchar](50) NOT NULL,
	[CreatedByUserName] [nvarchar](50) NOT NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedByUserID] [varchar](50) NULL,
	[LastUpdatedByUserName] [nvarchar](50) NULL,
	[EndedDateTime] [datetime] NULL,
	[EndedByUserID] [varchar](50) NULL,
	[EndedByUserName] [nvarchar](50) NULL,
	[RecordStatusInvalid] [tinyint] NOT NULL CONSTRAINT [DF_SSIP_WfProcessInstance_RecordStatus]  DEFAULT ((0)),
	[RowVersionID] [timestamp] NULL,
 CONSTRAINT [PK_WfProcessInstance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WfTasks]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WfTasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityInstanceID] [int] NOT NULL,
	[ProcessInstanceID] [int] NOT NULL,
	[AppName] [nvarchar](50) NOT NULL,
	[AppInstanceID] [int] NOT NULL,
	[ProcessGUID] [varchar](100) NOT NULL,
	[ActivityGUID] [varchar](100) NOT NULL,
	[ActivityName] [nvarchar](50) NOT NULL,
	[TaskType] [smallint] NOT NULL,
	[TaskState] [smallint] NOT NULL CONSTRAINT [DF_SSIP_WfTasks_IsCompleted]  DEFAULT ((0)),
	[AssignedToUserID] [varchar](50) NOT NULL,
	[AssignedToUserName] [nvarchar](50) NOT NULL,
	[CreatedByUserID] [varchar](50) NOT NULL,
	[CreatedByUserName] [nvarchar](50) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSIP_WfTasks_CreatedDateTime]  DEFAULT (getdate()),
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedByUserID] [varchar](50) NULL,
	[LastUpdatedByUserName] [nvarchar](50) NULL,
	[EndedByUserID] [varchar](50) NULL,
	[EndedByUserName] [nvarchar](50) NULL,
	[EndedDateTime] [datetime] NULL,
	[RecordStatusInvalid] [tinyint] NOT NULL CONSTRAINT [DF_SSIP_WfTasks_RecordStatusInvalid]  DEFAULT ((0)),
	[RowVersionID] [timestamp] NULL,
 CONSTRAINT [PK_SSIP_WfTasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WfTransitionInstance]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WfTransitionInstance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TransitionGUID] [varchar](100) NOT NULL,
	[AppName] [nvarchar](50) NOT NULL,
	[AppInstanceID] [int] NOT NULL,
	[ProcessInstanceID] [int] NOT NULL,
	[ProcessGUID] [varchar](100) NOT NULL,
	[TransitionType] [tinyint] NOT NULL,
	[FlyingType] [tinyint] NOT NULL CONSTRAINT [DF_WfTransitionInstance_IsBackwardFlying]  DEFAULT ((0)),
	[FromActivityInstanceID] [int] NOT NULL,
	[FromActivityGUID] [varchar](100) NOT NULL,
	[FromActivityType] [smallint] NOT NULL,
	[FromActivityName] [nvarchar](50) NOT NULL,
	[ToActivityInstanceID] [int] NOT NULL,
	[ToActivityGUID] [varchar](100) NOT NULL,
	[ToActivityType] [smallint] NOT NULL,
	[ToActivityName] [nvarchar](50) NOT NULL,
	[ConditionParseResult] [tinyint] NOT NULL CONSTRAINT [DF_SSIP_WfTransitionInstance_ConditionParseResult]  DEFAULT ((0)),
	[CreatedByUserID] [varchar](50) NOT NULL,
	[CreatedByUserName] [nvarchar](50) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSIP_WfTransitionInstance_CreatedDateTime]  DEFAULT (getdate()),
	[RecordStatusInvalid] [tinyint] NOT NULL CONSTRAINT [DF_SSIP_WfTransitionInstance_RecordStatusInvalid]  DEFAULT ((0)),
	[RowVersionID] [timestamp] NULL,
 CONSTRAINT [PK_WfTransitionInstance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vwWfActivityInstanceTasks]    Script Date: 2015-01-05 18:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwWfActivityInstanceTasks]
AS
SELECT   dbo.WfTasks.ID AS TaskID, dbo.WfActivityInstance.AppName, dbo.WfActivityInstance.AppInstanceID, 
                dbo.WfActivityInstance.ProcessGUID, dbo.WfTasks.ProcessInstanceID, dbo.WfActivityInstance.ActivityGUID, 
                dbo.WfTasks.ActivityInstanceID, dbo.WfActivityInstance.ActivityName, dbo.WfActivityInstance.ActivityType, 
                dbo.WfTasks.TaskType, dbo.WfTasks.AssignedToUserID, dbo.WfTasks.AssignedToUserName, 
                dbo.WfTasks.CreatedDateTime, dbo.WfTasks.EndedDateTime, dbo.WfTasks.EndedByUserID, 
                dbo.WfTasks.EndedByUserName, dbo.WfTasks.TaskState, dbo.WfActivityInstance.ActivityState, 
                dbo.WfTasks.RecordStatusInvalid, dbo.WfProcessInstance.ProcessState
FROM      dbo.WfActivityInstance INNER JOIN
                dbo.WfTasks ON dbo.WfActivityInstance.ID = dbo.WfTasks.ActivityInstanceID INNER JOIN
                dbo.WfProcessInstance ON dbo.WfActivityInstance.ProcessInstanceID = dbo.WfProcessInstance.ID


GO
SET IDENTITY_INSERT [dbo].[BizAppFlow] ON 

INSERT [dbo].[BizAppFlow] ([ID], [AppName], [AppInstanceID], [ActivityName], [Remark], [ChangedTime], [ChangedUserID], [ChangedUserName]) VALUES (1, N'流程发起', N'1', N'流程发起', N'申请人:6-普通员工-小明', CAST(N'2014-11-28 22:14:33.160' AS DateTime), 6, N'普通员工-小明')
INSERT [dbo].[BizAppFlow] ([ID], [AppName], [AppInstanceID], [ActivityName], [Remark], [ChangedTime], [ChangedUserID], [ChangedUserName]) VALUES (2, N'请假流程', N'1', N'部门经理审批', N'申请人:5-部门经理-张部门经理审批', CAST(N'2014-11-28 22:16:06.803' AS DateTime), 5, N'部门经理-张')
INSERT [dbo].[BizAppFlow] ([ID], [AppName], [AppInstanceID], [ActivityName], [Remark], [ChangedTime], [ChangedUserID], [ChangedUserName]) VALUES (3, N'请假流程', N'1', N'人事经理审批', N'申请人:4-人事经理-李小姐人事经理审批', CAST(N'2014-11-28 22:17:40.073' AS DateTime), 4, N'人事经理-李小姐')
SET IDENTITY_INSERT [dbo].[BizAppFlow] OFF
SET IDENTITY_INSERT [dbo].[HrsLeave] ON 

INSERT [dbo].[HrsLeave] ([ID], [LeaveType], [Days], [FromDate], [ToDate], [CurrentActivityText], [Status], [CreatedUserID], [CreatedUserName], [CreatedDate], [DepManagerRemark], [DirectorRemark], [DeputyGeneralRemark], [GeneralManagerRemark]) VALUES (1, 2, CAST(2.0 AS Decimal(18, 1)), CAST(N'2014-11-28' AS Date), CAST(N'2014-11-29' AS Date), N'人事经理审批', 0, 6, N'普通员工-小明', CAST(N'2014-11-28' AS Date), N'同意', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[HrsLeave] OFF
SET IDENTITY_INSERT [dbo].[SysRole] ON 

INSERT [dbo].[SysRole] ([ID], [RoleCode], [RoleName]) VALUES (1, N'employees', N'普通员工')
INSERT [dbo].[SysRole] ([ID], [RoleCode], [RoleName]) VALUES (2, N'depmanager', N'部门经理')
INSERT [dbo].[SysRole] ([ID], [RoleCode], [RoleName]) VALUES (3, N'hrmanager', N'人事经理')
INSERT [dbo].[SysRole] ([ID], [RoleCode], [RoleName]) VALUES (4, N'director', N'主管总监')
INSERT [dbo].[SysRole] ([ID], [RoleCode], [RoleName]) VALUES (7, N'deputygeneralmanager', N'副总经理')
INSERT [dbo].[SysRole] ([ID], [RoleCode], [RoleName]) VALUES (8, N'generalmanager', N'总经理')
SET IDENTITY_INSERT [dbo].[SysRole] OFF
SET IDENTITY_INSERT [dbo].[SysRoleUser] ON 

INSERT [dbo].[SysRoleUser] ([ID], [RoleID], [UserID]) VALUES (1, 8, 1)
INSERT [dbo].[SysRoleUser] ([ID], [RoleID], [UserID]) VALUES (2, 7, 2)
INSERT [dbo].[SysRoleUser] ([ID], [RoleID], [UserID]) VALUES (3, 4, 3)
INSERT [dbo].[SysRoleUser] ([ID], [RoleID], [UserID]) VALUES (4, 3, 4)
INSERT [dbo].[SysRoleUser] ([ID], [RoleID], [UserID]) VALUES (5, 2, 5)
INSERT [dbo].[SysRoleUser] ([ID], [RoleID], [UserID]) VALUES (6, 1, 6)
SET IDENTITY_INSERT [dbo].[SysRoleUser] OFF
SET IDENTITY_INSERT [dbo].[SysUser] ON 

INSERT [dbo].[SysUser] ([ID], [UserName]) VALUES (1, N'总经理-陈')
INSERT [dbo].[SysUser] ([ID], [UserName]) VALUES (2, N'副总经理-魏')
INSERT [dbo].[SysUser] ([ID], [UserName]) VALUES (3, N'主管总监-马总监')
INSERT [dbo].[SysUser] ([ID], [UserName]) VALUES (4, N'人事经理-李小姐')
INSERT [dbo].[SysUser] ([ID], [UserName]) VALUES (5, N'部门经理-张')
INSERT [dbo].[SysUser] ([ID], [UserName]) VALUES (6, N'普通员工-小明')
SET IDENTITY_INSERT [dbo].[SysUser] OFF
SET IDENTITY_INSERT [dbo].[WfActivityInstance] ON 

INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (1, 1, N'WallwaOrder测试数据', N'4612', N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'e357fe9e-dc33-4075-bd34-6f7425bb7671', N'开始', 1, 4, NULL, 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-11-28 18:40:30.230' AS DateTime), N'2', N'yiran', CAST(N'2014-11-28 18:40:30.470' AS DateTime), CAST(N'2014-11-28 18:40:30.470' AS DateTime), N'2', N'yiran', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (2, 1, N'WallwaOrder测试数据', N'4612', N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'aad747dd-2b75-449c-a8a6-391b8a426e83', N'打单', 4, 2, N'2', 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-11-28 18:40:30.657' AS DateTime), N'2', N'yiran', CAST(N'2014-11-28 18:40:30.893' AS DateTime), CAST(N'2014-11-28 18:40:30.893' AS DateTime), N'2', N'yiran', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (3, 1, N'WallwaOrder测试数据', N'4612', N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'890d4971-3d5d-4800-bdf3-a355fd4a6317', N'Or分支节点', 8, 4, NULL, 0, NULL, 1, 0, 1, 1, NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-11-28 18:40:30.893' AS DateTime), N'2', N'yiran', CAST(N'2014-11-28 18:40:30.893' AS DateTime), CAST(N'2014-11-28 18:40:30.893' AS DateTime), N'2', N'yiran', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (4, 1, N'WallwaOrder测试数据', N'4612', N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'fc8c71c5-8786-450e-af27-9f6a9de8560f', N'输出', 4, 1, N'', 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-11-28 18:40:30.907' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (5, 2, N'请假流程', N'1', N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'99d407e8-ad21-46b9-aa4f-ad3e0968f954', N'开始', 1, 4, NULL, 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:33.653' AS DateTime), N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:33.810' AS DateTime), CAST(N'2014-11-28 22:14:33.810' AS DateTime), N'6', N'普通员工-小明', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (6, 2, N'请假流程', N'1', N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'4a916298-d514-41e0-8a48-a6bcc33d32b9', N'员工提交', 4, 4, N'6', 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:33.880' AS DateTime), N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:34.007' AS DateTime), CAST(N'2014-11-28 22:14:34.007' AS DateTime), N'6', N'普通员工-小明', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (7, 2, N'请假流程', N'1', N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'a44d219c-c60e-468c-b5ab-3f5159ac24a4', N'Or分支节点', 8, 4, NULL, 0, NULL, 1, 0, 1, 1, NULL, NULL, NULL, N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:34.010' AS DateTime), N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:34.010' AS DateTime), CAST(N'2014-11-28 22:14:34.010' AS DateTime), N'6', N'普通员工-小明', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (8, 2, N'请假流程', N'1', N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'48bf310f-9dab-403a-9107-2d6d7d0060c9', N'部门经理审批', 4, 4, N'5', 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:34.013' AS DateTime), N'5', N'部门经理-张', CAST(N'2014-11-28 22:16:06.817' AS DateTime), CAST(N'2014-11-28 22:16:06.817' AS DateTime), N'5', N'部门经理-张', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (9, 2, N'请假流程', N'1', N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'd81e924c-59ee-4e57-afda-707e0af40311', N'人事经理审批', 4, 4, N'4', 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'5', N'部门经理-张', CAST(N'2014-11-28 22:16:06.817' AS DateTime), N'4', N'人事经理-李小姐', CAST(N'2014-11-28 22:17:40.090' AS DateTime), CAST(N'2014-11-28 22:17:40.090' AS DateTime), N'4', N'人事经理-李小姐', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (10, 2, N'请假流程', N'1', N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'b92b275f-f646-43b2-bfdd-f7904a186460', N'结束', 2, 4, NULL, 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'4', N'人事经理-李小姐', CAST(N'2014-11-28 22:17:40.090' AS DateTime), N'4', N'人事经理-李小姐', CAST(N'2014-11-28 22:17:40.093' AS DateTime), CAST(N'2014-11-28 22:17:40.093' AS DateTime), N'4', N'人事经理-李小姐', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (11, 3, N'WfOrder测试数据', N'10242', N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'e357fe9e-dc33-4075-bd34-6f7425bb7671', N'开始', 1, 4, NULL, 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-12-30 10:08:14.033' AS DateTime), N'2', N'yiran', CAST(N'2014-12-30 10:08:14.153' AS DateTime), CAST(N'2014-12-30 10:08:14.153' AS DateTime), N'2', N'yiran', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (12, 3, N'WfOrder测试数据', N'10242', N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'aad747dd-2b75-449c-a8a6-391b8a426e83', N'打单', 4, 4, N'2', 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-12-30 10:08:14.310' AS DateTime), N'2', N'yiran', CAST(N'2014-12-30 10:08:14.557' AS DateTime), CAST(N'2014-12-30 10:08:14.557' AS DateTime), N'2', N'yiran', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (13, 3, N'WfOrder测试数据', N'10242', N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'890d4971-3d5d-4800-bdf3-a355fd4a6317', N'Or分支节点', 8, 4, NULL, 0, NULL, 1, 0, 1, 1, NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-12-30 10:08:14.563' AS DateTime), N'2', N'yiran', CAST(N'2014-12-30 10:08:14.563' AS DateTime), CAST(N'2014-12-30 10:08:14.563' AS DateTime), N'2', N'yiran', 0)
INSERT [dbo].[WfActivityInstance] ([ID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [ActivityType], [ActivityState], [AssignedToUsers], [BackwardType], [BackSrcActivityInstanceID], [GatewayDirectionTypeID], [CanRenewInstance], [TokensRequired], [TokensHad], [ComplexType], [MIHostActivityInstanceID], [CompleteOrder], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [LastUpdatedDateTime], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (14, 3, N'WfOrder测试数据', N'10242', N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'fc8c71c5-8786-450e-af27-9f6a9de8560f', N'输出', 4, 1, N'', 0, NULL, 0, 0, 1, 1, NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-12-30 10:08:14.567' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[WfActivityInstance] OFF
SET IDENTITY_INSERT [dbo].[WfLog] ON 

INSERT [dbo].[WfLog] ([ID], [EventTypeID], [Priority], [Severity], [Title], [Message], [StackTrace], [InnerStackTrace], [RequestData], [Timestamp]) VALUES (1, 2, 1, N'HIGH', N'流程流转异常', N'列名 ''IsProcessCompleted'' 无效。', N'   在 System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   在 System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   在 System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   在 System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   在 System.Data.SqlClient.SqlDataReader.get_MetaData()
   在 System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   在 System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   在 System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   在 System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   在 System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   在 System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   在 System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   在 Dapper.SqlMapper.<QueryInternal>d__d`1.MoveNext() 位置 e:\Cloud365\GitHome\Slickflow\Source\Dapper\SqlMapper.cs:行号 862
   在 System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   在 DapperExtensions.DapperImplementor.Insert[T](IDbConnection connection, T entity, IDbTransaction transaction, Nullable`1 commandTimeout) 位置 e:\Cloud365\GitHome\Slickflow\Source\Dapper\Extensions\DapperImplementor.cs:行号 99
   在 DapperExtensions.DapperExtensions.Insert[T](IDbConnection connection, T entity, IDbTransaction transaction, Nullable`1 commandTimeout) 位置 e:\Cloud365\GitHome\Slickflow\Source\Dapper\Extensions\DapperExtensions.cs:行号 159
   在 Slickflow.Data.Repository.Insert[T](IDbConnection conn, T entity, IDbTransaction transaction) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Data\Repository.cs:行号 384
   在 Slickflow.Engine.Business.Manager.ProcessInstanceManager.Insert(IDbConnection conn, ProcessInstanceEntity entity, IDbTransaction trans) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Business\Manager\ProcessInstanceManager.cs:行号 163
   在 Slickflow.Engine.Core.Pattern.NodeMediatorStart.ExecuteWorkItem() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\Pattern\NodeMediatorStart.cs:行号 53
   在 Slickflow.Engine.Core.WfRuntimeManagerStartup.ExecuteInstanceImp(IDbSession session) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\WfRuntimeManagerStartup.cs:行号 44
   在 Slickflow.Engine.Core.WfRuntimeManager.Execute(IDbSession session) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\WfRuntimeManager.cs:行号 82', NULL, N'{"AppName":"WallwaOrder测试数据","AppInstanceID":"4612","ProcessGUID":"5C5041FC-AB7F-46C0-85A5-6250C3AEA375","UserID":"2","UserName":"yiran","NextActivityPerformers":{"aad747dd-2b75-449c-a8a6-391b8a426e83":[{"UserID":"2","UserName":"yiran"}]}}', CAST(N'2014-11-28 18:39:28.960' AS DateTime))
INSERT [dbo].[WfLog] ([ID], [EventTypeID], [Priority], [Severity], [Title], [Message], [StackTrace], [InnerStackTrace], [RequestData], [Timestamp]) VALUES (2, 2, 1, N'HIGH', N'流程流转异常', N'列名 ''IsProcessCompleted'' 无效。', N'   在 System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   在 System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   在 System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   在 System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   在 System.Data.SqlClient.SqlDataReader.get_MetaData()
   在 System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   在 System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   在 System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   在 System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   在 System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   在 System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   在 System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   在 Dapper.SqlMapper.<QueryInternal>d__d`1.MoveNext() 位置 e:\Cloud365\GitHome\Slickflow\Source\Dapper\SqlMapper.cs:行号 862
   在 System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   在 DapperExtensions.DapperImplementor.Insert[T](IDbConnection connection, T entity, IDbTransaction transaction, Nullable`1 commandTimeout) 位置 e:\Cloud365\GitHome\Slickflow\Source\Dapper\Extensions\DapperImplementor.cs:行号 99
   在 DapperExtensions.DapperExtensions.Insert[T](IDbConnection connection, T entity, IDbTransaction transaction, Nullable`1 commandTimeout) 位置 e:\Cloud365\GitHome\Slickflow\Source\Dapper\Extensions\DapperExtensions.cs:行号 159
   在 Slickflow.Data.Repository.Insert[T](IDbConnection conn, T entity, IDbTransaction transaction) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Data\Repository.cs:行号 384
   在 Slickflow.Engine.Business.Manager.ProcessInstanceManager.Insert(IDbConnection conn, ProcessInstanceEntity entity, IDbTransaction trans) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Business\Manager\ProcessInstanceManager.cs:行号 163
   在 Slickflow.Engine.Core.Pattern.NodeMediatorStart.ExecuteWorkItem() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\Pattern\NodeMediatorStart.cs:行号 53
   在 Slickflow.Engine.Core.WfRuntimeManagerStartup.ExecuteInstanceImp(IDbSession session) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\WfRuntimeManagerStartup.cs:行号 44
   在 Slickflow.Engine.Core.WfRuntimeManager.Execute(IDbSession session) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\WfRuntimeManager.cs:行号 100
   在 Slickflow.Engine.Service.WorkflowService.StartProcess(IDbConnection conn, WfAppRunner starter, IDbTransaction trans) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Service\WorkflowService.cs:行号 322', NULL, N'{"AppName":"WallwaOrder测试数据","AppInstanceID":"4612","ProcessGUID":"5C5041FC-AB7F-46C0-85A5-6250C3AEA375","UserID":"2","UserName":"yiran","NextActivityPerformers":{"aad747dd-2b75-449c-a8a6-391b8a426e83":[{"UserID":"2","UserName":"yiran"}]}}', CAST(N'2014-11-28 18:39:29.590' AS DateTime))
INSERT [dbo].[WfLog] ([ID], [EventTypeID], [Priority], [Severity], [Title], [Message], [StackTrace], [InnerStackTrace], [RequestData], [Timestamp]) VALUES (3, 2, 1, N'HIGH', N'流程流转异常', N'请配置流程XML文件，路径:d:\\made\MOrderFlow.xml', N'   在 Slickflow.Engine.Xpdl.ProcessModel.GetProcessXmlDocument() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 129
   在 Slickflow.Engine.Xpdl.ProcessModel.get_XmlProcessDefinition() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 34
   在 Slickflow.Engine.Xpdl.ProcessModel.GetXmlActivityTypeNodeFromXmlFile(String nodeType) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 599
   在 Slickflow.Engine.Xpdl.ProcessModel.GetStartActivity() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 196
   在 Slickflow.Engine.Xpdl.ProcessModel.GetFirstActivity() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 238
   在 Slickflow.Engine.Core.WfRuntimeManagerFactory.CreateRuntimeInstanceStartup(WfAppRunner runner, ProcessInstanceEntity parentProcessInstance, SubProcessNode subProcessNode, WfExecutedResult& result) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\WfRuntimeManagerFactory.cs:行号 85
   在 Slickflow.Engine.Core.WfRuntimeManagerFactory.CreateRuntimeInstanceStartup(WfAppRunner runner, WfExecutedResult& result) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\WfRuntimeManagerFactory.cs:行号 38
   在 Slickflow.Engine.Service.WorkflowService.StartProcess(IDbConnection conn, WfAppRunner starter, IDbTransaction trans) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Service\WorkflowService.cs:行号 360', NULL, N'{"AppName":"WfOrder测试数据","AppInstanceID":"10242","ProcessGUID":"5C5041FC-AB7F-46C0-85A5-6250C3AEA375","UserID":"2","UserName":"yiran"}', CAST(N'2014-12-30 10:06:52.740' AS DateTime))
INSERT [dbo].[WfLog] ([ID], [EventTypeID], [Priority], [Severity], [Title], [Message], [StackTrace], [InnerStackTrace], [RequestData], [Timestamp]) VALUES (4, 2, 1, N'HIGH', N'流程流转异常', N'请配置流程XML文件，路径:c:\\made\MOrderFlow.xml', N'   在 Slickflow.Engine.Xpdl.ProcessModel.GetProcessXmlDocument() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 129
   在 Slickflow.Engine.Xpdl.ProcessModel.get_XmlProcessDefinition() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 34
   在 Slickflow.Engine.Xpdl.ProcessModel.GetXmlActivityTypeNodeFromXmlFile(String nodeType) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 599
   在 Slickflow.Engine.Xpdl.ProcessModel.GetStartActivity() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 196
   在 Slickflow.Engine.Xpdl.ProcessModel.GetFirstActivity() 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Xpdl\ProcessModel.cs:行号 238
   在 Slickflow.Engine.Core.WfRuntimeManagerFactory.CreateRuntimeInstanceStartup(WfAppRunner runner, ProcessInstanceEntity parentProcessInstance, SubProcessNode subProcessNode, WfExecutedResult& result) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\WfRuntimeManagerFactory.cs:行号 85
   在 Slickflow.Engine.Core.WfRuntimeManagerFactory.CreateRuntimeInstanceStartup(WfAppRunner runner, WfExecutedResult& result) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Core\WfRuntimeManagerFactory.cs:行号 38
   在 Slickflow.Engine.Service.WorkflowService.StartProcess(IDbConnection conn, WfAppRunner starter, IDbTransaction trans) 位置 e:\Cloud365\GitHome\Slickflow\Source\Slickflow.Engine\Service\WorkflowService.cs:行号 360', NULL, N'{"AppName":"WfOrder测试数据","AppInstanceID":"10242","ProcessGUID":"5C5041FC-AB7F-46C0-85A5-6250C3AEA375","UserID":"2","UserName":"yiran"}', CAST(N'2014-12-30 10:07:52.733' AS DateTime))
SET IDENTITY_INSERT [dbo].[WfLog] OFF
SET IDENTITY_INSERT [dbo].[WfProcess] ON 

INSERT [dbo].[WfProcess] ([ID], [ProcessGUID], [ProcessName], [AppType], [PageUrl], [XmlFileName], [XmlFilePath], [Description], [CreatedDateTime], [LastUpdatedDateTime]) VALUES (1, N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'请假流程(NEW)', N'QINGJIA', NULL, N'HrsLeave1.xml', N'qingjia\HrsLeave1.xml', NULL, CAST(N'2014-11-26 10:54:01.330' AS DateTime), NULL)
INSERT [dbo].[WfProcess] ([ID], [ProcessGUID], [ProcessName], [AppType], [PageUrl], [XmlFileName], [XmlFilePath], [Description], [CreatedDateTime], [LastUpdatedDateTime]) VALUES (2, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'生产订单流程', N'MADE', N' ', N'MOrderFlow.xml', N'made\MOrderFlow.xml', N'生产订单流程描述', CAST(N'2014-11-07 15:23:40.710' AS DateTime), NULL)
INSERT [dbo].[WfProcess] ([ID], [ProcessGUID], [ProcessName], [AppType], [PageUrl], [XmlFileName], [XmlFilePath], [Description], [CreatedDateTime], [LastUpdatedDateTime]) VALUES (3, N'072af8c3-482a-4b1c-890b-685ce2fcc75d', N'报价流程', N'PRICE', NULL, N'price.xml', N'price\price.xml', N'wf2', CAST(N'2014-12-06 13:50:28.420' AS DateTime), NULL)
INSERT [dbo].[WfProcess] ([ID], [ProcessGUID], [ProcessName], [AppType], [PageUrl], [XmlFileName], [XmlFilePath], [Description], [CreatedDateTime], [LastUpdatedDateTime]) VALUES (4, N'6a171d68-3fe7-482a-a727-27eaf93bc42c', N'测试流程', N'TEST', NULL, N'test.xml', N'test\test.xml', NULL, CAST(N'2014-12-09 18:06:02.640' AS DateTime), NULL)
INSERT [dbo].[WfProcess] ([ID], [ProcessGUID], [ProcessName], [AppType], [PageUrl], [XmlFileName], [XmlFilePath], [Description], [CreatedDateTime], [LastUpdatedDateTime]) VALUES (23, N'15ac67af-5d94-437d-8ef6-d036c0b045c4', N'ufob', N'ufo', NULL, N'ufob.xml', N'ufo\ufob.xml', N'f', CAST(N'2015-01-03 21:13:13.687' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[WfProcess] OFF
SET IDENTITY_INSERT [dbo].[WfProcessInstance] ON 

INSERT [dbo].[WfProcessInstance] ([ID], [ProcessGUID], [ProcessName], [AppInstanceID], [AppName], [AppInstanceCode], [ProcessState], [ParentProcessInstanceID], [ParentProcessGUID], [InvokedActivityInstanceID], [InvokedActivityGUID], [CreatedDateTime], [CreatedByUserID], [CreatedByUserName], [LastUpdatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (1, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'生产订单流程', N'4612', N'WallwaOrder测试数据', NULL, 2, NULL, NULL, 0, NULL, CAST(N'2014-11-28 18:40:30.077' AS DateTime), N'2', N'yiran', CAST(N'2014-11-28 18:40:30.077' AS DateTime), N'2', N'yiran', NULL, NULL, NULL, 0)
INSERT [dbo].[WfProcessInstance] ([ID], [ProcessGUID], [ProcessName], [AppInstanceID], [AppName], [AppInstanceCode], [ProcessState], [ParentProcessInstanceID], [ParentProcessGUID], [InvokedActivityInstanceID], [InvokedActivityGUID], [CreatedDateTime], [CreatedByUserID], [CreatedByUserName], [LastUpdatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (2, N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'请假流程(NEW)', N'1', N'请假流程', NULL, 4, NULL, NULL, 0, NULL, CAST(N'2014-11-28 22:14:33.503' AS DateTime), N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:33.503' AS DateTime), N'6', N'普通员工-小明', CAST(N'2014-11-28 22:17:40.097' AS DateTime), N'4', N'人事经理-李小姐', 0)
INSERT [dbo].[WfProcessInstance] ([ID], [ProcessGUID], [ProcessName], [AppInstanceID], [AppName], [AppInstanceCode], [ProcessState], [ParentProcessInstanceID], [ParentProcessGUID], [InvokedActivityInstanceID], [InvokedActivityGUID], [CreatedDateTime], [CreatedByUserID], [CreatedByUserName], [LastUpdatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [EndedDateTime], [EndedByUserID], [EndedByUserName], [RecordStatusInvalid]) VALUES (3, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'生产订单流程', N'10242', N'WfOrder测试数据', NULL, 2, NULL, NULL, 0, NULL, CAST(N'2014-12-30 10:08:13.847' AS DateTime), N'2', N'yiran', CAST(N'2014-12-30 10:08:13.847' AS DateTime), N'2', N'yiran', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[WfProcessInstance] OFF
SET IDENTITY_INSERT [dbo].[WfTasks] ON 

INSERT [dbo].[WfTasks] ([ID], [ActivityInstanceID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [TaskType], [TaskState], [AssignedToUserID], [AssignedToUserName], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [EndedByUserID], [EndedByUserName], [EndedDateTime], [RecordStatusInvalid]) VALUES (1, 2, 1, N'WallwaOrder测试数据', 4612, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'aad747dd-2b75-449c-a8a6-391b8a426e83', N'打单', 1, 4, N'2', N'yiran', N'2', N'yiran', CAST(N'2014-11-28 18:40:30.657' AS DateTime), NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-11-28 18:40:30.877' AS DateTime), 0)
INSERT [dbo].[WfTasks] ([ID], [ActivityInstanceID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [TaskType], [TaskState], [AssignedToUserID], [AssignedToUserName], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [EndedByUserID], [EndedByUserName], [EndedDateTime], [RecordStatusInvalid]) VALUES (2, 6, 2, N'请假流程', 1, N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'4a916298-d514-41e0-8a48-a6bcc33d32b9', N'员工提交', 1, 4, N'6', N'普通员工-小明', N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:33.890' AS DateTime), NULL, NULL, NULL, N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:34.000' AS DateTime), 0)
INSERT [dbo].[WfTasks] ([ID], [ActivityInstanceID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [TaskType], [TaskState], [AssignedToUserID], [AssignedToUserName], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [EndedByUserID], [EndedByUserName], [EndedDateTime], [RecordStatusInvalid]) VALUES (3, 8, 2, N'请假流程', 1, N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'48bf310f-9dab-403a-9107-2d6d7d0060c9', N'部门经理审批', 1, 4, N'5', N'部门经理-张', N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:34.013' AS DateTime), NULL, NULL, NULL, N'5', N'部门经理-张', CAST(N'2014-11-28 22:16:06.817' AS DateTime), 0)
INSERT [dbo].[WfTasks] ([ID], [ActivityInstanceID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [TaskType], [TaskState], [AssignedToUserID], [AssignedToUserName], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [EndedByUserID], [EndedByUserName], [EndedDateTime], [RecordStatusInvalid]) VALUES (4, 9, 2, N'请假流程', 1, N'2acffb20-6bd1-4891-98c9-c76d022d1445', N'd81e924c-59ee-4e57-afda-707e0af40311', N'人事经理审批', 1, 4, N'4', N'人事经理-李小姐', N'5', N'部门经理-张', CAST(N'2014-11-28 22:16:06.833' AS DateTime), NULL, NULL, NULL, N'4', N'人事经理-李小姐', CAST(N'2014-11-28 22:17:40.087' AS DateTime), 0)
INSERT [dbo].[WfTasks] ([ID], [ActivityInstanceID], [ProcessInstanceID], [AppName], [AppInstanceID], [ProcessGUID], [ActivityGUID], [ActivityName], [TaskType], [TaskState], [AssignedToUserID], [AssignedToUserName], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [LastUpdatedDateTime], [LastUpdatedByUserID], [LastUpdatedByUserName], [EndedByUserID], [EndedByUserName], [EndedDateTime], [RecordStatusInvalid]) VALUES (5, 12, 3, N'WfOrder测试数据', 10242, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', N'aad747dd-2b75-449c-a8a6-391b8a426e83', N'打单', 1, 4, N'2', N'yiran', N'2', N'yiran', CAST(N'2014-12-30 10:08:14.317' AS DateTime), NULL, NULL, NULL, N'2', N'yiran', CAST(N'2014-12-30 10:08:14.537' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[WfTasks] OFF
SET IDENTITY_INSERT [dbo].[WfTransitionInstance] ON 

INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (1, N'8cf45855-a29c-4d8f-b7bb-5a8d7de25f34', N'WallwaOrder测试数据', 4612, 1, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', 1, 0, 1, N'e357fe9e-dc33-4075-bd34-6f7425bb7671', 1, N'开始', 2, N'aad747dd-2b75-449c-a8a6-391b8a426e83', 4, N'打单', 1, N'2', N'yiran', CAST(N'2014-11-28 18:40:30.687' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (2, N'8e51f7d5-18f2-47bd-8668-a1a4b2322add', N'WallwaOrder测试数据', 4612, 1, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', 1, 0, 2, N'aad747dd-2b75-449c-a8a6-391b8a426e83', 4, N'打单', 3, N'890d4971-3d5d-4800-bdf3-a355fd4a6317', 8, N'Or分支节点', 1, N'2', N'yiran', CAST(N'2014-11-28 18:40:30.893' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (3, N'f2388ddb-d3be-4085-b161-2cac489fff6e', N'WallwaOrder测试数据', 4612, 1, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', 1, 0, 3, N'890d4971-3d5d-4800-bdf3-a355fd4a6317', 8, N'Or分支节点', 4, N'fc8c71c5-8786-450e-af27-9f6a9de8560f', 4, N'输出', 1, N'2', N'yiran', CAST(N'2014-11-28 18:40:30.910' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (4, N'b46572bc-c066-4156-9a99-743959408cb3', N'请假流程', 1, 2, N'2acffb20-6bd1-4891-98c9-c76d022d1445', 1, 0, 5, N'99d407e8-ad21-46b9-aa4f-ad3e0968f954', 1, N'开始', 6, N'4a916298-d514-41e0-8a48-a6bcc33d32b9', 4, N'员工提交', 1, N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:33.933' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (5, N'3a16f97e-26e2-4748-a7a9-6ff3698b09e9', N'请假流程', 1, 2, N'2acffb20-6bd1-4891-98c9-c76d022d1445', 1, 0, 6, N'4a916298-d514-41e0-8a48-a6bcc33d32b9', 4, N'员工提交', 7, N'a44d219c-c60e-468c-b5ab-3f5159ac24a4', 8, N'Or分支节点', 1, N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:34.013' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (6, N'4cd35728-d203-48a9-a68a-38c5cef685ea', N'请假流程', 1, 2, N'2acffb20-6bd1-4891-98c9-c76d022d1445', 1, 0, 7, N'a44d219c-c60e-468c-b5ab-3f5159ac24a4', 8, N'Or分支节点', 8, N'48bf310f-9dab-403a-9107-2d6d7d0060c9', 4, N'部门经理审批', 1, N'6', N'普通员工-小明', CAST(N'2014-11-28 22:14:34.017' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (7, N'e64efc47-c09a-42c5-adcb-28b8fed31cf4', N'请假流程', 1, 2, N'2acffb20-6bd1-4891-98c9-c76d022d1445', 1, 0, 8, N'48bf310f-9dab-403a-9107-2d6d7d0060c9', 4, N'部门经理审批', 9, N'd81e924c-59ee-4e57-afda-707e0af40311', 4, N'人事经理审批', 1, N'5', N'部门经理-张', CAST(N'2014-11-28 22:16:06.850' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (8, N'0c851a0e-7d6a-b26d-7947-d25b88d5179b', N'请假流程', 1, 2, N'2acffb20-6bd1-4891-98c9-c76d022d1445', 1, 0, 9, N'd81e924c-59ee-4e57-afda-707e0af40311', 4, N'人事经理审批', 10, N'b92b275f-f646-43b2-bfdd-f7904a186460', 2, N'结束', 1, N'4', N'人事经理-李小姐', CAST(N'2014-11-28 22:17:40.093' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (9, N'8cf45855-a29c-4d8f-b7bb-5a8d7de25f34', N'WfOrder测试数据', 10242, 3, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', 1, 0, 11, N'e357fe9e-dc33-4075-bd34-6f7425bb7671', 1, N'开始', 12, N'aad747dd-2b75-449c-a8a6-391b8a426e83', 4, N'打单', 1, N'2', N'yiran', CAST(N'2014-12-30 10:08:14.343' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (10, N'8e51f7d5-18f2-47bd-8668-a1a4b2322add', N'WfOrder测试数据', 10242, 3, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', 1, 0, 12, N'aad747dd-2b75-449c-a8a6-391b8a426e83', 4, N'打单', 13, N'890d4971-3d5d-4800-bdf3-a355fd4a6317', 8, N'Or分支节点', 1, N'2', N'yiran', CAST(N'2014-12-30 10:08:14.567' AS DateTime), 0)
INSERT [dbo].[WfTransitionInstance] ([ID], [TransitionGUID], [AppName], [AppInstanceID], [ProcessInstanceID], [ProcessGUID], [TransitionType], [FlyingType], [FromActivityInstanceID], [FromActivityGUID], [FromActivityType], [FromActivityName], [ToActivityInstanceID], [ToActivityGUID], [ToActivityType], [ToActivityName], [ConditionParseResult], [CreatedByUserID], [CreatedByUserName], [CreatedDateTime], [RecordStatusInvalid]) VALUES (11, N'f2388ddb-d3be-4085-b161-2cac489fff6e', N'WfOrder测试数据', 10242, 3, N'5C5041FC-AB7F-46C0-85A5-6250C3AEA375', 1, 0, 13, N'890d4971-3d5d-4800-bdf3-a355fd4a6317', 8, N'Or分支节点', 14, N'fc8c71c5-8786-450e-af27-9f6a9de8560f', 4, N'输出', 1, N'2', N'yiran', CAST(N'2014-12-30 10:08:14.567' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[WfTransitionInstance] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_SSIP_WfProcess]    Script Date: 2015-01-05 18:41:58 ******/
ALTER TABLE [dbo].[WfProcess] ADD  CONSTRAINT [PK_SSIP_WfProcess] PRIMARY KEY NONCLUSTERED 
(
	[ProcessGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WfActivityInstance]  WITH NOCHECK ADD  CONSTRAINT [FK_WfActivityInstance_ProcessInstanceID] FOREIGN KEY([ProcessInstanceID])
REFERENCES [dbo].[WfProcessInstance] ([ID])
GO
ALTER TABLE [dbo].[WfActivityInstance] CHECK CONSTRAINT [FK_WfActivityInstance_ProcessInstanceID]
GO
ALTER TABLE [dbo].[WfTasks]  WITH NOCHECK ADD  CONSTRAINT [FK_WfTasks_ActivityInstanceID] FOREIGN KEY([ActivityInstanceID])
REFERENCES [dbo].[WfActivityInstance] ([ID])
GO
ALTER TABLE [dbo].[WfTasks] CHECK CONSTRAINT [FK_WfTasks_ActivityInstanceID]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请假天数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HrsLeave', @level2type=N'COLUMN',@level2name=N'Days'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请假开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HrsLeave', @level2type=N'COLUMN',@level2name=N'FromDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请假结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HrsLeave', @level2type=N'COLUMN',@level2name=N'ToDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'正在办理的节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HrsLeave', @level2type=N'COLUMN',@level2name=N'CurrentActivityText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' /// <summary>
           /// 未启动，流程记录为空
           /// </summary>
           NotStart = 0,
   
           /// <summary>
           /// 准备状态
           /// </summary>
           Ready = 1,
   
           /// <summary>
           /// 运行状态
           /// </summary>
           Running = 2,
   
           /// <summary>
           /// 完成
           /// </summary>
           Completed = 4,
   
           /// <summary>
           /// 挂起
           /// </summary>
           Suspended = 5,
   
           /// <summary>
           /// 取消
           /// </summary>
           Canceled = 6,
   
           /// <summary>
           /// 终止
           /// </summary>
           Discarded = 7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HrsLeave', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请假人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HrsLeave', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请假人名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HrsLeave', @level2type=N'COLUMN',@level2name=N'CreatedUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HrsLeave', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[17] 4[36] 2[32] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -1052
      End
      Begin Tables = 
         Begin Table = "WfActivityInstance"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "WfTasks"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "WfProcessInstance"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 365
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4410
         Alias = 1650
         Table = 2595
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwWfActivityInstanceTasks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwWfActivityInstanceTasks'
GO
