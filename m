Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 550FA1523A7
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 00:59:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F03B481CF3;
	Tue,  4 Feb 2020 23:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwWnaIRZ2pIV; Tue,  4 Feb 2020 23:59:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD373813A2;
	Tue,  4 Feb 2020 23:59:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE44FC0174;
	Tue,  4 Feb 2020 23:59:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E63EC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 23:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6DBDB80495
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 23:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1X6tXZcpqgS
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 23:59:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1BA9D84626
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 23:59:05 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id r18so201575vso.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 15:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TcS54X5u3D35EncQnOa2Vb4A59aceDi9bYhggZgDUb0=;
 b=npj8cSKumskrUZJXMYe8rKypauap/2OZX4VWAgKX+i1Cw0RMSNH3LxEU/IDgd4J9yW
 bwmn1OPJsazPRVmgW7/IDyzajz7CNEnRERGrK/K9HYT3+VrOEje4xY4owv4I/j0ImxiW
 ePvuzRJhJvRgDWyLcTmGkJDYuOWyrTEOYAjftJvrp3lsPmhJdpAoJ6/CXq9vmoHZmKA/
 WA+B3t03pWFcSti0vAovXJJoaEObnm0lbL7bQG2hjE4/JR5yHLGfnzN6kqOURnsQxdDB
 75fduPTYUJGaRk5X5cA55mwGZdw2Ujs2sl7kJ8WpMp6SyJ3H/gixjTA+8u84n1MRpYLc
 jULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TcS54X5u3D35EncQnOa2Vb4A59aceDi9bYhggZgDUb0=;
 b=Q7GP2uuAgdem51qSRILJoUqXCPxCvunlqnALIyV/F0L5jiZGtoTYOVnaVhVJeSM92g
 NlfnvR8ltkbwQqqLkMwZMDVmkiWtBI1tvS+9IFG1C7bb/WJxivwMifNLGViH6dcYUidB
 Ut0bkX3qJsS9mQkWOFVHXZMAGT6gzUwuGq5Tg/1ItpPYqBXjDhV5PZzTueG0TlcYK+GV
 4PhVRz69Tcc1KLMh4ET04C/sfF2a5BET6R8JwDOKehnGxW8GsWf2VDj4uzqvzvBcK3gy
 EGnrKGQcT+U3nZ2teIBRWCmcvsg75L5sFuPgEol0den2HOCAw5xMl+az6pulkJzZ2YrH
 DWgw==
X-Gm-Message-State: APjAAAVuEqM6mjh/AufgQSsd3jZQtmL6A9PlJsNY3AOemxiMdcyF3Y1c
 DQw0A1vODVpDPK+QBDnrXtKN2zzhKla7X047Jmu9jA==
X-Google-Smtp-Source: APXvYqwuI0TWTA/lGraii2n5o5puu/XY0aXxlExXu1Fz9TikGZ0zvSoceW3IJGcVdeyfmnpSzbZE4xjlydCECb1RiYg=
X-Received: by 2002:a05:6102:72b:: with SMTP id
 u11mr20212328vsg.69.1580860743752; 
 Tue, 04 Feb 2020 15:59:03 -0800 (PST)
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
 <CAJuQAmpiVqnNt-vSkQh5Gg63QZ49_nuz4+VW2Jfwn51gWVdtfA@mail.gmail.com>
 <b809340d-7e86-caf6-bf12-db7bb8265045@redhat.com>
In-Reply-To: <b809340d-7e86-caf6-bf12-db7bb8265045@redhat.com>
Date: Tue, 4 Feb 2020 15:58:51 -0800
Message-ID: <CAJuQAmqeKvc_k7pmDuC1b+w6yezzHoSxZJ8WW5sHVo1yMsRPfg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8143916964469964660=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============8143916964469964660==
Content-Type: multipart/alternative; boundary="00000000000012761a059dc8d3cb"

--00000000000012761a059dc8d3cb
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 4, 2020 at 11:17 AM David Hildenbrand <david@redhat.com> wrote:

