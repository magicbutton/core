-- CreateTable
CREATE TABLE "Tenant" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "domains" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Tenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SynchronizationLog" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "category" VARCHAR NOT NULL,
    "details" JSONB,
    "hasError" BOOLEAN NOT NULL,
    "error" VARCHAR,

    CONSTRAINT "SynchronizationLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AccessPoint" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "sortorder" VARCHAR,

    CONSTRAINT "AccessPoint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "action" VARCHAR NOT NULL,
    "status" VARCHAR NOT NULL,
    "entity" VARCHAR NOT NULL,
    "entityid" VARCHAR NOT NULL,
    "actor" VARCHAR NOT NULL,
    "metadata" JSONB,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Board" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "status" VARCHAR,
    "layout" JSONB,
    "metadata" JSONB,
    "parentId" INTEGER,
    "groupOwnerId" VARCHAR,
    "groupViewerId" VARCHAR,

    CONSTRAINT "Board_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "sortorder" VARCHAR,
    "color" VARCHAR,
    "isGroupTool" BOOLEAN DEFAULT false,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "region_id" INTEGER NOT NULL,
    "sortorder" VARCHAR,
    "channelId" INTEGER,
    "homePageUrl" TEXT,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Language" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "code" VARCHAR NOT NULL,
    "sortorder" VARCHAR,

    CONSTRAINT "Language_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Purpose" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "sortorder" VARCHAR,

    CONSTRAINT "Purpose_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Region" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "sortOrder" VARCHAR,

    CONSTRAINT "Region_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Setting" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "data" JSONB,

    CONSTRAINT "Setting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tool" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "koksmat_masterdataref" VARCHAR,
    "koksmat_masterdata_id" VARCHAR,
    "koksmat_masterdata_etag" VARCHAR,
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "url" VARCHAR NOT NULL,
    "status" VARCHAR,
    "documents" JSONB,
    "metadata" JSONB,
    "icon" VARCHAR,
    "uploaded_icon" VARCHAR,
    "categoryId" INTEGER,
    "parentId" INTEGER,
    "groupOwnerId" VARCHAR,
    "groupViewerId" VARCHAR,

    CONSTRAINT "Tool_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ToolTexts" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "toolId" INTEGER NOT NULL,
    "languageId" INTEGER NOT NULL,

    CONSTRAINT "ToolTexts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ToolGroup" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "status" VARCHAR,
    "metadata" JSONB,

    CONSTRAINT "ToolGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserGroup" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "sortorder" VARCHAR,

    CONSTRAINT "UserGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserProfile" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "koksmat_masterdataref" VARCHAR,
    "koksmat_masterdata_id" VARCHAR,
    "koksmat_masterdata_etag" VARCHAR,
    "name" VARCHAR NOT NULL,
    "displayName" VARCHAR,
    "description" VARCHAR,
    "translations" JSONB,
    "email" VARCHAR NOT NULL,
    "status" VARCHAR,
    "company" VARCHAR,
    "country" VARCHAR,
    "companykey" VARCHAR,
    "isExternal" BOOLEAN NOT NULL DEFAULT false,
    "CurrentEmail" VARCHAR,
    "OldEmail" VARCHAR,
    "OnPremisesId" VARCHAR,
    "boardId" INTEGER,
    "lastLogin" TIMESTAMPTZ(6),
    "language" VARCHAR,
    "homePage" TEXT,

    CONSTRAINT "UserProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserRole" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "sortorder" VARCHAR,

    CONSTRAINT "UserRole_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "data" JSONB,
    "userProfileId" INTEGER NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BusinessUnit" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "code" VARCHAR,
    "description" VARCHAR,
    "translations" JSONB,
    "sortorder" VARCHAR,
    "isGroupFunction" BOOLEAN NOT NULL,
    "homePageUrl" TEXT,
    "newsPageUrl" TEXT,

    CONSTRAINT "BusinessUnit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GuestDomain" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "sortorder" VARCHAR,

    CONSTRAINT "GuestDomain_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChannelCategory" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "translations" JSONB,
    "sortorder" VARCHAR,

    CONSTRAINT "ChannelCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Channel" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "description" VARCHAR,
    "mandatory" BOOLEAN NOT NULL DEFAULT false,
    "translations" JSONB,
    "sortorder" VARCHAR,
    "regionId" INTEGER,
    "externalGroup" VARCHAR,
    "categoryId" INTEGER,

    CONSTRAINT "Channel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Blob" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" VARCHAR,
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR NOT NULL,
    "hash" VARCHAR NOT NULL,
    "content_type" VARCHAR NOT NULL,
    "base64" TEXT NOT NULL,
    "data" BYTEA NOT NULL,
    "source_tool_id" INTEGER,

    CONSTRAINT "Blob_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BlobResized" (
    "id" SERIAL NOT NULL,
    "tenant" TEXT NOT NULL,
    "width" INTEGER NOT NULL,
    "data" BYTEA NOT NULL,
    "blobId" INTEGER NOT NULL,

    CONSTRAINT "BlobResized_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicesService" (
    "id" TEXT NOT NULL,
    "tenant" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "purpose" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "throttleEnabled" BOOLEAN NOT NULL DEFAULT false,
    "requestsPerMinute" INTEGER,
    "requestsPerHour" INTEGER,
    "requestsPerDay" INTEGER,

    CONSTRAINT "ServicesService_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicesTag" (
    "id" TEXT NOT NULL,
    "tenant" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ServicesTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicesEndpoint" (
    "id" TEXT NOT NULL,
    "tenant" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "deprecated" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "throttleEnabled" BOOLEAN NOT NULL DEFAULT false,
    "requestsPerMinute" INTEGER,
    "requestsPerHour" INTEGER,
    "requestsPerDay" INTEGER,
    "serviceId" TEXT NOT NULL,

    CONSTRAINT "ServicesEndpoint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicesParameter" (
    "id" TEXT NOT NULL,
    "tenant" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "required" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "endpointId" TEXT NOT NULL,

    CONSTRAINT "ServicesParameter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicesResponseSchema" (
    "id" TEXT NOT NULL,
    "tenant" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "endpointId" TEXT NOT NULL,

    CONSTRAINT "ServicesResponseSchema_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicesSchemaProperty" (
    "id" TEXT NOT NULL,
    "tenant" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "format" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "responseSchemaId" TEXT NOT NULL,

    CONSTRAINT "ServicesSchemaProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicesRequestLog" (
    "id" TEXT NOT NULL,
    "tenant" TEXT NOT NULL,
    "serviceName" TEXT NOT NULL,
    "endpointName" TEXT,
    "requestId" TEXT NOT NULL,
    "payload" JSONB NOT NULL,
    "async" BOOLEAN NOT NULL DEFAULT false,
    "timeout" INTEGER NOT NULL,
    "status" TEXT NOT NULL,
    "response" JSONB,
    "errorMessage" TEXT,
    "processingTime" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "apiKeyId" TEXT,
    "clientIp" TEXT,

    CONSTRAINT "ServicesRequestLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicesApiKey" (
    "id" TEXT NOT NULL,
    "tenant" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "expiresAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "throttleEnabled" BOOLEAN NOT NULL DEFAULT false,
    "requestsPerMinute" INTEGER,
    "requestsPerHour" INTEGER,
    "requestsPerDay" INTEGER,

    CONSTRAINT "ServicesApiKey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicesUsageRecord" (
    "id" TEXT NOT NULL,
    "tenant" TEXT NOT NULL,
    "serviceId" TEXT,
    "endpointId" TEXT,
    "apiKeyId" TEXT,
    "clientIp" TEXT,
    "minute" TIMESTAMP(3),
    "hour" TIMESTAMP(3),
    "day" TIMESTAMP(3),
    "count" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ServicesUsageRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CountryToTool" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_CountryToTool_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ToolPurposes" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_ToolPurposes_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ToolToUserProfile" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_ToolToUserProfile_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ToolGroupToUserProfile" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_ToolGroupToUserProfile_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ToolGroupToUserGroup" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_ToolGroupToUserGroup_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_UserProfileToUserRole" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_UserProfileToUserRole_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ServiceToTag" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ServiceToTag_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "Tenant_name_key" ON "Tenant"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Tenant_slug_key" ON "Tenant"("slug");

-- CreateIndex
CREATE INDEX "Tenant_slug_idx" ON "Tenant"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "AccessPoint_tenant_name_key" ON "AccessPoint"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Category_tenant_name_key" ON "Category"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Country_tenant_name_key" ON "Country"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Language_tenant_name_key" ON "Language"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Purpose_tenant_name_key" ON "Purpose"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Region_tenant_name_key" ON "Region"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Setting_tenant_name_key" ON "Setting"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "ToolTexts_toolId_languageId_key" ON "ToolTexts"("toolId", "languageId");

-- CreateIndex
CREATE UNIQUE INDEX "ToolGroup_tenant_name_key" ON "ToolGroup"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "UserGroup_tenant_name_key" ON "UserGroup"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "unique_email" ON "UserProfile"("email");

-- CreateIndex
CREATE UNIQUE INDEX "UserProfile_tenant_name_key" ON "UserProfile"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "UserRole_tenant_name_key" ON "UserRole"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessUnit_tenant_name_key" ON "BusinessUnit"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessUnit_tenant_code_key" ON "BusinessUnit"("tenant", "code");

-- CreateIndex
CREATE UNIQUE INDEX "GuestDomain_tenant_name_key" ON "GuestDomain"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "ChannelCategory_tenant_name_key" ON "ChannelCategory"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Channel_tenant_name_key" ON "Channel"("tenant", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Blob_tenant_name_key" ON "Blob"("tenant", "name");

-- CreateIndex
CREATE INDEX "ServicesService_name_idx" ON "ServicesService"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesService_tenant_name_key" ON "ServicesService"("tenant", "name");

-- CreateIndex
CREATE INDEX "ServicesTag_name_idx" ON "ServicesTag"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesTag_tenant_name_key" ON "ServicesTag"("tenant", "name");

-- CreateIndex
CREATE INDEX "ServicesEndpoint_name_idx" ON "ServicesEndpoint"("name");

-- CreateIndex
CREATE INDEX "ServicesEndpoint_deprecated_idx" ON "ServicesEndpoint"("deprecated");

-- CreateIndex
CREATE INDEX "ServicesEndpoint_version_idx" ON "ServicesEndpoint"("version");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesEndpoint_tenant_serviceId_name_version_key" ON "ServicesEndpoint"("tenant", "serviceId", "name", "version");

-- CreateIndex
CREATE INDEX "ServicesParameter_name_idx" ON "ServicesParameter"("name");

-- CreateIndex
CREATE INDEX "ServicesParameter_type_idx" ON "ServicesParameter"("type");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesParameter_endpointId_name_key" ON "ServicesParameter"("endpointId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesResponseSchema_endpointId_key" ON "ServicesResponseSchema"("endpointId");

-- CreateIndex
CREATE INDEX "ServicesSchemaProperty_name_idx" ON "ServicesSchemaProperty"("name");

-- CreateIndex
CREATE INDEX "ServicesSchemaProperty_type_idx" ON "ServicesSchemaProperty"("type");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesSchemaProperty_responseSchemaId_name_key" ON "ServicesSchemaProperty"("responseSchemaId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesRequestLog_requestId_key" ON "ServicesRequestLog"("requestId");

-- CreateIndex
CREATE INDEX "ServicesRequestLog_serviceName_idx" ON "ServicesRequestLog"("serviceName");

-- CreateIndex
CREATE INDEX "ServicesRequestLog_status_idx" ON "ServicesRequestLog"("status");

-- CreateIndex
CREATE INDEX "ServicesRequestLog_createdAt_idx" ON "ServicesRequestLog"("createdAt");

-- CreateIndex
CREATE INDEX "ServicesRequestLog_apiKeyId_idx" ON "ServicesRequestLog"("apiKeyId");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesApiKey_key_key" ON "ServicesApiKey"("key");

-- CreateIndex
CREATE INDEX "ServicesApiKey_key_idx" ON "ServicesApiKey"("key");

-- CreateIndex
CREATE INDEX "ServicesApiKey_active_idx" ON "ServicesApiKey"("active");

-- CreateIndex
CREATE INDEX "ServicesUsageRecord_minute_idx" ON "ServicesUsageRecord"("minute");

-- CreateIndex
CREATE INDEX "ServicesUsageRecord_hour_idx" ON "ServicesUsageRecord"("hour");

-- CreateIndex
CREATE INDEX "ServicesUsageRecord_day_idx" ON "ServicesUsageRecord"("day");

-- CreateIndex
CREATE INDEX "ServicesUsageRecord_clientIp_idx" ON "ServicesUsageRecord"("clientIp");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_serviceId_minute_key" ON "ServicesUsageRecord"("serviceId", "minute");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_serviceId_hour_key" ON "ServicesUsageRecord"("serviceId", "hour");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_serviceId_day_key" ON "ServicesUsageRecord"("serviceId", "day");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_endpointId_minute_key" ON "ServicesUsageRecord"("endpointId", "minute");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_endpointId_hour_key" ON "ServicesUsageRecord"("endpointId", "hour");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_endpointId_day_key" ON "ServicesUsageRecord"("endpointId", "day");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_apiKeyId_minute_key" ON "ServicesUsageRecord"("apiKeyId", "minute");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_apiKeyId_hour_key" ON "ServicesUsageRecord"("apiKeyId", "hour");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_apiKeyId_day_key" ON "ServicesUsageRecord"("apiKeyId", "day");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_clientIp_minute_key" ON "ServicesUsageRecord"("clientIp", "minute");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_clientIp_hour_key" ON "ServicesUsageRecord"("clientIp", "hour");

-- CreateIndex
CREATE UNIQUE INDEX "ServicesUsageRecord_clientIp_day_key" ON "ServicesUsageRecord"("clientIp", "day");

-- CreateIndex
CREATE INDEX "_CountryToTool_B_index" ON "_CountryToTool"("B");

-- CreateIndex
CREATE INDEX "_ToolPurposes_B_index" ON "_ToolPurposes"("B");

-- CreateIndex
CREATE INDEX "_ToolToUserProfile_B_index" ON "_ToolToUserProfile"("B");

-- CreateIndex
CREATE INDEX "_ToolGroupToUserProfile_B_index" ON "_ToolGroupToUserProfile"("B");

-- CreateIndex
CREATE INDEX "_ToolGroupToUserGroup_B_index" ON "_ToolGroupToUserGroup"("B");

-- CreateIndex
CREATE INDEX "_UserProfileToUserRole_B_index" ON "_UserProfileToUserRole"("B");

-- CreateIndex
CREATE INDEX "_ServiceToTag_B_index" ON "_ServiceToTag"("B");

-- AddForeignKey
ALTER TABLE "Board" ADD CONSTRAINT "Board_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Board"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Country" ADD CONSTRAINT "Country_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "Region"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Country" ADD CONSTRAINT "Country_channelId_fkey" FOREIGN KEY ("channelId") REFERENCES "Channel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tool" ADD CONSTRAINT "Tool_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tool" ADD CONSTRAINT "Tool_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Tool"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ToolTexts" ADD CONSTRAINT "ToolTexts_toolId_fkey" FOREIGN KEY ("toolId") REFERENCES "Tool"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ToolTexts" ADD CONSTRAINT "ToolTexts_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "Language"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserProfile" ADD CONSTRAINT "UserProfile_boardId_fkey" FOREIGN KEY ("boardId") REFERENCES "Board"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userProfileId_fkey" FOREIGN KEY ("userProfileId") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Channel" ADD CONSTRAINT "Channel_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "Region"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Channel" ADD CONSTRAINT "Channel_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "ChannelCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Blob" ADD CONSTRAINT "Blob_source_tool_id_fkey" FOREIGN KEY ("source_tool_id") REFERENCES "Tool"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BlobResized" ADD CONSTRAINT "BlobResized_blobId_fkey" FOREIGN KEY ("blobId") REFERENCES "Blob"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicesEndpoint" ADD CONSTRAINT "ServicesEndpoint_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "ServicesService"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicesParameter" ADD CONSTRAINT "ServicesParameter_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "ServicesEndpoint"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicesResponseSchema" ADD CONSTRAINT "ServicesResponseSchema_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "ServicesEndpoint"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicesSchemaProperty" ADD CONSTRAINT "ServicesSchemaProperty_responseSchemaId_fkey" FOREIGN KEY ("responseSchemaId") REFERENCES "ServicesResponseSchema"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicesUsageRecord" ADD CONSTRAINT "ServicesUsageRecord_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "ServicesService"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicesUsageRecord" ADD CONSTRAINT "ServicesUsageRecord_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "ServicesEndpoint"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicesUsageRecord" ADD CONSTRAINT "ServicesUsageRecord_apiKeyId_fkey" FOREIGN KEY ("apiKeyId") REFERENCES "ServicesApiKey"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToTool" ADD CONSTRAINT "_CountryToTool_A_fkey" FOREIGN KEY ("A") REFERENCES "Country"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToTool" ADD CONSTRAINT "_CountryToTool_B_fkey" FOREIGN KEY ("B") REFERENCES "Tool"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ToolPurposes" ADD CONSTRAINT "_ToolPurposes_A_fkey" FOREIGN KEY ("A") REFERENCES "Purpose"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ToolPurposes" ADD CONSTRAINT "_ToolPurposes_B_fkey" FOREIGN KEY ("B") REFERENCES "Tool"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ToolToUserProfile" ADD CONSTRAINT "_ToolToUserProfile_A_fkey" FOREIGN KEY ("A") REFERENCES "Tool"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ToolToUserProfile" ADD CONSTRAINT "_ToolToUserProfile_B_fkey" FOREIGN KEY ("B") REFERENCES "UserProfile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ToolGroupToUserProfile" ADD CONSTRAINT "_ToolGroupToUserProfile_A_fkey" FOREIGN KEY ("A") REFERENCES "ToolGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ToolGroupToUserProfile" ADD CONSTRAINT "_ToolGroupToUserProfile_B_fkey" FOREIGN KEY ("B") REFERENCES "UserProfile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ToolGroupToUserGroup" ADD CONSTRAINT "_ToolGroupToUserGroup_A_fkey" FOREIGN KEY ("A") REFERENCES "ToolGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ToolGroupToUserGroup" ADD CONSTRAINT "_ToolGroupToUserGroup_B_fkey" FOREIGN KEY ("B") REFERENCES "UserGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserProfileToUserRole" ADD CONSTRAINT "_UserProfileToUserRole_A_fkey" FOREIGN KEY ("A") REFERENCES "UserProfile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserProfileToUserRole" ADD CONSTRAINT "_UserProfileToUserRole_B_fkey" FOREIGN KEY ("B") REFERENCES "UserRole"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ServiceToTag" ADD CONSTRAINT "_ServiceToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "ServicesService"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ServiceToTag" ADD CONSTRAINT "_ServiceToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "ServicesTag"("id") ON DELETE CASCADE ON UPDATE CASCADE;
