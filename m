Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01E1520A8
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 19:53:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 23AC784BB2;
	Tue,  4 Feb 2020 18:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obSqh-dYr9kx; Tue,  4 Feb 2020 18:53:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1217084D7A;
	Tue,  4 Feb 2020 18:53:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9D61C1D87;
	Tue,  4 Feb 2020 18:52:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3700FC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 18:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1E8CB2013C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 18:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OgqCdZO30mkY
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 18:52:55 +0000 (UTC)
X-Greylist: delayed 19:36:38 by SQLgrey-1.7.6
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by silver.osuosl.org (Postfix) with ESMTPS id 231DA2000B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 18:52:55 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id b79so12045464vsd.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 10:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JFjuhlOU48p12QMv00/QPBxxPW3d/P9IoYypv065CfE=;
 b=i0vDtfwJSIMb0pbgmz469WvBT6h3lntoMPaoC19R21ozGQl0RIcwGd9Ce+H7blpc/6
 RHOZr6xpSMSW83IW/n08oOe2mZHC+qnj0tWf3xMnsrVHXBcL7dNERaei2cqUDHbcbiCd
 19tzLkVR2qriGBu0i3AD3R7MxIXFqhtPeZfD0GfQ1OJ0TVEc9UBKUy7RSKmh0Bpml0ae
 38xyA9qNFsfhHqj8CxDV7aNgMas4OG/bZMOYB1zaxHIjedf5jBjBIK6HhKU35YDRId8x
 b4997f0M9Os3+EHBzuz5gJYvH4rP5DsBXEp9lgXoCansHnUEW6dSitpE3xKWElZXo2iq
 48zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JFjuhlOU48p12QMv00/QPBxxPW3d/P9IoYypv065CfE=;
 b=H6tZl1LDPpuXThIOOZ+OJRGoHmfP3/B4MDZkk8LuqSbqX0a9K/yiIwLbv/td6upFJP
 Xpv0dtBVDA2Qm39HKMwG936jhMqZrRO74GFm6GIQP25mvTzSYhzwqlDbYKEtK0DVwyEV
 7WQdy897UkdxM495B25hmKuBHi7rzcs7VDpqDBYJNOup43YjYs6tI9+rCKdHzFBx3CQU
 fS8wprxQu7MFGg5fzxT6rw94/8326DQ5ZMUY9hhtBv1jQibwvnhyciAucpHLRfrpr+6/
 YBqZc/ecz9RwfeY+ulmd84BCC7oLVcggMYugHJwilUFn6THYpXxLZKNSWuZEtjSMSCDq
 JnPg==
X-Gm-Message-State: APjAAAWryhvvj0al8tOxYiI7Agi46TvhOQzJdE+SEspkjJiziCFAJZh7
 /lYe74FD9z6yvgGO7USrnDXewwGGC35NkinZ3znQjg==
X-Google-Smtp-Source: APXvYqxPOffbTHs6dP9CmwCbqDZvA029uMmiJaVYrG/dhOyMzIxue5TSSUCy/LAEA7ZbPpQiwn6P80yKmAjXW6XzIJM=
X-Received: by 2002:a05:6102:72b:: with SMTP id
 u11mr19360198vsg.69.1580842373898; 
 Tue, 04 Feb 2020 10:52:53 -0800 (PST)
MIME-Version: 1.0
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <20200203120225-mutt-send-email-mst@kernel.org>
 <CAJuQAmqGA9mhzR5AQeMDtovJAh7y8khC3qUtLKx_e9RdL0wFJQ@mail.gmail.com>
 <74cc25a6-cefb-c580-8e59-5b76fb680bf4@redhat.com>
In-Reply-To: <74cc25a6-cefb-c580-8e59-5b76fb680bf4@redhat.com>
Date: Tue, 4 Feb 2020 10:52:42 -0800
Message-ID: <CAJuQAmpiVqnNt-vSkQh5Gg63QZ49_nuz4+VW2Jfwn51gWVdtfA@mail.gmail.com>
Subject: Re: Balloon pressuring page cache
To: David Hildenbrand <david@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
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
From: Tyler Sanderson via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Tyler Sanderson <tysand@google.com>
Content-Type: multipart/mixed; boundary="===============3259729004362866944=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3259729004362866944==
Content-Type: multipart/alternative; boundary="00000000000024c073059dc48c52"

--00000000000024c073059dc48c52
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 4, 2020 at 12:29 AM David Hildenbrand <david@redhat.com> wrote:

