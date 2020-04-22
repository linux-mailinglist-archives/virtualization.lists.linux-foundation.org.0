Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E81B4916
	for <lists.virtualization@lfdr.de>; Wed, 22 Apr 2020 17:50:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B133285B5D;
	Wed, 22 Apr 2020 15:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gskmQFvmbJIz; Wed, 22 Apr 2020 15:50:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19BFE85ADF;
	Wed, 22 Apr 2020 15:50:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E145EC0175;
	Wed, 22 Apr 2020 15:50:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C479BC0175
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 15:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BF6D687762
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 15:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mww-yvkoFq7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 15:50:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0F7D787532
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 15:50:09 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id r2so2377707ilo.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DDefGlni6iZK2WeewTyZ1P8NTLuPSpq5RqIVP7ee4JE=;
 b=ICO12/Uej+ajxcNReeAOEc1BxdRuAicC5mpQoDCkeL8mBivrDyzD/jj6yBC0g9wzEg
 dFM6DXqZYUg+jzvteC/RvY2TOZB1oGAuCBTFdeoKeEUbOqBWW9hR5l7Dq7YkTQBdPKoE
 YfQQUJ/s+qkkJdkZ4CEMzHrdriryzqkTp0Wd7ipczSOKTpUim8RsIWFk9pGyoHVQmL2t
 eq++wM6t727JcT/fh6zcFSx4QP2QrJ4qB8oeAbhOWkHsYQ83K4Miocgf2PNrIfBLsHom
 C4Hd78u9HDEpH8fn0Ne702dGaO+kXQ6BcMCZSoPTqmnMID+1eYlVif0au+0cT3Id4YZm
 oTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDefGlni6iZK2WeewTyZ1P8NTLuPSpq5RqIVP7ee4JE=;
 b=pC9iGFwuHgUgn7cMhQ4fp/rKnwtK5o/S+fYPdvQ7t9jYeJG11x4UVMb0ozwD5pQ9IQ
 EYkSwkNSHdXM/GZ9cYw0PLus0E5e4dAjAhQh1llhyemZgCivm53ngWy0OOwL6RP1YCP9
 oVGiV42DlfGBd3Xp1rblFGUIBPl+PwlAskiXTx43rCK+cF7/+ul724Pei6Y3F9ww8X89
 VEnsAVfxv9/zzE93aljRH36Q90kk7PAItquOuDeLhIQPBvH2z3xZqg716kDGE9Ewe7KU
 bGoZTsQfrT+cKGCkCh46lwRG4uu//BA/TbVO42wWXk36IUD8RY3OBYPvcZyR5HPpMMXq
 J7iA==
X-Gm-Message-State: AGi0PubXD0Iy/kDnAGuIBK3CvUyRrTNMqCOvnJw6B1QJgV3KqDpcYSE6
 eRlRW0dQbPSCmQ64zOL6RY77iYCd0cWvWdNoJus=
X-Google-Smtp-Source: APiQypLXFA0OL2bRkCtymdjUWypIHwHI5mcEGVoB3xtHVPgyEKEwQ5b2Xd7MFKajmTi0Rz9BR469tbRMg2Izcq2blQo=
X-Received: by 2002:a92:d30c:: with SMTP id x12mr3100397ila.95.1587570608247; 
 Wed, 22 Apr 2020 08:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
 <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
 <20200417021335-mutt-send-email-mst@kernel.org>
 <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
 <20200417044641-mutt-send-email-mst@kernel.org>
 <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
 <20200417051223-mutt-send-email-mst@kernel.org>
 <3447361c-4d07-1785-c59b-8c98ddaebd92@redhat.com>
 <20200417055217-mutt-send-email-mst@kernel.org>
 <1823d9be-d175-6cb5-0c7d-8a68d959a0d5@redhat.com>
 <CAKgT0UdV5+yknti+W4jDLmo9CH+BeS82pm9vDcy47nV8pkEwcw@mail.gmail.com>
 <93ccb738-4480-4c31-69c9-5fc349e2a278@redhat.com>
 <CAKgT0UddMDRvztirfikyhtHX7Jx+GJZoA5uEcGMhpY9Aw2N5dA@mail.gmail.com>
 <238a99b6-d127-c626-19fa-77824bd72d13@redhat.com>
 <CAKgT0Ucn-bKqaL0ML4fcm2W7-tGAkJJt2ExYXnBuP4yp2J-uZQ@mail.gmail.com>
 <cfcd4c7e-7737-21e3-dd31-d291f486d1b1@redhat.com>
 <CAKgT0UcJEfEy7qS-4r9sQxP9ANZ_gG4VEJ__Zkusg_XDfjBuSg@mail.gmail.com>
 <a6c69e10-5acf-f72b-c0fb-d57c39c82b23@redhat.com>
