Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C715F805
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 21:49:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AD65687864;
	Fri, 14 Feb 2020 20:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3XCkB+fi3AEs; Fri, 14 Feb 2020 20:48:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3FCA287858;
	Fri, 14 Feb 2020 20:48:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 326B9C1D8D;
	Fri, 14 Feb 2020 20:48:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FC08C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 20:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0C3828820A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 20:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eO466y-hPjgJ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 20:48:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2C4E3881AB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 20:48:55 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id m195so2955305vkh.10
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cVD4wX404XOWnpP+jP2jRcvAhUXcMGtZ+78P2hMnNVI=;
 b=tz8lM3nO+h1J22d+uWHUN+dZWZp9fYiEJdHGM5W8BUYDc/F6+tVhUwcGkml9sx2TyC
 eLCSbRJUZ6JUyspEA4vnlHDT5cTcXvxVfDRG1NcasXs3Wf2GYJgLgu+r3Anhsc3ZJjHU
 9dg+JCCjEaMop9m7SAChX2ALwpgOojjKfycH61DdARxbXZyD8s1940zjfAUwBarZJk3s
 xwkX+lxgyqLxtR1Vh05rln8vauMpBITgAZJiQzax6SgqgpcsDzRnvFTu6eu9u5kSuJ1y
 8sByLMvP5sThmn4MjLanEY5e7Qee/y+W1p+AiOzhGeflzs1QHtRYUe+nY8fiWZtHHmhu
 qYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cVD4wX404XOWnpP+jP2jRcvAhUXcMGtZ+78P2hMnNVI=;
 b=E+Scy02jADAqYrC5ecHGmqPbI5zFuzFAdbC1pLhbbZHfGtTgaiq13W376zXFLuM+ar
 bDJPbrb6doYhhqWpOr5V/7/78sTueWfN2fPcVqFAzChoDOyp0jVojK37jMJ5eJv2CO8Z
 QtDxPReq0S9H8bSrcZxA2orCCMd4KCkDVMyMBs3BD5quBaGPiTmxitM1YB+U4MTURtXb
 q5agcQFh3lN7EdvpjOR2rm/WIsFMpxjd7aVOVXfp1x+JiYSCj2mrQ/lR/TRIbqR3v5f2
 HFiLYNvtgV1+cH+NrEqTkkBrHn3ui3jlHlmG1C3rPxByHixEfunnnU2jYtNaPOdKvvxP
 SXQA==
X-Gm-Message-State: APjAAAWxKYRbWUrSa5DRm2+9v+lEKb1l0pH3HwSTtuuv6XeO6Klaor94
 Xqx24MyKfUnvWVOWzPrPJ880RnoZGVkyo2jeN3av5Q==
X-Google-Smtp-Source: APXvYqz3bXhGEDPtdmDlO1dBPFCoEBtqZ+I1h3jNaZe+jf+wvfS4Vaj5sQvhiC0g/78U43tAtpb5c2DIeh/fLfv/9FY=
X-Received: by 2002:a1f:a484:: with SMTP id n126mr407782vke.58.1581713333937; 
 Fri, 14 Feb 2020 12:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
 <20200214140641.GB31689@dhcp22.suse.cz>
 <802f93b1-1588-bd2c-8238-c12ec7f7ae9e@redhat.com>
In-Reply-To: <802f93b1-1588-bd2c-8238-c12ec7f7ae9e@redhat.com>
Date: Fri, 14 Feb 2020 12:48:42 -0800
Message-ID: <CAJuQAmpGKcyWo8Ojnia_pXZAaOt98u0c_Sk-8ieCO218hutW1g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
To: David Hildenbrand <david@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
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
From: Tyler Sanderson via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Tyler Sanderson <tysand@google.com>
Content-Type: multipart/mixed; boundary="===============5193468567358900890=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============5193468567358900890==
Content-Type: multipart/alternative; boundary="000000000000685d73059e8f55b9"

--000000000000685d73059e8f55b9
Content-Type: text/plain; charset="UTF-8"

Regarding Wei's patch that modifies the shrinker implementation, versus
this patch which reverts to OOM notifier:
I am in favor of both patches. But I do want to make sure a fix gets back
ported to 4.19 where the performance regression was first introduced.
My concern with reverting to the OOM notifier is, as mst@ put it (in the
other thread):
"when linux hits OOM all kind of error paths are being hit, latent bugs
start triggering, latency goes up drastically."
The guest could be in a lot of pain before the OOM notifier is invoked, and
it seems like the shrinker API might allow more fine grained control of
when we deflate.

On the other hand, I'm not totally convinced that Wei's patch is an
expected use of the shrinker/page-cache APIs, and maybe it is fragile.
Needs more testing and scrutiny.

It seems to me like the shrinker API is the right API in the long run,
perhaps with some fixes and modifications. But maybe reverting to OOM
notifier is the best patch to back port?

On Fri, Feb 14, 2020 at 6:19 AM David Hildenbrand <david@redhat.com> wrote:

