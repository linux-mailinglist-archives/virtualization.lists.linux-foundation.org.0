Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B211E8713
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 20:59:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FC1D89418;
	Fri, 29 May 2020 18:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8t+QMohPtqj; Fri, 29 May 2020 18:59:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B6A589415;
	Fri, 29 May 2020 18:59:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72C07C016F;
	Fri, 29 May 2020 18:59:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8FA1C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 18:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A752E89415
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 18:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DO6OGKsS1tqX
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 18:59:31 +0000 (UTC)
X-Greylist: delayed 00:23:01 by SQLgrey-1.7.6
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A6D8689413
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 18:59:31 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id r23so1629394ybd.10
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 11:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pYV+SbM4gLYOmbxLKblPfhx31cVN95hUVZm6XRtv30w=;
 b=dV4dCHV94SNIGmVoomvviIl/wkGqW5TwMWhVK8YD9WpzFCPxTyHRq3ULLr3bBewCkg
 HYrcAXwhSaCC8+kcLGhTRmDQvGGKQ46kAtWNJMKFpGES5mjkITh38szRuGUfYFSqkdGU
 4vIdN/07O8XtmcXZCvuIT5RFWOU48OYjaDP44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pYV+SbM4gLYOmbxLKblPfhx31cVN95hUVZm6XRtv30w=;
 b=quDeayWw6ur1wteQujoYC1uyW2jA6LEfU9ugzkBNsG3v8inM4SnKVssySapoiVmfNQ
 vG5ruXMCI6ilLyDNse1I+xJkEqoGrs1b0NJwmMs9QiTDrAHQdtsQ4gtKH8TLwEptbmv6
 2WOpG4Fo2+1Z+xLdabRJIwz8vNRqn0ce2PGc5FdsfQCU29x4KZ9X8u0C3pEVAlAGfNWL
 69kHMW7LJEeB/8qKa3JMuZ5oVtzK4iGPWi+D0GH4mPW/GPpCscdo0SYxp5ucNYHBmagY
 gF7bkRzhUIoOo4NdzF0j5cXln3Wcfp6Np3BdxSmhLJ3DU9PPyBsEq8sCm+vQ9Nmuclei
 ICwA==
X-Gm-Message-State: AOAM530m4zaOa7Vbnp7ssBckaq09jDqHyc7vP3R9nPOcpq2tTaa4r/eO
 MHjEuszPuYR5BTeZeIZYq/8ZowUEBrFGIs2zYzIXWB2Dwos=
X-Google-Smtp-Source: ABdhPJxoJ4gJfuGYcLPPRTB9NanSEzQY1nJAEQ84o2EScgKu3++oBS0Jvtywk4XxMBPDWMLQKXSV5aI5gCioKK13Ck0=
X-Received: by 2002:ab0:7301:: with SMTP id v1mr2461988uao.101.1590777047150; 
 Fri, 29 May 2020 11:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-5-jasowang@redhat.com>
In-Reply-To: <20200529080303.15449-5-jasowang@redhat.com>
Date: Fri, 29 May 2020 14:30:19 -0400
Message-ID: <CAJPjb1JGn-+Y2EHvn1S+=uX_cjPVEUmGGo7CmAM2kTqyn4NRYQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] vhost_vdpa: support doorbell mapping via mmap
To: Jason Wang <jasowang@redhat.com>,
 Virtio-Dev <virtio-dev@lists.oasis-open.org>
Cc: Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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
From: Rob Miller via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Rob Miller <rob.miller@broadcom.com>
Content-Type: multipart/mixed; boundary="===============3658222441707900249=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3658222441707900249==
Content-Type: multipart/alternative; boundary="000000000000d094a005a6cda45c"

--000000000000d094a005a6cda45c
Content-Type: text/plain; charset="UTF-8"

Given the need for 4K doorbell such that QEMU can easily map, ect, and
assuming that I have a HW device which exposes 2 VQ's, with a notification
area off of BAR3, offset=whatever, notifier_multiplier=4, we don't need to
have 2 x 4K pages mapped into the VM for both doorbells do we? The guest
driver would ring DB0 at BAR4+offset, and DB1 at BAR4+offset+(4*1).

The 4K per DB is useful how? This allows for QEMU trapping of individual
DBs, that can then be used to do what, just forward the DBs via some other
scheme - this makes sense for non-HW related Virtio devices I guess. Is
this why there is a qemu option?

Rob Miller
rob.miller@broadcom.com
(919)721-3339


On Fri, May 29, 2020 at 4:03 AM Jason Wang <jasowang@redhat.com> wrote:

