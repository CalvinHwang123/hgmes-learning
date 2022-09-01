<html>
<head>
  <base href="${base}/">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="ant-design/antd.min.css">
  <link rel="stylesheet" href="app.css">
  <link rel="stylesheet" href="ant-design/style.css">
  <style>
    .ant-form-item {
      margin: 8px;
    }
  </style>
</head>
<body>
<div id="app">
  <template>
    <div class="my-antd-container" style="overflow: hidden; padding: 12px;">
      <h3
              style="text-align: center"
      >
        ${title}
        <a-button
                onclick="window.print()"
                style="float: right;"
        >打印</a-button>
      </h3>
      <#--<a-form layout="inline">-->
        <a-row :gutter="24">
          <a-col :span="8">
            <a-form-item label="单号">
              <a-input value="${rows[0].code}" readonly />
            </a-form-item>
          </a-col>
          <a-col :span="8">
            <a-form-item label="工单编号">
              <a-input value="${rows[0].workOrder.code}" readonly />
            </a-form-item>
          </a-col>
          <a-col :span="8">
            <a-form-item label="领料人">
              <a-input value="${rows[0].pickingPerson}" readonly />
            </a-form-item>
          </a-col>
        </a-row>
        <a-row :gutter="24">
          <a-col :span="8">
            <a-form-item label="领料时间">
              <a-input value="${rows[0].pickingDate}" readonly />
            </a-form-item>
          </a-col>
        </a-row>
      <#--</a-form>-->
      <a-row>
        <a-table :columns="columns" :data-source="data" :locale="{ emptyText: '暂无数据' }">
        </a-table>
      </a-row>
    </div>
  </template>
</div>
<script src="ant-design/vue.min.js"></script>
<script src="ant-design/moment.min.js"></script>
<script src="ant-design/antd.min.js"></script>
<script src="ant-design/axios.min.js"></script>
<script>
  //如果使用tpl模块则需要通过如下js脚本获取，注意只有登录成功才能获取到token
  // const token = parent.getAppToken().token;

  const columns = [
    { title: '物料编码', dataIndex: 'materialCode', key: '1', width: 150 },
    { title: '物料名称', dataIndex: 'materialName', key: '2', width: 150 },
    { title: '申请数量', dataIndex: 'demandNumber', key: '3', width: 150 },
    { title: '实发数量', dataIndex: 'actualNumber', key: '4', width: 150 },
    // { title: '备注', dataIndex: 'remark', key: '5' }
  ];

  var vue = new Vue({
    el: '#app',
    data() {
      return {
        columns,
        data: []
      };
    },
    watch: {
    },
    methods: {
    },
    computed: {
    },
    updated() {
      console.log('updated');
    },
    created() {
      console.log('created');
      const result = JSON.parse('${jsonResult}');
      // console.log('result', result);
      const overOrders = result.rows[0].productionPickingMaterialMoveOrders;
      if (overOrders && overOrders.length > 0) {
        overOrders.forEach(order => {
          this.data.push(
                  {
                    materialCode: order.material.code,
                    materialName: order.material.name,
                    demandNumber: order.demandNumber,
                    actualNumber: order.actualNumber,
                    // remark: order.remark
                  }
          )
        });
      }
    }
  });
</script>
</body>
</html>
