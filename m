Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDA9143BDE
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 12:15:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B873585E47;
	Tue, 21 Jan 2020 11:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yM7tvNSinYl1; Tue, 21 Jan 2020 11:15:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C943B85E07;
	Tue, 21 Jan 2020 11:15:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6793C1D88;
	Tue, 21 Jan 2020 11:15:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AAF7C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 11:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 85C8B204DB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 11:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebFfWKZfe64q
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 11:15:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id A5A55203FC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579605301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sas8QSfTms5SHYNUYcSN2fpX+ktGIKgMkg1A/nzCkbg=;
 b=TVr/x9VTQxxaRZNOrHwkjjloYXttORC0fuSzPn8cvznGr+7QAZSS+99urPsX24C7OCqfUw
 fQt/HsKi1lM2WXfigUA/qpSY8eQ4lfRyv+A/ZdV06HlWpRi8+Shs64QarNfa10ichhycZN
 E21sjH8kD1B7NtMxQxO4VxaZ4gfaKNU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-IuEa_HvJM9S_OVto6tZJxA-1; Tue, 21 Jan 2020 06:14:56 -0500
Received: by mail-qt1-f200.google.com with SMTP id e8so1665014qtg.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 03:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sas8QSfTms5SHYNUYcSN2fpX+ktGIKgMkg1A/nzCkbg=;
 b=V+r7+eGdN5fYLMe+mCEc7/dFBpAN4f1WMF0Wyr3foTlcRdQKme8+7ocXjxgnb7oLO0
 mZ7XxbLbWVF08tl3jKQLsp3Luf+rh3nZPyhXrfYyimBYaUSkfD/79oEnf7Prn+YH3ZsB
 vvfhG1oj6jwAUVPXRHbuPJwhhUFw5Ch44Kg6vygtx1rhKKFTKt5v602Nds05IGbqvKmf
 X7Kpi2elQ9W6bROn1bEfO7tLWLZ9OWzb5NBGrh+jHv97SZ5NOrtAmP8ZmomBRNbD7xCL
 exbmhA2FHTl8j9TDVQXaAgHULIinAfK9mazSiikMtfixD52us2ys1RyRnfsVB3Cxe5aH
 8Byg==
X-Gm-Message-State: APjAAAW/KsWlETu8Hj+1JqmzSq5pv9d68o7UL0C7SEbq1a48ccoD7HtC
 Z5Bjmt3IzAhvUgklmClbojmhtPbSmCOvmB/7x8m7XDzBIh2C9SsKzwnP4i1oAJ1KdqBwLbtxM+6
 4ODrbO8kmfDWBKE2TRP91y9Vn+ta6yX5onAvLFevOYA==
X-Received: by 2002:aed:2a12:: with SMTP id c18mr3777314qtd.200.1579605296052; 
 Tue, 21 Jan 2020 03:14:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBa53GZjQgDfeEt/mKYlPCXxhcFat/NW2g7/j2dAOcNMjdacdZ6bp3qye4cVZNWRDKUgo3aw==
X-Received: by 2002:aed:2a12:: with SMTP id c18mr3777280qtd.200.1579605295708; 
 Tue, 21 Jan 2020 03:14:55 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id k133sm428981qke.134.2020.01.21.03.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 03:14:54 -0800 (PST)
Date: Tue, 21 Jan 2020 06:14:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <20200121055403-mutt-send-email-mst@kernel.org>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
 <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
 <20200120110319-mutt-send-email-mst@kernel.org>
 <CAGxU2F5=DQJ56sH4BUqp_7rvaXSF9bFHp4QkpLApJQK0bmd4MA@mail.gmail.com>
 <20200120170120-mutt-send-email-mst@kernel.org>
 <CAGxU2F4uW7FNe5xC0sb3Xxr_GABSXuu1Z9n5M=Ntq==T7MaaVw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F4uW7FNe5xC0sb3Xxr_GABSXuu1Z9n5M=Ntq==T7MaaVw@mail.gmail.com>
