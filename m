Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3823BC16
	for <lists.virtualization@lfdr.de>; Tue,  4 Aug 2020 16:27:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A418B221C6;
	Tue,  4 Aug 2020 14:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oYDpFYynn-GT; Tue,  4 Aug 2020 14:27:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 747CC2052C;
	Tue,  4 Aug 2020 14:27:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A30AC004C;
	Tue,  4 Aug 2020 14:27:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF40BC004C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BDAF187EA4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3Votg1p21zR
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:27:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5EC7F87E9D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596551239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bGF5oICf+wJWIa6fAxOVBYLLnnJYZ/ChyTSMp+GyURE=;
 b=NDsAcbJTzOEP/k3Q2f1GVm8KMGmahpy86Zaw/GGKbR7Op2Uy51ADWAuSONWyxuVwGlssEL
 bKJkdQ+iLtsGQhgISIvsXSsyuKaOLxge9iFWbPreF5ZMtxhXQwMRdyy5+nnrv5hNGDRjK0
 D6tsn6Bx9SodppvfRMjfB7vequdEif8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-ys6kwI9dOgqC7XK-ZviTBA-1; Tue, 04 Aug 2020 10:27:16 -0400
X-MC-Unique: ys6kwI9dOgqC7XK-ZviTBA-1
Received: by mail-qk1-f198.google.com with SMTP id a186so12429587qke.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Aug 2020 07:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bGF5oICf+wJWIa6fAxOVBYLLnnJYZ/ChyTSMp+GyURE=;
 b=YALkC5cdCAW6QT6cx9imb+0QG/aJpCf/1wDTwoNgCg5UsSf2RBEPN4o0oIdeJO/dWp
 75eNpfZRPDF8ChdJovIEr8Y3Jx1C9B4k4KRbGfBOXOzRespcP8vgq9r2H59SsEmG70Uq
 rVPBVuBNcSL8b9/Lohvl3RnXbnz2SDffWkaf1COBkE5RPgSTcSre5fsC04XHxgXTDYNZ
 0iIdTewugXAiet/jpD57cHPmAex3EatrA3CA8qpwIF1mszUSjfTiluQUUTXKEF1Wm1xi
 EhG40hUuQKr4Y3lfFRzPZbL5KnJnIt7j8S15REvYAh0wZ2Z7UioNFu9XX5gGEeNLOsZA
 WPWQ==
X-Gm-Message-State: AOAM533nRc1dGHGbSFHRwMoXc4gG/aXs1fHiJI+KXf+erWNLcNMwKhNf
 aAEQ4aoavnHpThDFTjenDDvRjH5KhfmNCNKUEWzaD6Mw4pKmgCKCvg0v5P6DZ/PnI0AYRaE6yjw
 c0ks4YtwxhCq/zEYnXyYyKnNmac2RZ2xG3R6saMywzA==
X-Received: by 2002:ac8:152:: with SMTP id f18mr22417265qtg.163.1596551235483; 
 Tue, 04 Aug 2020 07:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxAKWSfZv5KvDGgWYvwWeTZ6oFjZGkGgH55qlqvWT0QAT381rkkB4I4jx2DK/sGmepiWWX0w==
X-Received: by 2002:ac8:152:: with SMTP id f18mr22417227qtg.163.1596551235101; 
 Tue, 04 Aug 2020 07:27:15 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net.
 [79.177.102.128])
 by smtp.gmail.com with ESMTPSA id k11sm20908702qkk.93.2020.08.04.07.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 07:27:14 -0700 (PDT)
Date: Tue, 4 Aug 2020 10:27:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v4 4/4] vhost: add an RPMsg API
Message-ID: <20200804102132-mutt-send-email-mst@kernel.org>
References: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
 <20200722150927.15587-5-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200722150927.15587-5-guennadi.liakhovetski@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

