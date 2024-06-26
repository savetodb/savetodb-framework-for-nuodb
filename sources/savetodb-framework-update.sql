-- =============================================
-- SaveToDB Framework for NuoDB
-- Version 10.13, April 29, 2024
--
-- This script updates SaveToDB Framework 10 to the latest version
--
-- Copyright 2014-2024 Gartle LLC
--
-- License: MIT
-- =============================================

SELECT CASE WHEN 1013 <= CAST(SUBSTR(HANDLER_CODE, 1, POSITION('.' IN HANDLER_CODE) - 1) AS INT) * 100 + CAST(SUBSTR(HANDLER_CODE, POSITION('.' IN HANDLER_CODE) + 1) AS DECIMAL) THEN 'SaveToDB Framework is up-to-date. Update skipped' ELSE HANDLER_CODE END AS CHECK_VERSION FROM XLS.HANDLERS WHERE TABLE_SCHEMA = 'XLS' AND TABLE_NAME = 'SAVETODB_FRAMEWORK' AND COLUMN_NAME = 'VERSION' AND EVENT_NAME = 'Information' LIMIT 1;

UPDATE XLS.HANDLERS t
INNER JOIN (
    SELECT
        CAST(NULL AS STRING) AS TABLE_SCHEMA
        , CAST(NULL AS STRING) AS TABLE_NAME
        , CAST(NULL AS STRING) AS COLUMN_NAME
        , CAST(NULL AS STRING) AS EVENT_NAME
        , CAST(NULL AS STRING) AS HANDLER_SCHEMA
        , CAST(NULL AS STRING) AS HANDLER_NAME
        , CAST(NULL AS STRING) AS HANDLER_TYPE
        , CAST(NULL AS STRING) HANDLER_CODE
        , CAST(NULL AS STRING) AS TARGET_WORKSHEET
        , CAST(NULL AS SMALLINT) AS MENU_ORDER
        , CAST(NULL AS SMALLINT) AS EDIT_PARAMETERS
    FROM DUAL

    UNION ALL SELECT 'XLS', 'SAVETODB_FRAMEWORK', 'VERSION', 'Information', NULL, NULL, 'ATTRIBUTE', '10.13', NULL, NULL, NULL FROM DUAL
    UNION ALL SELECT 'XLS', 'HANDLERS', 'EVENT_NAME', 'ValidationList', NULL, NULL, 'VALUES', 'Actions, AddHyperlinks, AddStateColumn, Authentication, BitColumn, Change, ContextMenu, ConvertFormulas, DataTypeBinary, DataTypeBinary16, DataTypeBit, DataTypeBoolean, DataTypeDate, DataTypeDateTime, DataTypeDateTimeOffset, DataTypeDouble, DataTypeInt, DataTypeGuid, DataTypeString, DataTypeTime, DataTypeTimeSpan, DefaultListObject, DefaultValue, DependsOn, DoNotAddChangeHandler, DoNotAddDependsOn, DoNotAddManyToMany, DoNotAddValidation, DoNotChange, DoNotConvertFormulas, DoNotKeepComments, DoNotKeepFormulas, DoNotSave, DoNotSelect, DoNotSort, DoNotTranslate, DoubleClick, DynamicColumns, Format, Formula, FormulaValue, HideByDefault, Information, JsonForm, KeepFormulas, KeepComments, License, LoadFormat, ManyToMany, ParameterValues, ProtectRows, RegEx, SaveFormat, SaveWithoutTransaction, SelectionChange, SelectionList, SelectPeriod, SyncParameter, UpdateChangedCellsOnly, UpdateEntireRow, ValidationList, WhereByDefault', NULL, NULL, NULL FROM DUAL

    ) s
    ON t.TABLE_SCHEMA = s.TABLE_SCHEMA
    AND t.TABLE_NAME = s.TABLE_NAME
    AND COALESCE(t.COLUMN_NAME, '') = COALESCE(s.COLUMN_NAME, '')
    AND t.EVENT_NAME = s.EVENT_NAME
    AND COALESCE(t.HANDLER_SCHEMA, '') = COALESCE(s.HANDLER_SCHEMA, '')
    AND COALESCE(t.HANDLER_NAME, '') = COALESCE(s.HANDLER_NAME, '')
    AND COALESCE(t.HANDLER_TYPE, '') = COALESCE(s.HANDLER_TYPE, '')
SET
    t.HANDLER_CODE = s.HANDLER_CODE
    , t.TARGET_WORKSHEET = s.TARGET_WORKSHEET
    , t.MENU_ORDER = s.MENU_ORDER
    , t.EDIT_PARAMETERS = s.EDIT_PARAMETERS
