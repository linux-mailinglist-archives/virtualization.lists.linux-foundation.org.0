Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 72988FC37E
	for <lists.virtualization@lfdr.de>; Thu, 14 Nov 2019 11:01:19 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C07871124;
	Thu, 14 Nov 2019 09:59:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0E25610EF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 09:59:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 386D98A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573725549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=rPRT3RdAnjmUAI+8hXqxtD1gQcxUr+7rHQkk20HvAA0=;
	b=LM4ZH7PklFdQmv1tcSxEunUPlg//ZN1r4fVZIhfXZtBB9NIljxKG3FlCWGaWo52f6mQDRb
	JB1gadWnbSWFYjHnSe1TSnwhnIfukkU5gvQ9xgSXhKTnu4GG/u/SwKQMUD2ZCOqkUZ64oP
	yITIGCZhX5TnRpLo4nugwx+vWN1bado=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-4Oe8ysdwNt-ixXAyBeJz3A-1; Thu, 14 Nov 2019 04:59:06 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2C90800C73;
	Thu, 14 Nov 2019 09:59:03 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-81.ams2.redhat.com
	[10.36.117.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FEE219757;
	Thu, 14 Nov 2019 09:59:00 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 12/15] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Date: Thu, 14 Nov 2019 10:57:47 +0100
Message-Id: <20191114095750.59106-13-sgarzare@redhat.com>
In-Reply-To: <20191114095750.59106-1-sgarzare@redhat.com>
References: <20191114095750.59106-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4Oe8ysdwNt-ixXAyBeJz3A-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org,
	Haiyang Zhang <haiyangz@microsoft.com>, Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

To allow other transports to be loaded with vmci_transport,
we register the vmci_transport as G2H or H2G only when a VMCI guest
or host is active.

To do that, this patch adds a callback registered in the vmci driver
that will be called when the host or guest becomes active.
This callback will register the vmci_transport in the VSOCK core.

Cc: Jorgen Hansen <jhansen@vmware.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v1 -> v2
- removed features variable in vmci_transport_init() [Stefan]
- added a flag to register only once the host [Jorgen]
---
 drivers/misc/vmw_vmci/vmci_driver.c | 67 +++++++++++++++++++++++++++++
 drivers/misc/vmw_vmci/vmci_driver.h |  2 +
 drivers/misc/vmw_vmci/vmci_guest.c  |  2 +
 drivers/misc/vmw_vmci/vmci_host.c   |  7 +++
 include/linux/vmw_vmci_api.h        |  2 +
 net/vmw_vsock/vmci_transport.c      | 33 +++++++++-----
 6 files changed, 102 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_driver.c b/drivers/misc/vmw_vmci/vmci_driver.c