> On 04.02.20 19:52, Tyler Sanderson wrote:
> >
> >
> > On Tue, Feb 4, 2020 at 12:29 AM David Hildenbrand <david@redhat.com
> > <mailto:david@redhat.com>> wrote:
> >
> >     On 03.02.20 21:32, Tyler Sanderson wrote:
> >     > There were apparently good reasons for moving away from OOM
> notifier
> >     > callback:
> >     > https://lkml.org/lkml/2018/7/12/314
> >     > https://lkml.org/lkml/2018/8/2/322
> >     >
> >     > In particular the OOM notifier is worse than the shrinker because:
> >
> >     The issue is that DEFLATE_ON_OOM is under-specified.
> >
> >     >
> >     >  1. It is last-resort, which means the system has already gone
> through
> >     >     heroics to prevent OOM. Those heroic reclaim efforts are
> expensive
> >     >     and impact application performance.
> >
> >     That's *exactly* what "deflate on OOM" suggests.
> >
> >
> > It seems there are some use cases where "deflate on OOM" is desired and
> > others where "deflate on pressure" is desired.
> > This suggests adding a new feature bit "DEFLATE_ON_PRESSURE" that
> > registers the shrinker, and reverting DEFLATE_ON_OOM to use the OOM
> > notifier callback.
> >
> > This lets users configure the balloon for their use case.
>
> You want the old behavior back, so why should we introduce a new one? Or
> am I missing something? (you did want us to revert to old handling, no?)
>
Reverting actually doesn't help me because this has been the behavior since
Linux 4.19 which is already widely in use. So my device implementation
needs to handle the shrinker behavior anyways. I started this conversation
to ask what the intended device implementation was.

I think there are reasonable device implementations that would prefer the
shrinker behavior (it turns out that mine doesn't).
For example, an implementation that slowly inflates the balloon for the
purpose of memory overcommit. It might leave the balloon inflated and
expect any memory pressure (including page cache usage) to deflate the
balloon as a way to dynamically right-size the balloon.

Two reasons I didn't go with the above implementation:
1. I need to support guests before Linux 4.19 which don't have the shrinker
behavior.
2. Memory in the balloon does not appear as "available" in /proc/meminfo
even though it is freeable. This is confusing to users, but isn't a deal
breaker.

If we added a DEFLATE_ON_PRESSURE feature bit that indicated shrinker API
support then that would resolve reason #1 (ideally we would backport the
bit to 4.19).

In any case, the shrinker behavior when pressuring page cache is more of an
inefficiency than a bug. It's not clear to me that it necessitates
reverting. If there were/are reasons to be on the shrinker interface then I
think those carry similar weight as the problem itself.


>
> I consider virtio-balloon to this very day a big hack. And I don't see
> it getting better with new config knobs. Having that said, the
> technologies that are candidates to replace it (free page reporting,
> taming the guest page cache, etc.) are still not ready - so we'll have
> to stick with it for now :( .
>
> >
> > I'm actually not sure how you would safely do memory overcommit without
> > DEFLATE_ON_OOM. So I think it unlocks a huge use case.
>
> Using better suited technologies that are not ready yet (well, some form
> of free page reporting is available under IBM z already but in a
> proprietary form) ;) Anyhow, I remember that DEFLATE_ON_OOM only makes
> it less likely to crash your guest, but not that you are safe to squeeze
> the last bit out of your guest VM.
>
Can you elaborate on the danger of DEFLATE_ON_OOM? I haven't seen any
problems in testing but I'd really like to know about the dangers.
Is there a difference in safety between the OOM notifier callback and the
shrinker API?


>
> --
> Thanks,
>
> David / dhildenb
>
>

--00000000000012761a059dc8d3cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 4, 2020 at 11:17 AM David=
 Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 04.=
02.20 19:52, Tyler Sanderson wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Feb 4, 2020 at 12:29 AM David Hildenbrand &lt;<a href=3D"mailt=
o:david@redhat.com" target=3D"_blank">david@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:david@redhat.com" target=3D"_blank">david=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 03.02.20 21:32, Tyler Sanderson wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; There were apparently good reasons for moving =
away from OOM notifier<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; callback:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://lkml.org/lkml/2018/7/12/314=
" rel=3D"noreferrer" target=3D"_blank">https://lkml.org/lkml/2018/7/12/314<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://lkml.org/lkml/2018/8/2/322"=
 rel=3D"noreferrer" target=3D"_blank">https://lkml.org/lkml/2018/8/2/322</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; In particular the OOM notifier is worse than t=
