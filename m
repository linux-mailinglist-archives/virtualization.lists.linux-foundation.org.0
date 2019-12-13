Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF711E11F
	for <lists.virtualization@lfdr.de>; Fri, 13 Dec 2019 10:47:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5477B8836A;
	Fri, 13 Dec 2019 09:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wsU8Y3m8IWA; Fri, 13 Dec 2019 09:47:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9EB9A8863B;
	Fri, 13 Dec 2019 09:47:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84E27C0881;
	Fri, 13 Dec 2019 09:47:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54E34C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 09:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 500B12050F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 09:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11W2wjo3YB0h
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 09:47:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 9099120497
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 09:47:19 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r27so5738186otc.8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 01:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LrgOuy/9sPvzhX64/ManuYWOHaw5/qKpeJcMH1l0dJw=;
 b=py7ETDLHzzwA4LMjoPAbUfx69/b0I/PdIIQUOOO8yelHdiT1UdDTDcYU3puG82JmH/
 LCX22DMcJfkzjQsH7sbwnCmEiAW2kReF83UaZdXJh/mhXnrOPyayviOnilc4xeYOWTeV
 mHZzo9mqojsJG/q7lXRT026PAGhQPxqcTgfXp45wr5rkYTms9A9XBEerd3vg5zwf6a3s
 sd+t2MGm4S4HcXmFTPAC01kMXCK5BIcyTy9tTTdfKGp7sckymo9RfZ1/l2/nM4B2fkS1
 2p+C/losMWymevyG656My9crpqloxRumBew4Lb/GabDHzpWjfRHP/FBHYIXgMYEJMzI2
 jsNg==
X-Gm-Message-State: APjAAAU4hE1Cd1eI/+wFc8Wz8bkpglciiqWNLh7damXyLkmrBFHYYK6m
 F0Nqbn+/TjtTsL/4Lzw9qt5Y5wcU+GSU0awLrgA=
X-Google-Smtp-Source: APXvYqyTYrRZu/3wd+jVnsU9fJlU3qWbi4XDyl6SoSVPdfbCj6mQh4LJVDI5doZGlsmV/j5Q03mkCLX7+C1j0mvjiyg=
X-Received: by 2002:a05:6830:18cd:: with SMTP id
 v13mr13098278ote.118.1576230438826; 
 Fri, 13 Dec 2019 01:47:18 -0800 (PST)
MIME-Version: 1.0
References: <20191212171137.13872-1-david@redhat.com>
 <20191212171137.13872-2-david@redhat.com>
 <5687328.t4MNS9KDDX@kreacher>
 <ec81db03-b970-420a-9c1b-29849b5e8902@redhat.com>
In-Reply-To: <ec81db03-b970-420a-9c1b-29849b5e8902@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 13 Dec 2019 10:47:07 +0100
Message-ID: <CAJZ5v0iqgnhOF1UQQBfv7C_b5RyoAz=U3JYLt3a0U+UnZ48DUA@mail.gmail.com>
Subject: Re: [PATCH RFC v4 01/13] ACPI: NUMA: export pxm_to_node
To: David Hildenbrand <david@redhat.com>
Cc: virtio-dev@lists.oasis-open.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 Len Brown <lenb@kernel.org>
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

On Fri, Dec 13, 2019 at 10:41 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 12.12.19 22:43, Rafael J. Wysocki wrote:
> > On Thursday, December 12, 2019 6:11:25 PM CET David Hildenbrand wrote:
> >> Will be needed by virtio-mem to identify the node from a pxm.
> >>
> >> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> >> Cc: Len Brown <lenb@kernel.org>
> >> Cc: linux-acpi@vger.kernel.org
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>  drivers/acpi/numa/srat.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
> >> index eadbf90e65d1..d5847fa7ac69 100644
> >> --- a/drivers/acpi/numa/srat.c
> >> +++ b/drivers/acpi/numa/srat.c
> >> @@ -35,6 +35,7 @@ int pxm_to_node(int pxm)
> >>              return NUMA_NO_NODE;
> >>      return pxm_to_node_map[pxm];
> >>  }
> >> +EXPORT_SYMBOL(pxm_to_node);
> >>
> >>  int node_to_pxm(int node)
> >>  {
> >>
> >
> > This is fine by me FWIW.
>
> Can I count that as an Acked-by and carry it along? Thanks!

Yes, please.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
