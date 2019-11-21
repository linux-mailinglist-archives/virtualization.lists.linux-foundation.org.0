Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03810554D
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 16:22:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49637886FF;
	Thu, 21 Nov 2019 15:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGXDEGBr1Fjl; Thu, 21 Nov 2019 15:21:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BAA10886BB;
	Thu, 21 Nov 2019 15:21:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A629AC18DA;
	Thu, 21 Nov 2019 15:21:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76C49C18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 66A5187F9A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xjfAkOmatz6p
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:21:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A6AB8877C9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574349716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xoi/mEqRIrWnRpvTl0NDdwq5Vb/YMexVa8/yaCTR3QA=;
 b=Ki2Y5n8rQ7E4w/dP7oGFj+h0wJGbsTgCT8AcBdvgEnN+WeZ2KzasFZhYDwQdCTAkjkZOX0
 zjnpnKnRLHRiz6XNVzDM9FM5EmFfjDeb44XZZ2SVxqIrn0oxNqAY8CSMQjXBsas0PwU5PQ
 NYHM1mNNtczNhwOxpHTvv+lLc6BLblc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-ZoOnJtOcOtmMOUcCCkPXEg-1; Thu, 21 Nov 2019 10:21:53 -0500
Received: by mail-wm1-f72.google.com with SMTP id 199so2002404wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 07:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v1PSvxZigoBGfcnTdo+vCEuQthQ6gbSlafKpw/APSmQ=;
 b=j+7U3K6PAhxvyV27/YJpkP8JUulRlCVNdNOgw5Kylp38xMP6NDJZxoJ3RdDGHc+kRT
 4v7zsepmXfgnmr8XmXokjdhIjdvqBFbHhBRkHnt5Ar2lbPd74rWqDW/OIwaApb6pT+pe
 F10eymFuEY/mTvw/P2Dfp4dIOoKX2U5UIDwCgv/uAE1inJsMORIVfgz5bK9D5NUjybXx
 x2gHAY3cFb4yglYRJj7xAOW/e+t948s8VR3P/T2oSXKys1G/n25or8vRwHbTvjMCz8fc
 Idp3+wZ0aNOLK7JL6wAUsfT5H+HrM1KcdfML5MmZilKN9vST2msFK4AQRiuQguuss+Qe
 k/JA==
X-Gm-Message-State: APjAAAXp5X67q8z1HblTGQPRgY1EyyYN/jxWK2H57f0LRqH+EOBVF5WN
 EHVCPMgq8SXVOM/IcE3WSqPuwFo2vMU4YXf37ZYugHuB2/JZXJXZJOwcF7l2jOGfH1r2I9112TE
 6paZMFt2l/yUVV7GeHEUANEVjF8LD8odh23YOXL7cKg==
X-Received: by 2002:a1c:3dc4:: with SMTP id
 k187mr10402987wma.167.1574349711882; 
 Thu, 21 Nov 2019 07:21:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqySb9ZwhXcrSGZTnTFX5ITs/qVK8z9OeOvPDmE4FyZUCogUa+d5o5clfV/hdSBv8nnPcYrKmw==
X-Received: by 2002:a1c:3dc4:: with SMTP id
 k187mr10402963wma.167.1574349711644; 
 Thu, 21 Nov 2019 07:21:51 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
 by smtp.gmail.com with ESMTPSA id s9sm3077160wmj.22.2019.11.21.07.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 07:21:51 -0800 (PST)
Date: Thu, 21 Nov 2019 16:21:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 3/6] vsock: add local transport support in the
 vsock core
Message-ID: <20191121152148.slv26oesn25dpjb6@steredhat>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-4-sgarzare@redhat.com>
 <MWHPR05MB3376F4452F0CF38C1AFABA2EDA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR05MB3376F4452F0CF38C1AFABA2EDA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
X-MC-Unique: ZoOnJtOcOtmMOUcCCkPXEg-1
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

