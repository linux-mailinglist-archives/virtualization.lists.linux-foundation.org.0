Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E93EB15F7A3
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 21:22:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 96B8F88326;
	Fri, 14 Feb 2020 20:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id byrfa3uWQ+zE; Fri, 14 Feb 2020 20:22:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C0B1988324;
	Fri, 14 Feb 2020 20:22:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2B51C0177;
	Fri, 14 Feb 2020 20:22:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44033C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 20:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 31AF686A85
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 20:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cm3VznzI5HA4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 20:22:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E2F8486A78
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 20:22:48 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id x123so7049378vsc.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LexI1BZdOqwFh/uxaMRiM6VT2X7USQig9BUtwDUnc8o=;
 b=HXAjCbJ0wkDyP2FJ0p+mQePzO+E8SfviHHEQ/VobjRLUzw+ugh7vCc1bMaoEWdAji1
 lso0D+qwxcX0asCzEfpFBZLYCYlnQpUxkB8De8p5zdTmRVwePR0VYzER0xlsBeN6s36e
 XqqKw7X6vKst0mHAAPNV6daQ1kQTuuXSP33F+3mlfUWiHrTIUBInxi7I2MmvaEj3M8O8
 glJ2iEtZ/+O6yqQ9waXMLUdqT3S4ImToX2Cu6UwXfPuznVAZzjcQavyb13tEwZ7K4N8V
 itEMUFFcxXE3f1Ao1Tj1Pc8ng9A66chcAKe9vKCvNaaGrUUPuUmXauDTWvoGJ5jlZ1Wr
 AS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LexI1BZdOqwFh/uxaMRiM6VT2X7USQig9BUtwDUnc8o=;
 b=SaJCMF2tnu8/E4KaPDKF0MuZJvhsH83BpkTHVQmgKEnYgsuOLNMZfjqhFm8S09RxVm
 nFQtnbORbTCnaIe0w8gUpdV3mBrfP9V3YkHpoCOwShwL4359xkAB3aCh3eiSSu8D5l+J
 GlbKU9SAW4J34/WPaRxeXqRH6eEq3P5BzJGP+7M1Pv5iLKHv26q6qiymD4UdDo3UUiQR
 YYHk1nDZX7Lr/NIOAQ10xR/sM2/PLi8BekxyIZn2nMuNLh8T8qNnfAyV/f3bsAoOhIzO
 uevWY8hIgoVU/oXXWkdewjkX1Ed5xamhiaiWmpbWxESxW1rzY9RjmbFCASpr2u+8jVXv
 lPsw==
X-Gm-Message-State: APjAAAVK2z6+Bd7Nfyz74yc2JmuLm8tEGQi0JYsW2g2HyIQ54L/aBfN7
 G3klfNDbP7zPpTXlwJ+YO/7BhN8PRW6wDNuuLfOd5A==
X-Google-Smtp-Source: APXvYqyXa5inw1XCxCEy/PkPBSqlOlicv2BzCBPQe3uBjpMU6BV6XfwNbum8DjXjuWgyGVbkS9gJV360tWh3//NrFdk=
X-Received: by 2002:a05:6102:809:: with SMTP id
 g9mr2648721vsb.62.1581711767575; 
 Fri, 14 Feb 2020 12:22:47 -0800 (PST)
MIME-Version: 1.0
References: <345addae-0945-2f49-52cf-8e53446e63b2@i-love.sakura.ne.jp>
 <286AC319A985734F985F78AFA26841F73E429F32@shsmsx102.ccr.corp.intel.com>
 <202002100357.01A3vNNU089831@www262.sakura.ne.jp>
 <286AC319A985734F985F78AFA26841F73E42AD6D@shsmsx102.ccr.corp.intel.com>
 <51306985-90ac-6e6b-d085-4e076698c48c@i-love.sakura.ne.jp>
