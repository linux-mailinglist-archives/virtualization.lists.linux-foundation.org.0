Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 677FD153861
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 19:43:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E64C88656A;
	Wed,  5 Feb 2020 18:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nghwOm4SaO0Q; Wed,  5 Feb 2020 18:43:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 91B5C8671F;
	Wed,  5 Feb 2020 18:43:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74519C0174;
	Wed,  5 Feb 2020 18:43:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1014C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 18:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AB14F8783F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 18:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eqf3Iuxa26R2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 18:43:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BD6EA85F8E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 18:43:17 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id a2so2042634vso.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 10:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RCPUsF6p09/nvGyzqGEB4sF6CrQ91hGBN8Tz6aQ941g=;
 b=ST99ESW/pOg2Hr3KW1GGzG6ZllnEKzoPnGtfnJ3ktWuJRNMLcryC9z3/7vrmo88S4i
 CkT48Ipmn2gQ7OqQ+OHVq+QZBgXx8gF48vnYfm9gn5BbP4QSZpINoSz8CXolMwzaqJgD
 +cAkLBy3UZWS0r4RGk35bDiebUk2456s8P4dceBnnjMxiRo/mJBqSQct9thYmUS0op6w
 HvjEQ+VGjTyZmGV1kkrvrkTKWhUjIXOFMdP3P2SCZs2OIfFE1lFcWcmTYapvKetqygPw
 45YRK0spgvwAMCvWkXRrL49B05L+JWuDCAFGgBoLbW5INbsEk//Slr3EBNGpwzaIY/er
 3BwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RCPUsF6p09/nvGyzqGEB4sF6CrQ91hGBN8Tz6aQ941g=;
 b=nepJckvsfhG82G2xMV3mGXhV8voM0VB6iaopznEEsMVUJQ1FcjS/VNcn8EUckRF9r0
 QsMKd8nXkEn+BjWFEn2z1HRnrx5Z8p2oZ1O+tePg5pz7s5YkaPbaIvFpSbaBOhXVjz/O
 UvFu4u3vL6ZJ8oPQ/q15LuVmHACMGPUmPvXIC0rFYkGMncuik5ktyQPpMYKnNySs1vlc
 8gOosgcOCYbBMMYb9mqV7/TUqEp1Dd6END9SFqCjK2BQdBmxjsBIvVoI3ub/RkGY1Or/
 M4vvrTtUmIJ2FnuOk4HQY7MeAr/+0THtvFD7unbUCo72vqih7gswttz2tdohzPBC8gkX
 AzDQ==
X-Gm-Message-State: APjAAAXnAR0GyGMkNW5HEamIUIIqz0QuWW3onesRlSkbPXhEMbZJrG1b
 gSHK+xhczBhaCj84c8jGZbeOp5NGyxfQcMvAa25BRg==
X-Google-Smtp-Source: APXvYqwcJlpadFVuJlED2dxL9ifbACdugCA/sYQVXhPp24DyMY932vfzXz/FkuZKD8lQ9bfuLbN663S+M/MTOEPUzXE=
X-Received: by 2002:a67:e3b3:: with SMTP id j19mr22827611vsm.41.1580928196513; 
 Wed, 05 Feb 2020 10:43:16 -0800 (PST)
MIME-Version: 1.0
References: <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <d69eafb4-ad0d-1617-9248-ea4fc776da58@redhat.com>
 <20200204033657-mutt-send-email-mst@kernel.org>
 <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F0F0@shsmsx102.ccr.corp.intel.com>
 <1eff30a0-a38a-cd45-2fc1-80cfd0bf5f04@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F306@shsmsx102.ccr.corp.intel.com>
 <2b388a78-79cd-f99a-6f87-6446dcb4b819@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F367@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <286AC319A985734F985F78AFA26841F73E41F367@shsmsx102.ccr.corp.intel.com>
