Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121063A053
	for <lists.virtualization@lfdr.de>; Mon, 28 Nov 2022 05:05:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 646DD81A5F;
	Mon, 28 Nov 2022 04:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 646DD81A5F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gfDhrjMt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZAtTN6PGjUTW; Mon, 28 Nov 2022 04:05:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DDBB981A46;
	Mon, 28 Nov 2022 04:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDBB981A46
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 256BEC007C;
	Mon, 28 Nov 2022 04:05:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5ECE0C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 04:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3885581A29
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 04:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3885581A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmHsGwaIjaO5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 04:05:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 067F781A24
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 067F781A24
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 04:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669608350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TW6u920HelKnlzU3FsbOm4kntLB0GHqwnJLuYrrI+/8=;
 b=gfDhrjMt2/bnnUXEIoT26zKEV+64wYcCxq74zdN/4jyDqXo+jM7A1nhAg4SpwS8kFva5wk
 9aC78SEGlsM44vOWS/0JiyEJ34CiO/OYsLMMBWevsoMr+WR6rNGFcxIpiM5rnKOZgGPX0X
 qo1gGnC+p44+vY4GD0gsrRcXDNZ4w6E=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-n3tMV58rOguwc9ZjZeAkbA-1; Sun, 27 Nov 2022 23:05:49 -0500
X-MC-Unique: n3tMV58rOguwc9ZjZeAkbA-1
Received: by mail-ot1-f71.google.com with SMTP id
 l12-20020a9d6a8c000000b0066c33f1649cso3764060otq.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 27 Nov 2022 20:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TW6u920HelKnlzU3FsbOm4kntLB0GHqwnJLuYrrI+/8=;
 b=3rsfsMLg09DiJ6biOx8anaLCsciOQ+9lugqkvfR6SYGwfNYzAVGzINNwGyz3wGsEDm
 TAZtLWYuR07Pe0bk2avjV1mj4tbH2fmqR8JEHIeGRBk50Q7lMNp5sCOhdV0EbXKjrlMn
 ncwnSC868klSFdrP4DcZv2F71BNnweWV0ND/iXjjfXeTMe2cB+Xedo5lQGTfvi0FdOSX
 dv+IZVHTgQhx3OeYm3J6BmvRUCPGlAdezCqzZNks+0dBrq1Te7mlEWzWNkWmWeTviF/5
 24K6fnTFTAcCRrGOGtNc95pePJoBElYCSM17yrKmUcGpHy+pAxh2VVx+LTzzakP0ZNcL
 ol0g==
X-Gm-Message-State: ANoB5pkUTYaSgu+wKLOooNNuKRHvyX1gMTGM+PZz1jpSf+TLFgMjtFZ+
 GqmFaR8k25/hM1ErYXWbqxwzp9CJ4YVxv1UIAS0XqUfTpMqztpbNFUQffMJjpRucO8TF7haBHcI
 jdqW0w4o7dqsRpXtB8YsaDeYRet0UZ+a7czkCvA+PnIP0xn0xhakk0uERaA==
X-Received: by 2002:aca:2103:0:b0:35b:9abf:5031 with SMTP id
 3-20020aca2103000000b0035b9abf5031mr5383214oiz.280.1669608348383; 
 Sun, 27 Nov 2022 20:05:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Amwfa3Ywi+8tdyygBOHJh0o3crwFoe1AjAwj76fJiS1Xng1WCeFaC6wSpfTtoNi3+YoYQtw8R+Hh21TuSFhI=
X-Received: by 2002:aca:2103:0:b0:35b:9abf:5031 with SMTP id
 3-20020aca2103000000b0035b9abf5031mr5383209oiz.280.1669608348105; Sun, 27 Nov
 2022 20:05:48 -0800 (PST)