index 819e35995d32..95fed4664a2d 100644
--- a/drivers/misc/vmw_vmci/vmci_driver.c
+++ b/drivers/misc/vmw_vmci/vmci_driver.c
@@ -28,6 +28,10 @@ MODULE_PARM_DESC(disable_guest,
 static bool vmci_guest_personality_initialized;
 static bool vmci_host_personality_initialized;
 
+static DEFINE_MUTEX(vmci_vsock_mutex); /* protects vmci_vsock_transport_cb */
+static vmci_vsock_cb vmci_vsock_transport_cb;
+bool vmci_vsock_cb_host_called;
+
 /*
  * vmci_get_context_id() - Gets the current context ID.
  *
@@ -45,6 +49,69 @@ u32 vmci_get_context_id(void)
 }
 EXPORT_SYMBOL_GPL(vmci_get_context_id);
 
+/*
+ * vmci_register_vsock_callback() - Register the VSOCK vmci_transport callback.
+ *
+ * The callback will be called when the first host or guest becomes active,
+ * or if they are already active when this function is called.
+ * To unregister the callback, call this function with NULL parameter.
+ *
+ * Returns 0 on success. -EBUSY if a callback is already registered.
+ */
+int vmci_register_vsock_callback(vmci_vsock_cb callback)
+{
+	int err = 0;
+
+	mutex_lock(&vmci_vsock_mutex);
+
+	if (vmci_vsock_transport_cb && callback) {
+		err = -EBUSY;
+		goto out;
+	}
+
+	vmci_vsock_transport_cb = callback;
+
+	if (!vmci_vsock_transport_cb) {
+		vmci_vsock_cb_host_called = false;
+		goto out;
+	}
+
+	if (vmci_guest_code_active())
+		vmci_vsock_transport_cb(false);
+
+	if (vmci_host_users() > 0) {
+		vmci_vsock_cb_host_called = true;
+		vmci_vsock_transport_cb(true);
+	}
+
+out:
+	mutex_unlock(&vmci_vsock_mutex);
+	return err;
+}
+EXPORT_SYMBOL_GPL(vmci_register_vsock_callback);
+
+void vmci_call_vsock_callback(bool is_host)
+{
+	mutex_lock(&vmci_vsock_mutex);
+
+	if (!vmci_vsock_transport_cb)
+		goto out;
+
+	/* In the host, this function could be called multiple times,
+	 * but we want to register it only once.
+	 */
+	if (is_host) {
+		if (vmci_vsock_cb_host_called)
+			goto out;
+
+		vmci_vsock_cb_host_called = true;
+	}
+
+	vmci_vsock_transport_cb(is_host);
+out:
+	mutex_unlock(&vmci_vsock_mutex);
+}
+
 static int __init vmci_drv_init(void)
 {
 	int vmci_err;
diff --git a/drivers/misc/vmw_vmci/vmci_driver.h b/drivers/misc/vmw_vmci/vmci_driver.h
index aab81b67670c..990682480bf6 100644
--- a/drivers/misc/vmw_vmci/vmci_driver.h
+++ b/drivers/misc/vmw_vmci/vmci_driver.h
@@ -36,10 +36,12 @@ extern struct pci_dev *vmci_pdev;
 
 u32 vmci_get_context_id(void);
 int vmci_send_datagram(struct vmci_datagram *dg);
+void vmci_call_vsock_callback(bool is_host);
 
 int vmci_host_init(void);
 void vmci_host_exit(void);
 bool vmci_host_code_active(void);
+int vmci_host_users(void);
 
 int vmci_guest_init(void);
 void vmci_guest_exit(void);
diff --git a/drivers/misc/vmw_vmci/vmci_guest.c b/drivers/misc/vmw_vmci/vmci_guest.c
index 7a84a48c75da..cc8eeb361fcd 100644
--- a/drivers/misc/vmw_vmci/vmci_guest.c
+++ b/drivers/misc/vmw_vmci/vmci_guest.c
@@ -637,6 +637,8 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
 		  vmci_dev->iobase + VMCI_CONTROL_ADDR);
 
 	pci_set_drvdata(pdev, vmci_dev);
+
+	vmci_call_vsock_callback(false);
 	return 0;
 
 err_free_irq:
diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index 833e2bd248a5..ff3c396146ff 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -108,6 +108,11 @@ bool vmci_host_code_active(void)
 	     atomic_read(&vmci_host_active_users) > 0);
 }
 
+int vmci_host_users(void)
+{
+	return atomic_read(&vmci_host_active_users);
+}
+
 /*
  * Called on open of /dev/vmci.
  */
