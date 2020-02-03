Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C682D151109
	for <lists.virtualization@lfdr.de>; Mon,  3 Feb 2020 21:32:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7AB8F84949;
	Mon,  3 Feb 2020 20:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUM6DS0pfler; Mon,  3 Feb 2020 20:32:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D36584B89;
	Mon,  3 Feb 2020 20:32:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 568B9C0174;
	Mon,  3 Feb 2020 20:32:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6B78C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 20:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A12A784F0F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 20:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IlnczlN9oKKT
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 20:32:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 452C684ED0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 20:32:18 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id t129so4513878vkg.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Feb 2020 12:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vKNtC8O5oWdev4z2OZqYfGRqu370JrtOcoEaQ3EinoA=;
 b=AsMYb7Nbdih11U2SnpwzLWyvAwlOqEaJscrSQYVxa8cQisQxQs45lNJBrGiB0u6C1a
 eNWd5/TYFD4XbWOgTWw1znOHMWDvMddJc5kXGtsZujdB/VqVXalXB+nbHAfmUBCHxNG9
 V+vslxEltJgcGee+J8P3l/UWD8/pdQ7As1GjraL5c8/5AkE07QtYJ0Hn4gL1fa5N+IHW
 dh6N4dvtn7liNdaKrv8UG+9CO6Vfi4qdqs389X9YhmlDnehjZoaEVVHqxxYM+HuCIzHm
 ZHiKLgRNS4oiE5FJHEVoZlEjax03ZG7DPRGCGGTGGdaY0iDzAQk3HyzIwdls0nHJAaKl
 wTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vKNtC8O5oWdev4z2OZqYfGRqu370JrtOcoEaQ3EinoA=;
 b=j5DbicKXFu6s4roc2scOxi85OtXrRnnyhgDBD1ImztvjzFqGEwYm4kc4qraSWpbtP2
 RSh4R+J0dmcbnjXl+LKsl90NdqnMhEB8C+UHgW1iEJX7+TYKCwTTl0tq84ly+P3KmqLV
 yY5sgXBqhtvRd4iasRstYG0kW75SU6KqVzJ7u9mzqiRI8bUGbVQxKoURERvLJSJuF5Xi
 DxAr3Ds9/BwZ/aMryJGMHpcycdRJ9j891mnXNPeN30JNdWYaTq0nYXSNsT0TWE2+jE3/
 /7RwlkpuvEa86S4CPEFAxpKJkdn/fCLNc6HhF3B3r091WZ/82OegUjl03Ula6msNMuC4
 DAOw==
X-Gm-Message-State: APjAAAUUD2YX1l4TVdFEgKxCtb1UIBeAIuJRI3ltnzuOnCeu1hlWeWp3
 /zWkVeXjIOzz29rQfqRj74nxsbFgv8/lBN3mvp3ziA==
X-Google-Smtp-Source: APXvYqyq6qZqQYbsi9Qolh9OJutRlVBaZWAAAVdQb1aFxsdrtp+O3JPhx/e52rJOCEjl7RfVzI5ToK76/ooJKzCbaCE=
X-Received: by 2002:a1f:7c0c:: with SMTP id x12mr14924704vkc.41.1580761936950; 
 Mon, 03 Feb 2020 12:32:16 -0800 (PST)
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
In-Reply-To: <20200203120225-mutt-send-email-mst@kernel.org>
Date: Mon, 3 Feb 2020 12:32:05 -0800
Message-ID: <CAJuQAmqGA9mhzR5AQeMDtovJAh7y8khC3qUtLKx_e9RdL0wFJQ@mail.gmail.com>
Subject: Re: Balloon pressuring page cache
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
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
Content-Type: multipart/mixed; boundary="===============3095139446014947072=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3095139446014947072==
Content-Type: multipart/alternative; boundary="000000000000ba8db1059db1d188"

--000000000000ba8db1059db1d188
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There were apparently good reasons for moving away from OOM notifier
callback:
https://lkml.org/lkml/2018/7/12/314
https://lkml.org/lkml/2018/8/2/322

In particular the OOM notifier is worse than the shrinker because:

   1. It is last-resort, which means the system has already gone through
   heroics to prevent OOM. Those heroic reclaim efforts are expensive and
   impact application performance.
   2. It lacks understanding of NUMA or other OOM constraints.
   3. It has a higher potential for bugs due to the subtlety of the
   callback context.