MIME-Version: 1.0
References: <20221128025558.2152-1-longpeng2@huawei.com>
In-Reply-To: <20221128025558.2152-1-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 28 Nov 2022 12:05:37 +0800
Message-ID: <CACGkMEsWoM1LKkPWPgDALssjkk4UXxfhYm3_aCFktNnpXtWVjQ@mail.gmail.com>
Subject: Re: [PATCH] vdpasim: support doorbell mapping
To: "Longpeng(Mike)" <longpeng2@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mst@redhat.com, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 yechuan@huawei.com, eperezma@redhat.com, huangzhichao@huawei.com,
 stefanha@redhat.com, virtualization@lists.linux-foundation.org
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

On Mon, Nov 28, 2022 at 10:56 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> Support doorbell mapping for vdpasim devices, then we can test the notify
> passthrough feature even if there's no real hardware on hand.

You can use vp_vdpa in L1 plus page_ver_vq in L0 to test it in L2.
That is how I test it.

>
> Allocates a dummy page which used to emulate the notify page of the device.
> All values written to this page would be ignored,  a periodic work will
> check whether there're requests that need to process.

This seems tricky, it means the device is working even if there's no
kick. If we really want to do, we should try to use page fault handler
(probably by extending the config ops), but I'm not sure it's worth to
bother (or if we can find a use case for no simulator devices).

>
> This cap is disabled as default, users can enable it as follow:
>   modprobe vdpa_sim notify_passthrough=true
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  drivers/vdpa/vdpa_sim/vdpa_sim.c     | 71 ++++++++++++++++++++++++++--
>  drivers/vdpa/vdpa_sim/vdpa_sim.h     |  5 +-
>  drivers/vdpa/vdpa_sim/vdpa_sim_blk.c |  5 +-
>  drivers/vdpa/vdpa_sim/vdpa_sim_net.c |  4 +-
>  4 files changed, 76 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> index 7438a89ce939..5c215b56b78b 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/dma-map-ops.h>
> +#include <asm/set_memory.h>
>  #include <linux/vringh.h>
>  #include <linux/vdpa.h>
>  #include <linux/vhost_iotlb.h>
> @@ -36,9 +37,15 @@ module_param(max_iotlb_entries, int, 0444);
>  MODULE_PARM_DESC(max_iotlb_entries,
>                  "Maximum number of iotlb entries for each address space. 0 means unlimited. (default: 2048)");
>
> +static bool notify_passthrough;
> +module_param(notify_passthrough, bool, 0444);
> +MODULE_PARM_DESC(notify_passthrough,
> +                "Enable vq notify(doorbell) area mapping. (default: false)");
> +
>  #define VDPASIM_QUEUE_ALIGN PAGE_SIZE
>  #define VDPASIM_QUEUE_MAX 256
>  #define VDPASIM_VENDOR_ID 0
> +#define VDPASIM_VRING_POLL_PERIOD 100 /* ms */
>
>  static struct vdpasim *vdpa_to_sim(struct vdpa_device *vdpa)
>  {
> @@ -276,7 +283,7 @@ struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr,
>         }
>
>         vdpasim->dev_attr = *dev_attr;
> -       INIT_WORK(&vdpasim->work, dev_attr->work_fn);
> +       INIT_DELAYED_WORK(&vdpasim->vring_work, dev_attr->work_fn);
>         spin_lock_init(&vdpasim->lock);
>         spin_lock_init(&vdpasim->iommu_lock);
>
> @@ -287,6 +294,15 @@ struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr,
>         set_dma_ops(dev, &vdpasim_dma_ops);
>         vdpasim->vdpa.mdev = dev_attr->mgmt_dev;
>
> +       if (notify_passthrough) {
> +               vdpasim->notify = __get_free_page(GFP_KERNEL | __GFP_ZERO);
> +               if (!vdpasim->notify)
> +                       goto err_iommu;
> +#ifdef CONFIG_X86
> +               set_memory_uc(vdpasim->notify, 1);
> +#endif

What's the reason for using uc memory?

> +       }
> +
>         vdpasim->config = kzalloc(dev_attr->config_size, GFP_KERNEL);
>         if (!vdpasim->config)
>                 goto err_iommu;
> @@ -357,8 +373,11 @@ static void vdpasim_kick_vq(struct vdpa_device *vdpa, u16 idx)
>         struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
>         struct vdpasim_virtqueue *vq = &vdpasim->vqs[idx];
>
> +       if (notify_passthrough)
> +               return;

