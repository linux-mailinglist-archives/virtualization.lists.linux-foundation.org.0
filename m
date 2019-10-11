Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE940D4350
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 16:46:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08F871A66;
	Fri, 11 Oct 2019 14:46:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CFEC815D5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:37:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6BABC735
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:37:46 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7C6A80F81
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:37:45 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id w8so4474635wrm.3
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 07:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cJdL4DlBZ1DsoqoslBnw04GmuGAbbtWTmEe0mcYukas=;
	b=Ro4+i0jpbw/BECJ8LR+tOslyAA33F9XQkqDYOeUlh7CLWz1I4mJ5SEhzwwKXnP4Al8
	1vwTzTJPXIsHjEi1SeoYWmUoQbIM+lDKbEF/eFbTgSs3TuwgIm6wbIVL58HD4Co5CYtI
	beMTbPiWDIheNaDIwMsdsFFmfFDcH3RT8egQfh+uB1mMUlBxkQrzd4lk7Sc0qHKxbuQc
	Xw3wALpWe/IMIKN7PcjbUIzthEDsWy3APIJTjAMoc7WlvBFrX+MEaZkVtgreCUl6M1ep
	yUCRt0rHOftdR/iz1fPpMXkN7P31q83gJ2073JNe9OdAE4sEab5wTUjOnwgvbdSXJMD+
	L+KQ==
X-Gm-Message-State: APjAAAXO7lWVH/tjVGP1I9l9qzBYyw+c8McUoeNMdIo6foMtzuC6b3fh
	/0fXmvqtON5RoBrKBEqrnB9wzuzyPkpYmVnKSAnkvtbZwrQt5GQDMgjy9RCsnBWdR/70t2/JBfZ
	Gi0koGxApsyrSQ0NhYSjuBzJNqrJP2yNSSCE+fUjY1g==
X-Received: by 2002:adf:a516:: with SMTP id i22mr14579496wrb.273.1570804664504;
	Fri, 11 Oct 2019 07:37:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNdP5yvb8Rbsm9tLzeyjamBn7Ne70jEAdvVVgHzVT6Bjn+tQzwtYnB8hZDowTkrOmAzV3rXQ==
X-Received: by 2002:adf:a516:: with SMTP id i22mr14579472wrb.273.1570804664273;
	Fri, 11 Oct 2019 07:37:44 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	y14sm13296394wrd.84.2019.10.11.07.37.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 07:37:43 -0700 (PDT)
Date: Fri, 11 Oct 2019 16:37:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net 1/2] vsock: add half-closed socket details in the
	implementation notes
Message-ID: <20191011143741.frgdjcyee25wpcmf@steredhat>
References: <20191011130758.22134-1-sgarzare@redhat.com>
	<20191011130758.22134-2-sgarzare@redhat.com>
	<20191011101936-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011101936-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adit Ranadive <aditr@vmware.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Fri, Oct 11, 2019 at 10:22:30AM -0400, Michael S. Tsirkin wrote:
> On Fri, Oct 11, 2019 at 03:07:57PM +0200, Stefano Garzarella wrote:
> > vmci_transport never allowed half-closed socket on the host side.
> > Since we want to have the same behaviour across all transports, we
> > add a section in the "Implementation notes".
> > 
> > Cc: Jorgen Hansen <jhansen@vmware.com>
> > Cc: Adit Ranadive <aditr@vmware.com>
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  net/vmw_vsock/af_vsock.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > index 2ab43b2bba31..27df57c2024b 100644
> > --- a/net/vmw_vsock/af_vsock.c
> > +++ b/net/vmw_vsock/af_vsock.c
> > @@ -83,6 +83,10 @@
> >   *   TCP_ESTABLISHED - connected
> >   *   TCP_CLOSING - disconnecting
> >   *   TCP_LISTEN - listening
> > + *
> > + * - Half-closed socket is supported only on the guest side. recv() on the host
> > + * side should return EOF when the guest closes a connection, also if some
> > + * data is still in the receive queue.
> >   */
> >  
> >  #include <linux/types.h>
> 
> That's a great way to lose data in a way that's hard to debug.
> 
> VMCI sockets connect to a hypervisor so there's tight control
> of what the hypervisor can do.
> 
> But vhost vsocks connect to a fully fledged Linux, so
> you can't assume this is safe. And application authors do not read
> kernel source.

Thanks for explaining.
Discard this patch, I'll try to add a getsockopt() to allow the tests
(and applications) to understand if half-closed socket is supported or not.

Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
