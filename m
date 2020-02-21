Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D7166DBD
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 04:30:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A50542154F;
	Fri, 21 Feb 2020 03:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fKrigBwOKgs; Fri, 21 Feb 2020 03:30:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8B217207A8;
	Fri, 21 Feb 2020 03:30:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69BA9C013E;
	Fri, 21 Feb 2020 03:30:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E6ECC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 03:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 294B78214C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 03:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JiG5fQGX7FMm
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 03:30:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 09E3B81E7B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 03:30:06 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id r18so391863vso.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUDd9XEKZ0mMI9kJjN+Q5EMiKEZY7NvZJReDi9zkSkM=;
 b=E5kI2417HAzfj75ssogxx/xIva9tL75P/5TfezibHr1sOw9h4xD6npTlFbWIDscalj
 YtacR3LLJtnGlAOBYf1kF41tne+MNi+hMfXElguVOFN5hWHtlXl1Tq813DH9OosUrJiF
 Tq9LChAivRSLn5lKtqq6Rrk+cH4i3VoGROMH9NLH1H9sd+NRkf5fk2xdsQHC5Y2TGZ+S
 JLmyFhVKX8WunUR5AQu/s5YVvf/VGOUr2kSmD4svkHPSftPvYn3A7JPX81e9wsLLGgNU
 LnQGhLy0n262yXtEUKZ99sOnqXmvAsuL7lccnAEoIneiJOiXBdiT+dNo24RLQu0vmfxI
 jjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUDd9XEKZ0mMI9kJjN+Q5EMiKEZY7NvZJReDi9zkSkM=;
 b=LaVfpi95g/KgoW5R+krYYvYQXM75AqJLxv2o0Qm45QYI455A72U9CjxfJj40zgxUHi
 qkMlQWnOEtAUjsO5nzdlun10sP1YIeJOge2Lsb67aRfyqp3zDmhIuCMuRp76iviexBiD
 q2ErhZSbjGw/FTmyLpr12vGsjdAgMpK7URcfoVTASruk0icF/SxzSlpy+vlEcPjlRkiO
 9HWdd64etArEXjy5+H7qE8XnF7AxoHEfSqqPItsEZZT1CvyCOKj8gplLkDpE+TF8WyQ/
 9pc34+H/EbOenL29yMuHhr25OyKbJ4GJoX+RcPtyeEsVDfj9GspWj2M2TzHb3j+XrChz
 DFDA==
X-Gm-Message-State: APjAAAWnX9KFyTnaiDsTuPIRk+QkEavra57Zkj0hOyK6mFhbG4bjSHGQ
 Byw47KflOD8103zAcWlNFvwZ9Fof3QU4Kfx5JFAF7w==
X-Google-Smtp-Source: APXvYqxmQCVmjJmoaB1i5MoCxlxObJQitys1HNzGNElVqIRR7PYnMh5hV+ZFJ1RAswVKjojX/rRu0XjeWIFN7rBxpkQ=
X-Received: by 2002:a67:df97:: with SMTP id x23mr19145618vsk.160.1582255804568; 
 Thu, 20 Feb 2020 19:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
 <f31eff75-b328-de41-c2cc-e55471aa27d8@redhat.com>
 <20200216044641-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200216044641-mutt-send-email-mst@kernel.org>
Date: Thu, 20 Feb 2020 19:29:53 -0800
Message-ID: <CAJuQAmqmOQMx3A8g81pnFLyTZ5E5joSCEGG5fBwPOBH7crdi2w@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
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
Content-Type: multipart/mixed; boundary="===============2586062620592428843=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============2586062620592428843==
Content-Type: multipart/alternative; boundary="0000000000002d6743059f0da34b"

--0000000000002d6743059f0da34b
Content-Type: text/plain; charset="UTF-8"

Testing this patch is on my short-term TODO list, but I wasn't able to get
to it this week. It is prioritized.

In the meantime, I can anecdotally vouch that kernels before 4.19, the ones
using the OOM notifier callback, have roughly 10x faster balloon inflation
when pressuring the cache. So I anticipate this patch will return to that
state and help my use case.

