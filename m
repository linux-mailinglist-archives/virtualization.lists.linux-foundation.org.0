Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9C25BEB7
	for <lists.virtualization@lfdr.de>; Thu,  3 Sep 2020 11:59:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7EEF422794;
	Thu,  3 Sep 2020 09:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5PaObMaT9uI; Thu,  3 Sep 2020 09:58:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6B7F220384;
	Thu,  3 Sep 2020 09:58:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B4C9C0052;
	Thu,  3 Sep 2020 09:58:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16229C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 09:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 01CA08669E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 09:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFo6E3GczlM9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 09:58:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 63E4E869E4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599127135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nNc60Gq5RK/C8kUq71+92jh70ccIAFs4rxIcS4CbeDM=;
 b=AxHKCULT/Dx2La9TWg3wumWRXxKJtDcCcixMXNg57hm6c8eULl9HcSQny29bw+BLreAEvv
 PEGqYTs4qzBmO9gWo2t491ZGhqBmjYxooNYx3QOgzW/7sFvgzvLFiUpQZ5d7HmlR2mwNqL
 wP1o8egmc7Evr6NE1Z8ieZ0ohKHnUpc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-ocPDrb2dOr204ZKc2qjs9g-1; Thu, 03 Sep 2020 05:58:51 -0400
X-MC-Unique: ocPDrb2dOr204ZKc2qjs9g-1
Received: by mail-wr1-f70.google.com with SMTP id a10so862864wrw.22
 for <virtualization@lists.linux-foundation.org>;
 Thu, 03 Sep 2020 02:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nNc60Gq5RK/C8kUq71+92jh70ccIAFs4rxIcS4CbeDM=;
 b=LynvsQKiOYXwmExvzCSGf3RZOnQhPHKen0cO7nvVg9isWdeA8+La4KpPOkDpJ/4GU+
 8tBEjURR2tAVT9LUrz/5KU1oo89jsxwOlm3TZHQxbm9C1IMehhOaK/dW2+yPVIyOOBP3
 U4M7thNizoJcai81MkIIkxh8bYw0FlhSZU1DgWkNqRwKn9V/rMTH1ohpqaI5wDSenT37
 l9Wn+RtsVBrYkVv7noT4aq9JHEPeTc/2jAkXdQfF9mCvilJ/PNgRJOUR0vpdpGLwfWBg
 R96UGUXXx6mNvxHh9FIJfnKwtwK7GkpW9WE+pmGsQDWfOHhgERX3+QcDI1CZtrDcP8Zr
 GIuA==
X-Gm-Message-State: AOAM531+a21re5VOFr07oc8lA2iLdCcMiedLiRL+QkcDZzV1tJaJh3DG
 EhYcrRQXpm/PwVFUgvk7u06mjJK6AYZ6LW/dlAkl1PE565jAvQOnCH4YpdyoUQ3+WjjDLFOSh2D
 0+kMpdxrMcnoMW4MI6fCrsKzQqxPegS1gILBmoAe0GA==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr1653256wmk.86.1599127130580; 
 Thu, 03 Sep 2020 02:58:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxXFnoBeJakzQY/Rh5Q5iezZdoyOEuLybrZ/tH+WZUK0IZcoeOwidNoVsA8y6cyNY0mAnZZw==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr1653220wmk.86.1599127130287; 
 Thu, 03 Sep 2020 02:58:50 -0700 (PDT)
Received: from redhat.com (bzq-79-177-107-202.red.bezeqint.net.
 [79.177.107.202])
 by smtp.gmail.com with ESMTPSA id z9sm3436337wma.4.2020.09.03.02.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 02:58:49 -0700 (PDT)
