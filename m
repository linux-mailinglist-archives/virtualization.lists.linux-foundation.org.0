Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F4614E59B
	for <lists.virtualization@lfdr.de>; Thu, 30 Jan 2020 23:46:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E37D87F79;
	Thu, 30 Jan 2020 22:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L13KAybnWYHx; Thu, 30 Jan 2020 22:46:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B12687F5C;
	Thu, 30 Jan 2020 22:46:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CF0AC0171;
	Thu, 30 Jan 2020 22:46:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61287C1796
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 22:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 471EA866F0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 22:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFTRMI-uCbFf
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 22:46:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4091D846EE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 22:46:34 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id f7so1837068uaa.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 14:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Rkc2wn75A8UJ6YAYb2iTNW/6YNBQNfs7eq3zkm9/z8=;
 b=bGxfIlsu1ciNot6cp4qLvQGqmEMbQEnrhZFWoKt3RApCx5znRCuQ99Eaat9cgkmjCj
 Sfqv1A1pqrC9hI1CyBnOD6asCL9LlVxLEHgSmC2ofClibcnMlq30sKqOi1g8E6aJHH70
 w8hhKm88gMLM+tMkoFPKHKRedTEURs+BvKrXvpRT/hwZmYRqOOVuXJKetJHKVqNoKx7t
 wJ91ZRRaweL9uWeqTapTY7lgROpxtLnhoWrkTEvgerqmDBZPLHCBNMBpm3ORpWOFDZ2/
 ddyIwIp20kXmaalHfRy2y/xJDNhhqDhHtTaY4wHq/xL5Czy0p2kQY8CpPutgbZZPFzF3
 MbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Rkc2wn75A8UJ6YAYb2iTNW/6YNBQNfs7eq3zkm9/z8=;
 b=a5Ym55DCP5DvrtO0wiIDM1NbcG9U5/T8D0OV00W9FDDEWSI6oYhDnjMOLtV5A5EtrW
 lxjACjpapUePgkutil3Ksg8mKFdtMtrTxtmEeT8/S/h47ldUOR+fWsFkdwoFvp6oA1dI
 1ef2vyGQQTuFT2rWmlEnyRvzYmlVLp6uCEL3nFs8/AlnjxRD3S0V6X/gyQS5SjRaaJUP
 2JRR+C6HJkW+zeElVQkuNyKO43Qwg3cEnX/PNI8DuaNdNLW8jH8iwohr6PMvRkZrjTAS
 E70RjKvCuJ3TizlTcGqGoa6/8Jrnqt1IVQOOrb2fLEMz9kyqL3APYL+4JMrClb0+EAzF
 3e6A==
X-Gm-Message-State: APjAAAWv3+MHLACJSJI3vboAAghLQ/rsC5mG6GiDV3oLw3IK6ZbcgZP2
 y2Xth3j24CXBRQ5oMAOqX/NaGWmamYdT0CXtmQjGXQ==
X-Google-Smtp-Source: APXvYqy3lh2lnpqSl4mrLC9Ybd0J7uqOu9l0rWGsUMH6Z7aoHGRRBDUeKvJbi43kCSOgFmrBP6SayJ7ptcS4RIQ2gHE=
X-Received: by 2002:ab0:b94:: with SMTP id c20mr4350836uak.67.1580424393113;
 Thu, 30 Jan 2020 14:46:33 -0800 (PST)
MIME-Version: 1.0
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
In-Reply-To: <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
Date: Thu, 30 Jan 2020 14:46:21 -0800
Message-ID: <CAJuQAmq3xPb5k=egCHwwYD=so8hwOCf6d42mUvVXOh2iLJ64dg@mail.gmail.com>
Subject: Re: Balloon pressuring page cache
To: David Hildenbrand <david@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============0227294358601645901=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============0227294358601645901==
Content-Type: multipart/alternative; boundary="0000000000008c2e37059d633a6f"

--0000000000008c2e37059d633a6f
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 30, 2020 at 7:03 AM David Hildenbrand <david@redhat.com> wrote:

> On 29.01.20 20:11, Tyler Sanderson wrote:
> >
> >
> > On Wed, Jan 29, 2020 at 2:31 AM David Hildenbrand <david@redhat.com
> > <mailto:david@redhat.com>> wrote:
> >
> >     On 29.01.20 01:22, Tyler Sanderson via Virtualization wrote:
> >     > A primary advantage of virtio balloon over other memory reclaim
> >     > mechanisms is that it can pressure the guest's page cache into
> >     shrinking.
> >     >
> >     > However, since the balloon driver changed to using the shrinker API
> >     >
> >     <
> https://github.com/torvalds/linux/commit/71994620bb25a8b109388fefa9e99a28e355255a#diff-fd202acf694d9eba19c8c64da3e480c9
> > this
> >     > use case has become a bit more tricky. I'm wondering what the
> intended
> >     > device implementation is.
> >     >
> >     > When inflating the balloon against page cache (i.e. no free memory
> >     > remains) vmscan.c will both shrink page cache, but also invoke the
> >     > shrinkers -- including the balloon's shrinker. So the balloon
> driver
> >     > allocates memory which requires reclaim, vmscan gets this memory by
> >     > shrinking the balloon, and then the driver adds the memory back to
> the
> >     > balloon. Basically a busy no-op.
> >     >
> >     > If file IO is ongoing during this balloon inflation then the page
> >     cache
> >     > could be growing which further puts "back pressure" on the balloon
> >     > trying to inflate. In testing I've seen periods of > 45 seconds
> where
> >     > balloon inflation makes no net forward progress.
> >     >
> >     > This wasn't a problem before the change to the shrinker API since
> >     forced
> >     > balloon deflation only occurred via the OOM notifier callback
> >     which was
> >     > invoked only after the page cache had depleted.
> >     >
> >     > Is this new busy behavior working as intended?
> >
> >     Please note that the shrinker will only be registered in case we have
> >     VIRTIO_BALLOON_F_DEFLATE_ON_OOM - (which is AFAIK very rare) - to
> >     implement automatic balloon deflation when the guest is under memory
> >     pressure.
> >
> >
> >     Are you actually experiencing issues with that or did you just
> stumble
> >     over the code?
> >
> >
> > We have a use case that is encountering this (and that registers
> > DEFLATE_ON_OOM). We can work around this, but it does seem inefficient.
> > I understand there were good reasons for moving away from the OOM
> > notifier callback, but I'm wondering if the balloon driver could specify
> > a "nice" level to the shrinker API that would cause it to be reclaimed
> > from only as a last resort?
> >
>
> Cc-ing linux-mm, Michal and Michael.
>
> Just wondering, how does your workaround look like?
>
The work around is to monitor the memory statistics reported on the stats
queue. Keep inflating (inefficiently) -- despite the activity on the
deflate queue -- until memory statistics indicate the guest is actually low
on available memory.