I will try to post official measurements of this patch next week.

On Sun, Feb 16, 2020 at 1:47 AM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Fri, Feb 14, 2020 at 10:51:43AM +0100, David Hildenbrand wrote:
> > On 05.02.20 17:34, David Hildenbrand wrote:
> > > Commit 71994620bb25 ("virtio_balloon: replace oom notifier with
> shrinker")
> > > changed the behavior when deflation happens automatically. Instead of
> > > deflating when called by the OOM handler, the shrinker is used.
> > >
> > > However, the balloon is not simply some slab cache that should be
> > > shrunk when under memory pressure. The shrinker does not have a
> concept of
> > > priorities, so this behavior cannot be configured.
> > >
> > > There was a report that this results in undesired side effects when
> > > inflating the balloon to shrink the page cache. [1]
> > >     "When inflating the balloon against page cache (i.e. no free memory
> > >      remains) vmscan.c will both shrink page cache, but also invoke the
> > >      shrinkers -- including the balloon's shrinker. So the balloon
> > >      driver allocates memory which requires reclaim, vmscan gets this
> > >      memory by shrinking the balloon, and then the driver adds the
> > >      memory back to the balloon. Basically a busy no-op."
> > >
> > > The name "deflate on OOM" makes it pretty clear when deflation should
> > > happen - after other approaches to reclaim memory failed, not while
> > > reclaiming. This allows to minimize the footprint of a guest - memory
> > > will only be taken out of the balloon when really needed.
> > >
> > > Especially, a drop_slab() will result in the whole balloon getting
> > > deflated - undesired. While handling it via the OOM handler might not
> be
> > > perfect, it keeps existing behavior. If we want a different behavior,
> then
> > > we need a new feature bit and document it properly (although, there
> should
> > > be a clear use case and the intended effects should be well described).
> > >
> > > Keep using the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT, because
> > > this has no such side effects. Always register the shrinker with
> > > VIRTIO_BALLOON_F_FREE_PAGE_HINT now. We are always allowed to reuse
> free
> > > pages that are still to be processed by the guest. The hypervisor takes
> > > care of identifying and resolving possible races between processing a
> > > hinting request and the guest reusing a page.
> > >
> > > In contrast to pre commit 71994620bb25 ("virtio_balloon: replace oom
> > > notifier with shrinker"), don't add a moodule parameter to configure
> the
> > > number of pages to deflate on OOM. Can be re-added if really needed.
> > > Also, pay attention that leak_balloon() returns the number of 4k pages
> -
> > > convert it properly in virtio_balloon_oom_notify().
> > >
> > > Note1: using the OOM handler is frowned upon, but it really is what we
> > >        need for this feature.
> > >
> > > Note2: without VIRTIO_BALLOON_F_MUST_TELL_HOST (iow, always with QEMU)
> we
> > >        could actually skip sending deflation requests to our
> hypervisor,
> > >        making the OOM path *very* simple. Besically freeing pages and
> > >        updating the balloon. If the communication with the host ever
> > >        becomes a problem on this call path.
> > >
> >
> > @Michael, how to proceed with this?
> >
>
> I'd like to see some reports that this helps people.
> e.g. a tested-by tag.
>
> > --
> > Thanks,
> >
> > David / dhildenb
>
>

--0000000000002d6743059f0da34b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Testing this patch is on my short-term TODO list, but I wa=
sn&#39;t able to get to it this week. It is prioritized.<div><br></div><div=
>In the meantime, I can anecdotally vouch that kernels before 4.19, the one=
s using the OOM notifier callback, have roughly 10x faster balloon inflatio=
n when pressuring the cache. So I anticipate this patch will return to that=
 state and help my use case.</div><div><br></div><div>I will try to post of=
ficial measurements of this patch next week.</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 16, 2020 at 1=
:47 AM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Fri, Feb 14, 2020 at 10:51:43AM +0100, David Hildenbrand wrote:<br>
&gt; On 05.02.20 17:34, David Hildenbrand wrote:<br>
&gt; &gt; Commit 71994620bb25 (&quot;virtio_balloon: replace oom notifier w=
ith shrinker&quot;)<br>
&gt; &gt; changed the behavior when deflation happens automatically. Instea=
d of<br>
&gt; &gt; deflating when called by the OOM handler, the shrinker is used.<b=
r>
&gt; &gt; <br>
&gt; &gt; However, the balloon is not simply some slab cache that should be=
<br>
&gt; &gt; shrunk when under memory pressure. The shrinker does not have a c=
oncept of<br>
&gt; &gt; priorities, so this behavior cannot be configured.<br>
&gt; &gt; <br>
&gt; &gt; There was a report that this results in undesired side effects wh=
en<br>
&gt; &gt; inflating the balloon to shrink the page cache. [1]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;When inflating the balloon against page =
cache (i.e. no free memory<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 remains) vmscan.c will both shrink page cache=
, but also invoke the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 shrinkers -- including the balloon&#39;s shri=
nker. So the balloon<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 driver allocates memory which requires reclai=
m, vmscan gets this<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 memory by shrinking the balloon, and then the=
 driver adds the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 memory back to the balloon. Basically a busy =
no-op.&quot;<br>
&gt; &gt; <br>
&gt; &gt; The name &quot;deflate on OOM&quot; makes it pretty clear when de=
flation should<br>
&gt; &gt; happen - after other approaches to reclaim memory failed, not whi=
le<br>
&gt; &gt; reclaiming. This allows to minimize the footprint of a guest - me=
mory<br>
&gt; &gt; will only be taken out of the balloon when really needed.<br>
&gt; &gt; <br>
&gt; &gt; Especially, a drop_slab() will result in the whole balloon gettin=
g<br>
&gt; &gt; deflated - undesired. While handling it via the OOM handler might=
 not be<br>
&gt; &gt; perfect, it keeps existing behavior. If we want a different behav=
ior, then<br>
&gt; &gt; we need a new feature bit and document it properly (although, the=
re should<br>
&gt; &gt; be a clear use case and the intended effects should be well descr=
ibed).<br>
&gt; &gt; <br>
&gt; &gt; Keep using the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT, beca=
use<br>
&gt; &gt; this has no such side effects. Always register the shrinker with<=
br>
&gt; &gt; VIRTIO_BALLOON_F_FREE_PAGE_HINT now. We are always allowed to reu=
se free<br>
&gt; &gt; pages that are still to be processed by the guest. The hypervisor=
 takes<br>
&gt; &gt; care of identifying and resolving possible races between processi=
ng a<br>
&gt; &gt; hinting request and the guest reusing a page.<br>
&gt; &gt; <br>
&gt; &gt; In contrast to pre commit 71994620bb25 (&quot;virtio_balloon: rep=
lace oom<br>
&gt; &gt; notifier with shrinker&quot;), don&#39;t add a moodule parameter =
to configure the<br>
&gt; &gt; number of pages to deflate on OOM. Can be re-added if really need=
ed.<br>
&gt; &gt; Also, pay attention that leak_balloon() returns the number of 4k =
pages -<br>
&gt; &gt; convert it properly in virtio_balloon_oom_notify().<br>
&gt; &gt; <br>
&gt; &gt; Note1: using the OOM handler is frowned upon, but it really is wh=
at we<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 need for this feature.<br>
&gt; &gt; <br>
&gt; &gt; Note2: without VIRTIO_BALLOON_F_MUST_TELL_HOST (iow, always with =
QEMU) we<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 could actually skip sending deflation =
requests to our hypervisor,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 making the OOM path *very* simple. Bes=
ically freeing pages and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 updating the balloon. If the communica=
tion with the host ever<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 becomes a problem on this call path.<b=
r>
&gt; &gt; <br>
&gt; <br>
&gt; @Michael, how to proceed with this?<br>
&gt; <br>
<br>
I&#39;d like to see some reports that this helps people.<br>
e.g. a tested-by tag.<br>
<br>
&gt; -- <br>
&gt; Thanks,<br>
&gt; <br>
&gt; David / dhildenb<br>
<br>
</blockquote></div>

--0000000000002d6743059f0da34b--

--===============2586062620592428843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2586062620592428843==--