Date: Thu, 3 Sep 2020 05:58:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jie Deng <jie.deng@intel.com>
Subject: Re: [PATCH] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20200903055633-mutt-send-email-mst@kernel.org>
References: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
MIME-Version: 1.0
In-Reply-To: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Sergey.Semin@baikalelectronics.ru, bjorn.andersson@linaro.org,
 loic.poulain@linaro.org, tali.perry1@gmail.com, yu1.wang@intel.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org,
 virtualization@lists.linux-foundation.org, wsa@kernel.org,
 wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
 linux-i2c@vger.kernel.org, rppt@kernel.org, shuo.a.liu@intel.com,
 andriy.shevchenko@linux.intel.com, conghui.chen@intel.com, jdelvare@suse.de
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Sep 03, 2020 at 01:34:45PM +0800, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
> 
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
> 
> This driver communicates with the backend driver through a
> virtio I2C message structure which includes following parts:
> 
> - Header: i2c_msg addr, flags, len.
> - Data buffer: the pointer to the i2c msg data.
> - Status: the processing result from the backend.
> 
> People may implement different backend drivers to emulate
> different controllers according to their needs. A backend
> example can be found in the device model of the open source
> project ACRN. For more information, please refer to
> https://projectacrn.org.
> 
> The virtio device ID 34 is used for this I2C adpter since IDs
> before 34 have been reserved by other virtio devices.

Please reserve the ID with the virtio tc so no one conflicts.


> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Jie Deng <jie.deng@intel.com>
> Reviewed-by: Shuo Liu <shuo.a.liu@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/Kconfig      |  11 ++
>  drivers/i2c/busses/Makefile     |   3 +
>  drivers/i2c/busses/i2c-virtio.c | 276 ++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/virtio_ids.h |   1 +
>  4 files changed, 291 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-virtio.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 293e7a0..70c8e30 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -21,6 +21,17 @@ config I2C_ALI1535
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-ali1535.
>  
> +config I2C_VIRTIO
> +	tristate "Virtio I2C Adapter"
> +	depends on VIRTIO
> +	help
> +	  If you say yes to this option, support will be included for the virtio
> +	  i2c adapter driver. The hardware can be emulated by any device model
> +	  software according to the virtio protocol.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called i2c-virtio.
> +
>  config I2C_ALI1563
>  	tristate "ALI 1563"
>  	depends on PCI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 19aff0e..821acfa 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -6,6 +6,9 @@
>  # ACPI drivers
>  obj-$(CONFIG_I2C_SCMI)		+= i2c-scmi.o
>  
> +# VIRTIO I2C host controller driver
> +obj-$(CONFIG_I2C_VIRTIO)	+= i2c-virtio.o
> +
>  # PC SMBus host controller drivers
>  obj-$(CONFIG_I2C_ALI1535)	+= i2c-ali1535.o
>  obj-$(CONFIG_I2C_ALI1563)	+= i2c-ali1563.o
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> new file mode 100644
> index 0000000..47f9fd1
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Virtio I2C Bus Driver
> + *
> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/completion.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/wait.h>
> +
> +#include <linux/virtio.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_config.h>
> +
> +#define VIRTIO_I2C_MSG_OK	0
> +#define VIRTIO_I2C_MSG_ERR	1
> +
> +/**
> + * struct virtio_i2c_hdr - the virtio I2C message header structure
> + * @addr: i2c_msg addr, the slave address
> + * @flags: i2c_msg flags
> + * @len: i2c_msg len
> + */
> +struct virtio_i2c_hdr {
> +	__virtio16 addr;
> +	__virtio16 flags;
> +	__virtio16 len;
> +} __packed;

virtio16 is for legacy devices, modern ones should be __le.
and  we don't really need to pack it I think.