@@ -338,6 +343,8 @@ static int vmci_host_do_init_context(struct vmci_host_dev *vmci_host_dev,
 	vmci_host_dev->ct_type = VMCIOBJ_CONTEXT;
 	atomic_inc(&vmci_host_active_users);
 
+	vmci_call_vsock_callback(true);
+
 	retval = 0;
 
 out:
diff --git a/include/linux/vmw_vmci_api.h b/include/linux/vmw_vmci_api.h
index acd9fafe4fc6..f28907345c80 100644
--- a/include/linux/vmw_vmci_api.h
+++ b/include/linux/vmw_vmci_api.h
@@ -19,6 +19,7 @@
 struct msghdr;
 typedef void (vmci_device_shutdown_fn) (void *device_registration,
 					void *user_data);
+typedef void (*vmci_vsock_cb) (bool is_host);
 
 int vmci_datagram_create_handle(u32 resource_id, u32 flags,
 				vmci_datagram_recv_cb recv_cb,
@@ -37,6 +38,7 @@ int vmci_doorbell_destroy(struct vmci_handle handle);
 int vmci_doorbell_notify(struct vmci_handle handle, u32 priv_flags);
 u32 vmci_get_context_id(void);
 bool vmci_is_context_owner(u32 context_id, kuid_t uid);
+int vmci_register_vsock_callback(vmci_vsock_cb callback);
 
 int vmci_event_subscribe(u32 event,
 			 vmci_event_cb callback, void *callback_data,
diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
index 86030ecb53dd..d9c9c834ad6f 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -2054,19 +2054,21 @@ static bool vmci_check_transport(struct vsock_sock *vsk)
 	return vsk->transport == &vmci_transport;
 }
 
-static int __init vmci_transport_init(void)
+void vmci_vsock_transport_cb(bool is_host)
 {
-	int features = VSOCK_TRANSPORT_F_DGRAM | VSOCK_TRANSPORT_F_H2G;
-	int cid;
-	int err;
+	int features;
 
-	cid = vmci_get_context_id();
+	if (is_host)
+		features = VSOCK_TRANSPORT_F_H2G;
+	else
+		features = VSOCK_TRANSPORT_F_G2H;
 
-	if (cid == VMCI_INVALID_ID)
-		return -EINVAL;
+	vsock_core_register(&vmci_transport, features);
+}
 
-	if (cid != VMCI_HOST_CONTEXT_ID)
-		features |= VSOCK_TRANSPORT_F_G2H;
+static int __init vmci_transport_init(void)
+{
+	int err;
 
 	/* Create the datagram handle that we will use to send and receive all
 	 * VSocket control messages for this context.
@@ -2080,7 +2082,6 @@ static int __init vmci_transport_init(void)
 		pr_err("Unable to create datagram handle. (%d)\n", err);
 		return vmci_transport_error_to_vsock_error(err);
 	}
-
 	err = vmci_event_subscribe(VMCI_EVENT_QP_RESUMED,
 				   vmci_transport_qp_resumed_cb,
 				   NULL, &vmci_transport_qp_resumed_sub_id);
@@ -2091,12 +2092,21 @@ static int __init vmci_transport_init(void)
 		goto err_destroy_stream_handle;
 	}
 
-	err = vsock_core_register(&vmci_transport, features);
+	/* Register only with dgram feature, other features (H2G, G2H) will be
+	 * registered when the first host or guest becomes active.
+	 */
+	err = vsock_core_register(&vmci_transport, VSOCK_TRANSPORT_F_DGRAM);
 	if (err < 0)
 		goto err_unsubscribe;
 
+	err = vmci_register_vsock_callback(vmci_vsock_transport_cb);
+	if (err < 0)
+		goto err_unregister;
+
 	return 0;
 
+err_unregister:
+	vsock_core_unregister(&vmci_transport);
 err_unsubscribe:
 	vmci_event_unsubscribe(vmci_transport_qp_resumed_sub_id);
 err_destroy_stream_handle:
@@ -2122,6 +2132,7 @@ static void __exit vmci_transport_exit(void)
 		vmci_transport_qp_resumed_sub_id = VMCI_INVALID_ID;
 	}
 
+	vmci_register_vsock_callback(NULL);
 	vsock_core_unregister(&vmci_transport);
 }
 module_exit(vmci_transport_exit);
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
