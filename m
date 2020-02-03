Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E315130D
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 00:22:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A3D192050C;
	Mon,  3 Feb 2020 23:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIlyltHLLg-3; Mon,  3 Feb 2020 23:22:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3ADBC204F6;
	Mon,  3 Feb 2020 23:22:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A55CC0174;
	Mon,  3 Feb 2020 23:22:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E660C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 23:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 28B2484EA3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 23:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rs9xfBQQGYTp
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 23:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EE15284D56
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 23:22:04 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id u10so7709026qvi.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Feb 2020 15:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KN20OzNNBnYBjMHjunupqidBOvoMUCpFBbWWGz+GzJ8=;
 b=MvqM72RbQDs2NPg8DcWfGu/0IbMK5fEtkIFsny1AtPCweiRQy9XJR7kctL8MFBFabg
 TwdCD8m3edH/hXy1wg/cAfB6I7Cr0+iTUprC7PlzSH6tXiMTsAM1UnBWgk3klL64MO5C
 wWkOum7bO6ifowO9bPBXq2m/iTKKmuFIxU+4IumvhKnRqGj28rRX0QWgOTbY4N9tHWl+
 zdVTIRFqXYVf/4BG4arqD7tllc1Jk8n3RLln3TT5Y8/5CFBMplZtNEw7xdmp/chl5ykE
 WifYoCVg3/pDdqKS6gkoGsJEIYVxvQ8fhT5HVqlWtnugLHZsbOR8hI3NSdKUOH6eBZVp
 EuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KN20OzNNBnYBjMHjunupqidBOvoMUCpFBbWWGz+GzJ8=;
 b=iDt1HHODX2mG2ex/wFIblAOfhoiPMHJHqNC8iumnr+kkHWW5j7UDN3y1JjmmbD8SSo
 pkaAMJ1jjwecqiJEVtlpEjRKHX8fOvunkzXVAEe3eMmZSdFc/rx49f+98OASXQJoAVUf
 R8Mu1OBJPp2sP138jl0gYchj36INYwpFP+O5jfwBQ37Ak2cTiRJsfc3ToTeAKssARHPz
 rV+w6NH0mYZN4Pq2dXF69dB3NKnt8WG7D4ITKBHuw5IVCcu+Yau+GLZ3E5JEJGZuwKwL
 wkV8Kx2X3ELlFl0GjP/G7OnUKD+/BThUIaSoB2i2BI/rza5Prt0aKkUupXuDxAb7w6tn
 XxqA==
X-Gm-Message-State: APjAAAWP14oAF6SnuyIrutLoGgpELaZ47H59NJxqBb9aGIQyGsTBUiIa
 25UZIIejn/2H+AF3bwvyTCzoo7yKsDrp+vVb9/dcZVDBKd8=
X-Google-Smtp-Source: APXvYqzSMbTobIrUjta2PRVMR5LzxcXd8VMYZkHAwSe+o4mp6e4iHwh+guE7ygidOTjbpHe+gMssuFQsa59SUjGF/cU=
X-Received: by 2002:a05:6102:2159:: with SMTP id
 h25mr16214373vsg.160.1580771776224; 
 Mon, 03 Feb 2020 15:16:16 -0800 (PST)
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
 <2584af9b8d358faf27ee838fdab2be594e255433.camel@linux.intel.com>
In-Reply-To: <2584af9b8d358faf27ee838fdab2be594e255433.camel@linux.intel.com>
Date: Mon, 3 Feb 2020 15:16:04 -0800
Message-ID: <CAJuQAmogkvpZfxH-pyHHYpzRpQpigiha4bfA8pofRiVqKh89Pw@mail.gmail.com>
Subject: Re: Balloon pressuring page cache
To: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>, Michal Hocko <mhocko@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============4380068405231153742=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============4380068405231153742==
Content-Type: multipart/alternative; boundary="00000000000031c9db059db41cc3"

--00000000000031c9db059db41cc3
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 3, 2020 at 1:22 PM Alexander Duyck <
alexander.h.duyck@linux.intel.com> wrote:

> On Mon, 2020-02-03 at 12:32 -0800, Tyler Sanderson wrote:
> > There were apparently good reasons for moving away from OOM notifier
> > callback:
> > https://lkml.org/lkml/2018/7/12/314
> > https://lkml.org/lkml/2018/8/2/322
> >
> > In particular the OOM notifier is worse than the shrinker because:
> > It is last-resort, which means the system has already gone through
> > heroics to prevent OOM. Those heroic reclaim efforts are expensive and
> > impact application performance.
> > It lacks understanding of NUMA or other OOM constraints.
> > It has a higher potential for bugs due to the subtlety of the callback
> > context.
> > Given the above, I think the shrinker API certainly makes the most sense
> > _if_ the balloon size is static. In that case memory should be reclaimed
> > from the balloon early and proportionally to balloon size, which the
> > shrinker API achieves.
>
> The problem is the shrinker doesn't have any concept of tiering or
> priority. I suspect he reason for using the OOM notification is because in
> practice it should be the last thing we are pulling memory out of with
> things like page cache and slab caches being first. Once we have pages
> that are leaked out of the balloon by the shrinker it will trigger the
> balloon wanting to reinflate.

