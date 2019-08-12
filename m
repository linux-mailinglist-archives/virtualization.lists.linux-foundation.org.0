Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A64D89692
	for <lists.virtualization@lfdr.de>; Mon, 12 Aug 2019 07:05:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 61F81BA0;
	Mon, 12 Aug 2019 05:05:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3AED4B59
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 05:05:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 197388B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 05:05:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F1063B551;
	Mon, 12 Aug 2019 05:05:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B0E45D6D0;
	Mon, 12 Aug 2019 05:05:32 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 553374A460;
	Mon, 12 Aug 2019 05:05:32 +0000 (UTC)
Date: Mon, 12 Aug 2019 01:05:31 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <904809366.7828013.1565586331773.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190810141213-mutt-send-email-mst@kernel.org>
References: <20190809064847.28918-1-pagupta@redhat.com>
	<20190809064847.28918-3-pagupta@redhat.com>
	<20190810141213-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH v3 2/2] virtio: decrement avail idx with buffer detach
	for packed ring
MIME-Version: 1.0
X-Originating-IP: [10.67.116.104, 10.4.195.22]
Thread-Topic: virtio: decrement avail idx with buffer detach for packed ring
Thread-Index: MiSZup5kLcvoPG95SMeU4GQP1njEJA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 12 Aug 2019 05:05:32 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: arnd@arndb.de, amit@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, xiaohli@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


> On Fri, Aug 09, 2019 at 12:18:47PM +0530, Pankaj Gupta wrote:
> > This patch decrements 'next_avail_idx' count when detaching a buffer
> > from vq for packed ring code. Split ring code already does this in
> > virtqueue_detach_unused_buf_split function. This updates the
> > 'next_avail_idx' to the previous correct index after an unused buffer
> > is detatched from the vq.
> > 
> > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> 
> I would make this patch 1, not patch 2, otherwise
> patch 1 corrupts the ring.

Sure. Will post this patch as patch 1 in next version.

Thanks,
Pankaj 

> 
> 
> > ---
> >  drivers/virtio/virtio_ring.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index c8be1c4f5b55..7c69181113e2 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -1537,6 +1537,12 @@ static void
> > *virtqueue_detach_unused_buf_packed(struct virtqueue *_vq)
> >  		/* detach_buf clears data, so grab it now. */
> >  		buf = vq->packed.desc_state[i].data;
> >  		detach_buf_packed(vq, i, NULL);
> > +		vq->packed.next_avail_idx--;
> > +		if (vq->packed.next_avail_idx < 0) {
> > +			vq->packed.next_avail_idx = vq->packed.vring.num - 1;
> > +			vq->packed.avail_wrap_counter ^= 1;
> > +		}
> > +
> >  		END_USE(vq);
> >  		return buf;
> >  	}
> > --
> > 2.20.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