WHERE
    s.TABLE_NAME IS NOT NULL
    AND (
    NOT COALESCE(t.HANDLER_CODE, '') = COALESCE(s.HANDLER_CODE, '')
    OR NOT COALESCE(t.TARGET_WORKSHEET, '') = COALESCE(s.TARGET_WORKSHEET, '')
    OR NOT COALESCE(t.MENU_ORDER, -1) = COALESCE(s.MENU_ORDER, -1)
    OR NOT COALESCE(t.EDIT_PARAMETERS, 0) = COALESCE(s.EDIT_PARAMETERS, 0)
    );

INSERT INTO XLS.HANDLERS
    ( TABLE_SCHEMA
    , TABLE_NAME
    , COLUMN_NAME
    , EVENT_NAME
    , HANDLER_SCHEMA
    , HANDLER_NAME
    , HANDLER_TYPE
    , HANDLER_CODE
    , TARGET_WORKSHEET
    , MENU_ORDER
    , EDIT_PARAMETERS
    )
SELECT
    s.TABLE_SCHEMA
    , s.TABLE_NAME
    , s.COLUMN_NAME
    , s.EVENT_NAME
    , s.HANDLER_SCHEMA
    , s.HANDLER_NAME
    , s.HANDLER_TYPE
    , s.HANDLER_CODE
    , s.TARGET_WORKSHEET
    , s.MENU_ORDER
    , s.EDIT_PARAMETERS
FROM
    (
    SELECT
        CAST(NULL AS STRING) AS TABLE_SCHEMA
        , CAST(NULL AS STRING) AS TABLE_NAME
        , CAST(NULL AS STRING) AS COLUMN_NAME
        , CAST(NULL AS STRING) AS EVENT_NAME
        , CAST(NULL AS STRING) AS HANDLER_SCHEMA
        , CAST(NULL AS STRING) AS HANDLER_NAME
        , CAST(NULL AS STRING) AS HANDLER_TYPE
        , CAST(NULL AS STRING) HANDLER_CODE
        , CAST(NULL AS STRING) AS TARGET_WORKSHEET
        , CAST(NULL AS SMALLINT) AS MENU_ORDER
        , CAST(NULL AS SMALLINT) AS EDIT_PARAMETERS
    FROM DUAL

    UNION ALL SELECT 'XLS', 'SAVETODB_FRAMEWORK', 'VERSION', 'Information', NULL, NULL, 'ATTRIBUTE', '10.13', NULL, NULL, NULL FROM DUAL
    UNION ALL SELECT 'XLS', 'HANDLERS', 'EVENT_NAME', 'ValidationList', NULL, NULL, 'VALUES', 'Actions, AddHyperlinks, AddStateColumn, Authentication, BitColumn, Change, ContextMenu, ConvertFormulas, DataTypeBinary, DataTypeBinary16, DataTypeBit, DataTypeBoolean, DataTypeDate, DataTypeDateTime, DataTypeDateTimeOffset, DataTypeDouble, DataTypeInt, DataTypeGuid, DataTypeString, DataTypeTime, DataTypeTimeSpan, DefaultListObject, DefaultValue, DependsOn, DoNotAddChangeHandler, DoNotAddDependsOn, DoNotAddManyToMany, DoNotAddValidation, DoNotChange, DoNotConvertFormulas, DoNotKeepComments, DoNotKeepFormulas, DoNotSave, DoNotSelect, DoNotSort, DoNotTranslate, DoubleClick, DynamicColumns, Format, Formula, FormulaValue, HideByDefault, Information, JsonForm, KeepFormulas, KeepComments, License, LoadFormat, ManyToMany, ParameterValues, ProtectRows, RegEx, SaveFormat, SaveWithoutTransaction, SelectionChange, SelectionList, SelectPeriod, SyncParameter, UpdateChangedCellsOnly, UpdateEntireRow, ValidationList, WhereByDefault', NULL, NULL, NULL FROM DUAL

    ) s
    LEFT OUTER JOIN XLS.HANDLERS T ON
        t.TABLE_SCHEMA = s.TABLE_SCHEMA
        AND t.TABLE_NAME = s.TABLE_NAME
        AND COALESCE(t.COLUMN_NAME, '') = COALESCE(s.COLUMN_NAME, '')
        AND t.EVENT_NAME = s.EVENT_NAME
        AND COALESCE(t.HANDLER_SCHEMA, '') = COALESCE(s.HANDLER_SCHEMA, '')
        AND COALESCE(t.HANDLER_NAME, '') = COALESCE(s.HANDLER_NAME, '')
        AND COALESCE(t.HANDLER_TYPE, '') = COALESCE(s.HANDLER_TYPE, '')
WHERE
    t.TABLE_NAME IS NULL
    AND s.TABLE_NAME IS NOT NULL;

-- print SaveToDB Framework updated