> >> There was a report that this results in undesired side effects when
> >> inflating the balloon to shrink the page cache. [1]
> >>      "When inflating the balloon against page cache (i.e. no free memory
> >>       remains) vmscan.c will both shrink page cache, but also invoke the
> >>       shrinkers -- including the balloon's shrinker. So the balloon
> >>       driver allocates memory which requires reclaim, vmscan gets this
> >>       memory by shrinking the balloon, and then the driver adds the
> >>       memory back to the balloon. Basically a busy no-op."
> >>
> >> The name "deflate on OOM" makes it pretty clear when deflation should
> >> happen - after other approaches to reclaim memory failed, not while
> >> reclaiming. This allows to minimize the footprint of a guest - memory
> >> will only be taken out of the balloon when really needed.
> >>
> >> Especially, a drop_slab() will result in the whole balloon getting
> >> deflated - undesired.
> >
> > Could you explain why some more? drop_caches shouldn't be really used in
> > any production workloads and if somebody really wants all the cache to
> > be dropped then why is balloon any different?
> >
>
> Deflation should happen when the guest is out of memory, not when
> somebody thinks it's time to reclaim some memory. That's what the
> feature promised from the beginning: Only give the guest more memory in
> case it *really* needs more memory.
>
> Deflate on oom, not deflate on reclaim/memory pressure. (that's what the
> report was all about)
>
> A priority for shrinkers might be a step into the right direction.
>
> --
> Thanks,
>
> David / dhildenb
>
>

--000000000000685d73059e8f55b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Regarding Wei&#39;s patch that modifies the shrinker =
implementation, versus this patch which reverts to OOM notifier:</div><div>=
I am in favor of both patches. But I do want to make sure a fix gets back p=
orted to 4.19 where the performance regression was first introduced.</div><=
div>My concern with reverting to the OOM notifier is, as mst@ put it (in th=
e other thread):<br><span style=3D"color:rgb(80,0,80)">&quot;when linux hit=
s OOM=C2=A0</span><span style=3D"color:rgb(80,0,80)">all kind of error path=
s are being hit, latent bugs start triggering,=C2=A0</span><span style=3D"c=
olor:rgb(80,0,80)">latency goes up drastically.&quot;</span><br></div><div>=
The guest could be in a lot of pain before the OOM notifier is invoked, and=
 it seems like the shrinker API might allow more fine grained control of wh=
en we deflate.</div><div><br></div><div>On the other hand, I&#39;m not tota=
lly convinced that Wei&#39;s patch is an expected use of the shrinker/page-=
cache APIs, and maybe it is fragile. Needs more testing=C2=A0and scrutiny.<=
/div><div><br></div><div>It seems to me like the shrinker API is the right =
API in the long run, perhaps with some fixes and modifications. But maybe r=
everting to OOM notifier is the best patch to back port?</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 14, 202=
0 at 6:19 AM David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" targ=
et=3D"_blank">david@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt;&gt; There was a report that this results=
 in undesired side effects when<br>
&gt;&gt; inflating the balloon to shrink the page cache. [1]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;When inflating the balloon against page =
cache (i.e. no free memory<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0remains) vmscan.c will both shrink page =
cache, but also invoke the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shrinkers -- including the balloon&#39;s=
 shrinker. So the balloon<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0driver allocates memory which requires r=
eclaim, vmscan gets this<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory by shrinking the balloon, and the=
n the driver adds the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory back to the balloon. Basically a =
busy no-op.&quot;<br>
&gt;&gt;<br>
&gt;&gt; The name &quot;deflate on OOM&quot; makes it pretty clear when def=
lation should<br>
&gt;&gt; happen - after other approaches to reclaim memory failed, not whil=
e<br>
&gt;&gt; reclaiming. This allows to minimize the footprint of a guest - mem=
ory<br>
&gt;&gt; will only be taken out of the balloon when really needed.<br>
&gt;&gt;<br>
&gt;&gt; Especially, a drop_slab() will result in the whole balloon getting=
<br>
&gt;&gt; deflated - undesired.<br>
&gt; <br>
&gt; Could you explain why some more? drop_caches shouldn&#39;t be really u=
sed in<br>
&gt; any production workloads and if somebody really wants all the cache to=
<br>
&gt; be dropped then why is balloon any different?<br>
&gt; <br>
<br>
Deflation should happen when the guest is out of memory, not when<br>
somebody thinks it&#39;s time to reclaim some memory. That&#39;s what the<b=
r>
feature promised from the beginning: Only give the guest more memory in<br>
case it *really* needs more memory.<br>
<br>
Deflate on oom, not deflate on reclaim/memory pressure. (that&#39;s what th=
e<br>
report was all about)<br>
<br>
A priority for shrinkers might be a step into the right direction.<br>
<br>
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
<br>
</blockquote></div></div>

--000000000000685d73059e8f55b9--

--===============5193468567358900890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5193468567358900890==--
