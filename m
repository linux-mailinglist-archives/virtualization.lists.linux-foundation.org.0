Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 79041F19D
	for <lists.virtualization@lfdr.de>; Tue, 30 Apr 2019 09:45:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 404E6E71;
	Tue, 30 Apr 2019 07:45:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E04E2E5E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 07:45:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3DBAB5F4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 07:45:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80775F74D4;
	Tue, 30 Apr 2019 07:45:04 +0000 (UTC)
Received: from localhost (dhcp-192-206.str.redhat.com [10.33.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2D876E73B;
	Tue, 30 Apr 2019 07:45:03 +0000 (UTC)
Date: Tue, 30 Apr 2019 09:45:02 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: Yoni Bettan <ybettan@redhat.com>
Subject: Re: [RFC-PATCH] Introducing virtio-example.
Message-ID: <20190430074502.dyud47r6yyyc6ufm@jenstp.localdomain>
References: <20190429124004.49365-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429124004.49365-1-ybettan@redhat.com>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 30 Apr 2019 07:45:04 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: open list <linux-kernel@vger.kernel.org>, ehabkost@redhat.com,
	virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, Apr 29, 2019 at 03:40:03PM +0300, Yoni Bettan wrote:
>The main goal is to create an example to be used as template or
>guideline for contributors when they wish to create a new virtio
>device and to document "the right way" to do so.
>
>It consists of several parts:

Thanks for doing this, I think it's a good idea. 

>    1. The device specification
>        * it can be found in the device header of the implementation
>        * it will hopefully be added to the official virtio specification
>
>    2. The device implementation for Qemu-KVM hypervisor
>        * it can be found at https://github.com/ybettan/qemu/blob/virtio\
>                /hw/virtio/virtio-example.c
>
>    3. The device driver for linux
>        * this patch content
>
>    4. A blog on virtio
>        * introducing the virtio concept
>        * gives some motivation for virtio-devices to be used
>        * bring extra documentation on "how to write":
>            - device specification
>            - device implementation
>            - device driver for linux
>        * it can be found at https://howtovms.wordpress.com

Maybe add a link to the blog in the example code? Or better put a
text-only version of it into Documentation/ (Not sure it's a good
idea, just thinking out loud...) 
>
>Signed-off-by: Yoni Bettan <ybettan@redhat.com>
>---
> samples/virtio/Makefile                |   1 +
> samples/virtio/virtio_example_driver.c | 239 +++++++++++++++++++++++++
> 2 files changed, 240 insertions(+)
> create mode 100644 samples/virtio/Makefile
> create mode 100644 samples/virtio/virtio_example_driver.c
>
>diff --git a/samples/virtio/Makefile b/samples/virtio/Makefile
>new file mode 100644
>index 000000000000..6f3cc811ca89
>--- /dev/null
>+++ b/samples/virtio/Makefile
>@@ -0,0 +1 @@
>+obj-m := virtio_example_driver.o
>diff --git a/samples/virtio/virtio_example_driver.c b/samples/virtio/virtio_example_driver.c
>new file mode 100644
>index 000000000000..2f5a354009a1
>--- /dev/null
>+++ b/samples/virtio/virtio_example_driver.c
>@@ -0,0 +1,239 @@
>+/*
>+ * Virtio example implementation.
>+ *
>+ *  Copyright 2019 Yoni Bettan Red Hat Corporation
>+ *
>+ *  This program is free software; you can redistribute it and/or modify
>+ *  it under the terms of the GNU General Public License as published by
>+ *  the Free Software Foundation; either version 2 of the License, or
>+ *  (at your option) any later version.
>+ *
>+ *  This program is distributed in the hope that it will be useful,
>+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>+ *  GNU General Public License for more details.
>+ */
>+
>+#include <linux/virtio.h>
>+#include <linux/module.h>
>+#include <linux/device.h>
>+#include <linux/pci.h>
>+#include <linux/interrupt.h>
>+#include <linux/io.h>               /* io map */
>+#include <linux/dma-mapping.h>      /* DMA */
>+#include <linux/kernel.h>           /* kstrtoint() func */
>+#include <linux/virtio_config.h>    /* find_single_vq() func */
>+
>+
>+#define VIRTIO_ID_EXAMPLE 21
>+/* big enough to contain a string representing an integer */
>+#define MAX_DATA_SIZE 20
>+
>+struct virtexample_info {
>+	struct virtqueue *vq;
>+    /*
>+     * in - the data we get from the device
>+     * out - the data we send to the device
>+     */
>+    int in, out;
>+};
>+
>+
>+
>+//-----------------------------------------------------------------------------
>+//                  sysfs - give user access to driver
>+//-----------------------------------------------------------------------------
>+
>+static ssize_t
>+virtio_buf_store(struct device *dev, struct device_attribute *attr,
>+                    const char *buf, size_t count)
>+{
>+    char tmp_buf[MAX_DATA_SIZE];
>+    int retval;
>+	struct scatterlist sg_in, sg_out;
>+	struct scatterlist *request[2];
>+    /* cast dev into a virtio_device */
>+    struct virtio_device *vdev = dev_to_virtio(dev);
>+	struct virtexample_info *vi = vdev->priv;

Indentation is off here and in many other places.

>+
>+    /* copy the user buffer since it is a const buffer */
>+    sprintf(tmp_buf, "%s", buf);
>+
>+    /* convert the data into an integer */
>+    retval = kstrtoint(tmp_buf, 10, &vi->out);
>+    if (retval) {
>+        pr_alert("string converstion failed with error: %d\n", retval);
>+    }
>+
>+    /* initialize a single entry sg lists, one for input and one for output */
>+    sg_init_one(&sg_out, &vi->out, sizeof(int));
>+    sg_init_one(&sg_in, &vi->in, sizeof(int));
>+
>+    /* build the request */
>+    request[0] = &sg_out;
>+    request[1] = &sg_in;
>+
>+	/* add the request to the queue, in_buf is sent as the buffer idetifier */
>+    virtqueue_add_sgs(vi->vq, request, 1, 1, &vi->in, GFP_KERNEL);
>+
>+    /* notify the device */
>+	virtqueue_kick(vi->vq);
>+
>+    return count;
>+}
>+
>+static ssize_t
>+virtio_buf_show(struct device *dev, struct device_attribute *attr, char *buf)
>+{
>+    /* cast dev into a virtio_device */
>+    struct virtio_device *vdev = dev_to_virtio(dev);
>+	struct virtexample_info *vi = vdev->priv;
>+
>+    return sprintf(buf, "%d\n", vi->in);
>+}
>+
>+/*
>+ * struct device_attribute dev_attr_virtio_buf = {
>+ *     .attr = {
>+ *         .name = "virtio_buf",
>+ *         .mode = 0644
>+ *     },
>+ *     .show = virtio_buf_show,
>+ *     .store = virtio_buf_store
>+ * }
>+ */
>+static DEVICE_ATTR_RW(virtio_buf);
>+
>+
>+/*
>+ * The example_attr defined above is then grouped in the struct attribute group
>+ * as follows:
>+ */
>+struct attribute *example_attrs[] = {
>+    &dev_attr_virtio_buf.attr,
>+    NULL,
>+};
>+
>+static const struct attribute_group example_attr_group = {
>+    .name = "example", /* directory's name */
>+    .attrs = example_attrs,
>+};
>+
>+
>+
>+//-----------------------------------------------------------------------------
>+//                              IRQ functions
>+//-----------------------------------------------------------------------------
>+
>+static void example_irq_handler(struct virtqueue *vq)
>+{
>+
>+	struct virtexample_info *vi = vq->vdev->priv;
>+    unsigned int len;
>+    int *res = NULL;
>+
>+    /* get the buffer from virtqueue */
>+    res = virtqueue_get_buf(vi->vq, &len);

check for res!=NULL?

>+
>+    vi->in = *res;
>+}
>+
>+
>+//-----------------------------------------------------------------------------
>+//                             driver functions
>+//-----------------------------------------------------------------------------
>+
>+
>+static int example_probe(struct virtio_device *vdev)
>+{
>+    int retval;
>+    struct virtexample_info *vi = NULL;
>+
>+    /* create sysfiles for UI */
>+    retval = sysfs_create_group(&vdev->dev.kobj, &example_attr_group);
>+    if (retval) {
>+        pr_alert("failed to create group in /sys/bus/virtio/devices/.../\n");

Should an error value be returned here? 

>+    }
>+
>+    /* initialize driver data */
>+	vi = kzalloc(sizeof(struct virtexample_info), GFP_KERNEL);
>+	if (!vi)
>+		return -ENOMEM;
>+
>+	/* We expect a single virtqueue. */
>+	vi->vq = virtio_find_single_vq(vdev, example_irq_handler, "input");
>+	if (IS_ERR(vi->vq)) {
>+        pr_alert("failed to connect to the device virtqueue\n");

same here

regards,
Jens 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