X-MC-Unique: IuEa_HvJM9S_OVto6tZJxA-1
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

On Tue, Jan 21, 2020 at 10:07:06AM +0100, Stefano Garzarella wrote:
> On Mon, Jan 20, 2020 at 11:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Mon, Jan 20, 2020 at 05:53:39PM +0100, Stefano Garzarella wrote:
> > > On Mon, Jan 20, 2020 at 5:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > On Mon, Jan 20, 2020 at 02:58:01PM +0100, Stefano Garzarella wrote:
> > > > > On Mon, Jan 20, 2020 at 1:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella wrote:
> > > > > > > On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> > > > > > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > > > > > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > > > > > > >
> > > > > > > > > This patch adds 'netns' module param to enable this new feature
> > > > > > > > > (disabled by default), because it changes vsock's behavior with
> > > > > > > > > network namespaces and could break existing applications.
> > > > > > > >
> > > > > > > > Sorry, no.
> > > > > > > >
> > > > > > > > I wonder if you can even design a legitimate, reasonable, use case
> > > > > > > > where these netns changes could break things.
> > > > > > >
> > > > > > > I forgot to mention the use case.
> > > > > > > I tried the RFC with Kata containers and we found that Kata shim-v1
> > > > > > > doesn't work (Kata shim-v2 works as is) because there are the following
> > > > > > > processes involved:
> > > > > > > - kata-runtime (runs in the init_netns) opens /dev/vhost-vsock and
> > > > > > >   passes it to qemu
> > > > > > > - kata-shim (runs in a container) wants to talk with the guest but the
> > > > > > >   vsock device is assigned to the init_netns and kata-shim runs in a
> > > > > > >   different netns, so the communication is not allowed
> > > > > > > But, as you said, this could be a wrong design, indeed they already
> > > > > > > found a fix, but I was not sure if others could have the same issue.
> > > > > > >
> > > > > > > In this case, do you think it is acceptable to make this change in
> > > > > > > the vsock's behavior with netns and ask the user to change the design?
> > > > > >
> > > > > > David's question is what would be a usecase that's broken
> > > > > > (as opposed to fixed) by enabling this by default.
> > > > >
> > > > > Yes, I got that. Thanks for clarifying.
> > > > > I just reported a broken example that can be fixed with a different
> > > > > design (due to the fact that before this series, vsock devices were
> > > > > accessible to all netns).
> > > > >
> > > > > >
> > > > > > If it does exist, you need a way for userspace to opt-in,
> > > > > > module parameter isn't that.
> > > > >
> > > > > Okay, but I honestly can't find a case that can't be solved.
> > > > > So I don't know whether to add an option (ioctl, sysfs ?) or wait for
> > > > > a real case to come up.
> > > > >
> > > > > I'll try to see better if there's any particular case where we need
> > > > > to disable netns in vsock.
> > > > >
> > > > > Thanks,
> > > > > Stefano
> > > >
> > > > Me neither. so what did you have in mind when you wrote:
> > > > "could break existing applications"?
> > >
> > > I had in mind:
> > > 1. the Kata case. It is fixable (the fix is not merged on kata), but
> > >    older versions will not work with newer Linux.
> >
> > meaning they will keep not working, right?
> 
> Right, I mean without this series they work, with this series they work
> only if the netns support is disabled or with a patch proposed but not
> merged in kata.
> 
> >
> > > 2. a single process running on init_netns that wants to communicate with
> > >    VMs handled by VMMs running in different netns, but this case can be
> > >    solved opening the /dev/vhost-vsock in the same netns of the process
> > >    that wants to communicate with the VMs (init_netns in this case), and
> > >    passig it to the VMM.
> >
> > again right now they just don't work, right?
> 
> Right, as above.
> 
> What do you recommend I do?
> 
> Thanks,
> Stefano

If this breaks userspace, then we need to maintain compatibility.
For example, have two devices, /dev/vhost-vsock and /dev/vhost-vsock-netns?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
