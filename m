Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F201AE222
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 18:22:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 60B48226B3;
	Fri, 17 Apr 2020 16:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tk03aj8RnfpD; Fri, 17 Apr 2020 16:22:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2ADF1226CA;
	Fri, 17 Apr 2020 16:22:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BC76C0172;
	Fri, 17 Apr 2020 16:22:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22967C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 16:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1FA4C877B4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 16:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vt82MgqApy06
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 16:22:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5A48C8776E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 16:22:28 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h6so2862707iok.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ogcnit47YIXAtxunXEVjxzeI76FX9vPOmOmk3NbtFIU=;
 b=soEE90lsmd4xHZ/Ijxo4+TnD3HlfrT2/2yv3BkoCSok3pExLriMpMUJtqniIrm0wcH
 2cE3AYagG10Br+53c2mJEbAHNx8zQredvxgCbfQQyR14+sK4Nn7Lld8cRrPsGtqp2aoi
 yMipYoBti4U8XkFR8XmEFL/zp8XOmHXl9FkTazH09FJSkrxCZuH1O41elurDjA1vIKun
 FPyMsCgn08xpuwMuVl58hIiiLzQpteQVnPGrm28vjZlWhyzqvmiNpMr3IAl5qoY1rnjF
 sp2ljtvSWtBzyPBIolesRyv7fpvM14irQhXqZ1p4Rw7gHGoGaQbo36CwVxDkw5k4Ue86
 zK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogcnit47YIXAtxunXEVjxzeI76FX9vPOmOmk3NbtFIU=;
 b=AGa9TyRdE6tSkXjLhQKrc721q+XyiaxJO8+BDCUSEmGufmaR1z7/Z1isNe5fH7g++m
 aLu9Khe+0VWlySDfxq1UGTggopJdMIAhDPTGsoDq+XRophhyc76/OzAT1CE8vC8euhGP
 t1XLqL0tJ7L0i4vSyPcTj3ySzVBU3Ve8o9VNxFLLScuidSH8oaz29s3gO+Lg0QpMo09m
 W+oCIJwc482FUekuEW2IcMaViUECm5SrsLyDQr7nzNGZqIyuB39a9fMCDTIoAOVU4J3O
 J+7Vm6YTE6m4zgnGenoQcXaJB32LQYDpOqCIz4PMUuHeU96F32tlwmCF1n4YRioNOhzX
 KZiQ==
X-Gm-Message-State: AGi0PuYqCcQhHW2cJ6tgFDlCXCZOfHFmAKIxFW9rjwTAfV5vbt9Po2n+
 mlOrZUxfnB35rpcYYDM8l34qyAu+4eMHQCDMVYQ=
X-Google-Smtp-Source: APiQypJQDfdjqUVGh/BpLUBCXH6JMOUTrUcR8k/Hyjcd6Mc1SscvISRLgvSjVaDn3WAtdusEZuCjmjdVYUF0b8nXcdg=
X-Received: by 2002:a5d:894a:: with SMTP id b10mr3932483iot.38.1587140547393; 
 Fri, 17 Apr 2020 09:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
 <20200416180845-mutt-send-email-mst@kernel.org>
 <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
 <20200417021335-mutt-send-email-mst@kernel.org>
 <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
 <20200417044641-mutt-send-email-mst@kernel.org>
 <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
 <20200417051223-mutt-send-email-mst@kernel.org>
 <3447361c-4d07-1785-c59b-8c98ddaebd92@redhat.com>
 <20200417055217-mutt-send-email-mst@kernel.org>
 <1823d9be-d175-6cb5-0c7d-8a68d959a0d5@redhat.com>
In-Reply-To: <1823d9be-d175-6cb5-0c7d-8a68d959a0d5@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Fri, 17 Apr 2020 09:22:16 -0700
Message-ID: <CAKgT0UdV5+yknti+W4jDLmo9CH+BeS82pm9vDcy47nV8pkEwcw@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
To: David Hildenbrand <david@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Fri, Apr 17, 2020 at 3:09 AM David Hildenbrand <david@redhat.com> wrote:
>
>  > What do you call "hinting ends" though? The fact we put
> > a page in the VQ is not a guarantee that it's been consumed
> > by the hypervisor.
> >
>
> I'd say hinting ends once the hypervisor sets FREE_PAGE_REPORT_S_DONE.

The key bit to this is that there are 4 states, and quasi unlimited
command IDs, although I believe the first 2 are matched up to the
states. So the VIRTIO_BALLOON_CMD_ID_DONE is matched up with
FREE_PAGE_REPORT_S_DONE, and CMD_ID_STOP with S_STOP, but really all
it means is that we are done with the current epoch so we need to
flush the memory and move on. The state is more important to the
hypervisor as it will switch to "STOP" while it is synching the dirty
bits, "REQUESTED" once that has been completed and it will increment
the command ID, "START" once the first hint is received with the
matching command ID, and "DONE" once the migration is complete. As
long as it is in the "START" state and the command ID in the hint
matches it will use the information to clear the dirty bits as it runs
in parallel with the migration task.

The piece I think I was missing was that the balloon is staying
(mostly) inflated until the migration is complete. If that is the case
then I suppose we could leave this enabled at least on the guest side,
assuming the balloon doesn't give back too many pages when it hits the
shrinker.

> >
> > I think a strict definition is this:
> > - hint includes a command ID
> > - hint implies "page was unused at some point after guest reading command ID"
> >
> >
> > Hypervisor can use dirty tracking tricks to get from that to
> > "page is unused at the moment".
> >
> >> Whereby X is
> >> currently assumed to be 0, correct?
> >
> >
> >
> > Now we are talking about what's safe to do with the page.
> >
> > If POISON flag is set by hypervisor but clear by guest,
> > or poison_val is 0, then it's clear it's safe to blow
> > away the page if we can figure out it's unused.
> >
> > Otherwise, it's much less clear :)
>
> Hah! Agreed :D

That isn't quite true. The problem is in the case of hinting it isn't
setting the page to 0. It is simply not migrating it. So if there is
data from an earlier pass it is stuck at that value. So the balloon
will see the poison/init on some pages cleared, however I suppose the
balloon doesn't care about the contents of the page. For the pages
that are leaked back out via the shrinker they will be dirtied so they
will end up being migrated with the correct value eventually.

> > I'll have to come back and re-read the rest next week, this
> > is complex stuff and I'm too rushed with other things today.
>
> Yeah, I'm also loaded with other stuff. Maybe Alex has time to
> understand the details as well.

So after looking it over again it makes a bit more sense why this
hasn't caused any issues so far, and I can see why the poison enabled
setup and hinting can work. The problem is I am left wondering what
assumptions we are allowed to leave in place.

1. Can we assume that we don't care about the contents in the pages in
the balloon changing?
2. Can we assume that the guest will always rewrite the page after the
deflate in the case of init_on_free or poison?
3. Can we assume that free page hinting will always function as a
balloon setup, so no moving it over to a page reporting type setup?

If we assume the above 3 items then there isn't any point in worrying
about poison when it comes to free page hinting. It doesn't make sense
to since they essentially negate it. As such I could go through this
patch and the QEMU patches and clean up any associations since the to
are not really tied together in any way.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