On Thu, Nov 21, 2019 at 03:04:18PM +0000, Jorgen Hansen wrote:
> > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > Sent: Tuesday, November 19, 2019 12:01 PM
> > To: netdev@vger.kernel.org
> >
> > This patch allows to register a transport able to handle
> > local communication (loopback).
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  include/net/af_vsock.h   |  2 ++
> >  net/vmw_vsock/af_vsock.c | 17 ++++++++++++++++-
> >  2 files changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> > index 4206dc6d813f..b1c717286993 100644
> > --- a/include/net/af_vsock.h
> > +++ b/include/net/af_vsock.h
> > @@ -98,6 +98,8 @@ struct vsock_transport_send_notify_data {
> >  #define VSOCK_TRANSPORT_F_G2H		0x00000002
> >  /* Transport provides DGRAM communication */
> >  #define VSOCK_TRANSPORT_F_DGRAM		0x00000004
> > +/* Transport provides local (loopback) communication */
> > +#define VSOCK_TRANSPORT_F_LOCAL		0x00000008
> > 
> >  struct vsock_transport {
> >  	struct module *module;
> > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > index cc8659838bf2..c9e5bad59dc1 100644
> > --- a/net/vmw_vsock/af_vsock.c
> > +++ b/net/vmw_vsock/af_vsock.c
> > @@ -136,6 +136,8 @@ static const struct vsock_transport *transport_h2g;
> >  static const struct vsock_transport *transport_g2h;
> >  /* Transport used for DGRAM communication */
> >  static const struct vsock_transport *transport_dgram;
> > +/* Transport used for local communication */
> > +static const struct vsock_transport *transport_local;
> >  static DEFINE_MUTEX(vsock_register_mutex);
> > 
> >  /**** UTILS ****/
> > @@ -2130,7 +2132,7 @@ EXPORT_SYMBOL_GPL(vsock_core_get_transport);
> > 
> >  int vsock_core_register(const struct vsock_transport *t, int features)
> >  {
> > -	const struct vsock_transport *t_h2g, *t_g2h, *t_dgram;
> > +	const struct vsock_transport *t_h2g, *t_g2h, *t_dgram, *t_local;
> >  	int err = mutex_lock_interruptible(&vsock_register_mutex);
> > 
> >  	if (err)
> > @@ -2139,6 +2141,7 @@ int vsock_core_register(const struct
> > vsock_transport *t, int features)
> >  	t_h2g = transport_h2g;
> >  	t_g2h = transport_g2h;
> >  	t_dgram = transport_dgram;
> > +	t_local = transport_local;
> > 
> >  	if (features & VSOCK_TRANSPORT_F_H2G) {
> >  		if (t_h2g) {
> > @@ -2164,9 +2167,18 @@ int vsock_core_register(const struct
> > vsock_transport *t, int features)
> >  		t_dgram = t;
> >  	}
> > 
> > +	if (features & VSOCK_TRANSPORT_F_LOCAL) {
> > +		if (t_local) {
> > +			err = -EBUSY;
> > +			goto err_busy;
> > +		}
> > +		t_local = t;
> > +	}
> > +
> >  	transport_h2g = t_h2g;
> >  	transport_g2h = t_g2h;
> >  	transport_dgram = t_dgram;
> > +	transport_local = t_local;
> > 
> >  err_busy:
> >  	mutex_unlock(&vsock_register_mutex);
> > @@ -2187,6 +2199,9 @@ void vsock_core_unregister(const struct
> > vsock_transport *t)
> >  	if (transport_dgram == t)
> >  		transport_dgram = NULL;
> > 
> > +	if (transport_local == t)
> > +		transport_local = NULL;
> > +
> >  	mutex_unlock(&vsock_register_mutex);
> >  }
> >  EXPORT_SYMBOL_GPL(vsock_core_unregister);
> > --
> > 2.21.0
> 
> Having loopback support as a separate transport fits nicely, but do we need to support
> different variants of loopback? It could just be built in.

I agree with you, indeed initially I developed it as built in, but
DEPMOD found a cyclic dependency because vsock_transport use
virtio_transport_common that use vsock, so if I include vsock_transport
in the vsock module, DEPMOD is not happy.

I don't know how to break this cyclic dependency, do you have any ideas?

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