So we should keep the two paths to be used at the same time. Userspace
can choose to not map doorbells?

Thanks

> +
>         if (vq->ready)
> -               schedule_work(&vdpasim->work);
> +               schedule_work(&vdpasim->vring_work.work);
>  }
>
>  static void vdpasim_set_vq_cb(struct vdpa_device *vdpa, u16 idx,
> @@ -495,6 +514,18 @@ static u8 vdpasim_get_status(struct vdpa_device *vdpa)
>         return status;
>  }
>
> +static void vdpasim_set_vring_work(struct vdpasim *vdpasim, bool start)
> +{
> +       if (!notify_passthrough)
> +               return;
> +
> +       if (start)
> +               schedule_delayed_work(&vdpasim->vring_work,
> +                               msecs_to_jiffies(VDPASIM_VRING_POLL_PERIOD));
> +       else
> +               cancel_delayed_work_sync(&vdpasim->vring_work);
> +}
> +
>  static void vdpasim_set_status(struct vdpa_device *vdpa, u8 status)
>  {
>         struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
> @@ -502,12 +533,16 @@ static void vdpasim_set_status(struct vdpa_device *vdpa, u8 status)
>         spin_lock(&vdpasim->lock);
>         vdpasim->status = status;
>         spin_unlock(&vdpasim->lock);
> +
> +       vdpasim_set_vring_work(vdpasim, status & VIRTIO_CONFIG_S_DRIVER_OK);
>  }
>
>  static int vdpasim_reset(struct vdpa_device *vdpa, bool clear)
>  {
>         struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
>
> +       vdpasim_set_vring_work(vdpasim, false);
> +
>         spin_lock(&vdpasim->lock);
>         vdpasim->status = 0;
>         vdpasim_do_reset(vdpasim);
> @@ -672,12 +707,24 @@ static int vdpasim_dma_unmap(struct vdpa_device *vdpa, unsigned int asid,
>         return 0;
>  }
>
> +static struct vdpa_notification_area
> +vdpasim_get_vq_notification(struct vdpa_device *vdpa, u16 qid)
> +{
> +       struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
> +       struct vdpa_notification_area notify;
> +
> +       notify.addr = virt_to_phys((void *)vdpasim->notify);
> +       notify.size = PAGE_SIZE;
> +
> +       return notify;
> +}
> +
>  static void vdpasim_free(struct vdpa_device *vdpa)
>  {
>         struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
>         int i;
>
> -       cancel_work_sync(&vdpasim->work);
> +       cancel_delayed_work_sync(&vdpasim->vring_work);
>
>         for (i = 0; i < vdpasim->dev_attr.nvqs; i++) {
>                 vringh_kiov_cleanup(&vdpasim->vqs[i].out_iov);
> @@ -693,7 +740,23 @@ static void vdpasim_free(struct vdpa_device *vdpa)
>         vhost_iotlb_free(vdpasim->iommu);
>         kfree(vdpasim->vqs);
>         kfree(vdpasim->config);
> +       if (vdpasim->notify) {
> +#ifdef CONFIG_X86
> +               set_memory_wb(vdpasim->notify, 1);
> +#endif
> +               free_page(vdpasim->notify);
> +       }
> +}
> +
> +void vdpasim_schedule_work(struct vdpasim *vdpasim, bool sched_now)
> +{
> +       if (sched_now)
> +               schedule_work(&vdpasim->vring_work.work);
> +       else if (notify_passthrough)
> +               schedule_delayed_work(&vdpasim->vring_work,
> +                                     msecs_to_jiffies(VDPASIM_VRING_POLL_PERIOD));
>  }
> +EXPORT_SYMBOL_GPL(vdpasim_schedule_work);
>
>  static const struct vdpa_config_ops vdpasim_config_ops = {
>         .set_vq_address         = vdpasim_set_vq_address,
> @@ -704,6 +767,7 @@ static const struct vdpa_config_ops vdpasim_config_ops = {
>         .get_vq_ready           = vdpasim_get_vq_ready,
>         .set_vq_state           = vdpasim_set_vq_state,
>         .get_vq_state           = vdpasim_get_vq_state,
> +       .get_vq_notification    = vdpasim_get_vq_notification,
>         .get_vq_align           = vdpasim_get_vq_align,
>         .get_vq_group           = vdpasim_get_vq_group,
>         .get_device_features    = vdpasim_get_device_features,
> @@ -737,6 +801,7 @@ static const struct vdpa_config_ops vdpasim_batch_config_ops = {
>         .get_vq_ready           = vdpasim_get_vq_ready,
>         .set_vq_state           = vdpasim_set_vq_state,
>         .get_vq_state           = vdpasim_get_vq_state,
> +       .get_vq_notification    = vdpasim_get_vq_notification,
>         .get_vq_align           = vdpasim_get_vq_align,
>         .get_vq_group           = vdpasim_get_vq_group,
>         .get_device_features    = vdpasim_get_device_features,
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.h b/drivers/vdpa/vdpa_sim/vdpa_sim.h
> index 0e78737dcc16..da0866834918 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim.h
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim.h
> @@ -53,7 +53,7 @@ struct vdpasim_dev_attr {
>  struct vdpasim {
>         struct vdpa_device vdpa;
>         struct vdpasim_virtqueue *vqs;
> -       struct work_struct work;
> +       struct delayed_work vring_work;
>         struct vdpasim_dev_attr dev_attr;
>         /* spinlock to synchronize virtqueue state */
>         spinlock_t lock;
> @@ -69,10 +69,13 @@ struct vdpasim {
>         bool running;
>         /* spinlock to synchronize iommu table */
>         spinlock_t iommu_lock;
> +       /* dummy notify page */
> +       unsigned long notify;
>  };
>
>  struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *attr,
>                                const struct vdpa_dev_set_config *config);
> +void vdpasim_schedule_work(struct vdpasim *vdpasim, bool sched_now);
>
>  /* TODO: cross-endian support */
>  static inline bool vdpasim_is_little_endian(struct vdpasim *vdpasim)
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
> index c6db1a1baf76..8a640ea82284 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
> @@ -288,7 +288,7 @@ static bool vdpasim_blk_handle_req(struct vdpasim *vdpasim,
>
>  static void vdpasim_blk_work(struct work_struct *work)
>  {
> -       struct vdpasim *vdpasim = container_of(work, struct vdpasim, work);
> +       struct vdpasim *vdpasim = container_of(work, struct vdpasim, vring_work.work);
>         bool reschedule = false;
>         int i;
>
> @@ -325,8 +325,7 @@ static void vdpasim_blk_work(struct work_struct *work)
>  out:
>         spin_unlock(&vdpasim->lock);
>
> -       if (reschedule)
> -               schedule_work(&vdpasim->work);
> +       vdpasim_schedule_work(vdpasim, reschedule);
>  }
>
>  static void vdpasim_blk_get_config(struct vdpasim *vdpasim, void *config)
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> index c3cb225ea469..8b998952384b 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> @@ -145,7 +145,7 @@ static void vdpasim_handle_cvq(struct vdpasim *vdpasim)
>
>  static void vdpasim_net_work(struct work_struct *work)
>  {
> -       struct vdpasim *vdpasim = container_of(work, struct vdpasim, work);
> +       struct vdpasim *vdpasim = container_of(work, struct vdpasim, vring_work.work);
>         struct vdpasim_virtqueue *txq = &vdpasim->vqs[1];
>         struct vdpasim_virtqueue *rxq = &vdpasim->vqs[0];
>         ssize_t read, write;
> @@ -196,7 +196,7 @@ static void vdpasim_net_work(struct work_struct *work)
>                 vdpasim_net_complete(rxq, write);
>
>                 if (++pkts > 4) {
> -                       schedule_work(&vdpasim->work);
> +                       vdpasim_schedule_work(vdpasim, true);
>                         goto out;
>                 }
>         }
> --
> 2.23.0
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
