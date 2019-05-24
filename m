Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BC529AB3
	for <lists.virtualization@lfdr.de>; Fri, 24 May 2019 17:13:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0C451DA8;
	Fri, 24 May 2019 15:13:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C8251DA8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 15:13:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750041.outbound.protection.outlook.com [40.107.75.41])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5201181A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ouXpXCC+rIJOcpSC5rDHbVgaUSixKLXUbgAgKioBTxk=;
	b=BQGaQAeuwihIVRdJGtAxRBAJJE+eSAdIwR24KAxNOmpGKXXVpa5bMX/4uNIIBfMnkXiubx2rYwsqmAhWaKrd3nvIrQT2VCwZCtyyKNZRyB74J7l4fprtaJPyS1qyRYuWhq0jaAUJEpNMhfahkmfbRwX1YrsNySaQ3Iz11NyhmqM=
Received: from BYAPR05MB5048.namprd05.prod.outlook.com (20.177.230.218) by
	BYAPR05MB6007.namprd05.prod.outlook.com (20.178.53.92) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1943.10; Fri, 24 May 2019 15:13:11 +0000
Received: from BYAPR05MB5048.namprd05.prod.outlook.com
	([fe80::c5:76f0:7f48:5a4d]) by BYAPR05MB5048.namprd05.prod.outlook.com
	([fe80::c5:76f0:7f48:5a4d%4]) with mapi id 15.20.1922.019;
	Fri, 24 May 2019 15:13:11 +0000
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pv-drivers
	<Pv-drivers@vmware.com>, "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
Subject: [PATCH] VMCI: Fix integer overflow in VMCI handle arrays
Thread-Topic: [PATCH] VMCI: Fix integer overflow in VMCI handle arrays
Thread-Index: AQHVEkMzlPJIg65F1E2swBNthr0CDw==
Date: Fri, 24 May 2019 15:13:10 +0000
Message-ID: <20190524151254.3306-1-vdasa@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0052.namprd05.prod.outlook.com
	(2603:10b6:a03:74::29) To BYAPR05MB5048.namprd05.prod.outlook.com
	(2603:10b6:a03:9d::26)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=vdasa@vmware.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.19.1