Given the above, I think the shrinker API certainly makes the most sense
_if_ the balloon size is static. In that case memory should be reclaimed
from the balloon early and proportionally to balloon size, which the
shrinker API achieves.

However, if the balloon is inflating and intentionally causing memory
pressure then this results in the inefficiency pointed out earlier.

If the balloon is inflating but not causing memory pressure then there is
no problem with either API.

This suggests another route: rather than cause memory pressure to shrink
the page cache, the balloon could issue the equivalent of "echo 3 >
/proc/sys/vm/drop_caches".
Of course ideally, we want to be more fine grained than "drop everything".
We really want an API that says "drop everything that hasn't been accessed
in the last 5 minutes".

This would eliminate the need for the balloon to cause memory pressure at
all which avoids the inefficiency in question. Furthermore, this pairs
nicely with the FREE_PAGE_HINT feature.


On Mon, Feb 3, 2020 at 9:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Mon, Feb 03, 2020 at 05:34:20PM +0100, David Hildenbrand wrote:
> > On 03.02.20 17:18, Alexander Duyck wrote:
> > > On Mon, 2020-02-03 at 08:11 -0500, Michael S. Tsirkin wrote:
> > >> On Thu, Jan 30, 2020 at 11:59:46AM -0800, Tyler Sanderson wrote:
> > >>>
> > >>> On Thu, Jan 30, 2020 at 7:31 AM Wang, Wei W <wei.w.wang@intel.com>
> wrote:
> > >>>
> > >>>     On Thursday, January 30, 2020 11:03 PM, David Hildenbrand wrote=
:
> > >>>     > On 29.01.20 20:11, Tyler Sanderson wrote:
> > >>>     > >
> > >>>     > >
> > >>>     > > On Wed, Jan 29, 2020 at 2:31 AM David Hildenbrand <
> david@redhat.com
> > >>>     > > <mailto:david@redhat.com>> wrote:
> > >>>     > >
> > >>>     > >     On 29.01.20 01:22, Tyler Sanderson via Virtualization
> wrote:
> > >>>     > >     > A primary advantage of virtio balloon over other
> memory reclaim
> > >>>     > >     > mechanisms is that it can pressure the guest's page
> cache into
> > >>>     > >     shrinking.
> > >>>     > >     >
> > >>>     > >     > However, since the balloon driver changed to using th=
e
> shrinker
> > >>>     API
> > >>>     > >     >
> > >>>     > >
> > >>>     > <
> https://github.com/torvalds/linux/commit/71994620bb25a8b109388fefa9
> > >>>     > e99a28e355255a#diff-fd202acf694d9eba19c8c64da3e480c9> this
> > >>>     > >     > use case has become a bit more tricky. I'm wondering
> what the
> > >>>     > intended
> > >>>     > >     > device implementation is.
> > >>>     > >     >
> > >>>     > >     > When inflating the balloon against page cache (i.e. n=
o
> free
> > >>>     memory
> > >>>     > >     > remains) vmscan.c will both shrink page cache, but
> also invoke
> > >>>     the
> > >>>     > >     > shrinkers -- including the balloon's shrinker. So the
> balloon
> > >>>     driver
> > >>>     > >     > allocates memory which requires reclaim, vmscan gets
> this memory
> > >>>     > by
> > >>>     > >     > shrinking the balloon, and then the driver adds the
> memory back
> > >>>     to
> > >>>     > the
> > >>>     > >     > balloon. Basically a busy no-op.
> > >>>
> > >>>     Per my understanding, the balloon allocation won=E2=80=99t invo=
ke
> shrinker as
> > >>>     __GFP_DIRECT_RECLAIM isn't set, no?
> > >>>
> > >>> I could be wrong about the mechanism, but the device sees lots of
> activity on
> > >>> the deflate queue. The balloon is being shrunk. And this only start=
s
> once all
> > >>> free memory is depleted and we're inflating into page cache.
> > >>
> > >> So given this looks like a regression, maybe we should revert the
> > >> patch in question 71994620bb25 ("virtio_balloon: replace oom notifie=
r
> with shrinker")
> > >> Besides, with VIRTIO_BALLOON_F_FREE_PAGE_HINT
> > >> shrinker also ignores VIRTIO_BALLOON_F_MUST_TELL_HOST which isn't ni=
ce
> > >> at all.
> > >>
> > >> So it looks like all this rework introduced more issues than it
> > >> addressed ...
> > >>
> > >> I also CC Alex Duyck for an opinion on this.
> > >> Alex, what do you use to put pressure on page cache?
> > >
> > > I would say reverting probably makes sense. I'm not sure there is muc=
h
> > > value to having a shrinker running deflation when you are actively
> trying
> > > to increase the balloon. It would make more sense to wait until you a=
re
> > > actually about to start hitting oom.
> >
> > I think the shrinker makes sense for free page hinting feature
> > (everything on free_page_list).
> >
> > So instead of only reverting, I think we should split it up and always
> > register the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT and the OOM
> > notifier (as before) for VIRTIO_BALLOON_F_MUST_TELL_HOST.
>
> OK ... I guess that means we need to fix shrinker to take
> VIRTIO_BALLOON_F_MUST_TELL_HOST into account correctly.
> Hosts ignore it at the moment but it's a fragile thing
> to do what it does and ignore used buffers.
>
> > (Of course, adapting what is being done in the shrinker and in the OOM
> > notifier)
> >
> > --
> > Thanks,
> >
> > David / dhildenb
>
>

--000000000000ba8db1059db1d188
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There were apparently good reasons for moving away from OO=
M notifier callback:<div><a href=3D"https://lkml.org/lkml/2018/7/12/314">ht=
tps://lkml.org/lkml/2018/7/12/314</a><br></div><div><a href=3D"https://lkml=
.org/lkml/2018/8/2/322">https://lkml.org/lkml/2018/8/2/322</a></div><div><b=
r></div><div>In particular the OOM notifier is worse than the shrinker beca=
use:</div><div><ol><li>It is last-resort, which means the system has alread=
y gone through heroics to prevent OOM. Those heroic reclaim efforts are exp=
ensive and impact application performance.</li><li>It lacks understanding o=
f NUMA or other OOM constraints.</li><li>It has a higher potential for bugs=
 due to the subtlety=C2=A0of the callback context.</li></ol></div><div>Give=
n the above, I think the shrinker=C2=A0API certainly makes the most sense _=
if_ the balloon size is static. In that case memory should be reclaimed fro=
m the balloon early and proportionally to balloon size, which the shrinker =
API achieves.</div><div><br></div><div>However, if the balloon is inflating=
 and intentionally causing memory pressure then this results in the ineffic=
iency pointed out earlier.</div><div><br></div><div>If the balloon is infla=
ting but not causing memory pressure then there is no problem with either A=
PI.</div><div><br></div><div>This suggests another route: rather than cause=
 memory pressure to shrink the page cache, the balloon could issue the equi=
valent=C2=A0of &quot;echo 3 &gt; /proc/sys/vm/drop_caches&quot;.</div><div>=
Of course ideally, we want to be more fine grained than &quot;drop everythi=
ng&quot;. We really want an API that says &quot;drop everything that hasn&#=
39;t been accessed in the last 5 minutes&quot;.</div><div><br></div><div><d=
iv>This would eliminate the need for the balloon to cause memory pressure a=
t all which=C2=A0avoids the inefficiency in question. Furthermore, this pai=
rs nicely with the FREE_PAGE_HINT feature.</div></div><div><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Feb 3, 2020 at 9:04 AM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redha=
t.com">mst@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Mon, Feb 03, 2020 at 05:34:20PM +0100, David Hilden=
brand wrote:<br>
&gt; On 03.02.20 17:18, Alexander Duyck wrote:<br>
&gt; &gt; On Mon, 2020-02-03 at 08:11 -0500, Michael S. Tsirkin wrote:<br>
&gt; &gt;&gt; On Thu, Jan 30, 2020 at 11:59:46AM -0800, Tyler Sanderson wro=
te:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Thu, Jan 30, 2020 at 7:31 AM Wang, Wei W &lt;<a href=
=3D"mailto:wei.w.wang@intel.com" target=3D"_blank">wei.w.wang@intel.com</a>=
&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0On Thursday, January 30, 2020 11:03 PM=
, David Hildenbrand wrote:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 29.01.20 20:11, Tyler Sanderso=
n wrote:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; On Wed, Jan 29, 2020 at 2:31=
 AM David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" target=3D"_bl=
ank">david@redhat.com</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &lt;mailto:<a href=3D"mailto=
:david@redhat.com" target=3D"_blank">david@redhat.com</a>&gt;&gt; wrote:<br=
>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0On 29.01.=
20 01:22, Tyler Sanderson via Virtualization wrote:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; A pr=
imary advantage of virtio balloon over other memory reclaim<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; mech=
anisms is that it can pressure the guest&#39;s page cache into<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0shrinking=
.<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Howe=
ver, since the balloon driver changed to using the shrinker<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0API<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"https://github.com=
/torvalds/linux/commit/71994620bb25a8b109388fefa9" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/torvalds/linux/commit/71994620bb25a8b109388=
fefa9</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; e99a28e355255a#diff-fd202acf694d9=
eba19c8c64da3e480c9&gt; this<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; use =
case has become a bit more tricky. I&#39;m wondering what the<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; intended<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; devi=
ce implementation is.<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; When=
 inflating the balloon against page cache (i.e. no free<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0memory<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; rema=
ins) vmscan.c will both shrink page cache, but also invoke<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0the<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; shri=
nkers -- including the balloon&#39;s shrinker. So the balloon<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0driver<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; allo=
cates memory which requires reclaim, vmscan gets this memory<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; by<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; shri=
nking the balloon, and then the driver adds the memory back<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0to<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; the<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; ball=
oon. Basically a busy no-op.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Per my understanding, the balloon allo=
cation won=E2=80=99t invoke shrinker as<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0__GFP_DIRECT_RECLAIM isn&#39;t set, no=
?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I could be wrong about the mechanism, but the device sees=
 lots of activity on<br>
&gt; &gt;&gt;&gt; the deflate queue. The balloon is being shrunk. And this =
only starts once all<br>
&gt; &gt;&gt;&gt; free memory is depleted and we&#39;re inflating into page=
 cache.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; So given this looks like a regression, maybe we should revert=
 the<br>
&gt; &gt;&gt; patch in question 71994620bb25 (&quot;virtio_balloon: replace=
 oom notifier with shrinker&quot;)<br>
&gt; &gt;&gt; Besides, with VIRTIO_BALLOON_F_FREE_PAGE_HINT<br>
&gt; &gt;&gt; shrinker also ignores VIRTIO_BALLOON_F_MUST_TELL_HOST which i=
sn&#39;t nice<br>
&gt; &gt;&gt; at all.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; So it looks like all this rework introduced more issues than =
it<br>
&gt; &gt;&gt; addressed ...<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I also CC Alex Duyck for an opinion on this.<br>
&gt; &gt;&gt; Alex, what do you use to put pressure on page cache?<br>
&gt; &gt; <br>
&gt; &gt; I would say reverting probably makes sense. I&#39;m not sure ther=
e is much<br>
&gt; &gt; value to having a shrinker running deflation when you are activel=
y trying<br>
&gt; &gt; to increase the balloon. It would make more sense to wait until y=
ou are<br>
&gt; &gt; actually about to start hitting oom.<br>
&gt; <br>
&gt; I think the shrinker makes sense for free page hinting feature<br>
&gt; (everything on free_page_list).<br>
&gt; <br>
&gt; So instead of only reverting, I think we should split it up and always=
<br>
&gt; register the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT and the OOM<=
br>
&gt; notifier (as before) for VIRTIO_BALLOON_F_MUST_TELL_HOST.<br>
<br>
OK ... I guess that means we need to fix shrinker to take<br>
VIRTIO_BALLOON_F_MUST_TELL_HOST into account correctly.<br>
Hosts ignore it at the moment but it&#39;s a fragile thing<br>
to do what it does and ignore used buffers.<br>
<br>
&gt; (Of course, adapting what is being done in the shrinker and in the OOM=
<br>
&gt; notifier)<br>
&gt; <br>
&gt; -- <br>
&gt; Thanks,<br>
&gt; <br>
&gt; David / dhildenb<br>
<br>
</blockquote></div>

--000000000000ba8db1059db1d188--

--===============3095139446014947072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3095139446014947072==--