Date: Wed, 5 Feb 2020 10:43:04 -0800
Message-ID: <CAJuQAmrVLV_XDKLoGoRL7Ep8=xj0oio6VE9_3cRhE5s0eZY2sw@mail.gmail.com>
Subject: Re: Balloon pressuring page cache
To: "Wang, Wei W" <wei.w.wang@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Nadav Amit <namit@vmware.com>,
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
Content-Type: multipart/mixed; boundary="===============1367893611558158752=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============1367893611558158752==
Content-Type: multipart/alternative; boundary="000000000000920dc4059dd887fa"

--000000000000920dc4059dd887fa
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 5, 2020 at 1:00 AM Wang, Wei W <wei.w.wang@intel.com> wrote:

> On Wednesday, February 5, 2020 4:57 PM, David Hildenbrand wrote:
> > >> Yes, I agree with you. Yet, I am thinking about one
> > >> (unlikely?impossible?) scenario. Can you refresh my brain why that
> > >> cannot happen (IOW, why we don't have to wait for the host to process
> > >> the request)?
> > >>
> > >> 1. Guest allocates a page and sends it to the host.
> > >> 2. Shrinker gets active and releases that page again.
> > >> 3. Some user in the guest allocates and modifies that page. After
> > >> that, it is done using that page for the next hour.
> > >> 4. The host processes the request and clears the bit in the dirty
> bitmap.
> > >> 5. The guest is being migrated by the host. The modified page is not
> > >> being migrated.
> > >
> > > Whenever the guest modifies a page during migration, it will be
> > > captured by the dirty logging and the hypervisor will send the dirtied
> the
> > page in the following round.
> >
> > Please explain why the steps I outlined don't apply esp. in the last
> round.
> > Your general statement does not explain why this race can't happen.
> >
>
> The guest is stopped in the last round, thus no page will be modified at
> that time.
>

Isn't the hint only useful during the *first* round?
After the first round if a page becomes free then we need to update the
copy at the migration destination, so freeing a page that previously had
contents should mark it dirty.


>
> Best,
> Wei
>

--000000000000920dc4059dd887fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 5, 2020 at 1:00 AM Wang, =
Wei W &lt;<a href=3D"mailto:wei.w.wang@intel.com">wei.w.wang@intel.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On We=
dnesday, February 5, 2020 4:57 PM, David Hildenbrand wrote:<br>
&gt; &gt;&gt; Yes, I agree with you. Yet, I am thinking about one<br>
&gt; &gt;&gt; (unlikely?impossible?) scenario. Can you refresh my brain why=
 that<br>
&gt; &gt;&gt; cannot happen (IOW, why we don&#39;t have to wait for the hos=
t to process<br>
&gt; &gt;&gt; the request)?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 1. Guest allocates a page and sends it to the host.<br>
&gt; &gt;&gt; 2. Shrinker gets active and releases that page again.<br>
&gt; &gt;&gt; 3. Some user in the guest allocates and modifies that page. A=
fter<br>
&gt; &gt;&gt; that, it is done using that page for the next hour.<br>
&gt; &gt;&gt; 4. The host processes the request and clears the bit in the d=
irty bitmap.<br>
&gt; &gt;&gt; 5. The guest is being migrated by the host. The modified page=
 is not<br>
&gt; &gt;&gt; being migrated.<br>
&gt; &gt;<br>
&gt; &gt; Whenever the guest modifies a page during migration, it will be<b=
r>
&gt; &gt; captured by the dirty logging and the hypervisor will send the di=
rtied the<br>
&gt; page in the following round.<br>
&gt; <br>
&gt; Please explain why the steps I outlined don&#39;t apply esp. in the la=
st round.<br>
&gt; Your general statement does not explain why this race can&#39;t happen=
.<br>
&gt; <br>
<br>
The guest is stopped in the last round, thus no page will be modified at th=
at time.<br></blockquote><div><br></div><div>Isn&#39;t the hint only useful=
 during the <i>first</i> round?</div><div>After the first round if a page b=
ecomes free then we need to update the copy at the migration destination, s=
o freeing a page that previously had contents should mark it dirty.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best,<br>
Wei<br>
</blockquote></div></div>

--000000000000920dc4059dd887fa--

--===============1367893611558158752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1367893611558158752==--
