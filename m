Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E68CE14D109
	for <lists.virtualization@lfdr.de>; Wed, 29 Jan 2020 20:11:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B4EA85F97;
	Wed, 29 Jan 2020 19:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDu5IOYKOW46; Wed, 29 Jan 2020 19:11:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09C0185F95;
	Wed, 29 Jan 2020 19:11:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E20C3C0171;
	Wed, 29 Jan 2020 19:11:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4895AC0171
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 19:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4519685F84
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 19:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiWMDBw1XMwD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 19:11:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ED46C85F90
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 19:11:29 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id 73so159930uac.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 11:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x9o0uhsoeeC4FFDbttT4OXRp0JMfd6x9U4cVjfs2SJA=;
 b=PRgw2Yhwc36HlOyCMz+03sz6qWcX2pnVEhIL56hlw4JnLycHm6E29mQWlqnsxbitp/
 fjZwzR7bwfg0rufMoGMMmkjoeEwCVNS68WM3Kx3iUT4/nNbkk/5sXlvtF3PfPhCXIPIi
 rMVw5aGT+5+LBUcvYg2Ke+BFAv8d4kcskC5/dimMMVgWFhrPanReRQYG8zXEUll09lyL
 nKfbUTE9UimBk9/ay+Sp0mZGGeWnptJku1GFmhITbkEyDfTzGDr4rcdCLWm/pnyElwgM
 Yj/ipZQK/14IUxH8ayvDjVhf8UyqOTFq7kDCp1z486qDshOJC+RFKvQJy+xFAqUC28ia
 +mbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9o0uhsoeeC4FFDbttT4OXRp0JMfd6x9U4cVjfs2SJA=;
 b=R4WGo+jYndl5aFhVgnsOgSWjAHFOdKmqTZ0vqZ1Ea90z2KvL+Oay+sYAzrXUrb4Cba
 pVrKAX2AChxg4uOiLqWgD0kQegEpzYYI1XB2i93I7kGd7ux/muT12b/EEM8ex7zxz1YM
 b9xUnsAzl/iVO6XLfOipISwcHG/Wo+hOC5oD2Nj5ook6ib8X59WQMB1kVpEFQA9XYpLF
 uEKJliDTZD7r6S6qMqEQfTAw3J34Ta+DkWiXQo3rXVZusXsvyJll4G6Y2kwB01/14XhH
 jYdSDVfP2bA9g62o3Nj7FgXSAY2rrx73TwDfIJ1XEqFSq8Eh326hvHKzFZirgJccILVL
 Jv0Q==
X-Gm-Message-State: APjAAAW7g5oJBdOC/s0NVEpYGZy8xhOeq9THBke8CFczRBbzmJLj6GxT
 /MAHenp2Eu/HP5w3w4xpxBY8QFq1mzAqGeA6nZPbnw==
X-Google-Smtp-Source: APXvYqwSPOFtv+4J8/zX+H30B9RfuG3YgcLiHwauJtJz4oqVpGdGGRZejBBaPi57lJvHzBWSq/kD3cDgmUzcCGIvj8E=
X-Received: by 2002:ab0:b94:: with SMTP id c20mr210455uak.67.1580325088717;
 Wed, 29 Jan 2020 11:11:28 -0800 (PST)
MIME-Version: 1.0
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
In-Reply-To: <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
Date: Wed, 29 Jan 2020 11:11:17 -0800
Message-ID: <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
Subject: Re: Balloon pressuring page cache
To: David Hildenbrand <david@redhat.com>
Cc: David Rientjes <rientjes@google.com>,
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
Content-Type: multipart/mixed; boundary="===============5989323806528501526=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============5989323806528501526==
Content-Type: multipart/alternative; boundary="0000000000008b7786059d4c1b63"

--0000000000008b7786059d4c1b63
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 29, 2020 at 2:31 AM David Hildenbrand <david@redhat.com> wrote:

