Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BDB57B37B
	for <lists.virtualization@lfdr.de>; Wed, 20 Jul 2022 11:08:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F011540B86;
	Wed, 20 Jul 2022 09:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F011540B86
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CbtFgKlX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqZBDiCRxdHe; Wed, 20 Jul 2022 09:08:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5172A400AB;
	Wed, 20 Jul 2022 09:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5172A400AB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E207C007D;
	Wed, 20 Jul 2022 09:08:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84BECC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jul 2022 09:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DD7161079
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jul 2022 09:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD7161079
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CbtFgKlX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtGEAZIrEoFB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jul 2022 09:08:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F19E60C01
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F19E60C01
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jul 2022 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658308121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7oILNlTSBMlh/gH2dKDrMjz2QtOfJWLTXJW3TwWpCbw=;
 b=CbtFgKlXd2f9KkmkL77rWpb03pMgCi6kSP4r9R0sBQWLyUouLEL6zN+kcdZXt29Nm1kCqu
 4+gi03xnP1W1DA5zfZpbXuuBgB2p6HbPLxxoHNUPOFNXjQyeu4PTAV+z/3NjtbYIY7XbgD
 KOkuf7+I0esC0iAp1S0P7PX1TL1rC3k=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-ELxKlJW2MK6VMgyT_pVe6w-1; Wed, 20 Jul 2022 05:08:40 -0400
X-MC-Unique: ELxKlJW2MK6VMgyT_pVe6w-1
Received: by mail-lj1-f200.google.com with SMTP id
 o11-20020a2e9b4b000000b0025d9ee85cd5so2735815ljj.20
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jul 2022 02:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7oILNlTSBMlh/gH2dKDrMjz2QtOfJWLTXJW3TwWpCbw=;
 b=l73evg6TzViebM+yCb0/cTfpjKAfGbJLiHHktJEODJmvrhGwWm6WyHDNr2LF8eHSiD
 e71G0LbbeKxmWXpkJpajEoPUt+zEtGCLkEoypDic+rB+0Du5wDXzzxtxrdgC7f+g/AOo
 ExeKlUbDaqlEcSdVwhEWLBXfJolpmZPeO36QyozTBUpuvVIx7FYu9IT5Mq0spRIsUXF5
 WHn6qWed0Jrd99AE41T35ONi/Y4vM/CemTqa2eh6yniyOwZ5/SlZ0qbuQGH+u8THlkz6
 nhorNhVHbPX/z193OdHhS2qHj6YRLQSby8I/31GHWZOPqeIFYrGcFlz0u2QHuJ2hV17S
 hjDA==
X-Gm-Message-State: AJIora9Hly9skw7wK8jbznAq4+m+lEELUZG+50oNAqTmpwoFTipeAW0c
 tRIAHnWoAAgmQ8QX6zs3UmeNRirYw+/va6XdmQcrK52QNIUgh5ozsEPbErHJBOoXCZIjU6jRpFG
 9cT9SxqNAH45SYdwaYI9pH09/pJEIdmk6c5Z/8COM3xjAJzVtGZgrT8n13A==
X-Received: by 2002:a05:6512:313a:b0:489:caea:7e27 with SMTP id
 p26-20020a056512313a00b00489caea7e27mr20155952lfd.397.1658308117700; 
 Wed, 20 Jul 2022 02:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uP3MgRzr0/5nsB7PzeZw8pmmLpL+0+4spvO27QV/6r7awqw7CmPbBMPu0/5OuF28xrhOC8dh3GqGc9SvWIDHs=
X-Received: by 2002:a05:6512:313a:b0:489:caea:7e27 with SMTP id
 p26-20020a056512313a00b00489caea7e27mr20155939lfd.397.1658308117377; Wed, 20
 Jul 2022 02:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220720044144.90-1-xieyongji@bytedance.com>
 <20220720044144.90-5-xieyongji@bytedance.com>
In-Reply-To: <20220720044144.90-5-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Jul 2022 17:08:26 +0800
Message-ID: <CACGkMEvTw966i2cB4u9_-SfrWG2yj7VqTXHak8YmOqpjcGfSDw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] vduse: Support registering userspace memory for
 IOVA regions
To: Xie Yongji <xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mst <mst@redhat.com>, Liu Xiaodong <xiaodong.liu@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, songmuchun@bytedance.com
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

