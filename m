Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D838FBE8
	for <lists.virtualization@lfdr.de>; Tue, 25 May 2021 09:39:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 306FC607CF;
	Tue, 25 May 2021 07:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fpDRMR59zW8m; Tue, 25 May 2021 07:39:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11CF6085E;
	Tue, 25 May 2021 07:39:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81421C0001;
	Tue, 25 May 2021 07:39:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0798C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 07:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D08E240166
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 07:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aI90cIypzVg6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 07:39:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAA2C400E4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 07:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621928359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jeWJ7HGi3jq6uRXU1bbWV9h6gPERN4k8ZMEjEkjKNkc=;
 b=i+PODPJNdkRbppd/fRtTT4Grvms1TDF1uNz1C9VfW6Z50w9u/5DcBo+GUhVGRltiQoNG7j
 KRQJYiv4koxs1DE9bwswYGpDCQqD4kNt4QyXJzCjpYZ2H62hw/BDaHqX493Cypmn3sZI+q
 FXdnfJcDQw7FX9jumZEmK1Yq8irZfOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-S4dYbxgOOQe4yMwIJ2HYlw-1; Tue, 25 May 2021 03:39:15 -0400
X-MC-Unique: S4dYbxgOOQe4yMwIJ2HYlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8684F1009465;
 Tue, 25 May 2021 07:39:14 +0000 (UTC)
Received: from T590 (ovpn-13-203.pek2.redhat.com [10.72.13.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5E3A60BF1;
 Tue, 25 May 2021 07:38:47 +0000 (UTC)
Date: Tue, 25 May 2021 15:38:42 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] virtio_blk: implement blk_mq_ops->poll()
Message-ID: <YKypgi2qcYVTgYdv@T590>
References: <20210520141305.355961-1-stefanha@redhat.com>
 <20210520141305.355961-4-stefanha@redhat.com>
 <20210524145928.GA3873@lst.de>
 <7cc7f19b-34b3-1501-898d-3f41e047d766@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cc7f19b-34b3-1501-898d-3f41e047d766@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
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

On Tue, May 25, 2021 at 09:22:48AM +0200, Paolo Bonzini wrote:
> On 24/05/21 16:59, Christoph Hellwig wrote:
> > On Thu, May 20, 2021 at 03:13:05PM +0100, Stefan Hajnoczi wrote:
> > > Possible drawbacks of this approach:
> > > 
> > > - Hardware virtio_blk implementations may find virtqueue_disable_cb()
> > >    expensive since it requires DMA. If such devices become popular then
> > >    the virtio_blk driver could use a similar approach to NVMe when
> > >    VIRTIO_F_ACCESS_PLATFORM is detected in the future.
> > > 
> > > - If a blk_poll() thread is descheduled it not only hurts polling
> > >    performance but also delays completion of non-REQ_HIPRI requests on
> > >    that virtqueue since vq notifications are disabled.
> > 
> > Yes, I think this is a dangerous configuration.  What argument exists
> > again just using dedicated poll queues?
> 
> There isn't an equivalent of the admin queue in virtio-blk, which would
> allow the guest to configure the desired number of poll queues.  The number
> of queues is fixed.

Dedicated vqs can be used for poll only, and I understand VM needn't to know
if the vq is polled or driven by IRQ in VM.

I tried that in v5.4, but not see obvious IOPS boost, so give up.

https://github.com/ming1/linux/commits/my_v5.4-virtio-irq-poll


Thanks,
Ming

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
