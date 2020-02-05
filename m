Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D71152682
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 07:58:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56E0C86E64;
	Wed,  5 Feb 2020 06:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PzLJEU05itht; Wed,  5 Feb 2020 06:57:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3F3986DAC;
	Wed,  5 Feb 2020 06:57:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8151FC0174;
	Wed,  5 Feb 2020 06:57:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6367AC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4AC0A20764
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDkFd5RtBAcu
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:57:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 05CE0203B0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580885875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=022y6NHg+AhKPTekrZ8/eEwlEB+QNZQOycjz0CuhG0k=;
 b=jKt73mAMpUPgZaF/EkFbqnJu3NGOmCkhqDjmuOX7TDLZFD9GUxUw/ek3P9mTFyVxeWAeP/
 vayObSk+H6HXocN/WVbK/6cx0ci0BAFqSjZMrJH7KAkz+IyxTBKqTO0uk3XZATtp6Er1yL
 k52i9EDJ4ZQHnX9aF9lHmrkA1D0qPtE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-yULLMZ-FMgaSz_Hgfx2SrA-1; Wed, 05 Feb 2020 01:57:52 -0500
Received: by mail-qt1-f199.google.com with SMTP id y3so721640qti.15
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 22:57:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7YGEo6r1q7a3oPDK4t6yazkdvlNaHSSuGWyn/XwzK5Y=;
 b=o/lGjBZeHNcUYCHrJ7gPc1ihhHWeGaTHGwMQyDCZwwHLrZ8/l5anb8aBiwF/HBylHY
 vJfwH2ZSrjIxwrWK1uVmwJ5B+ycBYLVWnm/XgeDI/w8f278Z9elLPcBjpc+coHk4T6IM
 VKE8qIt8rbRYf+nPq7cBBoN676gn+T3VSm5J9mC1SlYyy4BggpIN9156+bAlNYDBvg2T
 kVwkO+ASGTKW5DQisOHWhP376RUBZwO4i9iaDPGe9MtCdsewocgXeYofkrmXmatYELLU
 ueRO2Q10PDZ11Bh8djuHTcWxWZp64masA4CvhMkVkDJZ8ASIGkdGEhboyC6mV1SszBxv
 kryA==
X-Gm-Message-State: APjAAAU00pDo6rlJXFAPGrzpJpuR+UA45LpxTZJU65xo/qVx7izhp0AE
 Yyk9v4xcacu4dkJpBSuLPLKLpG+rlqnl4Fqlh8nHz+9bvZSaYGBL9NcvOs1iuR7gVoL/X2RaAHg
 5UcVMKw4m8BUyVLI6HTkhiCj9KQ/mhxDbVemOZ0VRvQ==
X-Received: by 2002:a05:620a:557:: with SMTP id
 o23mr32943453qko.246.1580885871724; 
 Tue, 04 Feb 2020 22:57:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyvwexytbZapMU9lmm33cMGazuF+4PG7l7eRe7Qx04MX+AWz5t2Gc8YiWF7CKjVQsiMg2YOgQ==
X-Received: by 2002:a05:620a:557:: with SMTP id
 o23mr32943432qko.246.1580885871460; 
 Tue, 04 Feb 2020 22:57:51 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id x126sm12593612qkc.42.2020.02.04.22.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 22:57:50 -0800 (PST)
Date: Wed, 5 Feb 2020 01:57:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tyler Sanderson <tysand@google.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200205015057-mutt-send-email-mst@kernel.org>
References: <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <20200203120225-mutt-send-email-mst@kernel.org>
 <CAJuQAmqGA9mhzR5AQeMDtovJAh7y8khC3qUtLKx_e9RdL0wFJQ@mail.gmail.com>
 <74cc25a6-cefb-c580-8e59-5b76fb680bf4@redhat.com>
 <CAJuQAmpiVqnNt-vSkQh5Gg63QZ49_nuz4+VW2Jfwn51gWVdtfA@mail.gmail.com>
 <b809340d-7e86-caf6-bf12-db7bb8265045@redhat.com>
 <CAJuQAmqeKvc_k7pmDuC1b+w6yezzHoSxZJ8WW5sHVo1yMsRPfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJuQAmqeKvc_k7pmDuC1b+w6yezzHoSxZJ8WW5sHVo1yMsRPfg@mail.gmail.com>
