Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B51520AB
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 19:56:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A0B142000B;
	Tue,  4 Feb 2020 18:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJbEOvlHSCVH; Tue,  4 Feb 2020 18:56:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B2C672013C;
	Tue,  4 Feb 2020 18:56:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94ED6C0174;
	Tue,  4 Feb 2020 18:56:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26136C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 18:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0665984D7A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 18:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N30yTFtB-YCZ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 18:56:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 14A8D84BBE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 18:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580842592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4UL03Ngw1wLHOkddctR7bXNoO5wNrK3jmzw6BCHLfT4=;
 b=FE4vQGSpb4zi6CofSJ0rlR4ssFMk+Fku5vw6qQXSmqTLgZLllEuLFXcrT7M+E4uOWrT3ie
 p+tlsk+FDcki/aNVfOk9j9POU8G+bhPBl8rcnVZZhBFIc/wirNCF6STl/rhU1rGzBN/Hpo
 c3FQe6psy1zDK8iyuvcB89NdNyQb5jU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-NTPZBxvoNmqgUWzBqbjybw-1; Tue, 04 Feb 2020 13:56:27 -0500
Received: by mail-qk1-f200.google.com with SMTP id z21so1700925qki.18
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 10:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nh+DZ4Y0u+XTvfkHliPjLCQG0zaBs8Iokr4BO5qL5oE=;
 b=dAr/dACJ1ao6JFuk78F2XF52slbrkFQg6bnOwBiZp6SD84P+RTpOy3ASqESyL9U7uy
 1gjnazUfPGKzScZtPSGj7/P6w/KUCmEx3J+uAqZzolYQdBffyMcOvf4K5baZb/vu1qMY
 dhg264donhAifRllNe0Xu0lQyhbQgKloKr551ttaxeX9HW4nM9gYrgU/qnA+DbILUueP
 UQXyIAto14I20VxrJkZdysV+0ftrFOqYfPxdwDS5Ezc4/EqdNeKbJm4kSemeEZ+LThg+
 1rjA9XE8uzbPWWZF9hpEGBjTOTYaErM8n3zXv846qntfzeVgTBbV65zLafmOecnLuwjT
 c8Fw==
X-Gm-Message-State: APjAAAUhfgD2cQjTrMr51mJEtUF14rHwq3BI/T2pX92g5SiNFYeuBQWd
 DBkH3nTqd6GBQgQWB2FKJRBdJpvi2ww+wIZb45aH9ZcnCUkuptcunDJymxMp51x4LQXWtH2MhIf
 xhQBhUaXZ+X8h1pkdjW3kSbTEhnN12eBNGHEiPgZIfA==
X-Received: by 2002:a0c:f193:: with SMTP id m19mr136391qvl.154.1580842587493; 
 Tue, 04 Feb 2020 10:56:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnU58vkOrjzUqa3857ou1cEE6izA8TOEXDujVIQTzgSk3wVjHWzJ8LdVI0/LhMBhOqOXxhmg==
X-Received: by 2002:a0c:f193:: with SMTP id m19mr136375qvl.154.1580842587234; 
 Tue, 04 Feb 2020 10:56:27 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id s22sm11834992qke.19.2020.02.04.10.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 10:56:26 -0800 (PST)
Date: Tue, 4 Feb 2020 13:56:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tyler Sanderson <tysand@google.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200204135533-mutt-send-email-mst@kernel.org>
References: <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <20200203120225-mutt-send-email-mst@kernel.org>
 <CAJuQAmqGA9mhzR5AQeMDtovJAh7y8khC3qUtLKx_e9RdL0wFJQ@mail.gmail.com>
 <74cc25a6-cefb-c580-8e59-5b76fb680bf4@redhat.com>
 <CAJuQAmpiVqnNt-vSkQh5Gg63QZ49_nuz4+VW2Jfwn51gWVdtfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJuQAmpiVqnNt-vSkQh5Gg63QZ49_nuz4+VW2Jfwn51gWVdtfA@mail.gmail.com>
X-MC-Unique: NTPZBxvoNmqgUWzBqbjybw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, namit@vmware.com,
 David Rientjes <rientjes@google.com>,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Feb 04, 2020 at 10:52:42AM -0800, Tyler Sanderson wrote:
> =

> =

> On Tue, Feb 4, 2020 at 12:29 AM David Hildenbrand <david@redhat.com> wrot=
e:
> =

>     On 03.02.20 21:32, Tyler Sanderson wrote:
>     > There were apparently good reasons for moving away from OOM notifier
>     > callback:
>     > https://lkml.org/lkml/2018/7/12/314
>     > https://lkml.org/lkml/2018/8/2/322
>     >
>     > In particular the OOM notifier is worse than the shrinker because:
> =

>     The issue is that DEFLATE_ON_OOM is under-specified.
> =

>     >
>     >=C2=A0 1. It is last-resort, which means the system has already gone=
 through
>     >=C2=A0 =C2=A0 =C2=A0heroics to prevent OOM. Those heroic reclaim eff=
orts are expensive
>     >=C2=A0 =C2=A0 =C2=A0and impact application performance.
> =

>     That's *exactly* what "deflate on OOM" suggests.
> =

> =

> It seems there are some use cases where "deflate on OOM" is desired and o=
thers
> where "deflate on pressure" is desired.
> This suggests adding a new feature bit "DEFLATE_ON_PRESSURE" that registe=
rs the
> shrinker, and reverting DEFLATE_ON_OOM to use the OOM notifier callback.
> =

> This lets users configure the balloon for their use case.

Right. Let's not repeat past mistakes and let's try to specify this
new one properly though :)

> =

> =

>     Assume you are using virtio-balloon for some weird way of memory
>     hotunplug (which is what some people do) and you want to minimize the
>     footprint of your guest. Then you really only want to give the guest
>     more memory (or rather, let it take back memory automatically in this
>     case) in case it really needs more memory. It should try to reclaim f=
irst.
> =

>     Under-specified.
> =

> =

>     >=C2=A0 2. It lacks understanding of NUMA or other OOM constraints.
> =

>     Ballooning in general lacks the understanding of NUMA.
> =

>     >=C2=A0 3. It has a higher potential for bugs due to the subtlety=C2=
=A0of the
>     >=C2=A0 =C2=A0 =C2=A0callback context.
> =

>     While that is a valid point, it doesn't explain why existing
>     functionality is changed.
> =

>     Personally, I think DEFLATE_ON_OOM should never have been introduced =
(at
>     least not in this form).
> =

> I'm actually not sure how you would safely do memory overcommit without
> DEFLATE_ON_OOM. So I think it unlocks a huge use case.
> =C2=A0
> =

> =

> =

>     --
>     Thanks,
> =

>     David / dhildenb
> =

> =


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