Deciding whether to trade IO performance (page cache) for memory-usage
efficiency (balloon) seems use-case dependent.
Deciding when to re-inflate is a similar policy choice.

If the balloon's shrinker priority is hard-coded to "last-resort" then
there would be no way to implement a policy where page cache growth could
shrink the balloon.
The current balloon implementation allows the host to implement this policy
and tune the tradeoff between balloon and page cache.


> Ideally if the shrinker is running we
> shouldn't be able to reinflate the balloon, and if we are reinflating the
> balloon we shouldn't need to run the shrinker. The fact that we can do
> both at the same time is problematic.
>
I agree that this is inefficient.


>
> > However, if the balloon is inflating and intentionally causing memory
> > pressure then this results in the inefficiency pointed out earlier.
> >
> > If the balloon is inflating but not causing memory pressure then there
> > is no problem with either API.
>
> The entire point of the balloon is to cause memory pressure. Otherwise
> essentially all we are really doing is hinting since the guest doesn't
> need the memory and isn't going to use it any time soon.
>
Causing memory pressure is just a mechanism to achieve increased reclaim.
If there was a better mechanism (like the fine-grained-cache-shrinking one
discussed below) then I think the balloon device would be perfectly
justified in using that instead (and maybe "balloon" becomes a misnomer. Oh
well).


>
> > This suggests another route: rather than cause memory pressure to shrink
> > the page cache, the balloon could issue the equivalent of "echo 3 >
> > /proc/sys/vm/drop_caches".
> > Of course ideally, we want to be more fine grained than "drop
> > everything". We really want an API that says "drop everything that
> > hasn't been accessed in the last 5 minutes".
> >
> > This would eliminate the need for the balloon to cause memory pressure
> > at all which avoids the inefficiency in question. Furthermore, this
> > pairs nicely with the FREE_PAGE_HINT feature.
>
> Something similar was brought up in the discussion we had about this in my
> patch set. The problem is, by trying to use a value like "5 minutes" it
> implies that we are going to need to track some extra state somewhere to
> determine that value.
>
> An alternative is to essentially just slowly shrink memory for the guest.
> We had some discussion about this in another thread, and the following
> code example was brought up as a way to go about doing that:
>
> https://github.com/Conan-Kudo/omv-kernel-rc/blob/master/0154-sysctl-vm-Fine-grained-cache-shrinking.patch
>
> The idea is you essentially just slowly bleed the memory from the guest by
> specifying some amount of MB of cache to be freed on some regular
> interval.
>
Makes sense. Whatever API is settled on, I'd just propose that we allow the
host to invoke it via the balloon device since the host has a host-global
view of memory and can make decisions that an individual guest cannot.

Alex, what is the status of your fine-grained-cache-shrinking patch? It
seems like a really good idea.


> Thanks.
>
> - Alex
>
>

--00000000000031c9db059db41cc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 3, 2020 at 1:22 PM Alexan=
der Duyck &lt;<a href=3D"mailto:alexander.h.duyck@linux.intel.com">alexande=
r.h.duyck@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Mon, 2020-02-03 at 12:32 -0800, Tyler Sanderson=
 wrote:<br>
&gt; There were apparently good reasons for moving away from OOM notifier<b=
r>
&gt; callback:<br>
&gt; <a href=3D"https://lkml.org/lkml/2018/7/12/314" rel=3D"noreferrer" tar=
get=3D"_blank">https://lkml.org/lkml/2018/7/12/314</a><br>
&gt; <a href=3D"https://lkml.org/lkml/2018/8/2/322" rel=3D"noreferrer" targ=
et=3D"_blank">https://lkml.org/lkml/2018/8/2/322</a><br>
&gt; <br>
&gt; In particular the OOM notifier is worse than the shrinker because:<br>
&gt; It is last-resort, which means the system has already gone through<br>
&gt; heroics to prevent OOM. Those heroic reclaim efforts are expensive and=
<br>
&gt; impact application performance.<br>
&gt; It lacks understanding of NUMA or other OOM constraints.<br>
&gt; It has a higher potential for bugs due to the subtlety of the callback=
<br>
&gt; context.<br>
&gt; Given the above, I think the shrinker API certainly makes the most sen=
se<br>
&gt; _if_ the balloon size is static. In that case memory should be reclaim=
ed<br>
&gt; from the balloon early and proportionally to balloon size, which the<b=
r>
&gt; shrinker API achieves.<br>
<br>
The problem is the shrinker doesn&#39;t have any concept of tiering or<br>
priority. I suspect he reason for using the OOM notification is because in<=
br>
practice it should be the last thing we are pulling memory out of with<br>
things like page cache and slab caches being first. Once we have pages<br>
that are leaked out of the balloon by the shrinker it will trigger the<br>
balloon wanting to reinflate.</blockquote><div>Deciding whether to trade IO=
 performance (page cache) for memory-usage efficiency (balloon) seems use-c=
