Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B194A142CA7
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 14:58:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 47AD58558D;
	Mon, 20 Jan 2020 13:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dATxUqwXe-Si; Mon, 20 Jan 2020 13:58:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE7A6853C5;
	Mon, 20 Jan 2020 13:58:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9A0AC0174;
	Mon, 20 Jan 2020 13:58:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 801B9C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 13:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 66E1D874E0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 13:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5OLgHw723wUV
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 13:58:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BE89086FDE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 13:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579528687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JSGrES7SvQ9BENTP8tuIq46XiUVWki3/yCQVC8wDv3E=;
 b=eQfAWLPB7WbkYcvw7akvc5muzko66Ln5Mc6sP4yeFKT9yYiCMK4TmtN5XtYPlSiBBnKC5N
 NY9AxCRY766vV1Yo0ycTpyXLw6GQKiFIYJyxoRErW++OZPrIiZMdON/+tu3aRws6A4aYHs
 GyOHFHeN9hJPmTBdGm7zaM56H1NRzHs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-6p7BxQXrMiqzJay5rC36gw-1; Mon, 20 Jan 2020 08:58:06 -0500
Received: by mail-wm1-f71.google.com with SMTP id c4so3726434wmb.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 05:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JSGrES7SvQ9BENTP8tuIq46XiUVWki3/yCQVC8wDv3E=;
 b=Yzv+FVBuWhhNiynIcbFybiO/mxf7+rkCN5ETpDkqUqGKqL/kakKL8yJYVhgy3+40iI
 ZRwroDp40cpAe4rpXx22XizBc1jp3t0PwyoaiJ5UXPzdqH3ZEr0RsCj+Otmj1x7GAguy
 llEiY616eij9/+WgLizXvM5nTI8u6q/8CPXpOqYLEW731cr9MKXjNmIkvcZvQPeS5xlg
 CM5Xxh7Bl4ixF00tdyHpE2HFfUbVIEC6zYYBL+p4z3ACLX/JLzk5O90aNG08Tudp3MF5
 5iALv1yLleebwwys4Dkp1lvmlviQWhTsa1jSJbaoqlXYzO+ruvu9GhqeMS0nZuex/gWg
 KvbQ==
X-Gm-Message-State: APjAAAWwXz4WVNmCYrbbDsQlTJYWOd5hyADqHV71AMqQIhab44Uf+Djx
 6y8RAuxwBlsRtpV83xr2Ajs5W5P50VXiiyzvFmIGkzJty4JNQCGm7rbORxdShz9+NB8LoUMMzYo
 +vfTrhU4IIWxLBhSNWO7ogFVd29CNc3x2XhAvAbjM5A==
X-Received: by 2002:a1c:a914:: with SMTP id s20mr19813069wme.189.1579528685023; 
 Mon, 20 Jan 2020 05:58:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6wszqOYoCEpagKH53ZUl7pwL2W60rXYY3qi8C3MZSqVyDhyOnZjTORoRt3i9V4qU4repffg==
X-Received: by 2002:a1c:a914:: with SMTP id s20mr19813038wme.189.1579528684814; 
 Mon, 20 Jan 2020 05:58:04 -0800 (PST)
Received: from steredhat (host84-49-dynamic.31-79-r.retail.telecomitalia.it.
 [79.31.49.84])
 by smtp.gmail.com with ESMTPSA id s8sm46404753wrt.57.2020.01.20.05.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 05:58:04 -0800 (PST)
Date: Mon, 20 Jan 2020 14:58:01 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200120060601-mutt-send-email-mst@kernel.org>
X-MC-Unique: 6p7BxQXrMiqzJay5rC36gw-1
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

On Mon, Jan 20, 2020 at 1:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella wrote:
> > On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > >
> > > > This patch adds 'netns' module param to enable this new feature
> > > > (disabled by default), because it changes vsock's behavior with
> > > > network namespaces and could break existing applications.
> > >
> > > Sorry, no.
> > >
> > > I wonder if you can even design a legitimate, reasonable, use case
> > > where these netns changes could break things.
> >
> > I forgot to mention the use case.
> > I tried the RFC with Kata containers and we found that Kata shim-v1
> > doesn't work (Kata shim-v2 works as is) because there are the following
> > processes involved:
> > - kata-runtime (runs in the init_netns) opens /dev/vhost-vsock and
> >   passes it to qemu
> > - kata-shim (runs in a container) wants to talk with the guest but the
> >   vsock device is assigned to the init_netns and kata-shim runs in a
> >   different netns, so the communication is not allowed
> > But, as you said, this could be a wrong design, indeed they already
> > found a fix, but I was not sure if others could have the same issue.
> >
> > In this case, do you think it is acceptable to make this change in
> > the vsock's behavior with netns and ask the user to change the design?
>
> David's question is what would be a usecase that's broken
> (as opposed to fixed) by enabling this by default.

Yes, I got that. Thanks for clarifying.
I just reported a broken example that can be fixed with a different
design (due to the fact that before this series, vsock devices were
accessible to all netns).

>
> If it does exist, you need a way for userspace to opt-in,
> module parameter isn't that.

Okay, but I honestly can't find a case that can't be solved.
So I don't know whether to add an option (ioctl, sysfs ?) or wait for
a real case to come up.

I'll try to see better if there's any particular case where we need
to disable netns in vsock.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