In-Reply-To: <51306985-90ac-6e6b-d085-4e076698c48c@i-love.sakura.ne.jp>
Date: Fri, 14 Feb 2020 12:22:36 -0800
Message-ID: <CAJuQAmpbNDhcJXrxO46ikivuzE3w9Bqp7BJzAxnFR-bo5Kw5Aw@mail.gmail.com>
Subject: Re: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "namit@vmware.com" <namit@vmware.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "alexander.h.duyck@linux.intel.com" <alexander.h.duyck@linux.intel.com>,
 "mhocko@kernel.org" <mhocko@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1888424916671118205=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============1888424916671118205==
Content-Type: multipart/alternative; boundary="0000000000000b6b64059e8ef85d"

--0000000000000b6b64059e8ef85d
Content-Type: text/plain; charset="UTF-8"

Sorry for the slow reply.

Re: Module parameters: I prefer not to have module parameters since they
are controlled by the guest. In general, in virtualized environments the
admins controlling the hypervisor are more knowledgeable about these things
than the users. A feature bit seems useful so that the host knows what the
guest behavior will be, and can change the host side implementation to make
the experience good for the guest.

I worry that requiring global_node_page_state(NR_FILE_PAGES) == 0 before
allowing deflation is too strict. One of the benefits of the shrinker API
is that it is invoked before vmscan.c has gone through heroic efforts to
reclaim the world. I'm not familiar enough with the code to judge how this
patch impacts this, but would it be beneficial to allow deflation when
vmscan.c is trying "too hard" to reclaim pages? Is there some softer
condition than "global_node_page_state(NR_FILE_PAGES) == 0"?

For my own understanding, does this patch work by returning 0 pages when
asked for pages? Are there cases where that results in an unnecessary OOM?
For example, if global_node_page_state(NR_FILE_PAGES) == 1, and the guest
needs 2?

Regarding other shrinkers (like KVM MMU cache): Reclaiming other shrinkers
first would match the behavior of DEFLATE_ON_OOM when it was using the OOM
notifier callback. On the other hand (awkwardly), the memory stats reported
on the stats queue for "available memory" do not count shrinker memory as
"available". So a balloon implementation that aims to reclaim some amount
of available memory would not be able to tell how much memory was in the
shrinkers and probably doesn't expect to reclaim them. For this reason, I
think only looking at page cache size is the right choice. There should be
a 1:1 relationship between stats reported and when DEFLATE_ON_OOM is
invoked. Maybe in the future we add another stat that reports shrinker
sizes, in which case we should also add a feature bit that allows other
shrinkers to be pressured.

Regarding NUMA awareness: I agree it's out of scope for this patch since
all implementations so far are not NUMA aware.

Would it be possible to back port this patch to 4.19 when the change to
shrinker API was made?

On Tue, Feb 11, 2020 at 6:20 AM Tetsuo Handa <
penguin-kernel@i-love.sakura.ne.jp> wrote:

> On 2020/02/10 16:27, Wang, Wei W wrote:
> >> Well, my comment is rather: "Do not try to reserve guest's memory. In
> other
> >> words, do not try to maintain balloons on the guest side. Since host
> would
> >> be able to cache file data on the host's cache, guests would be able to
> >> quickly fetch file data from host's cache via normal I/O requests." ;-)
> >
> > Didn't this one. The discussion was about guest pagecache pages v.s.
> guest balloon pages.
> > Why is host's pagecache here?
>
> I'm expecting a mode: "Guests should try to minimize pagecache pages (and
> teach
> host to treat reclaimed pages as if POSIX_FADV_DONTNEED) instead of
> managing
> guest balloon pages". In other words, as if
>
>   while :; sleep 5; echo 1 > /proc/sys/vm/drop_caches; done
>
> is running in the guest's kernel. And as if
>
>   echo 2 > /proc/sys/vm/drop_caches
>
> is triggered in the guest's kernel when host requested guests to reclaim
> memory. No long-life balloons. Guest balloons do not need to care about
> NUMA. Just leave the management of pagecache pages to the host.
>
>

