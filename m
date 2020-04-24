Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6A1B7215
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 12:35:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8954E203CE;
	Fri, 24 Apr 2020 10:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHAk9m8lbxYV; Fri, 24 Apr 2020 10:35:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 962E02034F;
	Fri, 24 Apr 2020 10:35:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7335DC0175;
	Fri, 24 Apr 2020 10:35:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C52D0C0175
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 10:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AE12086F0B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 10:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id togtPV5BAH90
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 10:35:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C506B86F0A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587724521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ntfPLZXoNyTvwSjnNtD9RbmeW0yN1V6v3M89sKls28c=;
 b=IjY0s8yZj2KYuelyE2zv4p3ddP6ogAEXoUUQ1PtaiS1D8FHWbvR4kL3uKbnGghjLQF4333
 R+IbATcNdiOXLmx5+gEpVZE+ms2s464EZisrEZY1NRuE4R1lnT8xvFOLHfISrqbBJgRzxY
 ZxHGYvEX8pVTqi3eRShhKhW3O0EN6qQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-EqGn4ILaPlKRcUfbBVjfiA-1; Fri, 24 Apr 2020 06:35:19 -0400
X-MC-Unique: EqGn4ILaPlKRcUfbBVjfiA-1
Received: by mail-wm1-f69.google.com with SMTP id 71so4009112wmb.8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 03:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ntfPLZXoNyTvwSjnNtD9RbmeW0yN1V6v3M89sKls28c=;
 b=pNvge9q6naKbVv755V0biWtIpXxsCCpxVavPAHkSRjuvw1HlmXa0P7W7LH9i3FqddN
 OAlieR+YSCyad0+OZhC7K8YpDP6c/egObmJllido2KaNBnUxzWlfX9Bp9g3EvpEkauvw
 r3rnP+0LXeiI9Xek5k7WwazWvHUYDQYG/X+Kmxn9EhUN+fHXEpDQcjdgnGz6l5RVeEZB
 fsfwR/XUJ2d2PEQbKmTiH0zCIzHuACo5KodOl+DqSvIhgUa13pGpak+XruAgL2dchHqu
 M06eR3X3wAgNFH3hpHzjmRPaQzJU8r833fkQHMavKExYa13hJfMz6GEYiU4Y28rWk9xN
 PHXQ==
X-Gm-Message-State: AGi0PuagF3Br0k1xwo980BkAg5JSjy+kYe2ivzSMtYYnEPAwlzvzqa9d
 qglgZhNaFYQP9OfqRfklsYgT6IfeCsnkJXCCKxMX+7XH1h91Ldbf7j8zThlkf6ucDkxKC+LlS4b
 0U7LEAJOfdKr5icyAsrXiTHUHT6E6ABMDDFLJEqHuSQ==
X-Received: by 2002:a1c:3884:: with SMTP id f126mr9826292wma.91.1587724518701; 
 Fri, 24 Apr 2020 03:35:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJwafXiFz/67CLTHYy0TolHGXrpgwxNZZfuWGXn40Y8iNEzMExmzSW5yG6FLTxenAUETL6jWw==
X-Received: by 2002:a1c:3884:: with SMTP id f126mr9826249wma.91.1587724518274; 
 Fri, 24 Apr 2020 03:35:18 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id 5sm2228287wmg.34.2020.04.24.03.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 03:35:17 -0700 (PDT)
Date: Fri, 24 Apr 2020 12:35:15 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH net] vsock/virtio: postpone packet delivery to monitoring
 devices
Message-ID: <20200424103515.v62vldnnmtz3r6dm@steredhat>
References: <20200421092527.41651-1-sgarzare@redhat.com>
 <20200421154246.GA47385@stefanha-x1.localdomain>
 <20200421161724.c3pnecltfz4jajww@steredhat>
 <20200422165420.GL47385@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200422165420.GL47385@stefanha-x1.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Gerard Garcia <ggarcia@deic.uab.cat>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
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

On Wed, Apr 22, 2020 at 05:54:20PM +0100, Stefan Hajnoczi wrote:
> On Tue, Apr 21, 2020 at 06:17:24PM +0200, Stefano Garzarella wrote:
> > On Tue, Apr 21, 2020 at 04:42:46PM +0100, Stefan Hajnoczi wrote:
> > > On Tue, Apr 21, 2020 at 11:25:27AM +0200, Stefano Garzarella wrote:
> > > > We delivering packets to monitoring devices, before to check if
> > > > the virtqueue has enough space.
> > > 
> > > "We [are] delivering packets" and "before to check" -> "before
> > > checking".  Perhaps it can be rewritten as:
> > > 
> > >   Packets are delivered to monitoring devices before checking if the
> > >   virtqueue has enough space.
> > > 
> > 
> > Yeah, it is better :-)
> > 
> > > > 
> > > > If the virtqueue is full, the transmitting packet is queued up
> > > > and it will be sent in the next iteration. This causes the same
> > > > packet to be delivered multiple times to monitoring devices.
> > > > 
> > > > This patch fixes this issue, postponing the packet delivery
> > > > to monitoring devices, only when it is properly queued in the
> > > 
> > > s/,//
> > > 
> > > > virqueue.
> > > 
> > > s/virqueue/virtqueue/
> > > 
> > 
> > Thanks, I'll fix in the v2!
> > 
> > > > @@ -137,6 +135,11 @@ virtio_transport_send_pkt_work(struct work_struct *work)
> > > >  			break;
> > > >  		}
> > > >  
> > > > +		/* Deliver to monitoring devices all correctly transmitted
> > > > +		 * packets.
> > > > +		 */
> > > > +		virtio_transport_deliver_tap_pkt(pkt);
> > > > +
> > > 
> > > The device may see the tx packet and therefore receive a reply to it
> > > before we can call virtio_transport_deliver_tap_pkt().  Does this mean
> > > that replies can now appear in the packet capture before the transmitted
> > > packet?
> > 
> > hmm, you are right!
> > 
> > And the same thing can already happen in vhost-vsock where we call
> > virtio_transport_deliver_tap_pkt() after the vhost_add_used(), right?
> > 
> > The vhost-vsock case can be fixed in a simple way, but here do you think
> > we should serialize them? (e.g. mutex, spinlock)
> > 
> > In this case I'm worried about performance.
> > 
> > Or is there some virtqueue API to check availability?
> 
> Let's stick to the same semantics as Ethernet netdevs.  That way there
> are no surprises to anyone who is familiar with Linux packet captures.
> I don't know what those semantics are though, you'd need to check the
> code :).

IIUC, the packet is delivered to tap/monitoring devices before to call
the xmit() callback provided by the NIC driver.

At that point, if the packet is delayed/dropped/retransmitted by the driver
or the NIC, the monitoring application is not aware.

So, I think we can delivery it the first time that we see the packet,
before to queue it in the virtqueue (I should revert this change and fix
vhost-vsock), setting a flag in the 'struct virtio_vsock_pkt' to avoid
to delivery it multiple times.

I mean something like this:
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -157,7 +157,11 @@ static struct sk_buff *virtio_transport_build_skb(void *opaque)

 void virtio_transport_deliver_tap_pkt(struct virtio_vsock_pkt *pkt)
 {
+       if (pkt->tap_delivered)
+               return;
+
        vsock_deliver_tap(virtio_transport_build_skb, pkt);
+       pkt->tap_delivered = true;
 }
 EXPORT_SYMBOL_GPL(virtio_transport_deliver_tap_pkt);


Let me know if you think it is a bad idea.

I'll send a v2 whit these changes.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