In-Reply-To: <a6c69e10-5acf-f72b-c0fb-d57c39c82b23@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 22 Apr 2020 08:49:57 -0700
Message-ID: <CAKgT0UdGOd_A0+Zp7Dwjp9ZaBDsdyHF_te=VfSHOR4KsWXZ-ng@mail.gmail.com>
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

On Wed, Apr 22, 2020 at 3:24 AM David Hildenbrand <david@redhat.com> wrote:
>
> >>> What is the expectation there? I assume we are saying either
> >>> poison_val or unmodified? If so I would think the inflate case makes
> >>> much more sense as that is where the madvise is called that will
> >>> discard the data. If so it would be pretty easy to just add a check
> >>> for the poison value to the same spot we check
> >>> qemu_balloon_is_inhibited.
> >>
> >> Okay, we have basically no idea what was the intention of
> >> VIRTIO_BALLOON_F_PAGE_POISON with basic deflation/inflation as well. So
> >> I think we can define what suits us.
> >>
> >> On the deflate path, we could always simply fill with poison_val. But
> >> there are nasty corner cases (esp. no VIRTIO_BALLOON_F_MUST_TELL_HOST).
> >>
> >> What would be your suggestion? Also don't care about
> >> VIRTIO_BALLOON_F_PAGE_POISON on ordinary inflation/deflation? At this
> >> point, I think this makes sense.
> >
> > That is kind of what I was thinking. The problem is that once again
> > the current implementation works when page poisoning is enabled. Us
> > disabling that wouldn't make much sense.
> >
> > The whole thing with the reporting is that we are essentially just
> > ballooning in place. What we may do at some point in the future would
> > be to add an additional feature bit to do that for the standard
> > balloon/hinting case. Then when that is set, and we know the contents
> > won't match we can then just skip the madvise or hinting calls. That
> > way it becomes an opt-in which is what the poison was supposed to be,
> > but wasn't because the QEMU side was never implemented.
>
> Yeah, introducing this later makes sense.
>
> So VIRTIO_BALLOON_F_PAGE_POISON really means:
> - poison_val in the config is unlocked
> - when active, the guest is using page poisoning/init on free with
>   poison_val ("for you information")
> - it only changes the semantic of free page reporting, nothing else.
>   (when reusing reported pages in the guest, they will either have the
>   old content, or will be filled with poison_val.)
>
> Makes sense? That should be easy to document.

Yep, makes sense. In theory the old content or being filled with
poison_val should be the same thing.

> >
> > In the meantime I still have to make more changes to my QEMU patch
> > set. The way the config_size logic is implemented is somewhat of a
> > pain when you factor in the way the host_features and poison were
> > handled.
>
> Okay, I'll wait for updated QEMU patches.

I got to the root cause of the issues I was seeing. The config size
being dependent on the page poison feature was somewhat problematic as
it affects where I can place the setting of the bit since I have to
have it done before we call virtio_init. I should be submitting the
patches this afternoon. I am just going through and making sure I have
my bases covered and testing for any corner cases.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
