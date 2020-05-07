Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC71C8861
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 13:34:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6202C89430;
	Thu,  7 May 2020 11:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJhqr60uj4my; Thu,  7 May 2020 11:34:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D561189389;
	Thu,  7 May 2020 11:34:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDB20C07FF;
	Thu,  7 May 2020 11:34:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F5A7C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 59A8D89389
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8AAb3XpOGHm1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:34:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B02018934C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588851293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eqvOBlgVIEs8Gtl6xmPaDqDCYhUqYo/jU6Ly/l67Miw=;
 b=b9sh/ViF78+Ie46oAG+ViNrAHkq3LfepixJ868NikyxEJx9prhfy5G/jL61eqAmY8lHOnS
 zWUmG/eWAgKOpoR6p/gCJkXuVRpew/J9P0uokIO+yEy5FYfXxWuF1b2cEtv5ZsbmqULaaE
 bIvkFLcK8Q1Z8dpaBJGllST9SuLTvas=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-VNoA9-v6P-yaq9S6ebSpnw-1; Thu, 07 May 2020 07:34:52 -0400
X-MC-Unique: VNoA9-v6P-yaq9S6ebSpnw-1
Received: by mail-wm1-f69.google.com with SMTP id a206so176113wmh.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 07 May 2020 04:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eqvOBlgVIEs8Gtl6xmPaDqDCYhUqYo/jU6Ly/l67Miw=;
 b=D/dfD/rGNGgGqFHWDqtW/zDpqOmcHppz6pHiW7QfIE3wsormApjaCb6NuN/w1jAMvc
 gZ+lIm3zfE3RwtUDfI1eNnmDMn2Ggoclqhm2x1oRZEp7vz1W2ynea/0KYn5eZHhmti0v
 kERtWD85l5G3Q4eb//PO1Cw9LVThcyg/+rGi9HFIAlIw2imv/6O/5FWJoHT+KFCwSiYu
 +X8lzpV3WYonzBasDQGi+UxSBezIvwaFeNBBmOzDBQEhZfDjo8fQLZqOXVRzcS/kLQ5d
 C4OoWzX222xLhd4x1NRLME6uWmEHt3JXPtARXkfYujTClqh0gF45w8opr3Ht3fKqPDNm
 54nA==
X-Gm-Message-State: AGi0Pubn9gcWOcqMhI3iHaHIugmRXl53IXrF/KmfQHQLG+kjvJyyL0w8
 y4luAVm8f69NES81Q1REoh+/xE+Bh3YpAD0NUYM1B6QSpsEkIunJn79gFWyS41Wv8bVKaGJApCC
 XROuFYnrLqaPLNzmcw9Hvr2qQQdVa4pswVn4RUR4k5w==
X-Received: by 2002:a1c:e910:: with SMTP id q16mr396234wmc.158.1588851290756; 
 Thu, 07 May 2020 04:34:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypIEJon7vaENbs1OmaRUfHXUhggPEYtcAd12YfpgMWFk8LZpYJx8EDfrRw7rVSkow6cjB/BCLg==
X-Received: by 2002:a1c:e910:: with SMTP id q16mr396213wmc.158.1588851290530; 
 Thu, 07 May 2020 04:34:50 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 k4sm3182951wmf.41.2020.05.07.04.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 04:34:49 -0700 (PDT)
Date: Thu, 7 May 2020 07:34:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 07/15] mm/memory_hotplug: Introduce
 offline_and_remove_memory()
Message-ID: <20200507073408-mutt-send-email-mst@kernel.org>
References: <20200507103119.11219-1-david@redhat.com>
 <20200507103119.11219-8-david@redhat.com>
 <20200507064558-mutt-send-email-mst@kernel.org>
 <a915653f-232e-aa13-68f7-f988704fa84c@redhat.com>
 <441bfb92-ecfa-f54e-3661-b219ea166e55@redhat.com>
MIME-Version: 1.0
In-Reply-To: <441bfb92-ecfa-f54e-3661-b219ea166e55@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Oscar Salvador <osalvador@suse.com>, virtio-dev@lists.oasis-open.org,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>,
 Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org,
 Dan Williams <dan.j.williams@intel.com>
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

On Thu, May 07, 2020 at 01:33:23PM +0200, David Hildenbrand wrote:
> >> I get:
> >>
> >> error: sha1 information is lacking or useless (mm/memory_hotplug.c).
> >> error: could not build fake ancestor
> >>
> >> which version is this against? Pls post patches on top of some tag
> >> in Linus' tree if possible.
> > 
> > As the cover states, latest linux-next. To be precise
> > 
> > commit 6b43f715b6379433e8eb30aa9bcc99bd6a585f77 (tag: next-20200507,
> > next/master)
> > Author: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date:   Thu May 7 18:11:31 2020 +1000
> > 
> >     Add linux-next specific files for 20200507
> > 
> 
> The patches seem to apply cleanly on top of
> 
> commit a811c1fa0a02c062555b54651065899437bacdbe (linus/master)
> Merge: b9388959ba50 16f8036086a9
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Wed May 6 20:53:22 2020 -0700
> 
>     Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net

Because you have the relevant hashes in your git tree not pruned yet.
Do a new clone and they won't apply.

> 
> I can resend based on that, after giving it a short test.
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