On Wed, Jul 22, 2020 at 05:09:27PM +0200, Guennadi Liakhovetski wrote:
> Linux supports running the RPMsg protocol over the VirtIO transport
> protocol, but currently there is only support for VirtIO clients and
> no support for a VirtIO server. This patch adds a vhost-based RPMsg
> server implementation.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
>  drivers/vhost/Kconfig       |   7 +
>  drivers/vhost/Makefile      |   3 +
>  drivers/vhost/rpmsg.c       | 375 ++++++++++++++++++++++++++++++++++++
>  drivers/vhost/vhost_rpmsg.h |  74 +++++++
>  4 files changed, 459 insertions(+)
>  create mode 100644 drivers/vhost/rpmsg.c
>  create mode 100644 drivers/vhost/vhost_rpmsg.h
> 
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index d3688c6afb87..602421bf1d03 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -38,6 +38,13 @@ config VHOST_NET
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called vhost_net.
>  
> +config VHOST_RPMSG
> +	tristate

So this lacks a description line so it does not appear
in menuconfig. How is user supposed to set it?
I added a one-line description.


> +	depends on VHOST

Other drivers select VHOST instead. Any reason not to
do it like this here?


> +	help
> +	  Vhost RPMsg API allows vhost drivers to communicate with VirtIO
> +	  drivers, using the RPMsg over VirtIO protocol.
> +