--0000000000000b6b64059e8ef85d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for the slow reply.<div><br></div><div>Re: Module pa=
rameters: I prefer not to have module parameters since they are controlled =
by the guest. In general, in virtualized environments the admins controllin=
g the hypervisor are more knowledgeable=C2=A0about these things than the us=
ers. A feature bit seems useful so that the host knows what the guest behav=
ior will be, and can change the host side implementation to make the experi=
ence good for the guest.</div><div><br></div><div>I worry that requiring gl=
obal_node_page_state(NR_FILE_PAGES) =3D=3D 0 before allowing deflation is t=
oo strict. One of the benefits of the shrinker API is that it is invoked be=
fore vmscan.c has gone through heroic efforts to reclaim the world. I&#39;m=
 not familiar enough with the code to judge how this patch impacts this, bu=
t would it be beneficial to allow deflation when vmscan.c is trying &quot;t=
oo hard&quot; to reclaim pages? Is there some softer condition than &quot;g=
lobal_node_page_state(NR_FILE_PAGES) =3D=3D 0&quot;?</div><div><br></div><d=
iv>For my own understanding, does this patch work by returning 0 pages when=
 asked for pages? Are there cases where that results in an unnecessary OOM?=
 For example, if global_node_page_state(NR_FILE_PAGES) =3D=3D 1, and the gu=
est needs 2?</div><div><br></div><div>Regarding other shrinkers (like KVM M=
MU cache): Reclaiming other shrinkers first would match the behavior of DEF=
LATE_ON_OOM when it was using the OOM notifier callback. On the other hand =
(awkwardly), the memory stats reported on the stats queue for &quot;availab=
le memory&quot; do not count shrinker memory as &quot;available&quot;. So a=
 balloon implementation that aims to reclaim some amount of available memor=
y would not be able to tell how much memory was in the shrinkers and probab=
ly doesn&#39;t expect to reclaim them. For this reason, I think only lookin=
g at page=C2=A0cache size is the right choice. There should be a 1:1 relati=
onship between stats reported and when DEFLATE_ON_OOM is invoked. Maybe in =
the future we add another stat that reports shrinker sizes, in which case w=
e should also add a feature bit that allows other shrinkers to be pressured=
.</div><div><br></div><div>Regarding NUMA awareness: I agree it&#39;s out o=
f scope for this patch since all implementations so far are not NUMA aware.=
</div><div><br></div><div>Would it be possible to back port this patch to 4=
.19 when the change to shrinker API was made?</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11, 2020 at =
6:20 AM Tetsuo Handa &lt;<a href=3D"mailto:penguin-kernel@i-love.sakura.ne.=
jp">penguin-kernel@i-love.sakura.ne.jp</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On 2020/02/10 16:27, Wang, Wei W wrot=
e:<br>
&gt;&gt; Well, my comment is rather: &quot;Do not try to reserve guest&#39;=
s memory. In other<br>
&gt;&gt; words, do not try to maintain balloons on the guest side. Since ho=
st would<br>
&gt;&gt; be able to cache file data on the host&#39;s cache, guests would b=
e able to<br>
&gt;&gt; quickly fetch file data from host&#39;s cache via normal I/O reque=
sts.&quot; ;-)<br>
&gt; <br>
&gt; Didn&#39;t this one. The discussion was about guest pagecache pages v.=
s. guest balloon pages.<br>
&gt; Why is host&#39;s pagecache here?<br>
<br>
I&#39;m expecting a mode: &quot;Guests should try to minimize pagecache pag=
es (and teach<br>
host to treat reclaimed pages as if POSIX_FADV_DONTNEED) instead of managin=
g<br>
guest balloon pages&quot;. In other words, as if<br>
<br>
=C2=A0 while :; sleep 5; echo 1 &gt; /proc/sys/vm/drop_caches; done<br>
<br>
is running in the guest&#39;s kernel. And as if<br>
<br>
=C2=A0 echo 2 &gt; /proc/sys/vm/drop_caches<br>
<br>
is triggered in the guest&#39;s kernel when host requested guests to reclai=
m<br>
memory. No long-life balloons. Guest balloons do not need to care about<br>
NUMA. Just leave the management of pagecache pages to the host.<br>
<br>
</blockquote></div>

--0000000000000b6b64059e8ef85d--

--===============1888424916671118205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1888424916671118205==--