ase dependent.</div><div>Deciding when to re-inflate is a similar policy ch=
oice.</div><div><br></div><div>If the balloon&#39;s shrinker priority is ha=
rd-coded to &quot;last-resort&quot; then there would be no way to implement=
 a policy where page cache growth could shrink the balloon.</div><div>The c=
urrent=C2=A0balloon implementation allows the host to implement this policy=
 and tune the tradeoff between balloon and page cache.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Ideally if the shrinker=
 is running we<br>
shouldn&#39;t be able to reinflate the balloon, and if we are reinflating t=
he<br>
balloon we shouldn&#39;t need to run the shrinker. The fact that we can do<=
br>
both at the same time is problematic.<br></blockquote><div>I agree that thi=
s is inefficient.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
&gt; However, if the balloon is inflating and intentionally causing memory<=
br>
&gt; pressure then this results in the inefficiency pointed out earlier.<br=
>
&gt; <br>
&gt; If the balloon is inflating but not causing memory pressure then there=
<br>
&gt; is no problem with either API.<br>
<br>
The entire point of the balloon is to cause memory pressure. Otherwise<br>
essentially all we are really doing is hinting since the guest doesn&#39;t<=
br>
need the memory and isn&#39;t going to use it any time soon.<br></blockquot=
e><div>Causing memory pressure is just a mechanism to achieve increased rec=
laim. If there was a better mechanism (like the fine-grained-cache-shrinkin=
g one discussed below) then I think the balloon device would be perfectly j=
ustified in using that instead (and maybe &quot;balloon&quot; becomes a mis=
nomer. Oh well).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
&gt; This suggests another route: rather than cause memory pressure to shri=
nk<br>
&gt; the page cache, the balloon could issue the equivalent of &quot;echo 3=
 &gt;<br>
&gt; /proc/sys/vm/drop_caches&quot;.<br>
&gt; Of course ideally, we want to be more fine grained than &quot;drop<br>
&gt; everything&quot;. We really want an API that says &quot;drop everythin=
g that<br>
&gt; hasn&#39;t been accessed in the last 5 minutes&quot;.<br>
&gt; <br>
&gt; This would eliminate the need for the balloon to cause memory pressure=
<br>
&gt; at all which avoids the inefficiency in question. Furthermore, this<br=
>
&gt; pairs nicely with the FREE_PAGE_HINT feature.<br>
<br>
Something similar was brought up in the discussion we had about this in my<=
br>
patch set. The problem is, by trying to use a value like &quot;5 minutes&qu=
ot; it<br>
implies that we are going to need to track some extra state somewhere to<br=
>
determine that value.<br>
<br>
An alternative is to essentially just slowly shrink memory for the guest.<b=
r>
We had some discussion about this in another thread, and the following<br>
code example was brought up as a way to go about doing that:<br>
<a href=3D"https://github.com/Conan-Kudo/omv-kernel-rc/blob/master/0154-sys=
ctl-vm-Fine-grained-cache-shrinking.patch" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/Conan-Kudo/omv-kernel-rc/blob/master/0154-sysctl-vm=
-Fine-grained-cache-shrinking.patch</a><br>
<br>
The idea is you essentially just slowly bleed the memory from the guest by<=
br>
specifying some amount of MB of cache to be freed on some regular<br>
interval.<br></blockquote><div>Makes sense. Whatever API is settled on, I&#=
39;d just propose that we allow the host to invoke it via the balloon devic=
e since the host has a host-global view of memory and can make decisions th=
at an individual guest cannot.</div><div><br></div><div>Alex, what is the s=
tatus of your fine-grained-cache-shrinking patch? It seems like a really go=
od idea.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Thanks.<br>
<br>
- Alex<br>
<br>
</blockquote></div></div>

--00000000000031c9db059db41cc3--

--===============4380068405231153742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4380068405231153742==--