-- 
> Thanks,
>
> David / dhildenb
>
>

--0000000000008c2e37059d633a6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 30, 2020 at 7:03 AM David=
 Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 29.=
01.20 20:11, Tyler Sanderson wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jan 29, 2020 at 2:31 AM David Hildenbrand &lt;<a href=3D"mailt=
o:david@redhat.com" target=3D"_blank">david@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:david@redhat.com" target=3D"_blank">david=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 29.01.20 01:22, Tyler Sanderson via Virtualizati=
on wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; A primary advantage of virtio balloon over oth=
er=C2=A0memory reclaim<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; mechanisms is that it can=C2=A0pressure the gu=
est&#39;s page cache into<br>
&gt;=C2=A0 =C2=A0 =C2=A0shrinking.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; However, since the balloon driver changed to u=
sing the shrinker API<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/torvalds/linux/co=
mmit/71994620bb25a8b109388fefa9e99a28e355255a#diff-fd202acf694d9eba19c8c64d=
a3e480c9" rel=3D"noreferrer" target=3D"_blank">https://github.com/torvalds/=
linux/commit/71994620bb25a8b109388fefa9e99a28e355255a#diff-fd202acf694d9eba=
19c8c64da3e480c9</a>&gt;=C2=A0this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; use case has become a bit more tricky. I&#39;m=
 wondering what the intended<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; device implementation is.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; When inflating the balloon against page cache =
(i.e. no free memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; remains) vmscan.c will both shrink page cache,=
 but also invoke the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; shrinkers -- including the balloon&#39;s shrin=
ker. So the balloon driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; allocates memory which requires reclaim, vmsca=
n gets this memory by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; shrinking the balloon, and then the driver add=
s the memory back to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; balloon. Basically a busy no-op.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; If file IO is ongoing during this balloon infl=
ation then the page<br>
&gt;=C2=A0 =C2=A0 =C2=A0cache<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; could be growing which further puts &quot;back=
 pressure&quot; on the balloon<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; trying to inflate. In testing I&#39;ve seen pe=
riods of &gt; 45 seconds where<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; balloon inflation makes no net forward progres=
s.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This wasn&#39;t a problem before the change to=
 the shrinker API since<br>
&gt;=C2=A0 =C2=A0 =C2=A0forced<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; balloon deflation only occurred via the OOM no=
tifier callback<br>
&gt;=C2=A0 =C2=A0 =C2=A0which was<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; invoked only after the page cache had depleted=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Is this new busy behavior working as intended?=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Please note that the shrinker will only be register=
ed in case we have<br>
&gt;=C2=A0 =C2=A0 =C2=A0VIRTIO_BALLOON_F_DEFLATE_ON_OOM - (which is AFAIK v=
ery rare) - to<br>
&gt;=C2=A0 =C2=A0 =C2=A0implement automatic balloon deflation when the gues=
t is under memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0pressure.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Are you actually experiencing issues with that or d=
id you just stumble<br>
&gt;=C2=A0 =C2=A0 =C2=A0over the code?<br>
&gt; <br>
&gt; <br>
&gt; We have a use case that is encountering this (and that registers<br>
&gt; DEFLATE_ON_OOM). We can work around this, but it does seem inefficient=
.<br>
&gt; I understand there were good reasons for moving away from the OOM<br>
&gt; notifier callback, but I&#39;m wondering if the balloon driver could s=
pecify<br>
&gt; a &quot;nice&quot; level to the shrinker API that would cause it to be=
 reclaimed<br>
&gt; from only as a last resort?<br>
&gt; =C2=A0<br>
<br>
Cc-ing linux-mm, Michal and Michael.<br>
<br>
Just wondering, how does your workaround look like?<br></blockquote><div>Th=
e work around is to monitor the memory statistics reported on the stats que=
ue. Keep inflating (inefficiently) -- despite the activity on the deflate q=
ueue -- until memory statistics indicate the guest is actually low on avail=
able memory.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
<br>
</blockquote></div></div>

--0000000000008c2e37059d633a6f--

--===============0227294358601645901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0227294358601645901==--
