Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BB44D60AF4E
	for <lists.virtualization@lfdr.de>; Mon, 24 Oct 2022 17:41:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30FF160C16;
	Mon, 24 Oct 2022 15:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30FF160C16
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SAm9xkfU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chQqE0aOUhKg; Mon, 24 Oct 2022 15:41:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E2B7F60C0E;
	Mon, 24 Oct 2022 15:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B7F60C0E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15C74C007C;
	Mon, 24 Oct 2022 15:41:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70D87C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Oct 2022 15:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5869A40591
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Oct 2022 15:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5869A40591
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=SAm9xkfU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6w7Dg7Lnl0Zm
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Oct 2022 15:41:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4B1D4023F
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4B1D4023F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Oct 2022 15:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666626079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Hq3UaVSrca8KQT+b+jODzI9hrrxpDiMplEibSWBJ8Y=;
 b=SAm9xkfUE2X+osO8skKHTFVJGuBJ5TfkvZPPnPco5R8Ka90bq8onSYVItpHTkal4yENP1Y
 EIZPkWZMeFZQe/gyte9xRP1VV7XSFvPQE987TrDZizTwLRJLgN040JBsADlyGq+9+Okrkn
 3P/FCTDZZT9n1f2FiScOWVy/vz9kmqo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-ywcSqWJDM5CgVcrATHXbBQ-1; Mon, 24 Oct 2022 11:41:16 -0400
X-MC-Unique: ywcSqWJDM5CgVcrATHXbBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F27ED86F123;
 Mon, 24 Oct 2022 15:41:15 +0000 (UTC)
Received: from T590 (ovpn-8-30.pek2.redhat.com [10.72.8.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8B7C40C2064;
 Mon, 24 Oct 2022 15:41:10 +0000 (UTC)
Date: Mon, 24 Oct 2022 23:41:02 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Bug] double ->queue_rq() because of timeout in ->queue_rq()
Message-ID: <Y1ayDrL5Z1JTT5OA@T590>
References: <Y1EQdafQlKNAsutk@T590> <Y1GpB6Gpm7GglwO3@fedora>
 <Y1ICvUwglbxkqE+v@T590> <Y1avnzv01gevnmXz@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1avnzv01gevnmXz@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Cc: Jens Axboe <axboe@kernel.dk>, djeffery@redhat.com,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
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

On Mon, Oct 24, 2022 at 11:30:39AM -0400, Stefan Hajnoczi wrote:
> On Fri, Oct 21, 2022 at 10:23:57AM +0800, Ming Lei wrote:
> > On Thu, Oct 20, 2022 at 04:01:11PM -0400, Stefan Hajnoczi wrote:
> > > On Thu, Oct 20, 2022 at 05:10:13PM +0800, Ming Lei wrote:
> > > > Hi,
> > > > 
> > > > David Jeffery found one double ->queue_rq() issue, so far it can
> > > > be triggered in the following two cases:
> > > > 
> > > > 1) scsi driver in guest kernel
> > > > 
> > > > - the story could be long vmexit latency or long preempt latency of
> > > > vCPU pthread, then IO req is timed out before queuing the request
> > > > to hardware but after calling blk_mq_start_request() during ->queue_rq(),
> > > > then timeout handler handles it by requeue, then double ->queue_rq() is
> > > > caused, and kernel panic
> > > > 
> > > > 2) burst of kernel messages from irq handler 
> > > > 
> > > > For 1), I think it is one reasonable case, given latency from host side
> > > > can come anytime in theory because vCPU is emulated by one normal host
> > > > pthread which can be preempted anywhere. For 2), I guess kernel message is
> > > > supposed to be rate limited.
> > > > 
> > > > Firstly, is this kind of so long(30sec) random latency when running kernel
> > > > code something normal? Or do we need to take care of it? IMO, it looks
> > > > reasonable in case of VM, but our VM experts may have better idea about this
> > > > situation. Also the default 30sec timeout could be reduced via sysfs or
> > > > drivers.
> > > 
> > > 30 seconds is a long latency that does not occur during normal
> > > operation, but unfortunately does happen on occasion.
> > 
> > Thanks for the confirmation!
> > 
> > > 
> > > I think there's an interest in understanding the root cause and solving
> > > long latencies (if possible) in the QEMU/KVM communities. We can
> > > investigate specific cases on kvm@vger.kernel.org and/or
> > > qemu-devel@nongnu.org.
> > 
> > The issue was original reported on VMware VM, but maybe David can figure
> > out how to trigger it on QEMU/KVM.
> 
> A very basic question:
> 
> The virtio_blk driver has no q->mq_ops->timeout() callback. Why does the
> block layer still enable the timeout mechanism when the driver doesn't
> implement ->timeout()?

No matter if ->timeout() is implemented or not, request still may
be timed out, and it is better for block layer to find such issue
and simply reset timer in case of no ->timeout().

> 
> I saw there was some "idle" hctx logic and I guess the requests are

timeout timer is reused for idle hctx detection.

> resubmitted (although it wasn't obvious to me how that happens in the
> code)? Maybe that's why the timer is still used if the driver doesn't
> care about timeouts...

Timeout handling is totally decided by driver's ->timeout() callback.
If driver doesn't implement ->timeout(), the request's timer is
reset.



Thanks
Ming

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
