Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E65323B83
	for <lists.virtualization@lfdr.de>; Wed, 24 Feb 2021 12:51:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C2D983CA3;
	Wed, 24 Feb 2021 11:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YoI1y6KxMu9d; Wed, 24 Feb 2021 11:51:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 163B683D02;
	Wed, 24 Feb 2021 11:51:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 917EFC0001;
	Wed, 24 Feb 2021 11:51:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D8A6C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 11:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F32D2606D0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 11:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqluXIall4hJ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 11:51:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 196AC60652
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 11:51:34 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id w69so2135823oif.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 03:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZiiPAiNWabnGZ16IUqe0LAkZFWBHxVvDkME6XuwnKs4=;
 b=VQjkMyXAeXK1kLQAd2DKfRdtZuytwp5tW9fxjcizyTQ6pPKAD1rJLnJi03eYHYfn93
 c85YV7E+idjaaVHtNeDntP307fqFlk32nMr57Nk4t7QgqUpsPOzwSmFCwBpLkAjWf6Dk
 e/DsahOQ0FPp1O78hS702nZEzpSjw2TR3LI3Ixx6EkIpw4C26WuHjBjX5BiCqV6vaY9t
 AZke8L3CiHpOqc3AlMN6hy1oSXJpdpGtOjZ7cbRN279slxyNQXzFHoovVTVbg9nfqucT
 L34wRE4ac0vFw/XXN9Efem190TYr645Rmm/gsYyWs5S4DRCozcoqkJWpFoi62QiUPzLV
 Tchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZiiPAiNWabnGZ16IUqe0LAkZFWBHxVvDkME6XuwnKs4=;
 b=F3lu9I96zX4ygL89Y6I4gRG2lVlaKbCx1Ji/gk7LWaeR3siHySBtBA9rDSlbMs4CyD
 AtVDroYUs200dlKsBCBWvSwYliFCTxKbV9nP3m0jIwKm7GT30sMq/LBgGcW7DEujtVWy
 fAnpQMj9Z5WBJpYFlUA8EgfVTXwlx4uOXmWcJF33848ppnLfGmOyH5W53PU6gdPsZ/4K
 wGh/D23biRujvIFifsdTZ43tTDUBC01vuinNRTI89FFyISy3aEHVxzmccwW8fVEjx6VS
 kxG1D2ktuDMgYwZdnqS68wWD+mLaSzt2Z6PNdLjjhP+wlp+NlPvM35uqbbdUUzczW2fr
 Xinw==
X-Gm-Message-State: AOAM530hJwgB13kFuJfrkUrxOczqi5sRBnhhMg77gWTl2Q2xL7cH8jbV
 IR2+pNShE5s42286hec4F56FRufE6LF7mEoQF38=
X-Google-Smtp-Source: ABdhPJzeL/NDvDL2TTwRHmD42PVoLy1R2M81A2y7J06nz+EZM6eugB7fYn+YTvScnW3W8BtcrZrin2bM4Kxy1gCla2c=
X-Received: by 2002:aca:aa96:: with SMTP id t144mr2463727oie.131.1614167493076; 
 Wed, 24 Feb 2021 03:51:33 -0800 (PST)
MIME-Version: 1.0
References: <CAJ-rMYrst2Xrg5a6dDTufMacqjy_Ccg2FM8XpAt4p2J9Yk_u7g@mail.gmail.com>
 <20210223074934-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210223074934-mutt-send-email-mst@kernel.org>
From: Gautam Dawar <gdawar.xilinx@gmail.com>
Date: Wed, 24 Feb 2021 17:21:21 +0530
Message-ID: <CAJ-rMYrQ1Zv5hcLzRtzGFKKCtPKZyvENRkFRTo88c4w4tpagOg@mail.gmail.com>
Subject: Re: [PATCH v3] vhost_vdpa: fix the missing
 irq_bypass_unregister_producer() invocation
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: martinh@xilinx.com, hanand@xilinx.com, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org
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

Hi Michael,

I've submitted a fresh patch including the ack from Jason and after
testing with git am.

Regards,
Gautam

On Tue, 23 Feb 2021 at 18:20, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Feb 23, 2021 at 06:15:07PM +0530, Gautam Dawar wrote:
> > When qemu with vhost-vdpa netdevice is run for the first time, it works well.
> > But after the VM is powered off, the next qemu run causes kernel panic due to a
> > NULL pointer dereference in irq_bypass_register_producer().
> >
> > When the VM is powered off, vhost_vdpa_clean_irq() misses on calling
> > irq_bypass_unregister_producer() for irq 0 because of the existing check.
> >
> > This leaves stale producer nodes, which are reset in vhost_vring_call_reset()
> > when vhost_dev_init() is invoked during the second qemu run.
> >
> > As the node member of struct irq_bypass_producer is also initialized
> > to zero, traversal on the producers list causes crash due to NULL pointer
> > dereference.
> >
> > Fixes: 2cf1ba9a4d15c ("vhost_vdpa: implement IRQ offloading in vhost_vdpa")
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=211711
> > Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
>
>
> A bit better but still:
> Applying: vhost_vdpa: fix the missing irq_bypass_unregister_producer() invocation
> error: corrupt patch at line 6
> error: could not build fake ancestor
> Patch failed at 0001 vhost_vdpa: fix the missing irq_bypass_unregister_producer() invocation
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>
>
> you also want to include acks you got on the previous versions.
>
> > -----
> > changelog:
> > v2->v3:
> >  - Re-submitting the patch in plain text format as suggested by Michael
> >  - Added the fixes tag
> >
> > v1->v2:
> >  - Addressed Jason's comment to remove the irq check and use
> >    vhost_vdpa_unsetup_vq_irq() to avoid local variable vq
> > -----
> >
> >
> > diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> > index 62a9bb0efc55..e00573b87aba 100644
> > --- a/drivers/vhost/vdpa.c
> > +++ b/drivers/vhost/vdpa.c
> > @@ -844,14 +844,10 @@ static int vhost_vdpa_open(struct inode *inode,
> > struct file *filep)
> >
> >  static void vhost_vdpa_clean_irq(struct vhost_vdpa *v)
> >  {
> > -       struct vhost_virtqueue *vq;
> >         int i;
> >
> > -       for (i = 0; i < v->nvqs; i++) {
> > -               vq = &v->vqs[i];
> > -               if (vq->call_ctx.producer.irq)
> > -                       irq_bypass_unregister_producer(&vq->call_ctx.producer);
> > -       }
> > +       for (i = 0; i < v->nvqs; i++)
> > +               vhost_vdpa_unsetup_vq_irq(v, i);
> >  }
> >
> >  static int vhost_vdpa_release(struct inode *inode, struct file *filep)
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
