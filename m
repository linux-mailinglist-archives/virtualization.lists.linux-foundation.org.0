Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF011056A6
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 17:13:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 247D6873B8;
	Thu, 21 Nov 2019 16:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WV70gDG3EwVO; Thu, 21 Nov 2019 16:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C954875EA;
	Thu, 21 Nov 2019 16:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1001FC1DDE;
	Thu, 21 Nov 2019 16:13:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AFB2C18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 46FE324E7D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPfVZHPD0Xwi
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:12:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id EC0802107F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574352775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4jDlqvRauMO48OH1rfHe5D1vr1CStUdJKWdRifHUHE=;
 b=RHxIZvF4+lbEReX4GTAic2iBvNp+y8wmAUukzwgi2oUiyyaqDCDmUgn8KL/jxpWOOSAEJB
 SaOB4EubByamNFKo2nSQ/tKP3ARTCyX9Yl4qcD2BIPzcontO6Da0wn2Ex6anEGNg/LjLGL
 wyh6elmQJGvcAWepL0RgaGwbWt98fto=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-RJ2Go32gOsScs7S9_BVtSg-1; Thu, 21 Nov 2019 11:12:52 -0500
Received: by mail-wm1-f71.google.com with SMTP id t203so1758120wmt.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 08:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bzunz7vaTZgIeoprS+AqEx2vIVmIoRBhLk3Y9Zo1tTc=;
 b=EpzpvoNdrdj6HaN6VVRPrDPVxH0Sq4jpXzdXJHuqPu4FWJAKBexteUevSce04yg+gq
 DJn4nxqC9LUeeM36muWnJSOGyp6aOpCn4OWgoEabLTDTM5CJ7R7PdrQzK9Glq5GwoV5k
 EAwxmAHJZi9Xqtwsl0JYHMKLaRh1VD/QeJLaJeBwrf45c6Agjc373rwr0MQezAPbjbDJ
 SPq7njdeaMbcQ5EDWJlGvU9P9NwGn/9CAxbF3ITJ9LtAI4yONJWRztG+FQnTkk3yytrJ
 oeXtHbHWj/wBS/qDaZ2aVJuPjLxn9XA/ZfFtugXn42ygszq0O5mnIXoISQGTXg2sP7RH
 I4vw==
X-Gm-Message-State: APjAAAXai7NXn3sSzc71ejFxl6pqJrxneR4JuyfjzcQPA2S2MEaZ3auv
 RN+7vqnXQBvOwzKMsSbIuZ8Ucxi7zU8asf1PYrWYXGABcRahEgCWlw0ei5QifsUHioKr4bmecFr
 ccrKQbIV0LPOXScXu6+Iwf4bALp9YpBG9WVDX82uhXQ==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr11307549wmi.114.1574352771191; 
 Thu, 21 Nov 2019 08:12:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqx/ihIoiUrBSYY5RXkVJWL/zIYFDoQRjxNOwfDXmQBBbNZUvYEUurSUy8wy3xec3AaM6xyemQ==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr11307522wmi.114.1574352770936; 
 Thu, 21 Nov 2019 08:12:50 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
 by smtp.gmail.com with ESMTPSA id g133sm75244wme.42.2019.11.21.08.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 08:12:50 -0800 (PST)
Date: Thu, 21 Nov 2019 17:12:47 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 3/6] vsock: add local transport support in the
 vsock core
Message-ID: <20191121161247.u6xvrso272q4ujag@steredhat>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-4-sgarzare@redhat.com>
 <MWHPR05MB3376F4452F0CF38C1AFABA2EDA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
 <20191121152148.slv26oesn25dpjb6@steredhat>
 <MWHPR05MB3376D95B5E50DF7CAF675EEDDA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR05MB3376D95B5E50DF7CAF675EEDDA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
X-MC-Unique: RJ2Go32gOsScs7S9_BVtSg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

