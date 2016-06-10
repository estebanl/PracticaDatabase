
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/09/2016 19:31:04
-- Generated from EDMX file: C:\Users\Spartan-117\Documents\Visual Studio 2015\Projects\Formacion\BasededatosPrueba\Modelo\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [pruebas];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ciudadcliente_ciudad]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ciudadcliente] DROP CONSTRAINT [FK_ciudadcliente_ciudad];
GO
IF OBJECT_ID(N'[dbo].[FK_ciudadcliente_cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ciudadcliente] DROP CONSTRAINT [FK_ciudadcliente_cliente];
GO
IF OBJECT_ID(N'[dbo].[FK_cliente_catalogo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cliente] DROP CONSTRAINT [FK_cliente_catalogo];
GO
IF OBJECT_ID(N'[dbo].[FK_cliente_catalogo1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cliente] DROP CONSTRAINT [FK_cliente_catalogo1];
GO
IF OBJECT_ID(N'[dbo].[FK_cliente_catalogo2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cliente] DROP CONSTRAINT [FK_cliente_catalogo2];
GO
IF OBJECT_ID(N'[dbo].[FK_cliente_telefono_cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cliente_telefono] DROP CONSTRAINT [FK_cliente_telefono_cliente];
GO
IF OBJECT_ID(N'[dbo].[FK_cliente_telefono_telefono]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cliente_telefono] DROP CONSTRAINT [FK_cliente_telefono_telefono];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[catalogo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[catalogo];
GO
IF OBJECT_ID(N'[dbo].[ciudad]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ciudad];
GO
IF OBJECT_ID(N'[dbo].[ciudadcliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ciudadcliente];
GO
IF OBJECT_ID(N'[dbo].[cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cliente];
GO
IF OBJECT_ID(N'[dbo].[cliente_telefono]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cliente_telefono];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[telefono]', 'U') IS NOT NULL
    DROP TABLE [dbo].[telefono];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'catalogo'
CREATE TABLE [dbo].[catalogo] (
    [id] int IDENTITY(1,1) NOT NULL,
    [valor] varchar(50)  NULL
);
GO

-- Creating table 'ciudad'
CREATE TABLE [dbo].[ciudad] (
    [id] int  NOT NULL,
    [ciudad1] nchar(10)  NULL
);
GO

-- Creating table 'ciudadcliente'
CREATE TABLE [dbo].[ciudadcliente] (
    [id] int  NOT NULL,
    [idcliente] int  NULL,
    [idciudad] int  NULL
);
GO

-- Creating table 'cliente'
CREATE TABLE [dbo].[cliente] (
    [id] int  NOT NULL,
    [nombre] nchar(10)  NULL,
    [apellidos] nchar(10)  NULL,
    [direccion] nchar(10)  NULL,
    [id_catalogo] int  NULL,
    [id_catalogo_dos] int  NULL,
    [id_catalogo_tres] int  NULL,
    [id_catalogo_cinco] int  NOT NULL
);
GO

-- Creating table 'cliente_telefono'
CREATE TABLE [dbo].[cliente_telefono] (
    [id] int IDENTITY(1,1) NOT NULL,
    [id_cliente] int  NULL,
    [id_telefono] int  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'telefono'
CREATE TABLE [dbo].[telefono] (
    [id] int IDENTITY(1,1) NOT NULL,
    [telefono1] varchar(20)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'catalogo'
ALTER TABLE [dbo].[catalogo]
ADD CONSTRAINT [PK_catalogo]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ciudad'
ALTER TABLE [dbo].[ciudad]
ADD CONSTRAINT [PK_ciudad]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ciudadcliente'
ALTER TABLE [dbo].[ciudadcliente]
ADD CONSTRAINT [PK_ciudadcliente]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'cliente'
ALTER TABLE [dbo].[cliente]
ADD CONSTRAINT [PK_cliente]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'cliente_telefono'
ALTER TABLE [dbo].[cliente_telefono]
ADD CONSTRAINT [PK_cliente_telefono]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [id] in table 'telefono'
ALTER TABLE [dbo].[telefono]
ADD CONSTRAINT [PK_telefono]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [id_catalogo] in table 'cliente'
ALTER TABLE [dbo].[cliente]
ADD CONSTRAINT [FK_cliente_catalogo]
    FOREIGN KEY ([id_catalogo])
    REFERENCES [dbo].[catalogo]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_cliente_catalogo'
CREATE INDEX [IX_FK_cliente_catalogo]
ON [dbo].[cliente]
    ([id_catalogo]);
GO

-- Creating foreign key on [id_catalogo_dos] in table 'cliente'
ALTER TABLE [dbo].[cliente]
ADD CONSTRAINT [FK_cliente_catalogo1]
    FOREIGN KEY ([id_catalogo_dos])
    REFERENCES [dbo].[catalogo]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_cliente_catalogo1'
CREATE INDEX [IX_FK_cliente_catalogo1]
ON [dbo].[cliente]
    ([id_catalogo_dos]);
GO

-- Creating foreign key on [id_catalogo_tres] in table 'cliente'
ALTER TABLE [dbo].[cliente]
ADD CONSTRAINT [FK_cliente_catalogo2]
    FOREIGN KEY ([id_catalogo_tres])
    REFERENCES [dbo].[catalogo]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_cliente_catalogo2'
CREATE INDEX [IX_FK_cliente_catalogo2]
ON [dbo].[cliente]
    ([id_catalogo_tres]);
GO

-- Creating foreign key on [idcliente] in table 'ciudadcliente'
ALTER TABLE [dbo].[ciudadcliente]
ADD CONSTRAINT [FK_ciudadcliente_ciudad]
    FOREIGN KEY ([idcliente])
    REFERENCES [dbo].[ciudad]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ciudadcliente_ciudad'
CREATE INDEX [IX_FK_ciudadcliente_ciudad]
ON [dbo].[ciudadcliente]
    ([idcliente]);
GO

-- Creating foreign key on [idciudad] in table 'ciudadcliente'
ALTER TABLE [dbo].[ciudadcliente]
ADD CONSTRAINT [FK_ciudadcliente_cliente]
    FOREIGN KEY ([idciudad])
    REFERENCES [dbo].[cliente]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ciudadcliente_cliente'
CREATE INDEX [IX_FK_ciudadcliente_cliente]
ON [dbo].[ciudadcliente]
    ([idciudad]);
GO

-- Creating foreign key on [id_cliente] in table 'cliente_telefono'
ALTER TABLE [dbo].[cliente_telefono]
ADD CONSTRAINT [FK_cliente_telefono_cliente]
    FOREIGN KEY ([id_cliente])
    REFERENCES [dbo].[cliente]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_cliente_telefono_cliente'
CREATE INDEX [IX_FK_cliente_telefono_cliente]
ON [dbo].[cliente_telefono]
    ([id_cliente]);
GO

-- Creating foreign key on [id_telefono] in table 'cliente_telefono'
ALTER TABLE [dbo].[cliente_telefono]
ADD CONSTRAINT [FK_cliente_telefono_telefono]
    FOREIGN KEY ([id_telefono])
    REFERENCES [dbo].[telefono]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_cliente_telefono_telefono'
CREATE INDEX [IX_FK_cliente_telefono_telefono]
ON [dbo].[cliente_telefono]
    ([id_telefono]);
GO

-- Creating foreign key on [id_catalogo_cinco] in table 'cliente'
ALTER TABLE [dbo].[cliente]
ADD CONSTRAINT [FK_catalogocliente]
    FOREIGN KEY ([id_catalogo_cinco])
    REFERENCES [dbo].[catalogo]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_catalogocliente'
CREATE INDEX [IX_FK_catalogocliente]
ON [dbo].[cliente]
    ([id_catalogo_cinco]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------