> Currently the doorbell is relayed via eventfd which may have
> significant overhead because of the cost of vmexits or syscall. This
> patch introduces mmap() based doorbell mapping which can eliminate the
> overhead caused by vmexit or syscall.
>
> To ease the userspace modeling of the doorbell layout (usually
> virtio-pci), this patch starts from a doorbell per page
> model. Vhost-vdpa only support the hardware doorbell that sit at the
> boundary of a page and does not share the page with other registers.
>
> Doorbell of each virtqueue must be mapped separately, pgoff is the
> index of the virtqueue. This allows userspace to map a subset of the
> doorbell which may be useful for the implementation of software
> assisted virtqueue (control vq) in the future.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vhost/vdpa.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 6ff72289f488..bbe23cea139a 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/cdev.h>
>  #include <linux/device.h>
> +#include <linux/mm.h>
>  #include <linux/iommu.h>
>  #include <linux/uuid.h>
>  #include <linux/vdpa.h>
> @@ -741,12 +742,70 @@ static int vhost_vdpa_release(struct inode *inode,
> struct file *filep)
>         return 0;
>  }
>
> +static vm_fault_t vhost_vdpa_fault(struct vm_fault *vmf)
> +{
> +       struct vhost_vdpa *v = vmf->vma->vm_file->private_data;
> +       struct vdpa_device *vdpa = v->vdpa;
> +       const struct vdpa_config_ops *ops = vdpa->config;
> +       struct vdpa_notification_area notify;
> +       struct vm_area_struct *vma = vmf->vma;
> +       u16 index = vma->vm_pgoff;
> +
> +       notify = ops->get_vq_notification(vdpa, index);
> +
> +       vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +       if (remap_pfn_range(vma, vmf->address & PAGE_MASK,
> +                           notify.addr >> PAGE_SHIFT, PAGE_SIZE,
> +                           vma->vm_page_prot))
> +               return VM_FAULT_SIGBUS;
> +
> +       return VM_FAULT_NOPAGE;
> +}
> +
> +static const struct vm_operations_struct vhost_vdpa_vm_ops = {
> +       .fault = vhost_vdpa_fault,
> +};
> +
> +static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +       struct vhost_vdpa *v = vma->vm_file->private_data;
> +       struct vdpa_device *vdpa = v->vdpa;
> +       const struct vdpa_config_ops *ops = vdpa->config;
> +       struct vdpa_notification_area notify;
> +       int index = vma->vm_pgoff;
> +
> +       if (vma->vm_end - vma->vm_start != PAGE_SIZE)
> +               return -EINVAL;
> +       if ((vma->vm_flags & VM_SHARED) == 0)
> +               return -EINVAL;
> +       if (vma->vm_flags & VM_READ)
> +               return -EINVAL;
> +       if (index > 65535)
> +               return -EINVAL;
> +       if (!ops->get_vq_notification)
> +               return -ENOTSUPP;
> +
> +       /* To be safe and easily modelled by userspace, We only
> +        * support the doorbell which sits on the page boundary and
> +        * does not share the page with other registers.
> +        */
> +       notify = ops->get_vq_notification(vdpa, index);
> +       if (notify.addr & (PAGE_SIZE - 1))
> +               return -EINVAL;
> +       if (vma->vm_end - vma->vm_start != notify.size)
> +               return -ENOTSUPP;
> +
> +       vma->vm_ops = &vhost_vdpa_vm_ops;
> +       return 0;
> +}
> +
>  static const struct file_operations vhost_vdpa_fops = {
>         .owner          = THIS_MODULE,
>         .open           = vhost_vdpa_open,
>         .release        = vhost_vdpa_release,
>         .write_iter     = vhost_vdpa_chr_write_iter,
>         .unlocked_ioctl = vhost_vdpa_unlocked_ioctl,
> +       .mmap           = vhost_vdpa_mmap,
>         .compat_ioctl   = compat_ptr_ioctl,
>  };
>
> --
> 2.20.1
>
>

--000000000000d094a005a6cda45c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Given the need for 4K doorbell such that QEMU can easily m=
ap, ect, and assuming that I have a HW device which exposes 2 VQ&#39;s, wit=
h a notification area off of BAR3, offset=3Dwhatever, notifier_multiplier=
=3D4, we don&#39;t need to have 2 x 4K pages mapped into the VM for both do=
orbells do we? The guest driver would ring DB0 at BAR4+offset, and DB1 at B=
AR4+offset+(4*1).<div><br></div><div>The 4K per DB is useful=C2=A0how? This=
 allows for QEMU trapping of individual DBs, that can then be used to do wh=
