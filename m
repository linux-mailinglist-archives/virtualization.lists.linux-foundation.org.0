Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C91AD379
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 01:53:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C7BB420526;
	Thu, 16 Apr 2020 23:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMnqooxj+R6f; Thu, 16 Apr 2020 23:52:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ED27D20425;
	Thu, 16 Apr 2020 23:52:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA741C1D88;
	Thu, 16 Apr 2020 23:52:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 150C2C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 23:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 04CED20526
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 23:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WtkCTlomjw6k
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 23:52:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 27C0B20425
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 23:52:54 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id t10so401669ilg.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 16:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nt8xfqR64UrmXiwp5NR+nTreG2PqVtfy4dHeLkjhcpE=;
 b=VeNj9oRPYH3SFxtQLV7byl4YU1VnfR++Iy6t+91wAOhbTwYWz+P4B2Ns9MNhSWzLnn
 mm4LEMmxR4/KE3/cJINY1u6QA7pAhbmHEQWxlf8AljsV52LbMu3olNpv10VoSlHWTAD4
 ak+QwHwFFhQCPHFVkw7tg9YTbqu8+oIYX/KLjIA9sehGTZcBKzR0Uoj4MphpsSSdxTK5
 H8oO9n1joLeRTj/wgLrzZ7Rv/eZk6dQXHaXnP/wmZDN5rFMLxYrzg9uXg1gLUdwbr5t2
 mSMAdH8zxSp9RYNFuU2PSQVDHR0F1SxByTjdKNUHkVMHs23b9lKqF+ozJy1ZjgRQARZK
 evzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nt8xfqR64UrmXiwp5NR+nTreG2PqVtfy4dHeLkjhcpE=;
 b=mclZPLqvqnlGOpA2s9EptH2I55VYKW6VFNB0im3VTqPTXYVHqMMD2pq91k1Pbyo0aU
 NTK6vdgZb2EVZYb2fIZfK3kNOCby2/82mgiEVY12OrgH+SiGEjQlGYhG9pCVYkvhRPs6
 ZUIoLWtu800KkAeEwnDFU5HyEmImchPys5Wr6bymwy+c+B4zSCWC9XilCCNxtby9o7wN
 WV7+6AiaF++XZKZfIoWnCSPV1wsN+nPd4z9oMz7UKOlkZggilN67SxzGY837SDMuiehf
 Zvn4tV46zD3Xcux/gyV+jTn0dNb88zpXCFHHnmf7YqUK4k2eLT3bvwxXfKEmCMiGZ/ce
 bFFw==
X-Gm-Message-State: AGi0PuatcQRnO9upYmm4Te4O2qHm6L8rC51yq1CC3CsdXKFzM+pe2m7S
 mOMmue6Uoqa5FftCyyxx3pm/lQQwQUoIuKGHXvU=
X-Google-Smtp-Source: APiQypLlQL6E01xxcXAgg2+zj3xzbg7JHckudvEdBUyLrUuBILAZ20HmAL+sC5iR/KMAwwj5+qUluduay2nrPNXZqio=
X-Received: by 2002:a92:584b:: with SMTP id m72mr338579ilb.95.1587081173324;
 Thu, 16 Apr 2020 16:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
 <20200416180845-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200416180845-mutt-send-email-mst@kernel.org>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Thu, 16 Apr 2020 16:52:42 -0700
Message-ID: <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
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

On Thu, Apr 16, 2020 at 3:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Apr 16, 2020 at 12:30:38PM -0700, Alexander Duyck wrote:
> > From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >
> > If we have free page hinting or page reporting enabled we should disable it
> > if the pages are poisoned or initialized on free and we cannot notify the
> > hypervisor.
> >
> > Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> >
> > Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>
>
> Why not put this logic in the hypervisor?

I did that too. This is to cover the case where somebody is running
the code prior to my QEMU changes where the page poison feature wasn't
being enabled.

> We don't know what hypervisor uses the hints for.

I agree, but at the same time the way the feature was originally coded
it was only checked if the FREE_PAGE_HINT feature was enabled. The
assumption there is that if we have page poison data and want to use
hints we need to report it. In my mind if we ever want to switch over
to the page reporting style setup for page hinting in the future we
will need to have it behave in a sane manner. So disabling it if we
have a poison value we need to report, but have no mechanism to report
it makes sense to me.

The actual likelihood of us encountering this case should be pretty
low anyway since it is not that common to have page poisoning or
init_on_free enabled.

> Yes you can not just drop them but you can maybe do
> other things such as MADV_SOFT_OFFLINE.
>
> Finally, VIRTIO_BALLOON_F_FREE_PAGE_HINT does nothing
> at all unless guest gets the command from hypervisor,
> so there isn't even any overhead.

The problem is we cannot communicate the full situation to the
hypervisor without the page poison feature being present. As such I
would worry about that backfiring on us due to the hypervisor acting
on incomplete data.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