> On 29.01.20 01:22, Tyler Sanderson via Virtualization wrote:
> > A primary advantage of virtio balloon over other memory reclaim
> > mechanisms is that it can pressure the guest's page cache into shrinking.
> >
> > However, since the balloon driver changed to using the shrinker API
> > <
> https://github.com/torvalds/linux/commit/71994620bb25a8b109388fefa9e99a28e355255a#diff-fd202acf694d9eba19c8c64da3e480c9
> > this
> > use case has become a bit more tricky. I'm wondering what the intended
> > device implementation is.
> >
> > When inflating the balloon against page cache (i.e. no free memory
> > remains) vmscan.c will both shrink page cache, but also invoke the
> > shrinkers -- including the balloon's shrinker. So the balloon driver
> > allocates memory which requires reclaim, vmscan gets this memory by
> > shrinking the balloon, and then the driver adds the memory back to the
> > balloon. Basically a busy no-op.
> >
> > If file IO is ongoing during this balloon inflation then the page cache
> > could be growing which further puts "back pressure" on the balloon
> > trying to inflate. In testing I've seen periods of > 45 seconds where
> > balloon inflation makes no net forward progress.
> >
> > This wasn't a problem before the change to the shrinker API since forced
> > balloon deflation only occurred via the OOM notifier callback which was
> > invoked only after the page cache had depleted.
> >
> > Is this new busy behavior working as intended?
>
> Please note that the shrinker will only be registered in case we have
> VIRTIO_BALLOON_F_DEFLATE_ON_OOM - (which is AFAIK very rare) - to
> implement automatic balloon deflation when the guest is under memory
> pressure.


> Are you actually experiencing issues with that or did you just stumble
> over the code?
>

We have a use case that is encountering this (and that registers
DEFLATE_ON_OOM). We can work around this, but it does seem inefficient.
I understand there were good reasons for moving away from the OOM notifier
callback, but I'm wondering if the balloon driver could specify a "nice"
level to the shrinker API that would cause it to be reclaimed from only as
a last resort?


>
> --
> Thanks,
>
> David / dhildenb
>
>

--0000000000008b7786059d4c1b63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 29, 2020 at 2:31 AM David=
 Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 29.=
01.20 01:22, Tyler Sanderson via Virtualization wrote:<br>
&gt; A primary advantage of virtio balloon over other=C2=A0memory reclaim<b=
r>
&gt; mechanisms is that it can=C2=A0pressure the guest&#39;s page cache int=
o shrinking.<br>
&gt; <br>
&gt; However, since the balloon driver changed to using the shrinker API<br=
>
&gt; &lt;<a href=3D"https://github.com/torvalds/linux/commit/71994620bb25a8=
b109388fefa9e99a28e355255a#diff-fd202acf694d9eba19c8c64da3e480c9" rel=3D"no=
referrer" target=3D"_blank">https://github.com/torvalds/linux/commit/719946=
20bb25a8b109388fefa9e99a28e355255a#diff-fd202acf694d9eba19c8c64da3e480c9</a=
>&gt;=C2=A0this<br>
&gt; use case has become a bit more tricky. I&#39;m wondering what the inte=
nded<br>
&gt; device implementation is.<br>
&gt; <br>
&gt; When inflating the balloon against page cache (i.e. no free memory<br>
&gt; remains) vmscan.c will both shrink page cache, but also invoke the<br>
&gt; shrinkers -- including the balloon&#39;s shrinker. So the balloon driv=
er<br>
&gt; allocates memory which requires reclaim, vmscan gets this memory by<br=
>
&gt; shrinking the balloon, and then the driver adds the memory back to the=
<br>
&gt; balloon. Basically a busy no-op.<br>
&gt; <br>
&gt; If file IO is ongoing during this balloon inflation then the page cach=
e<br>
&gt; could be growing which further puts &quot;back pressure&quot; on the b=
alloon<br>
&gt; trying to inflate. In testing I&#39;ve seen periods of &gt; 45 seconds=
 where<br>
&gt; balloon inflation makes no net forward progress.<br>
&gt; <br>
&gt; This wasn&#39;t a problem before the change to the shrinker API since =
forced<br>
&gt; balloon deflation only occurred via the OOM notifier callback which wa=
s<br>
&gt; invoked only after the page cache had depleted.<br>
&gt; <br>
&gt; Is this new busy behavior working as intended?<br>
<br>
Please note that the shrinker will only be registered in case we have<br>
VIRTIO_BALLOON_F_DEFLATE_ON_OOM - (which is AFAIK very rare) - to<br>
implement automatic balloon deflation when the guest is under memory<br>
pressure.</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Are you actually experiencing issues with that or did you just stumble<br>
over the code?<br></blockquote><div><br></div><div>We have a use case that =
is encountering this (and that registers DEFLATE_ON_OOM). We can work aroun=
d this, but it does seem inefficient.</div><div>I understand there were goo=
d reasons for moving away from the OOM notifier callback, but I&#39;m wonde=
ring if the balloon driver could specify a &quot;nice&quot; level to the sh=
rinker API that would cause it to be reclaimed from only as a last resort?<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
<br>
</blockquote></div></div>

--0000000000008b7786059d4c1b63--

--===============5989323806528501526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5989323806528501526==--