at, just forward the DBs via some other scheme - this makes sense for non-H=
W related Virtio devices I guess. Is this why there is a qemu option?</div>=
<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr">Rob Miller<div><a href=3D"m=
ailto:rob.miller@broadcom.com" target=3D"_blank">rob.miller@broadcom.com</a=
></div><div>(919)721-3339</div></div></div></div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 29, =
2020 at 4:03 AM Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasow=
ang@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Currently the doorbell is relayed via eventfd which may have<=
br>
significant overhead because of the cost of vmexits or syscall. This<br>
patch introduces mmap() based doorbell mapping which can eliminate the<br>
overhead caused by vmexit or syscall.<br>
<br>
To ease the userspace modeling of the doorbell layout (usually<br>
virtio-pci), this patch starts from a doorbell per page<br>
model. Vhost-vdpa only support the hardware doorbell that sit at the<br>
boundary of a page and does not share the page with other registers.<br>
<br>
Doorbell of each virtqueue must be mapped separately, pgoff is the<br>
index of the virtqueue. This allows userspace to map a subset of the<br>
doorbell which may be useful for the implementation of software<br>
assisted virtqueue (control vq) in the future.<br>
<br>
Signed-off-by: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=
=3D"_blank">jasowang@redhat.com</a>&gt;<br>
---<br>
=C2=A0drivers/vhost/vdpa.c | 59 +++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 59 insertions(+)<br>
<br>
diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c<br>
index 6ff72289f488..bbe23cea139a 100644<br>
--- a/drivers/vhost/vdpa.c<br>
+++ b/drivers/vhost/vdpa.c<br>
@@ -15,6 +15,7 @@<br>
=C2=A0#include &lt;linux/module.h&gt;<br>
=C2=A0#include &lt;linux/cdev.h&gt;<br>
=C2=A0#include &lt;linux/device.h&gt;<br>
+#include &lt;linux/mm.h&gt;<br>
=C2=A0#include &lt;linux/iommu.h&gt;<br>
=C2=A0#include &lt;linux/uuid.h&gt;<br>
=C2=A0#include &lt;linux/vdpa.h&gt;<br>
@@ -741,12 +742,70 @@ static int vhost_vdpa_release(struct inode *inode, st=
ruct file *filep)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
+static vm_fault_t vhost_vdpa_fault(struct vm_fault *vmf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vhost_vdpa *v =3D vmf-&gt;vma-&gt;vm_fil=
e-&gt;private_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vdpa_device *vdpa =3D v-&gt;vdpa;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct vdpa_config_ops *ops =3D vdpa-&gt;=
config;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vdpa_notification_area notify;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vm_area_struct *vma =3D vmf-&gt;vma;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 index =3D vma-&gt;vm_pgoff;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0notify =3D ops-&gt;get_vq_notification(vdpa, in=
dex);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vma-&gt;vm_page_prot =3D pgprot_noncached(vma-&=
gt;vm_page_prot);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (remap_pfn_range(vma, vmf-&gt;address &amp; =
PAGE_MASK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0notify.addr &gt;&gt; PAGE_SHIFT, PAGE_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0vma-&gt;vm_page_prot))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return VM_FAULT_SIG=
BUS;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return VM_FAULT_NOPAGE;<br>
+}<br>
+<br>
+static const struct vm_operations_struct vhost_vdpa_vm_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.fault =3D vhost_vdpa_fault,<br>
+};<br>
+<br>
+static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)<=
br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vhost_vdpa *v =3D vma-&gt;vm_file-&gt;pr=
ivate_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vdpa_device *vdpa =3D v-&gt;vdpa;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct vdpa_config_ops *ops =3D vdpa-&gt;=
config;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vdpa_notification_area notify;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int index =3D vma-&gt;vm_pgoff;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vma-&gt;vm_end - vma-&gt;vm_start !=3D PAGE=
_SIZE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((vma-&gt;vm_flags &amp; VM_SHARED) =3D=3D 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vma-&gt;vm_flags &amp; VM_READ)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (index &gt; 65535)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ops-&gt;get_vq_notification)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUPP;<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* To be safe and easily modelled by userspace,=
 We only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * support the doorbell which sits on the page =
boundary and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * does not share the page with other registers=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0notify =3D ops-&gt;get_vq_notification(vdpa, in=
dex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (notify.addr &amp; (PAGE_SIZE - 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vma-&gt;vm_end - vma-&gt;vm_start !=3D noti=
fy.size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUPP;<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vma-&gt;vm_ops =3D &amp;vhost_vdpa_vm_ops;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static const struct file_operations vhost_vdpa_fops =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TH=
IS_MODULE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D vhost_vdpa_open,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D vhost_v=
dpa_release,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .write_iter=C2=A0 =C2=A0 =C2=A0=3D vhost_vdpa_c=
hr_write_iter,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unlocked_ioctl =3D vhost_vdpa_unlocked_ioctl,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D vhost_vdpa_mmap,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .compat_ioctl=C2=A0 =C2=A0=3D compat_ptr_ioctl,=
<br>
=C2=A0};<br>
<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--000000000000d094a005a6cda45c--

--===============3658222441707900249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3658222441707900249==--