>  config VHOST_SCSI
>  	tristate "VHOST_SCSI TCM fabric driver"
>  	depends on TARGET_CORE && EVENTFD
> diff --git a/drivers/vhost/Makefile b/drivers/vhost/Makefile
> index f3e1897cce85..9cf459d59f97 100644
> --- a/drivers/vhost/Makefile
> +++ b/drivers/vhost/Makefile
> @@ -2,6 +2,9 @@
>  obj-$(CONFIG_VHOST_NET) += vhost_net.o
>  vhost_net-y := net.o
>  
> +obj-$(CONFIG_VHOST_RPMSG) += vhost_rpmsg.o
> +vhost_rpmsg-y := rpmsg.o
> +
>  obj-$(CONFIG_VHOST_SCSI) += vhost_scsi.o
>  vhost_scsi-y := scsi.o
>  
> diff --git a/drivers/vhost/rpmsg.c b/drivers/vhost/rpmsg.c
> new file mode 100644
> index 000000000000..d7ab48414224
> --- /dev/null
> +++ b/drivers/vhost/rpmsg.c
> @@ -0,0 +1,375 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright(c) 2020 Intel Corporation. All rights reserved.
> + *
> + * Author: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> + *
> + * Vhost RPMsg VirtIO interface. It provides a set of functions to match the
> + * guest side RPMsg VirtIO API, provided by drivers/rpmsg/virtio_rpmsg_bus.c
> + * These functions handle creation of 2 virtual queues, handling of endpoint
> + * addresses, sending a name-space announcement to the guest as well as any
> + * user messages. This API can be used by any vhost driver to handle RPMsg
> + * specific processing.
> + * Specific vhost drivers, using this API will use their own VirtIO device
> + * IDs, that should then also be added to the ID table in virtio_rpmsg_bus.c
> + */
> +
> +#include <linux/compat.h>
> +#include <linux/file.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/vhost.h>
> +#include <linux/virtio_rpmsg.h>
> +#include <uapi/linux/rpmsg.h>
> +
> +#include "vhost.h"
> +#include "vhost_rpmsg.h"
> +
> +/*
> + * All virtio-rpmsg virtual queue kicks always come with just one buffer -
> + * either input or output
> + */
> +static int vhost_rpmsg_get_single(struct vhost_virtqueue *vq)
> +{
> +	struct vhost_rpmsg *vr = container_of(vq->dev, struct vhost_rpmsg, dev);
> +	unsigned int out, in;
> +	int head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov), &out, &in,
> +				     NULL, NULL);
> +	if (head < 0) {
> +		vq_err(vq, "%s(): error %d getting buffer\n",
> +		       __func__, head);
> +		return head;
> +	}
> +
> +	/* Nothing new? */
> +	if (head == vq->num)
> +		return head;
> +
> +	if (vq == &vr->vq[VIRTIO_RPMSG_RESPONSE] && (out || in != 1)) {

This in != 1 looks like a dependency on a specific message layout.
virtio spec says to avoid these. Using iov iters it's not too hard to do
...


> +		vq_err(vq,
> +		       "%s(): invalid %d input and %d output in response queue\n",
> +		       __func__, in, out);
> +		goto return_buf;
> +	}
> +
> +	if (vq == &vr->vq[VIRTIO_RPMSG_REQUEST] && (in || out != 1)) {
> +		vq_err(vq,
> +		       "%s(): invalid %d input and %d output in request queue\n",
> +		       __func__, in, out);
> +		goto return_buf;
> +	}
> +
> +	return head;
> +
> +return_buf:
> +	/*
> +	 * FIXME: might need to return the buffer using vhost_add_used()
> +	 * or vhost_discard_vq_desc(). vhost_discard_vq_desc() is
> +	 * described as "being useful for error handling," but it makes
> +	 * the thus discarded buffers "unseen," so next time we look we
> +	 * retrieve them again?


Yes. It's your decision what to do on error. if you also signal
an eventfd using vq_err, then discarding will
make it so userspace can poke at ring and hopefully fix it ...

> +	 */
> +	return -EINVAL;
> +}
> +
> +static const struct vhost_rpmsg_ept *vhost_rpmsg_ept_find(struct vhost_rpmsg *vr, int addr)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < vr->n_epts; i++)
> +		if (vr->ept[i].addr == addr)
> +			return vr->ept + i;
> +
> +	return NULL;
> +}
> +
> +/*
> + * if len < 0, then for reading a request, the complete virtual queue buffer
> + * size is prepared, for sending a response, the length in the iterator is used
> + */
> +int vhost_rpmsg_start_lock(struct vhost_rpmsg *vr, struct vhost_rpmsg_iter *iter,
> +			   unsigned int qid, ssize_t len)
> +	__acquires(vq->mutex)
> +{
> +	struct vhost_virtqueue *vq = vr->vq + qid;
> +	size_t tmp;
> +
> +	if (qid >= VIRTIO_RPMSG_NUM_OF_VQS)
> +		return -EINVAL;
> +
> +	iter->vq = vq;
> +
> +	mutex_lock(&vq->mutex);
> +	vhost_disable_notify(&vr->dev, vq);
> +
> +	iter->head = vhost_rpmsg_get_single(vq);
> +	if (iter->head == vq->num)
> +		iter->head = -EAGAIN;
> +
> +	if (iter->head < 0)
> +		goto unlock;
> +
> +	tmp = vq->iov[0].iov_len;
> +	if (tmp < sizeof(iter->rhdr)) {
> +		vq_err(vq, "%s(): size %zu too small\n", __func__, tmp);
> +		iter->head = -ENOBUFS;
> +		goto return_buf;
> +	}
> +
> +	switch (qid) {
> +	case VIRTIO_RPMSG_REQUEST:
> +		if (len < 0) {
> +			len = tmp - sizeof(iter->rhdr);
> +		} else if (tmp < sizeof(iter->rhdr) + len) {
> +			iter->head = -ENOBUFS;
> +			goto return_buf;
> +		}
> +
> +		/* len is now the size of the payload */
> +		iov_iter_init(&iter->iov_iter, WRITE,
> +			      vq->iov, 1, sizeof(iter->rhdr) + len);
> +
> +		/* Read the RPMSG header with endpoint addresses */
> +		tmp = copy_from_iter(&iter->rhdr, sizeof(iter->rhdr), &iter->iov_iter);
> +		if (tmp != sizeof(iter->rhdr)) {
> +			vq_err(vq, "%s(): got %zu instead of %zu\n", __func__,
> +			       tmp, sizeof(iter->rhdr));
> +			iter->head = -EIO;
> +			goto return_buf;
> +		}
> +
> +		iter->ept = vhost_rpmsg_ept_find(vr, vhost32_to_cpu(vq, iter->rhdr.dst));
> +		if (!iter->ept) {
> +			vq_err(vq, "%s(): no endpoint with address %d\n",
> +			       __func__, vhost32_to_cpu(vq, iter->rhdr.dst));
> +			iter->head = -ENOENT;
> +			goto return_buf;
> +		}
> +
> +		/* Let the endpoint read the payload */
> +		if (iter->ept->read) {
> +			ssize_t ret = iter->ept->read(vr, iter);
> +
> +			if (ret < 0) {
> +				iter->head = ret;
> +				goto return_buf;
> +			}
> +
> +			iter->rhdr.len = cpu_to_vhost16(vq, ret);
> +		} else {
> +			iter->rhdr.len = 0;
> +		}
> +
> +		/* Prepare for the response phase */
> +		iter->rhdr.dst = iter->rhdr.src;
> +		iter->rhdr.src = cpu_to_vhost32(vq, iter->ept->addr);
> +
> +		break;
> +	case VIRTIO_RPMSG_RESPONSE:
> +		if (!iter->ept && iter->rhdr.dst != cpu_to_vhost32(vq, RPMSG_NS_ADDR)) {
> +			/*
> +			 * Usually the iterator is configured when processing a
> +			 * message on the request queue, but it's also possible
> +			 * to send a message on the response queue without a
> +			 * preceding request, in that case the iterator must
> +			 * contain source and destination addresses.
> +			 */
> +			iter->ept = vhost_rpmsg_ept_find(vr, vhost32_to_cpu(vq, iter->rhdr.src));
> +			if (!iter->ept) {
> +				iter->head = -ENOENT;
> +				goto return_buf;
> +			}
> +		}
> +
> +		if (len < 0) {
> +			len = tmp - sizeof(iter->rhdr);
> +		} else if (tmp < sizeof(iter->rhdr) + len) {
> +			iter->head = -ENOBUFS;
> +			goto return_buf;
> +		} else {
> +			iter->rhdr.len = cpu_to_vhost16(vq, len);
> +		}
> +
> +		/* len is now the size of the payload */
> +		iov_iter_init(&iter->iov_iter, READ, vq->iov, 1, sizeof(iter->rhdr) + len);
> +
> +		/* Write the RPMSG header with endpoint addresses */
> +		tmp = copy_to_iter(&iter->rhdr, sizeof(iter->rhdr), &iter->iov_iter);
> +		if (tmp != sizeof(iter->rhdr)) {
> +			iter->head = -EIO;
> +			goto return_buf;
> +		}
> +
> +		/* Let the endpoint write the payload */
> +		if (iter->ept && iter->ept->write) {
> +			ssize_t ret = iter->ept->write(vr, iter);
> +
> +			if (ret < 0) {
> +				iter->head = ret;
> +				goto return_buf;
> +			}
> +		}
> +
> +		break;
> +	}
> +
> +	return 0;
> +
> +return_buf:
> +	/*
> +	 * FIXME: vhost_discard_vq_desc() or vhost_add_used(), see comment in
> +	 * vhost_rpmsg_get_single()
> +	 */

What's to be done with this FIXME?


> +unlock:
> +	vhost_enable_notify(&vr->dev, vq);
> +	mutex_unlock(&vq->mutex);
> +
> +	return iter->head;
> +}
> +EXPORT_SYMBOL_GPL(vhost_rpmsg_start_lock);
> +
> +size_t vhost_rpmsg_copy(struct vhost_rpmsg *vr, struct vhost_rpmsg_iter *iter,
> +			void *data, size_t size)
> +{
> +	/*
> +	 * We could check for excess data, but copy_{to,from}_iter() don't do
> +	 * that either
> +	 */
> +	if (iter->vq == vr->vq + VIRTIO_RPMSG_RESPONSE)
> +		return copy_to_iter(data, size, &iter->iov_iter);
> +
> +	return copy_from_iter(data, size, &iter->iov_iter);
> +}
> +EXPORT_SYMBOL_GPL(vhost_rpmsg_copy);
> +
> +int vhost_rpmsg_finish_unlock(struct vhost_rpmsg *vr,
> +			      struct vhost_rpmsg_iter *iter)
> +	__releases(vq->mutex)
> +{
> +	if (iter->head >= 0)
> +		vhost_add_used_and_signal(iter->vq->dev, iter->vq, iter->head,
> +					  vhost16_to_cpu(iter->vq, iter->rhdr.len) +
> +					  sizeof(iter->rhdr));
> +
> +	vhost_enable_notify(&vr->dev, iter->vq);
> +	mutex_unlock(&iter->vq->mutex);
> +
> +	return iter->head;
> +}
> +EXPORT_SYMBOL_GPL(vhost_rpmsg_finish_unlock);
> +
> +/*
> + * Return false to terminate the external loop only if we fail to obtain either
> + * a request or a response buffer
> + */
> +static bool handle_rpmsg_req_single(struct vhost_rpmsg *vr,
> +				    struct vhost_virtqueue *vq)
> +{
> +	struct vhost_rpmsg_iter iter;
> +	int ret = vhost_rpmsg_start_lock(vr, &iter, VIRTIO_RPMSG_REQUEST, -EINVAL);
> +	if (!ret)
> +		ret = vhost_rpmsg_finish_unlock(vr, &iter);
> +	if (ret < 0) {
> +		if (ret != -EAGAIN)
> +			vq_err(vq, "%s(): RPMSG processing failed %d\n",
> +			       __func__, ret);
> +		return false;
> +	}
> +
> +	if (!iter.ept->write)
> +		return true;
> +
> +	ret = vhost_rpmsg_start_lock(vr, &iter, VIRTIO_RPMSG_RESPONSE, -EINVAL);
> +	if (!ret)
> +		ret = vhost_rpmsg_finish_unlock(vr, &iter);
> +	if (ret < 0) {
> +		vq_err(vq, "%s(): RPMSG finalising failed %d\n", __func__, ret);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void handle_rpmsg_req_kick(struct vhost_work *work)
> +{
> +	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
> +						  poll.work);
> +	struct vhost_rpmsg *vr = container_of(vq->dev, struct vhost_rpmsg, dev);
> +
> +	while (handle_rpmsg_req_single(vr, vq))
> +		;
> +}
> +
> +/*
> + * initialise two virtqueues with an array of endpoints,
> + * request and response callbacks
> + */
> +void vhost_rpmsg_init(struct vhost_rpmsg *vr, const struct vhost_rpmsg_ept *ept,
> +		      unsigned int n_epts)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(vr->vq); i++)
> +		vr->vq_p[i] = &vr->vq[i];
> +
> +	/* vq[0]: host -> guest, vq[1]: host <- guest */
> +	vr->vq[VIRTIO_RPMSG_REQUEST].handle_kick = handle_rpmsg_req_kick;
> +	vr->vq[VIRTIO_RPMSG_RESPONSE].handle_kick = NULL;
> +
> +	vr->ept = ept;
> +	vr->n_epts = n_epts;
> +
> +	vhost_dev_init(&vr->dev, vr->vq_p, VIRTIO_RPMSG_NUM_OF_VQS,
> +		       UIO_MAXIOV, 0, 0, true, NULL);
> +}
> +EXPORT_SYMBOL_GPL(vhost_rpmsg_init);
> +
> +void vhost_rpmsg_destroy(struct vhost_rpmsg *vr)
> +{
> +	if (vhost_dev_has_owner(&vr->dev))
> +		vhost_poll_flush(&vr->vq[VIRTIO_RPMSG_REQUEST].poll);
> +
> +	vhost_dev_cleanup(&vr->dev);
> +}
> +EXPORT_SYMBOL_GPL(vhost_rpmsg_destroy);
> +
> +/* send namespace */
> +int vhost_rpmsg_ns_announce(struct vhost_rpmsg *vr, const char *name, unsigned int src)
> +{
> +	struct vhost_virtqueue *vq = &vr->vq[VIRTIO_RPMSG_RESPONSE];
> +	struct vhost_rpmsg_iter iter = {
> +		.rhdr = {
> +			.src = 0,
> +			.dst = cpu_to_vhost32(vq, RPMSG_NS_ADDR),
> +			.flags = cpu_to_vhost16(vq, RPMSG_NS_CREATE), /* rpmsg_recv_single() */
> +		},
> +	};
> +	struct rpmsg_ns_msg ns = {
> +		.addr = cpu_to_vhost32(vq, src),
> +		.flags = cpu_to_vhost32(vq, RPMSG_NS_CREATE), /* for rpmsg_ns_cb() */
> +	};
> +	int ret = vhost_rpmsg_start_lock(vr, &iter, VIRTIO_RPMSG_RESPONSE, sizeof(ns));
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	strlcpy(ns.name, name, sizeof(ns.name));
> +
> +	ret = vhost_rpmsg_copy(vr, &iter, &ns, sizeof(ns));
> +	if (ret != sizeof(ns))
> +		vq_err(iter.vq, "%s(): added %d instead of %zu bytes\n",
> +		       __func__, ret, sizeof(ns));
> +
> +	ret = vhost_rpmsg_finish_unlock(vr, &iter);
> +	if (ret < 0)
> +		vq_err(iter.vq, "%s(): namespace announcement failed: %d\n",
> +		       __func__, ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(vhost_rpmsg_ns_announce);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Intel, Inc.");
> +MODULE_DESCRIPTION("Vhost RPMsg API");
> diff --git a/drivers/vhost/vhost_rpmsg.h b/drivers/vhost/vhost_rpmsg.h
> new file mode 100644
> index 000000000000..30072cecb8a0
> --- /dev/null
> +++ b/drivers/vhost/vhost_rpmsg.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright(c) 2020 Intel Corporation. All rights reserved.
> + *
> + * Author: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> + */
> +
> +#ifndef VHOST_RPMSG_H
> +#define VHOST_RPMSG_H
> +
> +#include <linux/uio.h>
> +#include <linux/virtio_rpmsg.h>
> +
> +#include "vhost.h"
> +
> +/* RPMsg uses two VirtQueues: one for each direction */
> +enum {
> +	VIRTIO_RPMSG_RESPONSE,	/* RPMsg response (host->guest) buffers */
> +	VIRTIO_RPMSG_REQUEST,	/* RPMsg request (guest->host) buffers */
> +	/* Keep last */
> +	VIRTIO_RPMSG_NUM_OF_VQS,
> +};
> +
> +struct vhost_rpmsg_ept;
> +
> +struct vhost_rpmsg_iter {
> +	struct iov_iter iov_iter;
> +	struct rpmsg_hdr rhdr;
> +	struct vhost_virtqueue *vq;
> +	const struct vhost_rpmsg_ept *ept;
> +	int head;
> +	void *priv;
> +};
> +
> +struct vhost_rpmsg {
> +	struct vhost_dev dev;
> +	struct vhost_virtqueue vq[VIRTIO_RPMSG_NUM_OF_VQS];
> +	struct vhost_virtqueue *vq_p[VIRTIO_RPMSG_NUM_OF_VQS];
> +	const struct vhost_rpmsg_ept *ept;
> +	unsigned int n_epts;
> +};
> +
> +struct vhost_rpmsg_ept {
> +	ssize_t (*read)(struct vhost_rpmsg *, struct vhost_rpmsg_iter *);
> +	ssize_t (*write)(struct vhost_rpmsg *, struct vhost_rpmsg_iter *);
> +	int addr;
> +};
> +
> +static inline size_t vhost_rpmsg_iter_len(const struct vhost_rpmsg_iter *iter)
> +{
> +	return iter->rhdr.len;
> +}
> +
> +#define VHOST_RPMSG_ITER(_vq, _src, _dst) {			\
> +	.rhdr = {						\
> +			.src = cpu_to_vhost32(_vq, _src),	\
> +			.dst = cpu_to_vhost32(_vq, _dst),	\
> +		},						\
> +	}
> +
> +void vhost_rpmsg_init(struct vhost_rpmsg *vr, const struct vhost_rpmsg_ept *ept,
> +		      unsigned int n_epts);
> +void vhost_rpmsg_destroy(struct vhost_rpmsg *vr);
> +int vhost_rpmsg_ns_announce(struct vhost_rpmsg *vr, const char *name,
> +			    unsigned int src);
> +int vhost_rpmsg_start_lock(struct vhost_rpmsg *vr,
> +			   struct vhost_rpmsg_iter *iter,
> +			   unsigned int qid, ssize_t len);
> +size_t vhost_rpmsg_copy(struct vhost_rpmsg *vr, struct vhost_rpmsg_iter *iter,
> +			void *data, size_t size);
> +int vhost_rpmsg_finish_unlock(struct vhost_rpmsg *vr,
> +			      struct vhost_rpmsg_iter *iter);
> +
> +#endif
> -- 
> 2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
