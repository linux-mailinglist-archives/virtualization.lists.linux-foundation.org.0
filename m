Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA61B2C52
	for <lists.virtualization@lfdr.de>; Tue, 21 Apr 2020 18:17:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4C2486B92;
	Tue, 21 Apr 2020 16:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOnOJPWOg7Lm; Tue, 21 Apr 2020 16:17:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CFA4C86B96;
	Tue, 21 Apr 2020 16:17:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB912C1797;
	Tue, 21 Apr 2020 16:17:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03015C1797
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 16:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E64DD88503
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 16:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIh-l8DpUmQe
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 16:17:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5352288508
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587485852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6AGRVLAb8VV2GGBt9FCUOJrCOZqz3yE3pnkPMqPpaZ4=;
 b=fLaw4mDFAiAUyt3HFsE9oUivBaoPBLz8vYuBl+PmmSagFLVEAqoHwnl6pq0D7hd5Z2VwC6
 k+3ZpIPdCpt3XJNxBWGgmThqT8hlPzGFfNlyFyLIIq+8sNEEPpq9grqrBRBIGdm3DaZRtd
 K99BwHoBHnJW3DSyFKc3FigvNbr3o7U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-Eav3HXNuPuabnJ9aNo_ffg-1; Tue, 21 Apr 2020 12:17:31 -0400
X-MC-Unique: Eav3HXNuPuabnJ9aNo_ffg-1
Received: by mail-wm1-f69.google.com with SMTP id q5so1691734wmc.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 09:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6AGRVLAb8VV2GGBt9FCUOJrCOZqz3yE3pnkPMqPpaZ4=;
 b=NEB+zBy+lKUwgFQue9U2nmxnFJk/8MkkRvqxMKSVtTPmBiGy16R7JqGVnUq23XK5ZR
 L5bivnBA38qICDhEzOdA2GiaBXXWMMMzgznYiniJSuJSw5v4iwm0+VotWKk/0/bQuOn5
 Mr4Pt8ccEEe0Arbl1+WvMRT1IxlVBVUA6if9ypSDc9J/7v4XLQchbBThg7Pw90Xrbhii
 OEMe8a2zrpGNJN1Qj2dehqU16sVEhI0pQ0092l2O6k2DhdnPNWUYQQGUH3hWIF401+6V
 slzpaCQb0ut0ZlFy0pdpazq7+VA1HcwCxgnEhJT/5PJv4NoeRqfaZBKTfEbI/C0xnX3A
 0WJQ==
X-Gm-Message-State: AGi0PuZK0MztmN37WcqSK4lH5seGrYHi9oZK//1KnuLoW3RAEUz552Nd
 h+TSJkSMNFMMdKNaL75qW3nvj5UHWtar9b5rEXhnHO/KdX7Waps62MGOg77xYGDjKQzIObDTlsy
 w46EZlUz96uN68RGaERR9UJpv2KXLbgG2MLWKLUy07Q==
X-Received: by 2002:adf:db41:: with SMTP id f1mr23709655wrj.13.1587485849056; 
 Tue, 21 Apr 2020 09:17:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypINqkJ2dm7HlXLMWrMoVJcXlSBgzF2ec7b2hdUNDNYkmeWZUjNIFZKliARHFyJyRzZXDY7ReQ==
X-Received: by 2002:adf:db41:: with SMTP id f1mr23709639wrj.13.1587485848793; 
 Tue, 21 Apr 2020 09:17:28 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id h2sm4500324wro.9.2020.04.21.09.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 09:17:27 -0700 (PDT)
Date: Tue, 21 Apr 2020 18:17:24 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH net] vsock/virtio: postpone packet delivery to monitoring
 devices
Message-ID: <20200421161724.c3pnecltfz4jajww@steredhat>
References: <20200421092527.41651-1-sgarzare@redhat.com>
 <20200421154246.GA47385@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200421154246.GA47385@stefanha-x1.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Gerard Garcia <ggarcia@deic.uab.cat>, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net
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

On Tue, Apr 21, 2020 at 04:42:46PM +0100, Stefan Hajnoczi wrote:
> On Tue, Apr 21, 2020 at 11:25:27AM +0200, Stefano Garzarella wrote:
> > We delivering packets to monitoring devices, before to check if
> > the virtqueue has enough space.
> 
> "We [are] delivering packets" and "before to check" -> "before
> checking".  Perhaps it can be rewritten as:
> 
>   Packets are delivered to monitoring devices before checking if the
>   virtqueue has enough space.
> 

Yeah, it is better :-)

> > 
> > If the virtqueue is full, the transmitting packet is queued up
> > and it will be sent in the next iteration. This causes the same
> > packet to be delivered multiple times to monitoring devices.
> > 
> > This patch fixes this issue, postponing the packet delivery
> > to monitoring devices, only when it is properly queued in the
> 
> s/,//
> 
> > virqueue.
> 
> s/virqueue/virtqueue/
> 

Thanks, I'll fix in the v2!

> > @@ -137,6 +135,11 @@ virtio_transport_send_pkt_work(struct work_struct *work)
> >  			break;
> >  		}
> >  
> > +		/* Deliver to monitoring devices all correctly transmitted
> > +		 * packets.
> > +		 */
> > +		virtio_transport_deliver_tap_pkt(pkt);
> > +
> 
> The device may see the tx packet and therefore receive a reply to it
> before we can call virtio_transport_deliver_tap_pkt().  Does this mean
> that replies can now appear in the packet capture before the transmitted
> packet?

hmm, you are right!

And the same thing can already happen in vhost-vsock where we call
virtio_transport_deliver_tap_pkt() after the vhost_add_used(), right?

The vhost-vsock case can be fixed in a simple way, but here do you think
we should serialize them? (e.g. mutex, spinlock)

In this case I'm worried about performance.

Or is there some virtqueue API to check availability?

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