> +
> +/**
> + * struct virtio_i2c_msg - the virtio I2C message structure
> + * @hdr: the virtio I2C message header
> + * @buf: virtio I2C message data buffer
> + * @status: the processing result from the backend
> + */
> +struct virtio_i2c_msg {
> +	struct virtio_i2c_hdr hdr;
> +	char *buf;
> +	u8 status;
> +};
> +
> +/**
> + * struct virtio_i2c - virtio I2C data
> + * @vdev: virtio device for this controller
> + * @completion: completion of virtio I2C message
> + * @adap: I2C adapter for this controller
> + * @i2c_lock: lock for virtqueue processing
> + * @vq: the virtio virtqueue for communication
> + */
> +struct virtio_i2c {
> +	struct virtio_device *vdev;
> +	struct completion completion;
> +	struct i2c_adapter adap;
> +	struct mutex i2c_lock;
> +	struct virtqueue *vq;
> +};
> +
> +static void virtio_i2c_msg_done(struct virtqueue *vq)
> +{
> +	struct virtio_i2c *vi = vq->vdev->priv;
> +
> +	complete(&vi->completion);
> +}
> +
> +static int virtio_i2c_add_msg(struct virtqueue *vq,
> +			      struct virtio_i2c_msg *vmsg,
> +			      struct i2c_msg *msg)
> +{
> +	struct scatterlist *sgs[3], hdr, bout, bin, status;
> +	int outcnt = 0, incnt = 0;
> +
> +	if (!msg->len)
> +		return -EINVAL;
> +
> +	vmsg->hdr.addr = msg->addr;
> +	vmsg->hdr.flags = msg->flags;
> +	vmsg->hdr.len = msg->len;
> +
> +	vmsg->buf = kzalloc(vmsg->hdr.len, GFP_KERNEL);
> +	if (!vmsg->buf)
> +		return -ENOMEM;
> +
> +	sg_init_one(&hdr, &vmsg->hdr, sizeof(struct virtio_i2c_hdr));
> +	sgs[outcnt++] = &hdr;
> +	if (vmsg->hdr.flags & I2C_M_RD) {
> +		sg_init_one(&bin, vmsg->buf, msg->len);
> +		sgs[outcnt + incnt++] = &bin;
> +	} else {
> +		memcpy(vmsg->buf, msg->buf, msg->len);
> +		sg_init_one(&bout, vmsg->buf, msg->len);
> +		sgs[outcnt++] = &bout;
> +	}
> +	sg_init_one(&status, &vmsg->status, sizeof(vmsg->status));
> +	sgs[outcnt + incnt++] = &status;
> +
> +	return virtqueue_add_sgs(vq, sgs, outcnt, incnt, vmsg, GFP_KERNEL);
> +}
> +
> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> +	struct virtio_i2c_msg *vmsg_o, *vmsg_i;
> +	struct virtqueue *vq = vi->vq;
> +	unsigned long time_left;
> +	int len, i, ret = 0;
> +
> +	vmsg_o = kzalloc(sizeof(*vmsg_o), GFP_KERNEL);
> +	if (!vmsg_o)
> +		return -ENOMEM;
> +
> +	mutex_lock(&vi->i2c_lock);
> +	vmsg_o->buf = NULL;
> +	for (i = 0; i < num; i++) {
> +		ret = virtio_i2c_add_msg(vq, vmsg_o, &msgs[i]);
> +		if (ret) {
> +			dev_err(&adap->dev, "failed to add msg[%d] to virtqueue.\n", i);
> +			goto err_unlock_free;
> +		}
> +
> +		virtqueue_kick(vq);
> +
> +		time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> +		if (!time_left) {
> +			dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", i, msgs[i].addr);
> +			ret = i;
> +			goto err_unlock_free;
> +		}
> +
> +		vmsg_i = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, &len);
> +		if (vmsg_i) {
> +			/* vmsg_i should point to the same address with vmsg_o */
> +			if (vmsg_i != vmsg_o) {
> +				dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue error.\n",
> +					i, vmsg_i->hdr.addr);
> +				ret = i;
> +				goto err_unlock_free;
> +			}
> +			if (vmsg_i->status != VIRTIO_I2C_MSG_OK) {
> +				dev_err(&adap->dev, "msg[%d]: addr=0x%x error=%d.\n",
> +					i, vmsg_i->hdr.addr, vmsg_i->status);
> +				ret = i;
> +				goto err_unlock_free;
> +			}
> +			if ((vmsg_i->hdr.flags & I2C_M_RD) && vmsg_i->hdr.len)
> +				memcpy(msgs[i].buf, vmsg_i->buf, vmsg_i->hdr.len);
> +
> +			kfree(vmsg_i->buf);
> +			vmsg_i->buf = NULL;
> +		}
> +		reinit_completion(&vi->completion);
> +	}
> +	if (i == num)
> +		ret = num;
> +
> +err_unlock_free:
> +	mutex_unlock(&vi->i2c_lock);
> +	kfree(vmsg_o->buf);
> +	kfree(vmsg_o);
> +	return ret;
> +}
> +
> +static void virtio_i2c_del_vqs(struct virtio_device *vdev)
> +{
> +	vdev->config->reset(vdev);
> +	vdev->config->del_vqs(vdev);
> +}
> +
> +static int virtio_i2c_setup_vqs(struct virtio_i2c *vi)
> +{
> +	struct virtio_device *vdev = vi->vdev;
> +
> +	vi->vq = virtio_find_single_vq(vdev, virtio_i2c_msg_done, "i2c-msg");
> +	return PTR_ERR_OR_ZERO(vi->vq);
> +}
> +
> +static u32 virtio_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static struct i2c_algorithm virtio_algorithm = {
> +	.master_xfer = virtio_i2c_xfer,
> +	.functionality = virtio_i2c_func,
> +};
> +
> +static struct i2c_adapter virtio_adapter = {
> +	.owner = THIS_MODULE,
> +	.name = "Virtio I2C Adapter",
> +	.class = I2C_CLASS_DEPRECATED,
> +	.algo = &virtio_algorithm,
> +};
> +
> +static int virtio_i2c_probe(struct virtio_device *vdev)
> +{
> +	struct device *pdev = vdev->dev.parent;
> +	struct virtio_i2c *vi;
> +	int ret;
> +
> +	vi = devm_kzalloc(&vdev->dev, sizeof(*vi), GFP_KERNEL);
> +	if (!vi)
> +		return -ENOMEM;
> +
> +	vdev->priv = vi;
> +	vi->vdev = vdev;
> +
> +	mutex_init(&vi->i2c_lock);
> +	init_completion(&vi->completion);
> +
> +	ret = virtio_i2c_setup_vqs(vi);
> +	if (ret)
> +		return ret;
> +
> +	vi->adap = virtio_adapter;
> +	i2c_set_adapdata(&vi->adap, vi);
> +	vi->adap.dev.parent = &vdev->dev;
> +	/* Setup ACPI node for slave devices which will be probed through ACPI */
> +	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
> +	vi->adap.timeout = HZ / 10;
> +	ret = i2c_add_adapter(&vi->adap);
> +	if (ret) {
> +		dev_err(&vdev->dev, "failed to add virtio-i2c adapter.\n");
> +		virtio_i2c_del_vqs(vdev);
> +	}
> +
> +	return ret;
> +}
> +
> +static void virtio_i2c_remove(struct virtio_device *vdev)
> +{
> +	struct virtio_i2c *vi = vdev->priv;
> +
> +	i2c_del_adapter(&vi->adap);
> +	virtio_i2c_del_vqs(vdev);
> +}
> +
> +static struct virtio_device_id id_table[] = {
> +	{ VIRTIO_ID_I2C_ADPTER, VIRTIO_DEV_ANY_ID },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(virtio, id_table);
> +
> +static int __maybe_unused virtio_i2c_freeze(struct virtio_device *vdev)
> +{
> +	virtio_i2c_del_vqs(vdev);
> +	return 0;
> +}
> +
> +static int __maybe_unused virtio_i2c_restore(struct virtio_device *vdev)
> +{
> +	return virtio_i2c_setup_vqs(vdev->priv);
> +}
> +
> +static struct virtio_driver virtio_i2c_driver = {
> +	.id_table	= id_table,
> +	.probe		= virtio_i2c_probe,
> +	.remove		= virtio_i2c_remove,
> +	.driver	= {
> +		.name	= "i2c_virtio",
> +	},
> +#ifdef CONFIG_PM_SLEEP
> +	.freeze = virtio_i2c_freeze,
> +	.restore = virtio_i2c_restore,
> +#endif
> +};
> +module_virtio_driver(virtio_i2c_driver);
> +
> +MODULE_DESCRIPTION("Virtio i2c bus driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index b052355..398ef2d 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -48,5 +48,6 @@
>  #define VIRTIO_ID_FS           26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM         27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C_ADPTER   34 /* virtio i2c adpter */
>  
>  #endif /* _LINUX_VIRTIO_IDS_H */
> -- 
> 2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
