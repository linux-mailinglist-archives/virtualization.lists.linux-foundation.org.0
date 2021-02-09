Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AD315236
	for <lists.virtualization@lfdr.de>; Tue,  9 Feb 2021 15:58:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 174AF864D7;
	Tue,  9 Feb 2021 14:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQSj+4KpNNs7; Tue,  9 Feb 2021 14:58:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 20EB18650D;
	Tue,  9 Feb 2021 14:58:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7360C013A;
	Tue,  9 Feb 2021 14:58:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DA43C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 14:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 424B385EC0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 14:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41_aClhqoSxj
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 14:58:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 34A8685B73
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 14:58:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y18so24057623edw.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Feb 2021 06:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WjnZ+lf0rzSbGvVNdx0+PwHC+l7Tql3OkLWocDuesLs=;
 b=cf7YjV4V97+iHjta9sBgI8VIOhq59EpYYWI8W5NFHlLUhaj8GpY8OCq/OQK5RzvGTu
 Mrm0B+m+XH5DbEN8+MuB4g5TYORFUkXL9e+XXdi7svUBVrpBX0VsFRoWt8o0avyx9hOA
 b/qgEbqqRA4kRp2MVFJQ/XbiPuiRrdSKRMcmHDKhbuAE3WuBhTuoYFil2mcoQIOWG9pO
 gxXdQfyKVw8BB+b1jX3b3AOtT2QlVcxX/n28KWWiWYyjaDrngulCGvXpRO7b8I/uhr1D
 tznFEUXxAT9v17LpACdM4UeJmVtxSK5ROeOwQ//35wgN0tt2PavUsIhG+uRA/Orrx0es
 rHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WjnZ+lf0rzSbGvVNdx0+PwHC+l7Tql3OkLWocDuesLs=;
 b=DfNIwE6swJy+x76SdSwnfiC+si1DQ/aftO9Nu24WguBPtqvwIiqeaJ1+dJt4r5lj6X
 EgVbE5FIIn461y3PDUtAAESqyFTX7gG7SihqxkrQ6SoYLJMPHjOT/rD4oKaOUqaK42eE
 lq3fsEOK04mPiuRR6Ib9qAVlOiaru1vLDTIVBhvdHOkkdYzl7pxCiGZ3EGfP5HbXa/U7
 C17GtnPiQbk+fSc5zd4Zkq+CzsHMbHunGxRiuJ4V8VTIyzbSxspqK4F5sf0UqpMajvd9
 t0VAgZtvfbQF34YP6h4SgmoQqMb9j9Pq9K/ypgYeyOkL8VJzwFw5gkZmOAnWmecOoUxI
 RW0A==
X-Gm-Message-State: AOAM531+DqL0Wm1iJb3SRNerYq/mbvAguRuF/ggMhBx7IonHcQy8Fr7R
 73eSfCaXlMLdEVmnHlesrdE5USLXu6a9y6kfTmA=
X-Google-Smtp-Source: ABdhPJxYq2+RUn1P0fxzlzX2fq91sYF4YIs7eek67HXUOblGnok6ui3pgm0DuhjNESCzrzsQYYPInSV5sKw7e+Go2Gk=
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr23500453edb.285.1612882721778; 
 Tue, 09 Feb 2021 06:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20210129002136.70865-1-weiwan@google.com>
 <a0b2cb8d-eb8f-30fb-2a22-678e6dd2f58f@redhat.com>
 <CAF=yD-+aPBF2RaCR8L5orTM37bf7Z4Z8Qko2D2LZjOz0khHTUg@mail.gmail.com>
 <3a3e005d-f9b2-c16a-5ada-6e04242c618e@redhat.com>
 <CAF=yD-+NVKiwS6P2=cS=gk2nLcsWP1anMyy4ghdPiNrhOmLRDw@mail.gmail.com>
 <9b0b8f2a-8476-697e-9002-e9947e3eab63@redhat.com>
 <CA+FuTScVOuoHKtrdrRFswjA3Zq1-7sgMVhnP2iMB5sYFFS8NFg@mail.gmail.com>
 <50ae0b71-df87-f26c-8b4d-8035f9f6a58d@redhat.com>
 <CAF=yD-J5-60D=JDwvpecjaO6J03SZHoHJyCsR3B1HbP1-jbqng@mail.gmail.com>
 <00de1b0f-f2aa-de54-9c7e-472643400417@redhat.com>
In-Reply-To: <00de1b0f-f2aa-de54-9c7e-472643400417@redhat.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 9 Feb 2021 09:58:04 -0500
Message-ID: <CAF=yD-K9xTBStGR5BEiS6WZd=znqM_ENcj9_nb=rrpcMORqE8g@mail.gmail.com>
Subject: Re: [PATCH net] virtio-net: suppress bad irq warning for tx napi
To: Jason Wang <jasowang@redhat.com>
Cc: Network Development <netdev@vger.kernel.org>, Wei Wang <weiwan@google.com>,
 virtualization@lists.linux-foundation.org, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
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

> >>> I have no preference. Just curious, especially if it complicates the patch.
> >>>
> >> My understanding is that. It's probably ok for net. But we probably need
> >> to document the assumptions to make sure it was not abused in other drivers.
> >>
> >> Introduce new parameters for find_vqs() can help to eliminate the subtle
> >> stuffs but I agree it looks like a overkill.
> >>
> >> (Btw, I forget the numbers but wonder how much difference if we simple
> >> remove the free_old_xmits() from the rx NAPI path?)
> > The committed patchset did not record those numbers, but I found them
> > in an earlier iteration:
> >
> >    [PATCH net-next 0/3] virtio-net tx napi
> >    https://lists.openwall.net/netdev/2017/04/02/55
> >
> > It did seem to significantly reduce compute cycles ("Gcyc") at the
> > time. For instance:
> >
> >      TCP_RR Latency (us):
> >      1x:
> >        p50              24       24       21
> >        p99              27       27       27
> >        Gcycles         299      432      308
> >
> > I'm concerned that removing it now may cause a regression report in a
> > few months. That is higher risk than the spurious interrupt warning
> > that was only reported after years of use.
>
>
> Right.
>
> So if Michael is fine with this approach, I'm ok with it. But we
> probably need to a TODO to invent the interrupt handlers that can be
> used for more than one virtqueues. When MSI-X is enabled, the interrupt
> handler (vring_interrup()) assumes the interrupt is used by a single
> virtqueue.

Thanks.

The approach to schedule tx-napi from virtnet_poll_cleantx instead of
cleaning directly in this rx-napi function was not effective at
suppressing the warning, I understand.

It should be easy to drop the spurious rate to a little under 99%
percent, if only to suppress the warning. By probabilistically
cleaning in virtnet_poll_cleantx only every 98/100, say. But that
really is a hack.

There does seem to be a huge potential for cycle savings if we can
really avoid the many spurious interrupts.

As scheduling napi_tx from virtnet_poll_cleantx is not effective,
agreed that we should probably look at the more complete solution to
handle both tx and rx virtqueues from the same IRQ.

And revert this explicit warning suppression patch once we have that.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