X-MC-Unique: yULLMZ-FMgaSz_Hgfx2SrA-1
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

On Tue, Feb 04, 2020 at 03:58:51PM -0800, Tyler Sanderson wrote:
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>=C2=A0 1. It is last-resort, which means the sy=
stem has already gone     through
>     >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0heroics to prevent OOM. Tho=
se heroic reclaim efforts are     expensive
>     >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0and impact application perf=
ormance.
>     >
>     >=C2=A0 =C2=A0 =C2=A0That's *exactly* what "deflate on OOM" suggests.
>     >
>     >
>     > It seems there are some use cases where "deflate on OOM" is desired=
 and
>     > others where "deflate on pressure" is desired.
>     > This suggests adding a new feature bit "DEFLATE_ON_PRESSURE" that
>     > registers the shrinker, and reverting DEFLATE_ON_OOM to use the OOM
>     > notifier callback.
>     >
>     > This lets users configure the balloon for their use case.
> =

>     You want the old behavior back, so why should we introduce a new one?=
 Or
>     am I missing something? (you did want us to revert to old handling, n=
o?)
> =

> Reverting actually doesn't help me because this has been the behavior sin=
ce
> Linux 4.19 which is already widely in use. So my device implementation ne=
eds to
> handle the shrinker behavior anyways. I started this conversation to ask =
what
> the intended device implementation was.
> =

> I think there are reasonable device implementations that would prefer the
> shrinker=C2=A0behavior (it turns out that mine doesn't).
> For example, an implementation that slowly inflates the balloon for the p=
urpose
> of memory overcommit. It might leave the balloon inflated and expect any =
memory
> pressure (including page cache usage) to deflate the balloon as a way to
> dynamically right-size the balloon.

So just to make sure we understand, what exactly does your
implementation do?


> Two reasons I didn't go with the above implementation:
> 1. I need to support guests before Linux 4.19 which don't have the shrink=
er
> behavior.
> 2. Memory in the balloon does not appear as "available" in /proc/meminfo =
even
> though it is freeable. This is confusing to users, but isn't a deal break=
er.
> =

> If we added a DEFLATE_ON_PRESSURE feature bit that indicated shrinker API
> support then that would resolve reason=C2=A0#1 (ideally we would backport=
 the bit to
> 4.19).

We could declare lack of pagecache pressure with DEFLATE_ON_OOM a
regression and backport the revert but not I think the new
DEFLATE_ON_PRESSURE.


> In any case, the shrinker=C2=A0behavior when pressuring page cache is mor=
e of an
> inefficiency than a bug. It's not clear to me that it necessitates revert=
ing.
> If there were/are reasons to be on the shrinker=C2=A0interface then I thi=
nk those
> carry similar weight as the problem itself.
> =C2=A0
> =

> =

>     I consider virtio-balloon to this very day a big hack. And I don't see
>     it getting better with new config knobs. Having that said, the
>     technologies that are candidates to replace it (free page reporting,
>     taming the guest page cache, etc.) are still not ready - so we'll have
>     to stick with it for now :( .
> =

>     >
>     > I'm actually not sure how you would safely do memory overcommit wit=
hout
>     > DEFLATE_ON_OOM. So I think it unlocks a huge use case.
> =

>     Using better suited technologies that are not ready yet (well, some f=
orm
>     of free page reporting is available under IBM z already but in a
>     proprietary form) ;) Anyhow, I remember that DEFLATE_ON_OOM only makes
>     it less likely to crash your guest, but not that you are safe to sque=
eze
>     the last bit out of your guest VM.
> =

> Can you elaborate on the danger of DEFLATE_ON_OOM? I haven't seen any pro=
blems
> in testing but I'd really like to know about the dangers.
> Is there a difference in safety between the OOM notifier callback and the
> shrinker API?

It's not about dangers as such. It's just that when linux hits OOM
all kind of error paths are being hit, latent bugs start triggering,
latency goes up drastically.


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
