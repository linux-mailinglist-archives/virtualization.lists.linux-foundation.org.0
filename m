Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B50942E6F45
	for <lists.virtualization@lfdr.de>; Tue, 29 Dec 2020 10:18:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 75D13871B4;
	Tue, 29 Dec 2020 09:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGd8jDaOMsvI; Tue, 29 Dec 2020 09:17:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AEDDC871B6;
	Tue, 29 Dec 2020 09:17:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8168FC0174;
	Tue, 29 Dec 2020 09:17:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4722BC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 09:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 291012047B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 09:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3uy9jXePdlV
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 09:17:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 986202040B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609233473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3a+7ld4pVpI/jzF0LVQOcnm0TWniIUVAixPWA1eaWIc=;
 b=N4zdhuL1+BBvUcZo/W2swrF0oX6vft8ga+RaAFI5qpAYnrDOwdmFBfUvpbNBlMMpG6Z2/+
 PiILXNChdNvC6aSz9SekVeNrnnVJjVgjO5Lp+rEFLx13NDTJGXUTMkWiQOWbM0DLPH7TOd
 rWVhQH6zwZLHdxNTmckIjdFLTVWZU3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-QuVpKqhuPhqdVu6Y8DRa_w-1; Tue, 29 Dec 2020 04:17:49 -0500
X-MC-Unique: QuVpKqhuPhqdVu6Y8DRa_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AE31801817;
 Tue, 29 Dec 2020 09:17:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D12360BE5;
 Tue, 29 Dec 2020 09:17:48 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 061F718095FF;
 Tue, 29 Dec 2020 09:17:48 +0000 (UTC)
Date: Tue, 29 Dec 2020 04:17:29 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Message-ID: <1881606476.40780520.1609233449300.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+FuTSffjFZGGwpMkpnTBbHHwnJN7if=0cVf0Des7Db5UFe0bw@mail.gmail.com>
References: <20201228162233.2032571-1-willemdebruijn.kernel@gmail.com>
 <20201228162233.2032571-3-willemdebruijn.kernel@gmail.com>
 <20201228122253-mutt-send-email-mst@kernel.org>
 <CA+FuTScguDWkvk=Lc+GzP=UCK2wjRFNJ_GEn_bniHpCDWdkfjg@mail.gmail.com>
 <20201228162903-mutt-send-email-mst@kernel.org>
 <CA+FuTSffjFZGGwpMkpnTBbHHwnJN7if=0cVf0Des7Db5UFe0bw@mail.gmail.com>
Subject: Re: [PATCH rfc 2/3] virtio-net: support receive timestamp
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.11]
Thread-Topic: virtio-net: support receive timestamp
Thread-Index: ZlLLJvNx7Gch4gx6qQxAB6fxhIb6TQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Network Development <netdev@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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



----- Original Message -----
> On Mon, Dec 28, 2020 at 7:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Dec 28, 2020 at 02:30:31PM -0500, Willem de Bruijn wrote:
> > > On Mon, Dec 28, 2020 at 12:29 PM Michael S. Tsirkin <mst@redhat.com>
> > > wrote:
> > > >
> > > > On Mon, Dec 28, 2020 at 11:22:32AM -0500, Willem de Bruijn wrote:
> > > > > From: Willem de Bruijn <willemb@google.com>
> > > > >
> > > > > Add optional PTP hardware timestamp offload for virtio-net.
> > > > >
> > > > > Accurate RTT measurement requires timestamps close to the wire.
> > > > > Introduce virtio feature VIRTIO_NET_F_RX_TSTAMP. If negotiated, the
> > > > > virtio-net header is expanded with room for a timestamp. A host may
> > > > > pass receive timestamps for all or some packets. A timestamp is valid
> > > > > if non-zero.
> > > > >
> > > > > The timestamp straddles (virtual) hardware domains. Like PTP, use
> > > > > international atomic time (CLOCK_TAI) as global clock base. It is
> > > > > guest responsibility to sync with host, e.g., through kvm-clock.
> > > > >
> > > > > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > > > > diff --git a/include/uapi/linux/virtio_net.h
> > > > > b/include/uapi/linux/virtio_net.h
> > > > > index f6881b5b77ee..0ffe2eeebd4a 100644
> > > > > --- a/include/uapi/linux/virtio_net.h
> > > > > +++ b/include/uapi/linux/virtio_net.h
> > > > > @@ -57,6 +57,7 @@
> > > > >                                        * Steering */
> > > > >  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23        /* Set MAC address */
> > > > >
> > > > > +#define VIRTIO_NET_F_RX_TSTAMP         55    /* Host sends TAI
> > > > > receive time */
> > > > >  #define VIRTIO_NET_F_TX_HASH   56    /* Guest sends hash report */
> > > > >  #define VIRTIO_NET_F_HASH_REPORT  57 /* Supports hash report */
> > > > >  #define VIRTIO_NET_F_RSS       60    /* Supports RSS RX steering */
> > > > > @@ -182,6 +183,17 @@ struct virtio_net_hdr_v1_hash {
> > > > >       };
> > > > >  };
> > > > >
> > > > > +struct virtio_net_hdr_v12 {
> > > > > +     struct virtio_net_hdr_v1 hdr;
> > > > > +     struct {
> > > > > +             __le32 value;
> > > > > +             __le16 report;
> > > > > +             __le16 flow_state;
> > > > > +     } hash;
> > > > > +     __virtio32 reserved;
> > > > > +     __virtio64 tstamp;
> > > > > +};
> > > > > +
> > > > >  #ifndef VIRTIO_NET_NO_LEGACY
> > > > >  /* This header comes first in the scatter-gather list.
> > > > >   * For legacy virtio, if VIRTIO_F_ANY_LAYOUT is not negotiated, it
> > > > >   must
> > > >
> > > >
> > > > So it looks like VIRTIO_NET_F_RX_TSTAMP should depend on both
> > > > VIRTIO_NET_F_RX_TSTAMP and VIRTIO_NET_F_HASH_REPORT then?
> > >
> > > Do you mean VIRTIO_NET_F_TX_TSTAMP depends on VIRTIO_NET_F_RX_TSTAMP?
> > >
> > > I think if either is enabled we need to enable the extended layout.
> > > Regardless of whether TX_HASH or HASH_REPORT are enabled. If they are
> > > not, then those fields are ignored.
> >
> > I mean do we waste the 8 bytes for hash if TSTAMP is set but HASH is not?
> > If TSTAMP depends on HASH then point is moot.
> 
> True, but the two features really are independent.
> 
> I did consider using configurable metadata layout depending on
> features negotiated. If there are tons of optional extensions, that
> makes sense. But it is more complex and parsing error prone. With a
> handful of options each of a few bytes, that did not seem worth the
> cost to me at this point.

Consider NFV workloads(64B) packet. Most fields of current vnet header
is even a burdern. It might be the time to introduce configurable or
self-descriptive vnet header.


> 
> And importantly, such a mode can always be added later as a separate
> VIRTIO_NET_F_PACKED_HEADER option.

What will do feature provide?

Thanks

> 
> If anything, perhaps if we increase the virtio_net_hdr_* allocation,
> we should allocate some additional reserved space now? As each new
> size introduces quite a bit of boilerplate. Also, e.g., in qemu just
> to pass the sizes between virtio-net driver and vhost-net device.
> 
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
