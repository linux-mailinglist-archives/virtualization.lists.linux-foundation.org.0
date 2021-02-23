Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DCB322AC2
	for <lists.virtualization@lfdr.de>; Tue, 23 Feb 2021 13:47:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5FB88703D;
	Tue, 23 Feb 2021 12:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKmqau3pP3m1; Tue, 23 Feb 2021 12:47:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35AFC8703C;
	Tue, 23 Feb 2021 12:47:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13B2DC0001;
	Tue, 23 Feb 2021 12:47:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEC62C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABBD4839CF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFWGANe4E-aP
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:47:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D2D383187
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:47:07 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id d9so1239488ote.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 04:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sbr9OUmbLA6mNnjWfgltSXXs3s6P6GbYJolGwo6mmkY=;
 b=M/wNughVeIw4N5iUyeWe8DXGeaeu15aXQ/EGCCx2S2PCYlBnrb8+Z5pw6hAAC7C2Ld
 lAS1oggSjpLRT830Hq3IRUezwNYLOumWY6HEFKxIYOArs/oQY1VaWb6FMFPL5p363kN6
 IMb/QldSM/DQYpyut9xgyP5uHXcxIGJpqzTpT/b6ltj6Z4QhsMbwvpDOfX1xMVwWEoYT
 sjisNVWZhZS+tl7Q0eJdYf/dIYzQ4xvxc49Flg0S9xN0LmcHovvkRbJlR+m9Okaw84bB
 QhrKhUJ7ifPVh5YOdM19P91UiOQ8Xss2umS+jdDMnYytkqQbdhnoJDn7ZA1ZWJ5aZA+U
 hunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sbr9OUmbLA6mNnjWfgltSXXs3s6P6GbYJolGwo6mmkY=;
 b=AsqjEY6saIeyPAgB1T7Qp4sa3FWVoVCp8CIv3YymjVVIsanwyQbARKfou4fJTecLnX
 59X0j120cRMCKE++nuWFJX5VSncQ2Rea6fkFk0+YYmq8MXwEsoY9UHifBpvMvQa4RdSM
 sWEos6hctpkaoQP20IadEuvaUFc1dT/51BYnZQ9A/TWm38N7xjZk6ur+saL4kyXgNRzX
 GhMLj1OBcTY84XKWhgjRhHcr0L+1H/AsggS/gGOSHBeBQ0gpntioOYEgkV2obcLFCIdb
 rV5Kqtt+ZAmzz2g+r7LJDXI0pfzssaPVTI6/USPhhTDwajxt7aqOdrkNoVz3rTbVJF6U
 ulZg==
X-Gm-Message-State: AOAM5321uyr9o44LvBfyzGYC7xZ7W5k/KKU7vZG8emPb6bGZ4niwPT1p
 mVLTCa4vGuyg4BF8M2FLQaRBNpJ4hfXY8YZZurw=
X-Google-Smtp-Source: ABdhPJzBJwLXjFFOdeNvxLrWVbmGza7T7a6mcbgBhdVKeAU4jLshU1f/S/276jbPmmvt34HOFX3lu9PtdigpoT9uN9w=
X-Received: by 2002:a9d:6c8d:: with SMTP id c13mr19678338otr.333.1614084426566; 
 Tue, 23 Feb 2021 04:47:06 -0800 (PST)
MIME-Version: 1.0
References: <CAJ-rMYpFFD0vwERMbj_tMLmeFqECr0Q+s4ct_sO0AAt3rgWG0Q@mail.gmail.com>
 <20210223071149-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210223071149-mutt-send-email-mst@kernel.org>
From: Gautam Dawar <gdawar.xilinx@gmail.com>
Date: Tue, 23 Feb 2021 18:16:55 +0530
Message-ID: <CAJ-rMYpmDwKc+0om5dNL7SubM=ng89DfV_qY73FNgsUY3R1nJg@mail.gmail.com>
Subject: Re: [PATCH v2] vhost vdpa: fix the missing
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

On Tue, 23 Feb 2021 at 17:43, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Feb 23, 2021 at 03:30:45PM +0530, Gautam Dawar wrote:
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
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=211711
> > Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
>
> Could you please repost without HTML? Otherwise git am fails on this patch:
>
> error: corrupt patch at line 6
> error: could not build fake ancestor
> Patch failed at 0001 vhost vdpa: fix the missing irq_bypass_unregister_producer() invocation
>
> Also, which commit introduces the bug? A Fixes: tag would be helpful.
>
> Thanks!
>
I've added the fixes tag and submitted patch v3 in plain-text format.
Thanks,
Gautam

> > -----
> > changelog:
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
> > @@ -844,14 +844,10 @@ static int vhost_vdpa_open(struct inode *inode, struct
> > file *filep)
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
