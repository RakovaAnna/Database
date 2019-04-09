
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/14/2018 16:26:20
-- Generated from EDMX file: C:\Users\анна\Desktop\Практика\Schedules\Schedules\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SchData];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ScheduleLesson]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LessonSet] DROP CONSTRAINT [FK_ScheduleLesson];
GO
IF OBJECT_ID(N'[dbo].[FK_LessonSClass]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LessonSet] DROP CONSTRAINT [FK_LessonSClass];
GO
IF OBJECT_ID(N'[dbo].[FK_SubjectLesson]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LessonSet] DROP CONSTRAINT [FK_SubjectLesson];
GO
IF OBJECT_ID(N'[dbo].[FK_SubjectPlanElem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlanElemSet] DROP CONSTRAINT [FK_SubjectPlanElem];
GO
IF OBJECT_ID(N'[dbo].[FK_TeacherSubject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubjectSet] DROP CONSTRAINT [FK_TeacherSubject];
GO
IF OBJECT_ID(N'[dbo].[FK_PlanElemIndivPlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlanElemSet] DROP CONSTRAINT [FK_PlanElemIndivPlan];
GO
IF OBJECT_ID(N'[dbo].[FK_SClassPlanElem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlanElemSet] DROP CONSTRAINT [FK_SClassPlanElem];
GO
IF OBJECT_ID(N'[dbo].[FK_IndivPlanStudent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentSet] DROP CONSTRAINT [FK_IndivPlanStudent];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentSClass]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentSet] DROP CONSTRAINT [FK_StudentSClass];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ScheduleSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScheduleSet];
GO
IF OBJECT_ID(N'[dbo].[LessonSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LessonSet];
GO
IF OBJECT_ID(N'[dbo].[TeacherSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TeacherSet];
GO
IF OBJECT_ID(N'[dbo].[SubjectSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubjectSet];
GO
IF OBJECT_ID(N'[dbo].[SClassSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SClassSet];
GO
IF OBJECT_ID(N'[dbo].[PlanElemSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlanElemSet];
GO
IF OBJECT_ID(N'[dbo].[IndivPlanSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[IndivPlanSet];
GO
IF OBJECT_ID(N'[dbo].[StudentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ScheduleSet'
CREATE TABLE [dbo].[ScheduleSet] (
    [Date] datetime  NOT NULL,
    [ChangeDate] datetime  NOT NULL
);
GO

-- Creating table 'LessonSet'
CREATE TABLE [dbo].[LessonSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Number] smallint  NOT NULL,
    [Schedule_Date] datetime  NOT NULL,
    [SClass_Id] int  NOT NULL,
    [Subject_Id] int  NOT NULL
);
GO

-- Creating table 'TeacherSet'
CREATE TABLE [dbo].[TeacherSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SubjectSet'
CREATE TABLE [dbo].[SubjectSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Room] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Teacher_Id] int  NOT NULL
);
GO

-- Creating table 'SClassSet'
CREATE TABLE [dbo].[SClassSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Number] smallint  NOT NULL,
    [Letter] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PlanElemSet'
CREATE TABLE [dbo].[PlanElemSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Mo] smallint  NOT NULL,
    [Tu] smallint  NOT NULL,
    [We] smallint  NOT NULL,
    [Th] smallint  NOT NULL,
    [Fr] smallint  NOT NULL,
    [Sa] smallint  NOT NULL,
    [Subject_Id] int  NOT NULL,
    [IndivPlan_Id] int  NULL,
    [SClass_Id] int  NULL
);
GO

-- Creating table 'IndivPlanSet'
CREATE TABLE [dbo].[IndivPlanSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StudentSet'
CREATE TABLE [dbo].[StudentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [IndivPlan_Id] int  NULL,
    [SClass_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Date] in table 'ScheduleSet'
ALTER TABLE [dbo].[ScheduleSet]
ADD CONSTRAINT [PK_ScheduleSet]
    PRIMARY KEY CLUSTERED ([Date] ASC);
GO

-- Creating primary key on [Id] in table 'LessonSet'
ALTER TABLE [dbo].[LessonSet]
ADD CONSTRAINT [PK_LessonSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TeacherSet'
ALTER TABLE [dbo].[TeacherSet]
ADD CONSTRAINT [PK_TeacherSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubjectSet'
ALTER TABLE [dbo].[SubjectSet]
ADD CONSTRAINT [PK_SubjectSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SClassSet'
ALTER TABLE [dbo].[SClassSet]
ADD CONSTRAINT [PK_SClassSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PlanElemSet'
ALTER TABLE [dbo].[PlanElemSet]
ADD CONSTRAINT [PK_PlanElemSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'IndivPlanSet'
ALTER TABLE [dbo].[IndivPlanSet]
ADD CONSTRAINT [PK_IndivPlanSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [PK_StudentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Schedule_Date] in table 'LessonSet'
ALTER TABLE [dbo].[LessonSet]
ADD CONSTRAINT [FK_ScheduleLesson]
    FOREIGN KEY ([Schedule_Date])
    REFERENCES [dbo].[ScheduleSet]
        ([Date])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleLesson'
CREATE INDEX [IX_FK_ScheduleLesson]
ON [dbo].[LessonSet]
    ([Schedule_Date]);
GO

-- Creating foreign key on [SClass_Id] in table 'LessonSet'
ALTER TABLE [dbo].[LessonSet]
ADD CONSTRAINT [FK_LessonSClass]
    FOREIGN KEY ([SClass_Id])
    REFERENCES [dbo].[SClassSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LessonSClass'
CREATE INDEX [IX_FK_LessonSClass]
ON [dbo].[LessonSet]
    ([SClass_Id]);
GO

-- Creating foreign key on [Subject_Id] in table 'LessonSet'
ALTER TABLE [dbo].[LessonSet]
ADD CONSTRAINT [FK_SubjectLesson]
    FOREIGN KEY ([Subject_Id])
    REFERENCES [dbo].[SubjectSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectLesson'
CREATE INDEX [IX_FK_SubjectLesson]
ON [dbo].[LessonSet]
    ([Subject_Id]);
GO

-- Creating foreign key on [Subject_Id] in table 'PlanElemSet'
ALTER TABLE [dbo].[PlanElemSet]
ADD CONSTRAINT [FK_SubjectPlanElem]
    FOREIGN KEY ([Subject_Id])
    REFERENCES [dbo].[SubjectSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectPlanElem'
CREATE INDEX [IX_FK_SubjectPlanElem]
ON [dbo].[PlanElemSet]
    ([Subject_Id]);
GO

-- Creating foreign key on [Teacher_Id] in table 'SubjectSet'
ALTER TABLE [dbo].[SubjectSet]
ADD CONSTRAINT [FK_TeacherSubject]
    FOREIGN KEY ([Teacher_Id])
    REFERENCES [dbo].[TeacherSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherSubject'
CREATE INDEX [IX_FK_TeacherSubject]
ON [dbo].[SubjectSet]
    ([Teacher_Id]);
GO

-- Creating foreign key on [IndivPlan_Id] in table 'PlanElemSet'
ALTER TABLE [dbo].[PlanElemSet]
ADD CONSTRAINT [FK_PlanElemIndivPlan]
    FOREIGN KEY ([IndivPlan_Id])
    REFERENCES [dbo].[IndivPlanSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlanElemIndivPlan'
CREATE INDEX [IX_FK_PlanElemIndivPlan]
ON [dbo].[PlanElemSet]
    ([IndivPlan_Id]);
GO

-- Creating foreign key on [SClass_Id] in table 'PlanElemSet'
ALTER TABLE [dbo].[PlanElemSet]
ADD CONSTRAINT [FK_SClassPlanElem]
    FOREIGN KEY ([SClass_Id])
    REFERENCES [dbo].[SClassSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SClassPlanElem'
CREATE INDEX [IX_FK_SClassPlanElem]
ON [dbo].[PlanElemSet]
    ([SClass_Id]);
GO

-- Creating foreign key on [IndivPlan_Id] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [FK_IndivPlanStudent]
    FOREIGN KEY ([IndivPlan_Id])
    REFERENCES [dbo].[IndivPlanSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IndivPlanStudent'
CREATE INDEX [IX_FK_IndivPlanStudent]
ON [dbo].[StudentSet]
    ([IndivPlan_Id]);
GO

-- Creating foreign key on [SClass_Id] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [FK_StudentSClass]
    FOREIGN KEY ([SClass_Id])
    REFERENCES [dbo].[SClassSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentSClass'
CREATE INDEX [IX_FK_StudentSClass]
ON [dbo].[StudentSet]
    ([SClass_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------