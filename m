Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A75152910
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 11:25:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E2A3838D9;
	Wed,  5 Feb 2020 10:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZRGkf4KgMwq0; Wed,  5 Feb 2020 10:25:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 87EF984906;
	Wed,  5 Feb 2020 10:25:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D214C0174;
	Wed,  5 Feb 2020 10:25:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC084C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D777584353
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2v87kxt1bFIB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:25:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2FD55838D9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580898322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Th0XcpP7r0V6eKsY9PqmpTgUBfuwmqI1knRa/il+Xzw=;
 b=gB2hxMJ5b89/+5BoqxLogqjnDF6dl7TwC0kLP7X0FGlHvfZE+w/0UaGiixSdEulBfpRmW6
 f0IGEN6amfi4rvDHxUuDxnE14DtXAEet8l1wfKZzgMMfLKpvD8OPkXfk+Ijf9DY9s7t0Hq
 pgyZTBMdMiau7WLRLL81ANPy5/ndE7g=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-s4Kq4tdUNOOThH6-BWejQw-1; Wed, 05 Feb 2020 05:25:19 -0500
Received: by mail-qv1-f69.google.com with SMTP id r9so1162926qvs.19
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 02:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Th0XcpP7r0V6eKsY9PqmpTgUBfuwmqI1knRa/il+Xzw=;
 b=JIDAWHlES2zO3k7g4ftVXtoQzgMr/LOip2vXVmCTHS/bdl8gw5vW+p5kdVyhoa+Eux
 h+sR1jvMTreAg6E3aeWrc9Ua8coG7Ctf8euSZ4dI7KcV8iF9oI6MhdjDZ9nuQw1j5SgO
 10dSWIdhoJr5mxsvLgOnN16Ox8DIb5wUgqv3Ivc13cQYQexkpsIn8yFKAcHsqJvkdrZc
 0j4hSEFE9aqFX/GIqeLNf4sx1u1hvYMyro1RPeAQL6BYh6ybBvpITe+8dbWs8HCnsUkh
 BFLetCoBAQYr3O4NHvbXnXmTl/nYTkfgcq6ACVjKsM4xQjFI3aGPrr+WetsKyRAPCgJe
 DCVQ==
X-Gm-Message-State: APjAAAUIBk98f1cIuV8UU5UcM07KqOL14mGkRI5hbGELp24cvvVMeFUQ
 9Hr4HTnzX2ghxNdynR8FOOwL/caXNWJHkfLw4xbQtp4qNZJ4esN3UJNU667sg6Wuqcg4vn8W1xW
 wIvyUfEDiMnqehCr3/4HozJe5iKcpak9kFIMc4rt+1A==
X-Received: by 2002:ac8:4244:: with SMTP id r4mr32591676qtm.169.1580898318700; 
 Wed, 05 Feb 2020 02:25:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxeN9/Sf51A57E2dquqji1cEOs/pPxiQYKvs5cjPgo3kYdFuAUjbxh7yniZG0sAnx3PGUrIfQ==
X-Received: by 2002:ac8:4244:: with SMTP id r4mr32591653qtm.169.1580898318351; 
 Wed, 05 Feb 2020 02:25:18 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id r3sm3957528qtc.85.2020.02.05.02.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 02:25:17 -0800 (PST)
Date: Wed, 5 Feb 2020 05:25:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200205051404-mutt-send-email-mst@kernel.org>
References: <286AC319A985734F985F78AFA26841F73E41F306@shsmsx102.ccr.corp.intel.com>
 <2b388a78-79cd-f99a-6f87-6446dcb4b819@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F367@shsmsx102.ccr.corp.intel.com>
 <605bef3e-373f-f39a-4849-930326564b5b@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F3DE@shsmsx102.ccr.corp.intel.com>
 <bcb69e37-fd84-6397-0ff5-befd99a361dd@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F490@shsmsx102.ccr.corp.intel.com>
 <5b184893-014c-35a1-928b-37b8f4647116@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F562@shsmsx102.ccr.corp.intel.com>
 <ef1dfd46-49c8-8aa9-2a5e-d2ebb2e093f5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ef1dfd46-49c8-8aa9-2a5e-d2ebb2e093f5@redhat.com>
X-MC-Unique: s4Kq4tdUNOOThH6-BWejQw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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

On Wed, Feb 05, 2020 at 10:58:14AM +0100, David Hildenbrand wrote:
> On 05.02.20 10:49, Wang, Wei W wrote:
> > On Wednesday, February 5, 2020 5:37 PM, David Hildenbrand wrote:
> >>>
> >>> Not sure how TCG tracks the dirty bits. But In whatever
> >>> implementation, the hypervisor should have
> >>
> >> There is only a single bitmap for that purpose. (well, the one where KVM
> >> syncs to)
> >>
> >>> already dealt with the race between he current round and the previous
> >> round dirty recording.
> >>> (the race isn't brought by this feature essentially)
> >>
> >> It is guaranteed to work reliably without this feature as you only clear what
> >> *has been migrated*, 
> > 
> > Not "clear what has been migrated" (that skips nothing..)
> > Anyway, it's a hint used for optimization.
> 
> Yes, an optimization that might easily lead to data corruption when the
> two bitmaps are either not in place or don't play along in that specific
> way (and I suspect this is the case under TCG).

So I checked and TCG has two copies too.
Each block has bmap used for migration and also dirty_memory
where pages are marked dirty. See cpu_physical_memory_sync_dirty_bitmap.

So from QEMU POV, there is a callback that tells balloon when it's safe
to request hints. As that affects the bitmap, that must not happen in
parallel with dirty bitmap handling. Sounds like a reasonable
limitation.

The hint can be useful outside migration, but in its current form
needs to then be non-destructive.
E.g. I can imaging userspace calling MADV_SOFT_OFFLINE on the hinted
memory.

Again a flag that tells guest it should wait until used
could be a reasonable expension. If we stick to the shrinker
it's actually implementable easily. With an OOM notifier - I'm not so
sure ...

And a big part of the problem is that after all this time the page
hinting interfaces are still undocumented. Quite sad really :(

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