On Wed, Jul 20, 2022 at 12:42 PM Xie Yongji <xieyongji@bytedance.com> wrote:
>
> Introduce two ioctls: VDUSE_IOTLB_REG_UMEM and
> VDUSE_IOTLB_DEREG_UMEM to support registering
> and de-registering userspace memory for IOVA
> regions.
>
> Now it only supports registering userspace memory
> for bounce buffer region in virtio-vdpa case.
>
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  drivers/vdpa/vdpa_user/vduse_dev.c | 141 +++++++++++++++++++++++++++++
>  include/uapi/linux/vduse.h         |  23 +++++
>  2 files changed, 164 insertions(+)
>
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index 3bc27de58f46..eedff0a3885a 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -21,6 +21,8 @@
>  #include <linux/uio.h>
>  #include <linux/vdpa.h>
>  #include <linux/nospec.h>
> +#include <linux/vmalloc.h>
> +#include <linux/sched/mm.h>
>  #include <uapi/linux/vduse.h>
>  #include <uapi/linux/vdpa.h>
>  #include <uapi/linux/virtio_config.h>
> @@ -64,6 +66,13 @@ struct vduse_vdpa {
>         struct vduse_dev *dev;
>  };
>
> +struct vduse_umem {
> +       unsigned long iova;
> +       unsigned long npages;
> +       struct page **pages;
> +       struct mm_struct *mm;
> +};
> +
>  struct vduse_dev {
>         struct vduse_vdpa *vdev;
>         struct device *dev;
> @@ -95,6 +104,8 @@ struct vduse_dev {
>         u8 status;
>         u32 vq_num;
>         u32 vq_align;
> +       struct vduse_umem *umem;
> +       struct mutex mem_lock;
>  };
>
>  struct vduse_dev_msg {
> @@ -917,6 +928,102 @@ static int vduse_dev_queue_irq_work(struct vduse_dev *dev,
>         return ret;
>  }
>
> +static int vduse_dev_dereg_umem(struct vduse_dev *dev,
> +                               u64 iova, u64 size)
> +{
> +       int ret;
> +
> +       mutex_lock(&dev->mem_lock);
> +       ret = -ENOENT;
> +       if (!dev->umem)
> +               goto unlock;
> +
> +       ret = -EINVAL;
> +       if (dev->umem->iova != iova || size != dev->domain->bounce_size)
> +               goto unlock;
> +
> +       vduse_domain_remove_user_bounce_pages(dev->domain);
> +       unpin_user_pages_dirty_lock(dev->umem->pages,
> +                                   dev->umem->npages, true);
> +       atomic64_sub(dev->umem->npages, &dev->umem->mm->pinned_vm);
> +       mmdrop(dev->umem->mm);
> +       vfree(dev->umem->pages);
> +       kfree(dev->umem);
> +       dev->umem = NULL;
> +       ret = 0;
> +unlock:
> +       mutex_unlock(&dev->mem_lock);
> +       return ret;
> +}
> +
> +static int vduse_dev_reg_umem(struct vduse_dev *dev,
> +                             u64 iova, u64 uaddr, u64 size)
> +{
> +       struct page **page_list = NULL;
> +       struct vduse_umem *umem = NULL;
> +       long pinned = 0;
> +       unsigned long npages, lock_limit;
> +       int ret;
> +
> +       if (!dev->domain->bounce_map ||
> +           size != dev->domain->bounce_size ||
> +           iova != 0 || uaddr & ~PAGE_MASK)
> +               return -EINVAL;
> +
> +       mutex_lock(&dev->mem_lock);
> +       ret = -EEXIST;
> +       if (dev->umem)
> +               goto unlock;
> +
> +       ret = -ENOMEM;
> +       npages = size >> PAGE_SHIFT;
> +       page_list = __vmalloc(array_size(npages, sizeof(struct page *)),
> +                             GFP_KERNEL_ACCOUNT);
> +       umem = kzalloc(sizeof(*umem), GFP_KERNEL);
> +       if (!page_list || !umem)
> +               goto unlock;
> +
> +       mmap_read_lock(current->mm);
> +
> +       lock_limit = PFN_DOWN(rlimit(RLIMIT_MEMLOCK));
> +       if (npages + atomic64_read(&current->mm->pinned_vm) > lock_limit)
> +               goto out;
> +
> +       pinned = pin_user_pages(uaddr, npages, FOLL_LONGTERM | FOLL_WRITE,
> +                               page_list, NULL);
> +       if (pinned != npages) {
> +               ret = pinned < 0 ? pinned : -ENOMEM;
> +               goto out;
> +       }
> +
> +       ret = vduse_domain_add_user_bounce_pages(dev->domain,
> +                                                page_list, pinned);
> +       if (ret)
> +               goto out;
> +
> +       atomic64_add(npages, &current->mm->pinned_vm);
> +
> +       umem->pages = page_list;
> +       umem->npages = pinned;
> +       umem->iova = iova;
> +       umem->mm = current->mm;
> +       mmgrab(current->mm);
> +
> +       dev->umem = umem;
> +out:
> +       if (ret && pinned > 0)
> +               unpin_user_pages(page_list, pinned);
> +
> +       mmap_read_unlock(current->mm);
> +unlock:
> +       if (ret) {
> +               vfree(page_list);
> +               kfree(umem);
> +       }
> +       mutex_unlock(&dev->mem_lock);
> +       return ret;
> +}
> +
>  static long vduse_dev_ioctl(struct file *file, unsigned int cmd,
>                             unsigned long arg)
>  {
> @@ -1089,6 +1196,38 @@ static long vduse_dev_ioctl(struct file *file, unsigned int cmd,
>                 ret = vduse_dev_queue_irq_work(dev, &dev->vqs[index].inject);
>                 break;
>         }
> +       case VDUSE_IOTLB_REG_UMEM: {
> +               struct vduse_iova_umem umem;
> +
> +               ret = -EFAULT;
> +               if (copy_from_user(&umem, argp, sizeof(umem)))
> +                       break;
> +
> +               ret = -EINVAL;
> +               if (!is_mem_zero((const char *)umem.reserved,
> +                                sizeof(umem.reserved)))
> +                       break;
> +
> +               ret = vduse_dev_reg_umem(dev, umem.iova,
> +                                        umem.uaddr, umem.size);
> +               break;
> +       }
> +       case VDUSE_IOTLB_DEREG_UMEM: {
> +               struct vduse_iova_umem umem;
> +
> +               ret = -EFAULT;
> +               if (copy_from_user(&umem, argp, sizeof(umem)))
> +                       break;
> +
> +               ret = -EINVAL;
> +               if (!is_mem_zero((const char *)umem.reserved,
> +                                sizeof(umem.reserved)))
> +                       break;
> +
> +               ret = vduse_dev_dereg_umem(dev, umem.iova,
> +                                          umem.size);
> +               break;
> +       }
>         default:
>                 ret = -ENOIOCTLCMD;
>                 break;
> @@ -1101,6 +1240,7 @@ static int vduse_dev_release(struct inode *inode, struct file *file)
>  {
>         struct vduse_dev *dev = file->private_data;
>
> +       vduse_dev_dereg_umem(dev, 0, dev->domain->bounce_size);
>         spin_lock(&dev->msg_lock);
>         /* Make sure the inflight messages can processed after reconncection */
>         list_splice_init(&dev->recv_list, &dev->send_list);
> @@ -1163,6 +1303,7 @@ static struct vduse_dev *vduse_dev_create(void)
>                 return NULL;
>
>         mutex_init(&dev->lock);
> +       mutex_init(&dev->mem_lock);
>         spin_lock_init(&dev->msg_lock);
>         INIT_LIST_HEAD(&dev->send_list);
>         INIT_LIST_HEAD(&dev->recv_list);
> diff --git a/include/uapi/linux/vduse.h b/include/uapi/linux/vduse.h
> index 7cfe1c1280c0..9885e0571f09 100644
> --- a/include/uapi/linux/vduse.h
> +++ b/include/uapi/linux/vduse.h
> @@ -210,6 +210,29 @@ struct vduse_vq_eventfd {
>   */
>  #define VDUSE_VQ_INJECT_IRQ    _IOW(VDUSE_BASE, 0x17, __u32)
>
> +/**
> + * struct vduse_iova_umem - userspace memory configuration for one IOVA region
> + * @uaddr: start address of userspace memory, it must be aligned to page size
> + * @iova: start of the IOVA region
> + * @size: size of the IOVA region
> + * @reserved: for future use, needs to be initialized to zero
> + *
> + * Structure used by VDUSE_IOTLB_REG_UMEM and VDUSE_IOTLB_DEREG_UMEM
> + * ioctls to register/de-register userspace memory for IOVA regions
> + */
> +struct vduse_iova_umem {
> +       __u64 uaddr;
> +       __u64 iova;
> +       __u64 size;
> +       __u64 reserved[3];
> +};
> +
> +/* Register userspace memory for IOVA regions */
> +#define VDUSE_IOTLB_REG_UMEM   _IOW(VDUSE_BASE, 0x18, struct vduse_iova_umem)
> +
> +/* De-register the userspace memory. Caller should set iova and size field. */
> +#define VDUSE_IOTLB_DEREG_UMEM _IOW(VDUSE_BASE, 0x19, struct vduse_iova_umem)
> +
>  /* The control messages definition for read(2)/write(2) on /dev/vduse/$NAME */
>
>  /**
> --
> 2.20.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
