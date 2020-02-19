Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FB616398F
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 02:47:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9A5A88643F;
	Wed, 19 Feb 2020 01:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4uvvtjXDQXid; Wed, 19 Feb 2020 01:47:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0A0B6842B8;
	Wed, 19 Feb 2020 01:47:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D109FC013E;
	Wed, 19 Feb 2020 01:47:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D5F1C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 01:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6BD87860DC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 01:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cc3b4w7cY61Q
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 01:47:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 90D7D84173
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 01:47:09 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c84so4985646wme.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 17:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0fVrJXKQFBq1+DGIaqCpMFpVnwhHK6KBaU4A547suOs=;
 b=YLgqtn1vXiFmrY2qtcO4cITsJLHu/AVbBSZEJXUjgEko2za6mFlRXo65+dWkQXKRgO
 oyBH45ZP6ovZa90w72vhBPA/kdwQ5l4Wb6ww2v4tsfqrpiNr7wJJr6qDkQxGAq6UNzYu
 7/x8FMTWoPNKGNhE4+jxj9C/trMmqmjjwxMJZujH5pncP7uKTDGvYc9sUwjK8KZYa6Nb
 fGR0/n70ccFqpNmW5VzoivbPHUQrUmfIbjH3P/GH2fkkj2J908pE1+IOMjtK0wRvkR64
 3oBrPq0e4MK8O9EwGEEJSyHaZUvoBsFww7Px/X0M//l5pky9UaU1PoheuYo2Bn2CYrML
 ehUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0fVrJXKQFBq1+DGIaqCpMFpVnwhHK6KBaU4A547suOs=;
 b=ncFfmmzr7w1VBeZs90ylTsYAFvsNS2LWm2Az5Hrzk3wmeT5UXDFQYgK5vqht/cMzDW
 LghKidK5xcKxG9icPOCwrWZzre7ArUSctrpq3dKgP1PJRD3B4CvrqT+JAsCNkyg7Lri5
 fqYQ+iOhhPowrQqBEM1ns9SLkngEBemzd/sc3aBsLu189/KeaoL3QgxFfq5SRI+aWSZi
 mqVHGZD6XEb6tyxWlvDU/cCMLAWsWZ03kwuAPq1fnu2JEayPTGI9VzIUM7+0+TQ4vOeA
 oGM2J15+1neYr8fpyzesUimjYlfimiITdaFPOAG1qFO03PXm8lUT1m1RYuIx25IZspxx
 0Hww==
X-Gm-Message-State: APjAAAV5jyhRmcoj71c0zKx7fjMrE3N8h1kyYNNodAjfphKjyspj9qgP
 jPzcZMp+Bciq6zD4TzrLQ1CgnXi/D0cFytkJu4k=
X-Google-Smtp-Source: APXvYqz/18W0f7bNjt6tGI58SVmP1FmnZYrDg6ZokZyrHZqy2s5BaPpIsHcEE+bP4h8WKGWdiuCoYqOW2DZrhZYGBqA=
X-Received: by 2002:a1c:5441:: with SMTP id p1mr6603389wmi.161.1582076827865; 
 Tue, 18 Feb 2020 17:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20200213123728.61216-1-pasic@linux.ibm.com>
 <20200213123728.61216-2-pasic@linux.ibm.com>
 <CACVXFVNiADTW_vLVc1bUSa0CoViLbVzoMnSJW4=sx=MCE-xUPw@mail.gmail.com>
 <20200218133531.3eb08120.pasic@linux.ibm.com>
In-Reply-To: <20200218133531.3eb08120.pasic@linux.ibm.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Wed, 19 Feb 2020 09:46:56 +0800
Message-ID: <CACVXFVPBPCzr+sfQ4HOw1DNPGnEfp+5BLqQkXWQgkaBKqr3yVQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] virtio-blk: fix hw_queue stopped on arbitrary error
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390 <linux-s390@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 linux-block <linux-block@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
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

On Tue, Feb 18, 2020 at 8:35 PM Halil Pasic <pasic@linux.ibm.com> wrote:
>
> On Tue, 18 Feb 2020 10:21:18 +0800
> Ming Lei <tom.leiming@gmail.com> wrote:
>
> > On Thu, Feb 13, 2020 at 8:38 PM Halil Pasic <pasic@linux.ibm.com> wrote:
> > >
> > > Since nobody else is going to restart our hw_queue for us, the
> > > blk_mq_start_stopped_hw_queues() is in virtblk_done() is not sufficient
> > > necessarily sufficient to ensure that the queue will get started again.
> > > In case of global resource outage (-ENOMEM because mapping failure,
> > > because of swiotlb full) our virtqueue may be empty and we can get
> > > stuck with a stopped hw_queue.
> > >
> > > Let us not stop the queue on arbitrary errors, but only on -EONSPC which
> > > indicates a full virtqueue, where the hw_queue is guaranteed to get
> > > started by virtblk_done() before when it makes sense to carry on
> > > submitting requests. Let us also remove a stale comment.
> >
> > The generic solution may be to stop queue only when there is any
> > in-flight request
> > not completed.
> >
>
> I think this is a pretty close to that. The queue is stopped only on
> ENOSPC, which means virtqueue is full.
>
> > Checking -ENOMEM may not be enough, given -EIO can be returned from
> > virtqueue_add()
> > too in case of dma map failure.
>
> I'm not checking on -ENOMEM. So the queue would not be stopped on EIO.
> Maybe I'm misunderstanding something In any case, please have another
> look at the diff, and if your concerns persist please help me understand.

Looks I misread the patch, and this patch is fine:

Reviewed-by: Ming Lei <ming.lei@redhat.com>


Thanks,
Ming Lei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
