USE [master]
GO
/****** Object:  Database [gsvihc]    Script Date: 07/31/2011 15:42:31 ******/
CREATE DATABASE [gsvihc] ON  PRIMARY 
( NAME = N'gsvihc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.LOCALDB\MSSQL\DATA\gsvihc.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'gsvihc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.LOCALDB\MSSQL\DATA\gsvihc_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [gsvihc] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gsvihc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gsvihc] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [gsvihc] SET ANSI_NULLS OFF
GO
ALTER DATABASE [gsvihc] SET ANSI_PADDING OFF
GO
ALTER DATABASE [gsvihc] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [gsvihc] SET ARITHABORT OFF
GO
ALTER DATABASE [gsvihc] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [gsvihc] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [gsvihc] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [gsvihc] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [gsvihc] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [gsvihc] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [gsvihc] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [gsvihc] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [gsvihc] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [gsvihc] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [gsvihc] SET  DISABLE_BROKER
GO
ALTER DATABASE [gsvihc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [gsvihc] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [gsvihc] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [gsvihc] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [gsvihc] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [gsvihc] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [gsvihc] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [gsvihc] SET  READ_WRITE
GO
ALTER DATABASE [gsvihc] SET RECOVERY SIMPLE
GO
ALTER DATABASE [gsvihc] SET  MULTI_USER
GO
ALTER DATABASE [gsvihc] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [gsvihc] SET DB_CHAINING OFF
GO
USE [gsvihc]
GO
/****** Object:  Table [dbo].[Gene]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gene](
	[HUGO_gene_symbol] [varchar](8) NOT NULL,
	[oncogene_flag] [bit] NOT NULL,
	[tumor_suppressor_flag] [bit] NOT NULL,
	[cell_cycle_flag] [bit] NOT NULL,
	[entrez_gene_id] [int] NOT NULL,
	[UCSC_coordinates] [varchar](50) NULL,
 CONSTRAINT [PK_Gene] PRIMARY KEY CLUSTERED 
(
	[HUGO_gene_symbol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExternalResource]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExternalResource](
	[resource_id] [uniqueidentifier] NOT NULL,
	[resource_type] [varchar](50) NOT NULL,
	[resource_uri] [varchar](80) NULL,
	[resource_description] [varchar](80) NULL,
 CONSTRAINT [PK_ExternalResource] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClinicalNoteType]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClinicalNoteType](
	[clinical_note-type_id] [uniqueidentifier] NOT NULL,
	[cn_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClinicalNoteType] PRIMARY KEY CLUSTERED 
(
	[clinical_note-type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenomicAnnotationType]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GenomicAnnotationType](
	[genomic_annotation_type_id] [uniqueidentifier] NOT NULL,
	[type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GenomicAnnotationType] PRIMARY KEY CLUSTERED 
(
	[genomic_annotation_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[user_account_id] [uniqueidentifier] NOT NULL,
	[user_full_name] [varchar](80) NOT NULL,
	[user_email] [varchar](80) NOT NULL,
	[user_affiliation] [varchar](80) NULL,
	[patient_data_access_level] [varchar](50) NOT NULL,
	[annotation_write_flag] [bit] NULL,
	[last_login] [datetime] NULL,
	[user_password] [varchar](128) NULL,
	[password_date] [date] NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[user_account_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[patient_id] [uniqueidentifier] NOT NULL,
	[sex] [varchar](50) NULL,
	[date_of_birth] [date] NULL,
	[date_of_death] [date] NULL,
	[family_history_flag] [bit] NULL,
	[soft_delete_flag] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientDataAudit]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientDataAudit](
	[patient_id] [uniqueidentifier] NOT NULL,
	[audit_seq] [int] IDENTITY(1,1) NOT NULL,
	[operation_type] [varchar](50) NOT NULL,
	[operation_date] [datetime] NOT NULL,
	[table_name] [varchar](50) NOT NULL,
	[column_name] [varchar](50) NOT NULL,
	[old_value] [varchar](512) NULL,
	[new_value] [varchar](512) NULL,
	[user_account_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientDataAudit] PRIMARY KEY CLUSTERED 
(
	[audit_seq] ASC,
	[patient_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenomicAnnotation]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GenomicAnnotation](
	[genomic_annotation_id] [uniqueidentifier] NOT NULL,
	[UCSC_coordinates] [varchar](80) NULL,
	[genomic_offset] [int] NULL,
	[genomic_length] [int] NULL,
	[transcript_offset] [int] NULL,
	[transcript_length] [int] NULL,
	[aa_offset] [int] NULL,
	[aa_length] [int] NULL,
	[annotation_text] [varchar](2048) NULL,
	[bioportal_evidence_code] [varchar](12) NULL,
	[soft_delete_flag] [bit] NOT NULL,
	[web_ref_identifier] [varchar](80) NULL,
	[resource_id] [uniqueidentifier] NULL,
	[user_account_id] [uniqueidentifier] NULL,
	[annotation_date] [datetime] NOT NULL,
	[annotation_type] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GenomicAnnotation] PRIMARY KEY CLUSTERED 
(
	[genomic_annotation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClinicalNote]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClinicalNote](
	[patient_id] [uniqueidentifier] NOT NULL,
	[clinical_note_id] [uniqueidentifier] NOT NULL,
	[clinical_note_timestamp] [datetime] NOT NULL,
	[note] [varchar](512) NOT NULL,
	[soft_delete_flag] [bit] NULL,
	[clinical_note_type_id] [uniqueidentifier] NOT NULL,
	[user_account_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ClinicalNote_1] PRIMARY KEY CLUSTERED 
(
	[clinical_note_id] ASC,
	[patient_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClassificationType]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClassificationType](
	[classification_type_id] [uniqueidentifier] NOT NULL,
	[type] [varchar](40) NOT NULL,
	[ontology_name] [varchar](50) NULL,
	[resource_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ClassificationType] PRIMARY KEY CLUSTERED 
(
	[classification_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GeneAnnotation]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GeneAnnotation](
	[genomic_annotation_id] [uniqueidentifier] NOT NULL,
	[HUGO_gene_symbol] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Classification]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Classification](
	[classificationId] [uniqueidentifier] NOT NULL,
	[primary_classification] [varchar](128) NOT NULL,
	[subclass1] [varchar](128) NULL,
	[sublass2] [varchar](128) NULL,
	[subclass3] [varchar](128) NULL,
	[sublass4] [varchar](128) NULL,
	[comments] [varchar](512) NULL,
	[classification_type] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Classification] PRIMARY KEY CLUSTERED 
(
	[classificationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StructualVariation]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StructualVariation](
	[structural_variation_id] [uniqueidentifier] NOT NULL,
	[description] [varchar](512) NULL,
	[genome_variation] [varchar](256) NULL,
	[transcript_variation] [varchar](256) NULL,
	[aa_variation] [varchar](256) NULL,
	[translocation] [varchar](256) NULL,
	[sv_classification_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_StructualVariation] PRIMARY KEY CLUSTERED 
(
	[structural_variation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientBiopsy]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientBiopsy](
	[biopsy_seq] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [uniqueidentifier] NOT NULL,
	[cancer_flag] [bit] NOT NULL,
	[cell_type_classification_id] [uniqueidentifier] NULL,
	[cancer_classification_id] [uniqueidentifier] NULL,
	[soft_delete_flag] [bit] NULL,
	[histological_image] [image] NULL,
	[biopsy_date] [datetime] NULL,
	[parent_biopsy_id] [int] NULL,
 CONSTRAINT [PK_PatientBiopsy] PRIMARY KEY CLUSTERED 
(
	[biopsy_seq] ASC,
	[patient_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenomicEntity]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GenomicEntity](
	[genomic_entity_id] [uniqueidentifier] NOT NULL,
	[description] [varchar](128) NULL,
	[cytogenetic_location] [varchar](50) NULL,
	[UCSC_coordinates] [varchar](80) NULL,
	[ref_seq_build_id] [varchar](50) NULL,
	[HUGO_gene_symbol] [varchar](8) NULL,
	[genomic_entity_classification] [uniqueidentifier] NULL,
	[nc_rna_flag] [bit] NOT NULL,
	[ext_origin_flag] [bit] NOT NULL,
 CONSTRAINT [PK_GenomicEntity] PRIMARY KEY CLUSTERED 
(
	[genomic_entity_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StructuralVariationAnnotation]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StructuralVariationAnnotation](
	[structural_variation_id] [uniqueidentifier] NOT NULL,
	[genomic_annotation_id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenomicAnalysis]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GenomicAnalysis](
	[analysis_seq] [int] IDENTITY(1,1) NOT NULL,
	[biopsy_seq] [int] NOT NULL,
	[patient_id] [uniqueidentifier] NOT NULL,
	[coverage] [int] NULL,
	[analysis_type] [varchar](128) NULL,
	[analysis_date] [nchar](10) NULL,
	[analysis_comments] [varchar](1024) NULL,
	[CIRCOS_image] [image] NULL,
 CONSTRAINT [PK_GenomicAnalysis] PRIMARY KEY CLUSTERED 
(
	[analysis_seq] ASC,
	[patient_id] ASC,
	[biopsy_seq] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenomicEntityAnnotation]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenomicEntityAnnotation](
	[genomic_entity_id] [uniqueidentifier] NOT NULL,
	[genomic_annotation_id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SV_GE_ASSOCIATION]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SV_GE_ASSOCIATION](
	[structural_variation_id] [uniqueidentifier] NOT NULL,
	[genomic_entity_id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StructuralVariationCollection]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StructuralVariationCollection](
	[structural_variation_id] [uniqueidentifier] NOT NULL,
	[analysis_seq] [int] NOT NULL,
	[biopsy_seq] [int] NOT NULL,
	[patient_id] [uniqueidentifier] NOT NULL,
	[LOH_flag] [bit] NOT NULL,
	[somatic_mut_flag] [bit] NOT NULL,
	[driver_flag] [bit] NOT NULL,
	[comments] [varchar](2048) NULL,
 CONSTRAINT [PK_StructuralVariationCollection] PRIMARY KEY CLUSTERED 
(
	[structural_variation_id] ASC,
	[patient_id] ASC,
	[biopsy_seq] ASC,
	[analysis_seq] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SequenceDataFile]    Script Date: 07/31/2011 15:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SequenceDataFile](
	[patient_id] [uniqueidentifier] NOT NULL,
	[biopsy_seq] [int] NOT NULL,
	[analysis_seq] [int] NOT NULL,
	[file_seq] [int] IDENTITY(1,1) NOT NULL,
	[file_URI] [varchar](128) NOT NULL,
	[file_format_type] [varchar](50) NULL,
	[restricted_access_flag] [bit] NOT NULL,
 CONSTRAINT [PK_SequenceDataFile] PRIMARY KEY CLUSTERED 
(
	[file_seq] ASC,
	[patient_id] ASC,
	[biopsy_seq] ASC,
	[analysis_seq] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_Gene_oncogene_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[Gene] ADD  CONSTRAINT [DF_Gene_oncogene_flag]  DEFAULT ((0)) FOR [oncogene_flag]
GO
/****** Object:  Default [DF_Gene_tumor_suppressor_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[Gene] ADD  CONSTRAINT [DF_Gene_tumor_suppressor_flag]  DEFAULT ((0)) FOR [tumor_suppressor_flag]
GO
/****** Object:  Default [DF_Gene_cell_cycle_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[Gene] ADD  CONSTRAINT [DF_Gene_cell_cycle_flag]  DEFAULT ((0)) FOR [cell_cycle_flag]
GO
/****** Object:  Default [DF_UserAccount_patient_data_access_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[UserAccount] ADD  CONSTRAINT [DF_UserAccount_patient_data_access_flag]  DEFAULT ('NONE') FOR [patient_data_access_level]
GO
/****** Object:  Default [DF_UserAccount_annotation_write_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[UserAccount] ADD  CONSTRAINT [DF_UserAccount_annotation_write_flag]  DEFAULT ((0)) FOR [annotation_write_flag]
GO
/****** Object:  Default [DF_Patient_soft_delete_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patient_soft_delete_flag]  DEFAULT ((0)) FOR [soft_delete_flag]
GO
/****** Object:  Default [DF_PatientDataAudit_operation_date]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientDataAudit] ADD  CONSTRAINT [DF_PatientDataAudit_operation_date]  DEFAULT (getdate()) FOR [operation_date]
GO
/****** Object:  Default [DF_GenomicAnnotation_soft_delete_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicAnnotation] ADD  CONSTRAINT [DF_GenomicAnnotation_soft_delete_flag]  DEFAULT ((0)) FOR [soft_delete_flag]
GO
/****** Object:  Default [DF_GenomicAnnotation_annotation_date]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicAnnotation] ADD  CONSTRAINT [DF_GenomicAnnotation_annotation_date]  DEFAULT (getdate()) FOR [annotation_date]
GO
/****** Object:  Default [DF_ClinicalNote_clinical_note_timestamp]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[ClinicalNote] ADD  CONSTRAINT [DF_ClinicalNote_clinical_note_timestamp]  DEFAULT (getdate()) FOR [clinical_note_timestamp]
GO
/****** Object:  Default [DF_ClinicalNote_soft_delete_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[ClinicalNote] ADD  CONSTRAINT [DF_ClinicalNote_soft_delete_flag]  DEFAULT ((0)) FOR [soft_delete_flag]
GO
/****** Object:  Default [DF_PatientBiopsy_cancer_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientBiopsy] ADD  CONSTRAINT [DF_PatientBiopsy_cancer_flag]  DEFAULT ((0)) FOR [cancer_flag]
GO
/****** Object:  Default [DF_PatientBiopsy_soft_delete_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientBiopsy] ADD  CONSTRAINT [DF_PatientBiopsy_soft_delete_flag]  DEFAULT ((0)) FOR [soft_delete_flag]
GO
/****** Object:  Default [DF_GenomicEntity_nc_rna_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicEntity] ADD  CONSTRAINT [DF_GenomicEntity_nc_rna_flag]  DEFAULT ((0)) FOR [nc_rna_flag]
GO
/****** Object:  Default [DF_GenomicEntity_ext_origin_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicEntity] ADD  CONSTRAINT [DF_GenomicEntity_ext_origin_flag]  DEFAULT ((0)) FOR [ext_origin_flag]
GO
/****** Object:  Default [DF_GenomicAnalysis_analysis_date]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicAnalysis] ADD  CONSTRAINT [DF_GenomicAnalysis_analysis_date]  DEFAULT (getdate()) FOR [analysis_date]
GO
/****** Object:  Default [DF_StructuralVariationCollection_LOH_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[StructuralVariationCollection] ADD  CONSTRAINT [DF_StructuralVariationCollection_LOH_flag]  DEFAULT ((0)) FOR [LOH_flag]
GO
/****** Object:  Default [DF_StructuralVariationCollection_somatic_mut_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[StructuralVariationCollection] ADD  CONSTRAINT [DF_StructuralVariationCollection_somatic_mut_flag]  DEFAULT ((0)) FOR [somatic_mut_flag]
GO
/****** Object:  Default [DF_StructuralVariationCollection_driver_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[StructuralVariationCollection] ADD  CONSTRAINT [DF_StructuralVariationCollection_driver_flag]  DEFAULT ((0)) FOR [driver_flag]
GO
/****** Object:  Default [DF_SequenceDataFile_restricted_access_flag]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[SequenceDataFile] ADD  CONSTRAINT [DF_SequenceDataFile_restricted_access_flag]  DEFAULT ((0)) FOR [restricted_access_flag]
GO
/****** Object:  Check [CK_UserAccount]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[UserAccount]  WITH CHECK ADD  CONSTRAINT [CK_UserAccount] CHECK  (([patient_data_access_level]='ADMIN' OR [patient_data_access_level]='WRITE' OR [patient_data_access_level]='NOTE' OR [patient_data_access_level]='READ' OR [patient_data_access_level]='NONE'))
GO
ALTER TABLE [dbo].[UserAccount] CHECK CONSTRAINT [CK_UserAccount]
GO
/****** Object:  Check [CK_PatientDataAudit]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientDataAudit]  WITH CHECK ADD  CONSTRAINT [CK_PatientDataAudit] CHECK  (([operation_type]='UPDATE' OR [operation_type]='DELETE' OR [operation_type]='INSERT'))
GO
ALTER TABLE [dbo].[PatientDataAudit] CHECK CONSTRAINT [CK_PatientDataAudit]
GO
/****** Object:  ForeignKey [FK_PatientDataAudit_Patient]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientDataAudit]  WITH CHECK ADD  CONSTRAINT [FK_PatientDataAudit_Patient] FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[PatientDataAudit] CHECK CONSTRAINT [FK_PatientDataAudit_Patient]
GO
/****** Object:  ForeignKey [FK_PatientDataAudit_UserAccount]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientDataAudit]  WITH CHECK ADD  CONSTRAINT [FK_PatientDataAudit_UserAccount] FOREIGN KEY([user_account_id])
REFERENCES [dbo].[UserAccount] ([user_account_id])
GO
ALTER TABLE [dbo].[PatientDataAudit] CHECK CONSTRAINT [FK_PatientDataAudit_UserAccount]
GO
/****** Object:  ForeignKey [FK_GenomicAnnotation_ExternalResource]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicAnnotation]  WITH CHECK ADD  CONSTRAINT [FK_GenomicAnnotation_ExternalResource] FOREIGN KEY([resource_id])
REFERENCES [dbo].[ExternalResource] ([resource_id])
GO
ALTER TABLE [dbo].[GenomicAnnotation] CHECK CONSTRAINT [FK_GenomicAnnotation_ExternalResource]
GO
/****** Object:  ForeignKey [FK_GenomicAnnotation_GenomicAnnotationType]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicAnnotation]  WITH CHECK ADD  CONSTRAINT [FK_GenomicAnnotation_GenomicAnnotationType] FOREIGN KEY([annotation_type])
REFERENCES [dbo].[GenomicAnnotationType] ([genomic_annotation_type_id])
GO
ALTER TABLE [dbo].[GenomicAnnotation] CHECK CONSTRAINT [FK_GenomicAnnotation_GenomicAnnotationType]
GO
/****** Object:  ForeignKey [FK_GenomicAnnotation_UserAccount]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicAnnotation]  WITH CHECK ADD  CONSTRAINT [FK_GenomicAnnotation_UserAccount] FOREIGN KEY([user_account_id])
REFERENCES [dbo].[UserAccount] ([user_account_id])
GO
ALTER TABLE [dbo].[GenomicAnnotation] CHECK CONSTRAINT [FK_GenomicAnnotation_UserAccount]
GO
/****** Object:  ForeignKey [FK_ClinicalNote_ClinicalNoteType]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[ClinicalNote]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalNote_ClinicalNoteType] FOREIGN KEY([clinical_note_type_id])
REFERENCES [dbo].[ClinicalNoteType] ([clinical_note-type_id])
GO
ALTER TABLE [dbo].[ClinicalNote] CHECK CONSTRAINT [FK_ClinicalNote_ClinicalNoteType]
GO
/****** Object:  ForeignKey [FK_ClinicalNote_Patient]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[ClinicalNote]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalNote_Patient] FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[ClinicalNote] CHECK CONSTRAINT [FK_ClinicalNote_Patient]
GO
/****** Object:  ForeignKey [FK_ClinicalNote_UserAccount]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[ClinicalNote]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalNote_UserAccount] FOREIGN KEY([user_account_id])
REFERENCES [dbo].[UserAccount] ([user_account_id])
GO
ALTER TABLE [dbo].[ClinicalNote] CHECK CONSTRAINT [FK_ClinicalNote_UserAccount]
GO
/****** Object:  ForeignKey [FK_ClassificationType_ExternalResource]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[ClassificationType]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationType_ExternalResource] FOREIGN KEY([resource_id])
REFERENCES [dbo].[ExternalResource] ([resource_id])
GO
ALTER TABLE [dbo].[ClassificationType] CHECK CONSTRAINT [FK_ClassificationType_ExternalResource]
GO
/****** Object:  ForeignKey [FK_GeneAnnotation_Gene1]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GeneAnnotation]  WITH CHECK ADD  CONSTRAINT [FK_GeneAnnotation_Gene1] FOREIGN KEY([HUGO_gene_symbol])
REFERENCES [dbo].[Gene] ([HUGO_gene_symbol])
GO
ALTER TABLE [dbo].[GeneAnnotation] CHECK CONSTRAINT [FK_GeneAnnotation_Gene1]
GO
/****** Object:  ForeignKey [FK_GeneAnnotation_GenomicAnnotation1]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GeneAnnotation]  WITH CHECK ADD  CONSTRAINT [FK_GeneAnnotation_GenomicAnnotation1] FOREIGN KEY([genomic_annotation_id])
REFERENCES [dbo].[GenomicAnnotation] ([genomic_annotation_id])
GO
ALTER TABLE [dbo].[GeneAnnotation] CHECK CONSTRAINT [FK_GeneAnnotation_GenomicAnnotation1]
GO
/****** Object:  ForeignKey [FK_Classification_ClassificationType]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[Classification]  WITH CHECK ADD  CONSTRAINT [FK_Classification_ClassificationType] FOREIGN KEY([classification_type])
REFERENCES [dbo].[ClassificationType] ([classification_type_id])
GO
ALTER TABLE [dbo].[Classification] CHECK CONSTRAINT [FK_Classification_ClassificationType]
GO
/****** Object:  ForeignKey [FK_StructualVariation_Classification]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[StructualVariation]  WITH CHECK ADD  CONSTRAINT [FK_StructualVariation_Classification] FOREIGN KEY([sv_classification_id])
REFERENCES [dbo].[Classification] ([classificationId])
GO
ALTER TABLE [dbo].[StructualVariation] CHECK CONSTRAINT [FK_StructualVariation_Classification]
GO
/****** Object:  ForeignKey [FK_PatientBiopsy_CancerType]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientBiopsy]  WITH CHECK ADD  CONSTRAINT [FK_PatientBiopsy_CancerType] FOREIGN KEY([cancer_classification_id])
REFERENCES [dbo].[Classification] ([classificationId])
GO
ALTER TABLE [dbo].[PatientBiopsy] CHECK CONSTRAINT [FK_PatientBiopsy_CancerType]
GO
/****** Object:  ForeignKey [FK_PatientBiopsy_CellType]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientBiopsy]  WITH CHECK ADD  CONSTRAINT [FK_PatientBiopsy_CellType] FOREIGN KEY([cell_type_classification_id])
REFERENCES [dbo].[Classification] ([classificationId])
GO
ALTER TABLE [dbo].[PatientBiopsy] CHECK CONSTRAINT [FK_PatientBiopsy_CellType]
GO
/****** Object:  ForeignKey [FK_PatientBiopsy_Patient]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientBiopsy]  WITH CHECK ADD  CONSTRAINT [FK_PatientBiopsy_Patient] FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[PatientBiopsy] CHECK CONSTRAINT [FK_PatientBiopsy_Patient]
GO
/****** Object:  ForeignKey [FK_PatientBiopsy_PatientBiopsy]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[PatientBiopsy]  WITH CHECK ADD  CONSTRAINT [FK_PatientBiopsy_PatientBiopsy] FOREIGN KEY([parent_biopsy_id], [patient_id])
REFERENCES [dbo].[PatientBiopsy] ([biopsy_seq], [patient_id])
GO
ALTER TABLE [dbo].[PatientBiopsy] CHECK CONSTRAINT [FK_PatientBiopsy_PatientBiopsy]
GO
/****** Object:  ForeignKey [FK_GenomicEntity_Classification]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicEntity]  WITH CHECK ADD  CONSTRAINT [FK_GenomicEntity_Classification] FOREIGN KEY([genomic_entity_classification])
REFERENCES [dbo].[Classification] ([classificationId])
GO
ALTER TABLE [dbo].[GenomicEntity] CHECK CONSTRAINT [FK_GenomicEntity_Classification]
GO
/****** Object:  ForeignKey [FK_GenomicEntity_Gene]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicEntity]  WITH CHECK ADD  CONSTRAINT [FK_GenomicEntity_Gene] FOREIGN KEY([HUGO_gene_symbol])
REFERENCES [dbo].[Gene] ([HUGO_gene_symbol])
GO
ALTER TABLE [dbo].[GenomicEntity] CHECK CONSTRAINT [FK_GenomicEntity_Gene]
GO
/****** Object:  ForeignKey [FK_StructuralVariationAnnotation_GenomicAnnotation]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[StructuralVariationAnnotation]  WITH CHECK ADD  CONSTRAINT [FK_StructuralVariationAnnotation_GenomicAnnotation] FOREIGN KEY([genomic_annotation_id])
REFERENCES [dbo].[GenomicAnnotation] ([genomic_annotation_id])
GO
ALTER TABLE [dbo].[StructuralVariationAnnotation] CHECK CONSTRAINT [FK_StructuralVariationAnnotation_GenomicAnnotation]
GO
/****** Object:  ForeignKey [FK_StructuralVariationAnnotation_StructualVariation]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[StructuralVariationAnnotation]  WITH CHECK ADD  CONSTRAINT [FK_StructuralVariationAnnotation_StructualVariation] FOREIGN KEY([structural_variation_id])
REFERENCES [dbo].[StructualVariation] ([structural_variation_id])
GO
ALTER TABLE [dbo].[StructuralVariationAnnotation] CHECK CONSTRAINT [FK_StructuralVariationAnnotation_StructualVariation]
GO
/****** Object:  ForeignKey [FK_GenomicAnalysis_PatientBiopsy]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_GenomicAnalysis_PatientBiopsy] FOREIGN KEY([biopsy_seq], [patient_id])
REFERENCES [dbo].[PatientBiopsy] ([biopsy_seq], [patient_id])
GO
ALTER TABLE [dbo].[GenomicAnalysis] CHECK CONSTRAINT [FK_GenomicAnalysis_PatientBiopsy]
GO
/****** Object:  ForeignKey [FK_GenomicEntityAnnotation_GenomicAnnotation]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicEntityAnnotation]  WITH CHECK ADD  CONSTRAINT [FK_GenomicEntityAnnotation_GenomicAnnotation] FOREIGN KEY([genomic_annotation_id])
REFERENCES [dbo].[GenomicAnnotation] ([genomic_annotation_id])
GO
ALTER TABLE [dbo].[GenomicEntityAnnotation] CHECK CONSTRAINT [FK_GenomicEntityAnnotation_GenomicAnnotation]
GO
/****** Object:  ForeignKey [FK_GenomicEntityAnnotation_GenomicEntity]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[GenomicEntityAnnotation]  WITH CHECK ADD  CONSTRAINT [FK_GenomicEntityAnnotation_GenomicEntity] FOREIGN KEY([genomic_entity_id])
REFERENCES [dbo].[GenomicEntity] ([genomic_entity_id])
GO
ALTER TABLE [dbo].[GenomicEntityAnnotation] CHECK CONSTRAINT [FK_GenomicEntityAnnotation_GenomicEntity]
GO
/****** Object:  ForeignKey [FK_SV_GE_ASSOCIATION_GenomicEntity]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[SV_GE_ASSOCIATION]  WITH CHECK ADD  CONSTRAINT [FK_SV_GE_ASSOCIATION_GenomicEntity] FOREIGN KEY([genomic_entity_id])
REFERENCES [dbo].[GenomicEntity] ([genomic_entity_id])
GO
ALTER TABLE [dbo].[SV_GE_ASSOCIATION] CHECK CONSTRAINT [FK_SV_GE_ASSOCIATION_GenomicEntity]
GO
/****** Object:  ForeignKey [FK_SV_GE_ASSOCIATION_StructualVariation]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[SV_GE_ASSOCIATION]  WITH CHECK ADD  CONSTRAINT [FK_SV_GE_ASSOCIATION_StructualVariation] FOREIGN KEY([structural_variation_id])
REFERENCES [dbo].[StructualVariation] ([structural_variation_id])
GO
ALTER TABLE [dbo].[SV_GE_ASSOCIATION] CHECK CONSTRAINT [FK_SV_GE_ASSOCIATION_StructualVariation]
GO
/****** Object:  ForeignKey [FK_StructuralVariationCollection_GenomicAnalysis]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[StructuralVariationCollection]  WITH CHECK ADD  CONSTRAINT [FK_StructuralVariationCollection_GenomicAnalysis] FOREIGN KEY([analysis_seq], [patient_id], [biopsy_seq])
REFERENCES [dbo].[GenomicAnalysis] ([analysis_seq], [patient_id], [biopsy_seq])
GO
ALTER TABLE [dbo].[StructuralVariationCollection] CHECK CONSTRAINT [FK_StructuralVariationCollection_GenomicAnalysis]
GO
/****** Object:  ForeignKey [FK_StructuralVariationCollection_StructuralVariation]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[StructuralVariationCollection]  WITH CHECK ADD  CONSTRAINT [FK_StructuralVariationCollection_StructuralVariation] FOREIGN KEY([structural_variation_id])
REFERENCES [dbo].[StructualVariation] ([structural_variation_id])
GO
ALTER TABLE [dbo].[StructuralVariationCollection] CHECK CONSTRAINT [FK_StructuralVariationCollection_StructuralVariation]
GO
/****** Object:  ForeignKey [FK_SequenceDataFile_GenomicAnalysis]    Script Date: 07/31/2011 15:42:32 ******/
ALTER TABLE [dbo].[SequenceDataFile]  WITH CHECK ADD  CONSTRAINT [FK_SequenceDataFile_GenomicAnalysis] FOREIGN KEY([analysis_seq], [patient_id], [biopsy_seq])
REFERENCES [dbo].[GenomicAnalysis] ([analysis_seq], [patient_id], [biopsy_seq])
GO
ALTER TABLE [dbo].[SequenceDataFile] CHECK CONSTRAINT [FK_SequenceDataFile_GenomicAnalysis]
GO