On Thu, Nov 21, 2019 at 03:53:47PM +0000, Jorgen Hansen wrote:
> > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > Sent: Thursday, November 21, 2019 4:22 PM
> > 
> > On Thu, Nov 21, 2019 at 03:04:18PM +0000, Jorgen Hansen wrote:
> > > > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > > > Sent: Tuesday, November 19, 2019 12:01 PM
> > > > To: netdev@vger.kernel.org
> > > >
> > > > This patch allows to register a transport able to handle
> > > > local communication (loopback).
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > ---
> > > >  include/net/af_vsock.h   |  2 ++
> > > >  net/vmw_vsock/af_vsock.c | 17 ++++++++++++++++-
> > > >  2 files changed, 18 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> > > > index 4206dc6d813f..b1c717286993 100644
> > > > --- a/include/net/af_vsock.h
> > > > +++ b/include/net/af_vsock.h
> > > > @@ -98,6 +98,8 @@ struct vsock_transport_send_notify_data {
> > > >  #define VSOCK_TRANSPORT_F_G2H		0x00000002
> > > >  /* Transport provides DGRAM communication */
> > > >  #define VSOCK_TRANSPORT_F_DGRAM		0x00000004
> > > > +/* Transport provides local (loopback) communication */
> > > > +#define VSOCK_TRANSPORT_F_LOCAL		0x00000008
> > > >
> > > >  struct vsock_transport {
> > > >  	struct module *module;
> > > > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > > > index cc8659838bf2..c9e5bad59dc1 100644
> > > > --- a/net/vmw_vsock/af_vsock.c
> > > > +++ b/net/vmw_vsock/af_vsock.c
> > > > @@ -136,6 +136,8 @@ static const struct vsock_transport
> > *transport_h2g;
> > > >  static const struct vsock_transport *transport_g2h;
> > > >  /* Transport used for DGRAM communication */
> > > >  static const struct vsock_transport *transport_dgram;
> > > > +/* Transport used for local communication */
> > > > +static const struct vsock_transport *transport_local;
> > > >  static DEFINE_MUTEX(vsock_register_mutex);
> > > >
> > > >  /**** UTILS ****/
> > > > @@ -2130,7 +2132,7 @@
> > EXPORT_SYMBOL_GPL(vsock_core_get_transport);
> > > >
> > > >  int vsock_core_register(const struct vsock_transport *t, int features)
> > > >  {
> > > > -	const struct vsock_transport *t_h2g, *t_g2h, *t_dgram;
> > > > +	const struct vsock_transport *t_h2g, *t_g2h, *t_dgram, *t_local;
> > > >  	int err = mutex_lock_interruptible(&vsock_register_mutex);
> > > >
> > > >  	if (err)
> > > > @@ -2139,6 +2141,7 @@ int vsock_core_register(const struct
> > > > vsock_transport *t, int features)
> > > >  	t_h2g = transport_h2g;
> > > >  	t_g2h = transport_g2h;
> > > >  	t_dgram = transport_dgram;
> > > > +	t_local = transport_local;
> > > >
> > > >  	if (features & VSOCK_TRANSPORT_F_H2G) {
> > > >  		if (t_h2g) {
> > > > @@ -2164,9 +2167,18 @@ int vsock_core_register(const struct
> > > > vsock_transport *t, int features)
> > > >  		t_dgram = t;
> > > >  	}
> > > >
> > > > +	if (features & VSOCK_TRANSPORT_F_LOCAL) {
> > > > +		if (t_local) {
> > > > +			err = -EBUSY;
> > > > +			goto err_busy;
> > > > +		}
> > > > +		t_local = t;
> > > > +	}
> > > > +
> > > >  	transport_h2g = t_h2g;
> > > >  	transport_g2h = t_g2h;
> > > >  	transport_dgram = t_dgram;
> > > > +	transport_local = t_local;
> > > >
> > > >  err_busy:
> > > >  	mutex_unlock(&vsock_register_mutex);
> > > > @@ -2187,6 +2199,9 @@ void vsock_core_unregister(const struct
> > > > vsock_transport *t)
> > > >  	if (transport_dgram == t)
> > > >  		transport_dgram = NULL;
> > > >
> > > > +	if (transport_local == t)
> > > > +		transport_local = NULL;
> > > > +
> > > >  	mutex_unlock(&vsock_register_mutex);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(vsock_core_unregister);
> > > > --
> > > > 2.21.0
> > >
> > > Having loopback support as a separate transport fits nicely, but do we need
> > to support
> > > different variants of loopback? It could just be built in.
> > 
> > I agree with you, indeed initially I developed it as built in, but
> > DEPMOD found a cyclic dependency because vsock_transport use
> > virtio_transport_common that use vsock, so if I include vsock_transport
> > in the vsock module, DEPMOD is not happy.
> > 
> > I don't know how to break this cyclic dependency, do you have any ideas?
> 
> One way to view this would be that the loopback transport and the support
> it uses from virtio_transport_common are independent of virtio as such,
> and could be part of  the af_vsock module if loopback is configured. So
> in a way, the virtio g2h and h2g transports would be extensions of the
> built in loopback transport. But that brings in quite a bit of code so
> it could be better to just keep it as is.

Great idea!

Stefan already suggested (as a long-term goal) to rename the generic
functionality in virtio_transport_common.c

Maybe I can do both in another series later on, since it requires enough
changes.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
