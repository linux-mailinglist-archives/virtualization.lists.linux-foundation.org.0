Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DD81B97AC
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 08:45:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 18345879A3;
	Mon, 27 Apr 2020 06:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFY9oBDDWTT0; Mon, 27 Apr 2020 06:45:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 41E6487941;
	Mon, 27 Apr 2020 06:45:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2283CC0172;
	Mon, 27 Apr 2020 06:45:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0A14C0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 06:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E021084A92
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 06:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMFtklO0LrOO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 06:45:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9F17584F2E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 06:45:34 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 72so24442966otu.1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 23:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A20QEuwcQ3bPQDVPM4YhHWYF19sEEIWz0tIXZgQQNBA=;
 b=BalkiBons2UE9EnQQvEmseyhIVWLB/sob5bQPMy+GUt8Z2piYezrWIejXVxxx4Q/dH
 Q4xxaENXi7koecIHMNxbooAQy+WjXmrFaGe5/d9H+c48dVCrmhlWKGyyZBI5cVu1J39X
 9XT7bFRfpjuo1PXIy7vthX06oAgeubhr088+eHtmKlI+N9MOzqtBtokmimyv0uV5Ue6a
 rFLIsiy13CyFmcKg9b2JCgnzmRTaD0m+RZvGM7D+d6qLm5k77p8uENcI2rLt1jTybPhY
 NY4Uj6XTrUyAGoZCs7U3EvkiII1Z6xaeGPBqzbYvqTd1uy9AwGIwOtdgiAZNJJbgd78e
 c+iw==
X-Gm-Message-State: AGi0PuZ7BuQP6PDH9N8uy6S16Zgu3+c92SaWiFDjn9+/6FAqIsByhztD
 1gAdPDG34nNqLzP6wVmj2mZ+jI5KHLV19z9nAPk=
X-Google-Smtp-Source: APiQypKnNMH9rOhofcKlK7I9omQSdQmvVEfckYI5Sp58zjUJsZuaoc+VBXSc57/r+A1q4uEpYjSTT0Irt0S0re1bJoY=
X-Received: by 2002:a9d:564:: with SMTP id 91mr17254715otw.250.1587969933846; 
 Sun, 26 Apr 2020 23:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200420143229.245488-1-mst@redhat.com>
In-Reply-To: <20200420143229.245488-1-mst@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Apr 2020 08:45:22 +0200
Message-ID: <CAMuHMdWaG5EUsbTOMPkj4i50D40T0TLRvB6g-Y8Dj4C0v7KTqQ@mail.gmail.com>
Subject: Re: [PATCH v4] vhost: disable for OABI
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Earnshaw <Richard.Earnshaw@arm.com>, KVM list <kvm@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Dutt <sudeep.dutt@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Christoph Hellwig <hch@infradead.org>, netdev <netdev@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Ard Biesheuvel <ardb@kernel.org>
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

Hi Michael,

Thanks for your patch!

On Mon, Apr 20, 2020 at 5:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> vhost is currently broken on the some ARM configs.
>
> The reason is that the ring element addresses are passed between
> components with different alignments assumptions. Thus, if
> guest selects a pointer and host then gets and dereferences
> it, then alignment assumed by the host's compiler might be
> greater than the actual alignment of the pointer.
> compiler on the host from assuming pointer is aligned.
>
> This actually triggers on ARM with -mabi=apcs-gnu - which is a
> deprecated configuration. With this OABI, compiler assumes that
> all structures are 4 byte aligned - which is stronger than
> virtio guarantees for available and used rings, which are
> merely 2 bytes. Thus a guest without -mabi=apcs-gnu running
> on top of host with -mabi=apcs-gnu will be broken.
>
> The correct fix is to force alignment of structures - however
> that is an intrusive fix that's best deferred until the next release.
>
> We didn't previously support such ancient systems at all - this surfaced
> after vdpa support prompted removing dependency of vhost on
> VIRTULIZATION. So for now, let's just add something along the lines of
>
>         depends on !ARM || AEABI
>
> to the virtio Kconfig declaration, and add a comment that it has to do
> with struct member alignment.
>
> Note: we can't make VHOST and VHOST_RING themselves have
> a dependency since these are selected. Add a new symbol for that.

Adding the dependencies to VHOST and VHOST_RING themselves is indeed not
sufficient.  But IMHO you should still add VHOST_DPN dependencies t
 these two symbols, so any driver selecting them without fulfilling the
VHOST_DPN dependency will trigger a Kconfig warning.  Else the
issue will be ignored silently.

> We should be able to drop this dependency down the road.
>
> Fixes: 20c384f1ea1a0bc7 ("vhost: refine vhost and vringh kconfig")
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Suggested-by: Richard Earnshaw <Richard.Earnshaw@arm.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
