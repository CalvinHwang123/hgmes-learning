-- 视图
-- 01 车间收料
CREATE VIEW `v_workshop_receive` AS SELECT
	`t_production_picking`.`id` AS `id`,
	`t_production_picking`.`code` AS `code`,
	'生产领料' AS `order_type`
FROM
	`t_production_picking`
WHERE
	(
		`t_production_picking`.`status` <> '已接收'
	)
UNION ALL
	SELECT
		`t_common_picking`.`id` AS `id`,
		`t_common_picking`.`code` AS `code`,
		'常规领料' AS `order_type`
	FROM
		`t_common_picking`
	WHERE
		(
			`t_common_picking`.`status` <> '已接收'
		)
