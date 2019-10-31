Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DB019EABEA
	for <lists.virtualization@lfdr.de>; Thu, 31 Oct 2019 09:54:56 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4C478B0B;
	Thu, 31 Oct 2019 08:54:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 51E74A7F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 08:54:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DEDC7174
	for <virtualization@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 08:54:47 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1073D81F22
	for <virtualization@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 08:54:47 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id i23so2094156wmb.3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 01:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wIxff/xeNXe1wb8LPDwW/yTYgkSfAil2vq+uYePEE2c=;
	b=jSHExO8y42wx+1NbQvHJm/mqaVHIeCYyQb0PfRhWwSiAvxB91aLSiYg08ZmaKFgLcb
	QinRZMO6W9/RB0JgxnZLdcBJdcLsiB7mF9nogR4zlLYqnA1irT+3cAkccwAVh+cuUlsJ
	5khNDwPSUknTi9m/M78w4oPM6Jf89az6fSA/LOXOjVRyhdXir2j3N5KIR0Bmw9BcrNrR
	6RLNN8CogOXjIYP052XQx4Ih2l8YPKjLuBNU9tZHdJjo3Aybbk6uK20TI21s8/aGmKnQ
	hLTDngTwn7+gqSV8ruQNF6jF50Cegu8yheS4vm40FX06uc+vHGekQtaAMDURvHljTD/o
	za3g==
X-Gm-Message-State: APjAAAUmWw264+wr88lPT/s9TiKJknoe8FVR1pXlZXF6LxJ/4TAgpEsf
	6A3oJeGt5H0UAcmiUjUVxVTFSCBz7AjbhoyFQCGNE7iSP6EWO2QjfY8lR0yMGeO4vw1Wy2G+vA3
	S1ahy6NRtG+B1Rvi1YdFzZ7M72tWwzIccTi10CQt0pQ==
X-Received: by 2002:a05:600c:2248:: with SMTP id
	a8mr3992696wmm.176.1572512085583; 
	Thu, 31 Oct 2019 01:54:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwljnfXIFUbhpOVjeOyn7RSMG1RK8ExAwGTNSA6Ok15JomaTkrWe27dOdJI/ge/KJL7MFrKYQ==
X-Received: by 2002:a05:600c:2248:: with SMTP id
	a8mr3992677wmm.176.1572512085348; 
	Thu, 31 Oct 2019 01:54:45 -0700 (PDT)
Received: from steredhat ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id l8sm3361933wru.22.2019.10.31.01.54.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 01:54:44 -0700 (PDT)
Date: Thu, 31 Oct 2019 09:54:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 11/14] vsock: add multi-transports support
Message-ID: <20191031085442.vkb5tnchfsa6n4dh@steredhat>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-12-sgarzare@redhat.com>
	<CAGxU2F7n48kBy_y2GB=mcvraK=mw_2Jn8=2hvQnEOWqWuT9OjA@mail.gmail.com>
	<MWHPR05MB3376E623764F54D39D8135A9DA600@MWHPR05MB3376.namprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR05MB3376E623764F54D39D8135A9DA600@MWHPR05MB3376.namprd05.prod.outlook.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SBL_CSS autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Arnd Bergmann <arnd@arndb.de>, kvm <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>
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

On Wed, Oct 30, 2019 at 03:40:05PM +0000, Jorgen Hansen wrote:
> > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > > +/* Assign a transport to a socket and call the .init transport callback.
> > > + *
> > > + * Note: for stream socket this must be called when vsk->remote_addr
> > > +is set
> > > + * (e.g. during the connect() or when a connection request on a
> > > +listener
> > > + * socket is received).
> > > + * The vsk->remote_addr is used to decide which transport to use:
> > > + *  - remote CID > VMADDR_CID_HOST will use host->guest transport
> > > + *  - remote CID <= VMADDR_CID_HOST will use guest->host transport
> > > +*/ int vsock_assign_transport(struct vsock_sock *vsk, struct
> > > +vsock_sock *psk) {
> > > +       const struct vsock_transport *new_transport;
> > > +       struct sock *sk = sk_vsock(vsk);
> > > +
> > > +       switch (sk->sk_type) {
> > > +       case SOCK_DGRAM:
> > > +               new_transport = transport_dgram;
> > > +               break;
> > > +       case SOCK_STREAM:
> > > +               if (vsk->remote_addr.svm_cid > VMADDR_CID_HOST)
> > > +                       new_transport = transport_h2g;
> > > +               else
> > > +                       new_transport = transport_g2h;
> > 
> > I just noticed that this break the loopback in the guest.
> > As a fix, we should use 'transport_g2h' when remote_cid <=
> > VMADDR_CID_HOST or remote_cid is the id of 'transport_g2h'.
> > 
> > To do that we also need to avoid that L2 guests can have the same CID of L1.
> > For vhost_vsock I can call vsock_find_cid() in vhost_vsock_set_cid()
> > 
> > @Jorgen: for vmci we need to do the same? or it is guaranteed, since it's
> > already support nested VMs, that a L2 guests cannot have the same CID as
> > the L1.
> 
> As far as I can tell, we have the same issue with the current support for nested VMs in
> VMCI. If we have an L2 guest with the same CID as the L1 guest, we will always send to
> the L2 guest, and we may assign an L2 guest the same CID as L1. It should be straight
> forward to avoid this, though.
> 

Yes, I think so.

For the v2 I'm exposing the vsock_find_cid() to the transports, in this
way I can reject requests to set the same L1 CID for L2 guests.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