he shrinker because:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The issue is that DEFLATE_ON_OOM is under-specified=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1. It is last-resort, which means the sy=
stem has already gone through<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0heroics to prevent OOM. Tho=
se heroic reclaim efforts are expensive<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0and impact application perf=
ormance.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That&#39;s *exactly* what &quot;deflate on OOM&quot=
; suggests.<br>
&gt; <br>
&gt; <br>
&gt; It seems there are some use cases where &quot;deflate on OOM&quot; is =
desired and<br>
&gt; others where &quot;deflate on pressure&quot; is desired.<br>
&gt; This suggests adding a new feature bit &quot;DEFLATE_ON_PRESSURE&quot;=
 that<br>
&gt; registers the shrinker, and reverting DEFLATE_ON_OOM to use the OOM<br=
>
&gt; notifier callback.<br>
&gt; <br>
&gt; This lets users configure the balloon for their use case.<br>
<br>
You want the old behavior back, so why should we introduce a new one? Or<br=
>
am I missing something? (you did want us to revert to old handling, no?)<br=
></blockquote><div>Reverting actually doesn&#39;t help me because this has =
been the behavior since Linux 4.19 which is already widely in use. So my de=
vice implementation needs to handle the shrinker behavior anyways. I starte=
d this conversation to ask what the intended device implementation was.</di=
v><div><br></div><div>I think there are reasonable device implementations t=
hat would prefer the shrinker=C2=A0behavior (it turns out that mine doesn&#=
39;t).<br></div><div>For example, an implementation that slowly inflates th=
e balloon for the purpose of memory overcommit. It might leave the balloon =
inflated and expect any memory pressure (including page cache usage) to def=
late the balloon as a way to dynamically right-size the balloon.</div><div>=
<br></div><div>Two reasons I didn&#39;t go with the above implementation:</=
div><div>1. I need to support guests before Linux 4.19 which don&#39;t have=
 the shrinker behavior.</div><div>2. Memory in the balloon does not appear =
as &quot;available&quot; in /proc/meminfo even though it is freeable. This =
is confusing to users, but isn&#39;t a deal breaker.</div><div><div><br></d=
iv><div>If we added a DEFLATE_ON_PRESSURE feature bit that indicated shrink=
er API support then that would resolve reason=C2=A0#1 (ideally we would bac=
kport the bit to 4.19).</div><div><br></div><div>In any case, the shrinker=
=C2=A0behavior when pressuring page cache is more of an inefficiency than a=
 bug. It&#39;s not clear to me that it necessitates reverting. If there wer=
e/are reasons to be on the shrinker=C2=A0interface then I think those carry=
 similar weight as the problem itself.</div></div><div>=C2=A0<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I consider virtio-balloon to this very day a big hack. And I don&#39;t see<=
br>
it getting better with new config knobs. Having that said, the<br>
technologies that are candidates to replace it (free page reporting,<br>
taming the guest page cache, etc.) are still not ready - so we&#39;ll have<=
br>
to stick with it for now :( .<br>
<br>
&gt; <br>
&gt; I&#39;m actually not sure how you would safely do memory overcommit wi=
thout<br>
&gt; DEFLATE_ON_OOM. So I think it unlocks a huge use case.<br>
<br>
Using better suited technologies that are not ready yet (well, some form<br=
>
of free page reporting is available under IBM z already but in a<br>
proprietary form) ;) Anyhow, I remember that DEFLATE_ON_OOM only makes<br>
it less likely to crash your guest, but not that you are safe to squeeze<br=
>
the last bit out of your guest VM.<br></blockquote><div>Can you elaborate o=
n the danger of DEFLATE_ON_OOM? I haven&#39;t seen any problems in testing =
but I&#39;d really like to know about the dangers.</div><div>Is there a dif=
ference in safety between the OOM notifier callback and the shrinker API?</=
div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
<br>
</blockquote></div></div>

--00000000000012761a059dc8d3cb--

--===============8143916964469964660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8143916964469964660==--