> On 03.02.20 21:32, Tyler Sanderson wrote:
> > There were apparently good reasons for moving away from OOM notifier
> > callback:
> > https://lkml.org/lkml/2018/7/12/314
> > https://lkml.org/lkml/2018/8/2/322
> >
> > In particular the OOM notifier is worse than the shrinker because:
>
> The issue is that DEFLATE_ON_OOM is under-specified.
>
> >
> >  1. It is last-resort, which means the system has already gone through
> >     heroics to prevent OOM. Those heroic reclaim efforts are expensive
> >     and impact application performance.
>
> That's *exactly* what "deflate on OOM" suggests.
>

It seems there are some use cases where "deflate on OOM" is desired and
others where "deflate on pressure" is desired.
This suggests adding a new feature bit "DEFLATE_ON_PRESSURE" that registers
the shrinker, and reverting DEFLATE_ON_OOM to use the OOM notifier callback.

This lets users configure the balloon for their use case.


>
> Assume you are using virtio-balloon for some weird way of memory
> hotunplug (which is what some people do) and you want to minimize the
> footprint of your guest. Then you really only want to give the guest
> more memory (or rather, let it take back memory automatically in this
> case) in case it really needs more memory. It should try to reclaim first.
>
> Under-specified.
>
>
> >  2. It lacks understanding of NUMA or other OOM constraints.
>
> Ballooning in general lacks the understanding of NUMA.
>
> >  3. It has a higher potential for bugs due to the subtlety of the
> >     callback context.
>
> While that is a valid point, it doesn't explain why existing
> functionality is changed.
>
> Personally, I think DEFLATE_ON_OOM should never have been introduced (at
> least not in this form).
>
I'm actually not sure how you would safely do memory overcommit without
DEFLATE_ON_OOM. So I think it unlocks a huge use case.


>
>
> --
> Thanks,
>
> David / dhildenb
>
>

--00000000000024c073059dc48c52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 4, 2020 at 12:29 AM David=
 Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 03.=
02.20 21:32, Tyler Sanderson wrote:<br>
&gt; There were apparently good reasons for moving away from OOM notifier<b=
r>
&gt; callback:<br>
&gt; <a href=3D"https://lkml.org/lkml/2018/7/12/314" rel=3D"noreferrer" tar=
get=3D"_blank">https://lkml.org/lkml/2018/7/12/314</a><br>
&gt; <a href=3D"https://lkml.org/lkml/2018/8/2/322" rel=3D"noreferrer" targ=
et=3D"_blank">https://lkml.org/lkml/2018/8/2/322</a><br>
&gt; <br>
&gt; In particular the OOM notifier is worse than the shrinker because:<br>
<br>
The issue is that DEFLATE_ON_OOM is under-specified.<br>
<br>
&gt; <br>
&gt;=C2=A0 1. It is last-resort, which means the system has already gone th=
rough<br>
&gt;=C2=A0 =C2=A0 =C2=A0heroics to prevent OOM. Those heroic reclaim effort=
s are expensive<br>
&gt;=C2=A0 =C2=A0 =C2=A0and impact application performance.<br>
<br>
That&#39;s *exactly* what &quot;deflate on OOM&quot; suggests.<br></blockqu=
ote><div><br></div><div>It seems there are some use cases where &quot;defla=
te on OOM&quot; is desired and others where &quot;deflate on pressure&quot;=
 is desired.</div><div>This suggests adding a new feature bit &quot;DEFLATE=
_ON_PRESSURE&quot; that registers the shrinker, and reverting DEFLATE_ON_OO=
M to use the OOM notifier callback.</div><div><br></div><div>This lets user=
s configure the balloon for their use case.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Assume you are using virtio-balloon for some weird way of memory<br>
hotunplug (which is what some people do) and you want to minimize the<br>
footprint of your guest. Then you really only want to give the guest<br>
more memory (or rather, let it take back memory automatically in this<br>
case) in case it really needs more memory. It should try to reclaim first.<=
br>
<br>
Under-specified.<br>
<br>
<br>
&gt;=C2=A0 2. It lacks understanding of NUMA or other OOM constraints.<br>
<br>
Ballooning in general lacks the understanding of NUMA.<br>
<br>
&gt;=C2=A0 3. It has a higher potential for bugs due to the subtlety=C2=A0o=
f the<br>
&gt;=C2=A0 =C2=A0 =C2=A0callback context.<br>
<br>
While that is a valid point, it doesn&#39;t explain why existing<br>
functionality is changed.<br>
<br>
Personally, I think DEFLATE_ON_OOM should never have been introduced (at<br=
>
least not in this form).<br></blockquote><div>I&#39;m actually not sure how=
 you would safely do memory overcommit without DEFLATE_ON_OOM. So I think i=
t unlocks a huge use case.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
<br>
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
<br>
</blockquote></div></div>

--00000000000024c073059dc48c52--

--===============3259729004362866944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3259729004362866944==--