x-originating-ip: [66.170.99.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4cb908d-eb87-480f-059d-08d6e05a557a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:BYAPR05MB6007; 
x-ms-traffictypediagnostic: BYAPR05MB6007:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BYAPR05MB600789F0B469F6079E8454D5CE020@BYAPR05MB6007.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(68736007)(66066001)(6486002)(486006)(99286004)(36756003)(8936002)(50226002)(81166006)(81156014)(8676002)(102836004)(316002)(66446008)(66556008)(73956011)(86362001)(66476007)(64756008)(66946007)(5660300002)(256004)(14444005)(30864003)(52116002)(71190400001)(14454004)(1076003)(25786009)(71200400001)(6506007)(386003)(110136005)(53936002)(6436002)(186003)(7736002)(476003)(478600001)(26005)(4326008)(3846002)(6116002)(107886003)(2616005)(305945005)(2501003)(6512007)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB6007;
	H:BYAPR05MB5048.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tfJgrw2IKOhZdbKj8R088M5X7guMz/taBwKoGrqEKKgLzNYEaIH1nGCEOABbQCuNF3oGAzNVR4ScrFG745IDDa/zcc6Lfg+zHKmbjRt9pqZGgK+X+yXITxQRfG7VTyX0sZjACY3YIOnjD2rJ9nNKsmPNj5Y2YY7EuDBDwvE3WIvGnKDHCbvJz4dhuoZGDIUwSNAjPjMopsSCv4sODUf5ey+aFKIQhEiAL6MJYcTuGrJfyXFQu62awMbuSRZYLj0+L1/A/AVWSTd6BnIFsISknMVHpzXkAl/wy8rKAsdlx5h941eA3WUkuN3xX4viSlL9EmxMtzFVDiqvOc9vAomGdmzFAmJVXTMazS4jroKLils/S5BFWwV6XL0lQLFSmiIQRfBzHxaQ8mR/1DTBL9RRxNbK+ZUu1o85tFMHjRsTXvQ=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cb908d-eb87-480f-059d-08d6e05a557a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 15:13:11.0149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdasa@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6007
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vishnu DASA <vdasa@vmware.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Vishnu DASA via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: Vishnu DASA <vdasa@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The VMCI handle array has an integer overflow in
vmci_handle_arr_append_entry when it tries to expand the array. This can be
triggered from a guest, since the doorbell link hypercall doesn't impose a
limit on the number of doorbell handles that a VM can create in the
hypervisor, and these handles are stored in a handle array.

In this change, we introduce a mandatory max capacity for handle
arrays/lists to avoid excessive memory usage.

Signed-off-by: Vishnu Dasa <vdasa@vmware.com>
Reviewed-by: Adit Ranadive <aditr@vmware.com>
Reviewed-by: Jorgen Hansen <jhansen@vmware.com>
---
 drivers/misc/vmw_vmci/vmci_context.c      | 80 +++++++++++++----------
 drivers/misc/vmw_vmci/vmci_handle_array.c | 38 +++++++----
 drivers/misc/vmw_vmci/vmci_handle_array.h | 29 +++++---
 include/linux/vmw_vmci_defs.h             | 11 +++-
 4 files changed, 99 insertions(+), 59 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index 21d0fa592145..bc089e634a75 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -29,6 +29,9 @@
 #include "vmci_driver.h"
 #include "vmci_event.h"
 
+/* Use a wide upper bound for the maximum contexts. */
+#define VMCI_MAX_CONTEXTS 2000
+
 /*
  * List of current VMCI contexts.  Contexts can be added by
  * vmci_ctx_create() and removed via vmci_ctx_destroy().
@@ -125,19 +128,22 @@ struct vmci_ctx *vmci_ctx_create(u32 cid, u32 priv_flags,
 	/* Initialize host-specific VMCI context. */
 	init_waitqueue_head(&context->host_context.wait_queue);
 
-	context->queue_pair_array = vmci_handle_arr_create(0);
+	context->queue_pair_array =
+		vmci_handle_arr_create(0, VMCI_MAX_GUEST_QP_COUNT);
 	if (!context->queue_pair_array) {
 		error = -ENOMEM;
 		goto err_free_ctx;
 	}
 
-	context->doorbell_array = vmci_handle_arr_create(0);
+	context->doorbell_array =
+		vmci_handle_arr_create(0, VMCI_MAX_GUEST_DOORBELL_COUNT);
 	if (!context->doorbell_array) {
 		error = -ENOMEM;
 		goto err_free_qp_array;
 	}
 
-	context->pending_doorbell_array = vmci_handle_arr_create(0);
+	context->pending_doorbell_array =
+		vmci_handle_arr_create(0, VMCI_MAX_GUEST_DOORBELL_COUNT);
 	if (!context->pending_doorbell_array) {
 		error = -ENOMEM;
 		goto err_free_db_array;
@@ -212,7 +218,7 @@ static int ctx_fire_notification(u32 context_id, u32 priv_flags)
 	 * We create an array to hold the subscribers we find when
 	 * scanning through all contexts.
 	 */
-	subscriber_array = vmci_handle_arr_create(0);
+	subscriber_array = vmci_handle_arr_create(0, VMCI_MAX_CONTEXTS);
 	if (subscriber_array == NULL)
 		return VMCI_ERROR_NO_MEM;
 
@@ -631,20 +637,26 @@ int vmci_ctx_add_notification(u32 context_id, u32 remote_cid)
 
 	spin_lock(&context->lock);
 
-	list_for_each_entry(n, &context->notifier_list, node) {
-		if (vmci_handle_is_equal(n->handle, notifier->handle)) {
-			exists = true;
-			break;
+	if (context->n_notifiers < VMCI_MAX_CONTEXTS) {
+		list_for_each_entry(n, &context->notifier_list, node) {
+			if (vmci_handle_is_equal(n->handle, notifier->handle)) {
+				exists = true;
+				break;
+			}
 		}
-	}
 
-	if (exists) {
-		kfree(notifier);
-		result = VMCI_ERROR_ALREADY_EXISTS;
+		if (exists) {
+			kfree(notifier);
+			result = VMCI_ERROR_ALREADY_EXISTS;
+		} else {
+			list_add_tail_rcu(&notifier->node,
+					  &context->notifier_list);
+			context->n_notifiers++;
+			result = VMCI_SUCCESS;
+		}
 	} else {
-		list_add_tail_rcu(&notifier->node, &context->notifier_list);
-		context->n_notifiers++;
-		result = VMCI_SUCCESS;
+		kfree(notifier);
+		result = VMCI_ERROR_NO_MEM;
 	}
 
 	spin_unlock(&context->lock);
@@ -729,8 +741,7 @@ static int vmci_ctx_get_chkpt_doorbells(struct vmci_ctx *context,
 					u32 *buf_size, void **pbuf)
 {
 	struct dbell_cpt_state *dbells;
-	size_t n_doorbells;
-	int i;
+	u32 i, n_doorbells;
 
 	n_doorbells = vmci_handle_arr_get_size(context->doorbell_array);
 	if (n_doorbells > 0) {
@@ -868,7 +879,8 @@ int vmci_ctx_rcv_notifications_get(u32 context_id,
 	spin_lock(&context->lock);
 
 	*db_handle_array = context->pending_doorbell_array;
-	context->pending_doorbell_array = vmci_handle_arr_create(0);
+	context->pending_doorbell_array =
+		vmci_handle_arr_create(0, VMCI_MAX_GUEST_DOORBELL_COUNT);
 	if (!context->pending_doorbell_array) {
 		context->pending_doorbell_array = *db_handle_array;
 		*db_handle_array = NULL;
@@ -950,12 +962,11 @@ int vmci_ctx_dbell_create(u32 context_id, struct vmci_handle handle)
 		return VMCI_ERROR_NOT_FOUND;
 
 	spin_lock(&context->lock);
-	if (!vmci_handle_arr_has_entry(context->doorbell_array, handle)) {
-		vmci_handle_arr_append_entry(&context->doorbell_array, handle);
-		result = VMCI_SUCCESS;
-	} else {
+	if (!vmci_handle_arr_has_entry(context->doorbell_array, handle))
+		result = vmci_handle_arr_append_entry(&context->doorbell_array,
+						      handle);
+	else
 		result = VMCI_ERROR_DUPLICATE_ENTRY;
-	}
 
 	spin_unlock(&context->lock);
 	vmci_ctx_put(context);
@@ -1091,15 +1102,16 @@ int vmci_ctx_notify_dbell(u32 src_cid,
 			if (!vmci_handle_arr_has_entry(
 					dst_context->pending_doorbell_array,
 					handle)) {
-				vmci_handle_arr_append_entry(
+				result = vmci_handle_arr_append_entry(
 					&dst_context->pending_doorbell_array,
 					handle);
-
-				ctx_signal_notify(dst_context);
-				wake_up(&dst_context->host_context.wait_queue);
-
+				if (result == VMCI_SUCCESS) {
+					ctx_signal_notify(dst_context);
+					wake_up(&dst_context->host_context.wait_queue);
+				}
+			} else {
+				result = VMCI_SUCCESS;
 			}
-			result = VMCI_SUCCESS;
 		}
 		spin_unlock(&dst_context->lock);
 	}
@@ -1126,13 +1138,11 @@ int vmci_ctx_qp_create(struct vmci_ctx *context, struct vmci_handle handle)
 	if (context == NULL || vmci_handle_is_invalid(handle))
 		return VMCI_ERROR_INVALID_ARGS;
 
-	if (!vmci_handle_arr_has_entry(context->queue_pair_array, handle)) {
-		vmci_handle_arr_append_entry(&context->queue_pair_array,
-					     handle);
-		result = VMCI_SUCCESS;
-	} else {
+	if (!vmci_handle_arr_has_entry(context->queue_pair_array, handle))
+		result = vmci_handle_arr_append_entry(
+			&context->queue_pair_array, handle);
+	else
 		result = VMCI_ERROR_DUPLICATE_ENTRY;
-	}
 
 	return result;
 }
diff --git a/drivers/misc/vmw_vmci/vmci_handle_array.c b/drivers/misc/vmw_vmci/vmci_handle_array.c
index 344973a0fb0a..917e18a8af95 100644
--- a/drivers/misc/vmw_vmci/vmci_handle_array.c
+++ b/drivers/misc/vmw_vmci/vmci_handle_array.c
@@ -16,24 +16,29 @@
 #include <linux/slab.h>
 #include "vmci_handle_array.h"
 
-static size_t handle_arr_calc_size(size_t capacity)
+static size_t handle_arr_calc_size(u32 capacity)
 {
-	return sizeof(struct vmci_handle_arr) +
+	return VMCI_HANDLE_ARRAY_HEADER_SIZE +
 	    capacity * sizeof(struct vmci_handle);
 }
 
-struct vmci_handle_arr *vmci_handle_arr_create(size_t capacity)
+struct vmci_handle_arr *vmci_handle_arr_create(u32 capacity, u32 max_capacity)
 {
 	struct vmci_handle_arr *array;
 
+	if (max_capacity == 0 || capacity > max_capacity)
+		return NULL;
+
 	if (capacity == 0)
-		capacity = VMCI_HANDLE_ARRAY_DEFAULT_SIZE;
+		capacity = min((u32)VMCI_HANDLE_ARRAY_DEFAULT_CAPACITY,
+			       max_capacity);
 
 	array = kmalloc(handle_arr_calc_size(capacity), GFP_ATOMIC);
 	if (!array)
 		return NULL;
 
 	array->capacity = capacity;
+	array->max_capacity = max_capacity;
 	array->size = 0;
 
 	return array;
@@ -44,27 +49,34 @@ void vmci_handle_arr_destroy(struct vmci_handle_arr *array)
 	kfree(array);
 }
 
-void vmci_handle_arr_append_entry(struct vmci_handle_arr **array_ptr,
-				  struct vmci_handle handle)
+int vmci_handle_arr_append_entry(struct vmci_handle_arr **array_ptr,
+				 struct vmci_handle handle)
 {
 	struct vmci_handle_arr *array = *array_ptr;
 
 	if (unlikely(array->size >= array->capacity)) {
 		/* reallocate. */
 		struct vmci_handle_arr *new_array;
-		size_t new_capacity = array->capacity * VMCI_ARR_CAP_MULT;
-		size_t new_size = handle_arr_calc_size(new_capacity);
+		u32 capacity_bump = min(array->max_capacity - array->capacity,
+					array->capacity);
+		size_t new_size = handle_arr_calc_size(array->capacity +
+						       capacity_bump);
+
+		if (array->size >= array->max_capacity)
+			return VMCI_ERROR_NO_MEM;
 
 		new_array = krealloc(array, new_size, GFP_ATOMIC);
 		if (!new_array)
-			return;
+			return VMCI_ERROR_NO_MEM;
 
-		new_array->capacity = new_capacity;
+		new_array->capacity += capacity_bump;
 		*array_ptr = array = new_array;
 	}
 
 	array->entries[array->size] = handle;
 	array->size++;
+
+	return VMCI_SUCCESS;
 }
 
 /*
@@ -74,7 +86,7 @@ struct vmci_handle vmci_handle_arr_remove_entry(struct vmci_handle_arr *array,
 						struct vmci_handle entry_handle)
 {
 	struct vmci_handle handle = VMCI_INVALID_HANDLE;
-	size_t i;
+	u32 i;
 
 	for (i = 0; i < array->size; i++) {
 		if (vmci_handle_is_equal(array->entries[i], entry_handle)) {
@@ -109,7 +121,7 @@ struct vmci_handle vmci_handle_arr_remove_tail(struct vmci_handle_arr *array)
  * Handle at given index, VMCI_INVALID_HANDLE if invalid index.
  */
 struct vmci_handle
-vmci_handle_arr_get_entry(const struct vmci_handle_arr *array, size_t index)
+vmci_handle_arr_get_entry(const struct vmci_handle_arr *array, u32 index)
 {
 	if (unlikely(index >= array->size))
 		return VMCI_INVALID_HANDLE;
@@ -120,7 +132,7 @@ vmci_handle_arr_get_entry(const struct vmci_handle_arr *array, size_t index)
 bool vmci_handle_arr_has_entry(const struct vmci_handle_arr *array,
 			       struct vmci_handle entry_handle)
 {
-	size_t i;
+	u32 i;
 
 	for (i = 0; i < array->size; i++)
 		if (vmci_handle_is_equal(array->entries[i], entry_handle))
diff --git a/drivers/misc/vmw_vmci/vmci_handle_array.h b/drivers/misc/vmw_vmci/vmci_handle_array.h
index b5f3a7f98cf1..0fc58597820e 100644
--- a/drivers/misc/vmw_vmci/vmci_handle_array.h
+++ b/drivers/misc/vmw_vmci/vmci_handle_array.h
@@ -17,32 +17,41 @@
 #define _VMCI_HANDLE_ARRAY_H_
 
 #include <linux/vmw_vmci_defs.h>
+#include <linux/limits.h>
 #include <linux/types.h>
 
-#define VMCI_HANDLE_ARRAY_DEFAULT_SIZE 4
-#define VMCI_ARR_CAP_MULT 2	/* Array capacity multiplier */
-
 struct vmci_handle_arr {
-	size_t capacity;
-	size_t size;
+	u32 capacity;
+	u32 max_capacity;
+	u32 size;
+	u32 pad;
 	struct vmci_handle entries[];
 };
 
-struct vmci_handle_arr *vmci_handle_arr_create(size_t capacity);
+#define VMCI_HANDLE_ARRAY_HEADER_SIZE				\
+	offsetof(struct vmci_handle_arr, entries)
+/* Select a default capacity that results in a 64 byte sized array */
+#define VMCI_HANDLE_ARRAY_DEFAULT_CAPACITY			6
+/* Make sure that the max array size can be expressed by a u32 */
+#define VMCI_HANDLE_ARRAY_MAX_CAPACITY				\
+	((U32_MAX - VMCI_HANDLE_ARRAY_HEADER_SIZE - 1) /	\
+	sizeof(struct vmci_handle))
+
+struct vmci_handle_arr *vmci_handle_arr_create(u32 capacity, u32 max_capacity);
 void vmci_handle_arr_destroy(struct vmci_handle_arr *array);
-void vmci_handle_arr_append_entry(struct vmci_handle_arr **array_ptr,
-				  struct vmci_handle handle);
+int vmci_handle_arr_append_entry(struct vmci_handle_arr **array_ptr,
+				 struct vmci_handle handle);
 struct vmci_handle vmci_handle_arr_remove_entry(struct vmci_handle_arr *array,
 						struct vmci_handle
 						entry_handle);
 struct vmci_handle vmci_handle_arr_remove_tail(struct vmci_handle_arr *array);
 struct vmci_handle
-vmci_handle_arr_get_entry(const struct vmci_handle_arr *array, size_t index);
+vmci_handle_arr_get_entry(const struct vmci_handle_arr *array, u32 index);
 bool vmci_handle_arr_has_entry(const struct vmci_handle_arr *array,
 			       struct vmci_handle entry_handle);
 struct vmci_handle *vmci_handle_arr_get_handles(struct vmci_handle_arr *array);
 
-static inline size_t vmci_handle_arr_get_size(
+static inline u32 vmci_handle_arr_get_size(
 	const struct vmci_handle_arr *array)
 {
 	return array->size;
diff --git a/include/linux/vmw_vmci_defs.h b/include/linux/vmw_vmci_defs.h
index eaa1e762bf06..6124b4cebb42 100644
--- a/include/linux/vmw_vmci_defs.h
+++ b/include/linux/vmw_vmci_defs.h
@@ -69,9 +69,18 @@ enum {
 
 /*
  * A single VMCI device has an upper limit of 128MB on the amount of
- * memory that can be used for queue pairs.
+ * memory that can be used for queue pairs. Since each queue pair
+ * consists of at least two pages, the memory limit also dictates the
+ * number of queue pairs a guest can create.
  */
 #define VMCI_MAX_GUEST_QP_MEMORY (128 * 1024 * 1024)
+#define VMCI_MAX_GUEST_QP_COUNT  (VMCI_MAX_GUEST_QP_MEMORY / PAGE_SIZE / 2)
+
+/*
+ * There can be at most PAGE_SIZE doorbells since there is one doorbell
+ * per byte in the doorbell bitmap page.
+ */
+#define VMCI_MAX_GUEST_DOORBELL_COUNT PAGE_SIZE
 
 /*
  * Queues with pre-mapped data pages must be small, so that we don't pin
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
