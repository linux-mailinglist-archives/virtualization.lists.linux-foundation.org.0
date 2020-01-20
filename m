Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 60064142F2F
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 17:04:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 969F420428;
	Mon, 20 Jan 2020 16:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtLgaGEzeg2B; Mon, 20 Jan 2020 16:04:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5E6B02044E;
	Mon, 20 Jan 2020 16:04:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B409C1D88;
	Mon, 20 Jan 2020 16:04:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 713ADC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 16:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 60ABB85633
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 16:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jx646jYR_AA0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 16:04:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4D9E383754
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579536249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p4ejQ2/oe91bnyA0QOnuHtrCvG5ijZh9PVgfR3T6gU8=;
 b=ZvszC1JBnuRxVBB4Fnd5io/E71okdLn6h3270qtWx9SH89wxtzhMdtI37cFEKCW6zaonzN
 tb+YsfqYp61heIhcr2pyptzjkT9n+Iqzk4dKXjswth364rgKSfvTc9zH2xHjhQWYGOzc4C
 5CMWP7+PV5mvd5zaTx6fKTahI09rZro=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-yf_P7A6iP5CglAE9DrPHUg-1; Mon, 20 Jan 2020 11:04:08 -0500
Received: by mail-qv1-f69.google.com with SMTP id j10so21042891qvi.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p4ejQ2/oe91bnyA0QOnuHtrCvG5ijZh9PVgfR3T6gU8=;
 b=Tk7E5IdnsohRMF49jhIleCUyJNykrRiUGIPLdzY5qlrtylP/11a1B0XOF9uzav3CXo
 QakCTUYPWmZdXwjchqY3rbmF6YwYr5fQouhqRDIgMy1G7hte9ZGpg6p0+/Pu9EpMeyHB
 cX2KHdfdOwcuqNfvRtbVUzKz4So0Nx+g512OmwU5WI7thE+fWwWpuUfxhWFznu4h2DCI
 qgRJggrzD8zGaAlbBVUf5tgrydkoDe3rlMR3KmdXU9to3xwy7m5WlhyalkEVLB0ZFUaI
 eh0AjIVAZLZQSNLGmH5wCSfOgrGn3Lo4GovkGS8MxdB58GNd0OePQ1qZXhttd6Kgz8jz
 F+DA==
X-Gm-Message-State: APjAAAXep2loTG69CkN6f/wxptQZEzvvgHy9OViDsX5K0nFTlVBTff33
 KmRY4f3eJEdKSrvfM8bbiHfKndH2c645UAsFafTXlCpvNA9P2T7S4bbm2jPhCndctveU2RbbSHb
 2Q2WE7ny5JeVwF0bMzwrDlZgDgOCpa74ciz5bdzk+5w==
X-Received: by 2002:aed:2d67:: with SMTP id h94mr14153qtd.74.1579536247742;
 Mon, 20 Jan 2020 08:04:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHYHZZeb/F+oSnPwvaj7ijjCP3wY5WXEKtUs5DPKrE69F2FmzJea/xoQ0/lmBxFbbg2H6+0w==
X-Received: by 2002:aed:2d67:: with SMTP id h94mr14119qtd.74.1579536247441;
 Mon, 20 Jan 2020 08:04:07 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id 68sm16186184qkj.102.2020.01.20.08.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 08:04:06 -0800 (PST)
Date: Mon, 20 Jan 2020 11:04:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <20200120110319-mutt-send-email-mst@kernel.org>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
 <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
X-MC-Unique: yf_P7A6iP5CglAE9DrPHUg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 netdev@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, David Miller <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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

On Mon, Jan 20, 2020 at 02:58:01PM +0100, Stefano Garzarella wrote:
> On Mon, Jan 20, 2020 at 1:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella wrote:
> > > On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > > >
> > > > > This patch adds 'netns' module param to enable this new feature
> > > > > (disabled by default), because it changes vsock's behavior with
> > > > > network namespaces and could break existing applications.
> > > >
> > > > Sorry, no.
> > > >
> > > > I wonder if you can even design a legitimate, reasonable, use case
> > > > where these netns changes could break things.
> > >
> > > I forgot to mention the use case.
> > > I tried the RFC with Kata containers and we found that Kata shim-v1
> > > doesn't work (Kata shim-v2 works as is) because there are the following
> > > processes involved:
> > > - kata-runtime (runs in the init_netns) opens /dev/vhost-vsock and
> > >   passes it to qemu
> > > - kata-shim (runs in a container) wants to talk with the guest but the
> > >   vsock device is assigned to the init_netns and kata-shim runs in a
> > >   different netns, so the communication is not allowed
> > > But, as you said, this could be a wrong design, indeed they already
> > > found a fix, but I was not sure if others could have the same issue.
> > >
> > > In this case, do you think it is acceptable to make this change in
> > > the vsock's behavior with netns and ask the user to change the design?
> >
> > David's question is what would be a usecase that's broken
> > (as opposed to fixed) by enabling this by default.
> 
> Yes, I got that. Thanks for clarifying.
> I just reported a broken example that can be fixed with a different
> design (due to the fact that before this series, vsock devices were
> accessible to all netns).
> 
> >
> > If it does exist, you need a way for userspace to opt-in,
> > module parameter isn't that.
> 
> Okay, but I honestly can't find a case that can't be solved.
> So I don't know whether to add an option (ioctl, sysfs ?) or wait for
> a real case to come up.
> 
> I'll try to see better if there's any particular case where we need
> to disable netns in vsock.
> 
> Thanks,
> Stefano

Me neither. so what did you have in mind when you wrote:
"could break existing applications"?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
